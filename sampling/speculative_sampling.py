import torch
from tqdm import tqdm
import torch

from sampling.kvcache_model import KVCacheModel
from sampling.utils import norm_logits, sample,max_fn
from globals import Decoder

@torch.no_grad()
def speculative_sampling(prefix : torch.Tensor, approx_model : torch.nn.Module, target_model : torch.nn.Module, 
                         max_len : int , gamma : int = 4,
                         temperature : float = 1, top_k : int = 0, top_p : float = 0, verbose : bool = False, random_seed : int = None) -> torch.Tensor:
    seq_len = prefix.shape[1]
    T = seq_len + max_len
    
    assert prefix.shape[0] == 1, "input batch size must be 1"
    with tqdm(total=T, desc="speculative sampling") as pbar:
        while prefix.shape[1] < T:
            x = prefix
            prefix_len = prefix.shape[1]
            for _ in range(gamma):
                q = approx_model(x).logits
                next_tok = sample(norm_logits(q[:,-1,:],
                                              temperature,top_k,top_p))
                x = torch.cat((x,next_tok),dim=1)
                
            for i in range(q.shape[1]):
                q[:,i,:] = norm_logits(q[:,i,:],
                                temperature, top_k, top_p)
                p = target_model(x).logits
                p[:,i,:] = norm_logits(p[:,i,:],
                                temperature, top_k, top_p)
            is_all_accept = True
            n = prefix_len - 1
            for i in range(gamma):
                if random_seed:
                    torch.manual_seed(random_seed)
                r = x[:,prefix+i]
                j= x[:,prefix_len+i]
                
                if r < torch.min(torch.tensor([1], device=q.device), p[:, prefix_len + i - 1, j] / q[:, prefix_len + i - 1, j]):
                    #accept
                    n+=1
                else:
                    t =  sample(max_fn(p[:,n,:] -q[:,n,:]))
                    is_all_accept = False
                    break
            prefix = x[:,:n+1]
            if is_all_accept:
                t = sample(p[:, -1, :])
            
            prefix = torch.cat((prefix, t), dim=1)
            pbar.update(n - pbar.n)
        return prefix