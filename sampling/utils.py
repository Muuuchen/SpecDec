import torch 

from torch.nn import functional as F

def  top_kp_filter(logits: torch.Tensor, topk:int=0,topp: float=0):
    # 过滤i到那些
    if topk > 0:
        filter = torch.topk(logits, min(topk,logits.size(-1)))[0]
        logits[logits < filter[:, [-1]]] = float('-inf')
    if topp > 0.0:
        sorted_logits, sorted_indices = torch.sort(logits, descending=True)
        cumulative_probs = torch.cumsum(
            F.softmax(sorted_logits, dim=-1), dim=-1) # softmax后累计概率
        filter = cumulative_probs > topp
        #huoxu 有问题
        filter[..., 1:] = filter[..., :-1].clone()
        filter[..., 0] = 0 #起码保留概率最大的一个，舍弃概率最小的一个
        indices_to_remove = filter.scatter(1, sorted_indices, filter)
        logits[indices_to_remove] = float('-inf')
    return logits
    # 因为至少要保留一个token
    
def norm_logits(logits :torch.Tensor, temperature: float, top_k:float,top_p: float)->torch.Tensor:
    assert(logits.dim() == 2)
    logits = logits / temperature
    logits = top_kp_filter(logits,top_k=top_k,top_p=top_p)
    probs = F.softmax(logits,dim=1)
    return probs

def sample(probs:torch.Tensor, num_samples:int =1 ):
    # TODO what is torch.multinomial concrete meaning
    idx_next  = torch.multinomial(probs, num_samples=num_samples) # 多项式采样
    # 根据probs中概率值 作为权重 每次都选择一个，然后再来一个，所以输出的值为每次选择的索引
    if(idx_next.item() == 0):
        raise RuntimeError
    return idx_next

def max_fn(x):
    "norm max"
    x_max = torch.where(x>0,x,torch.zeros_like(x)) # 否则将保存后一个
    x_max_sum = torch.sum(x_max, dim=1,keepdim=True)
    return x_max / x_max_sum


    
        