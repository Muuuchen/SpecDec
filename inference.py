
import torch
import argparse
import contexttimer
from colorama import Fore, Style
from transformers import AutoTokenizer,AutoModelForCausalLM
from globals import Decoder
from sampling import autogressive_sampling,speculative_sampling
MODELZOO = {
    # llamma 
    "llama2-7B": "",
    "llama2-70B": ""
}

def parse_argument():
    parser = argparse.ArgumentParser(description="args for inderence.py")
    
    parser.add_argument("--input", type=str, default="what is LLM")
    parser.add_argument("--draft-model",type=str,default=MODELZOO["llama2-7B"])
    parser.add_argument("--target-model", type=str, default=MODELZOO["llama2-70B"])
    parser.add_argument('--verbose', '-v', action='store_true', default=False, help='enable verbose mode')
    parser.add_argument('--seed', '-s', type=int, default=None, help='set a random seed, which can makes the result reproducible')
    parser.add_argument('--benchmark', '-b', action='store_true', default=False, help='show benchmark results.')
    parser.add_argument('--profiling', '-p', action='store_true', default=False, help='collect torch profiler results.')
    parser.add_argument('--max_tokens', '-M', type=int, default=20, help='max token number generated.')
    parser.add_argument('--gamma', '-g', type=int, default=4, help='guess time.')
    args = parser.parse_args()
    return args

def color_print(text):
    print(Fore.RED + text +Style.RESET_ALL)

def generate(input_text,draft_model_name,target_model_name, num_tokens=20,gamma=4,random_seeed=None, verbose=False, use_benchmark=Flase,use_profiling=False):
    torch_deivce = 'cuda' if torch.cuda.is_available() else 'cpu'
    tokenizer = AutoTokenizer.from_pretrained(draft_model_name,trust_remotr_code=True)
    Decoder().set_tokenizer(tokenizer)
    print(f"begin loading models: \n {draft_model_name} \n {target_model_name}")
    draft_model = AutoModelForCausalLM.from_pretrained(draft_model_name,torch_dtype=torch.float16,
                                                       device_amp="auto",
                                                       trust_remote=True)
    target_model = AutoModelForCausalLM.from_pretrained(target_model_name,torch_dtype=torch.float16,
                                                    device_amp="auto",
                                                    trust_remote=True)
    print("finish loading models")
    
    input_ids = tokenizer.encode(input_text,return_tensors='pt').to(torch_deivce)
    
    top_k = 10
    top_p = 0.9
    
    torch.manual_seed(111)
    output = autogressive_sampling(input_ids,target_model,num_tokens, top_k = top_k, top_p=top_p)
    generated_text = tokenizer.decode(output[0], skip_special_tokens=True)
    color_print(f"large (target) model autoregressive_sampling: {generated_text}")
    
    torch.manual_seed(111)
    output = speculative_sampling(input_ids, draft_model, target_model, num_tokens, gamma = gamma, top_k = top_k, top_p=top_p, random_seed = random_seed, verbose = verbose)
    generated_text = tokenizer.decode(output[0], skip_special_tokens=True)
    color_print(f"small (approx) model autoregressive_sampling: {generated_text}")
    
if __name__ == "__main__":
    args = parse_argument()
    generate(args.input, args.approx_model_name, args.target_model_name, num_tokens=args.max_tokens, gamma=args.gamma,
             random_seed = args.seed, verbose=args.verbose, use_benchmark = args.benchmark)


