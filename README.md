# How to Prompt LLMs for Text-to-SQL: A Study in Zero-shot, Single-domain, and Cross-domain Settings

## Description

This repo contains codes for the
paper: [How to Prompt LLMs for Text-to-SQL: A Study in Zero-shot, Single-domain, and Cross-domain Settings](https://arxiv.org/pdf/2305.11853.pdf).

## Setup

1. Please download the [Spider](https://yale-lily.github.io/spider) dataset and place it under the `data` folder in the root directory.
2. Install the necessary packages
3. Run the preprocessing script

```
pip install -r requirements.txt
python preprocessing.py
```

## Generate Database Prompt

If you'd like to obtain the prompt text for the database without running the text-to-SQL on Spider, use the following command:

```
python print_prompt.py --db_id [db_id] --prompt_db [prompt_db] 
```

## Run OpenAI Models for Text-to-SQL

```
export OPENAI_API_KEY=<your-api-key>
python text_to_sql.py --setting [setting] --model [model] --prompt_db [prompt_db] 
```

For example, to run text-to-SQL with codex in the zero-shot setting, you could use:

```
python text_to_sql.py --setting zeroshot --model codex --prompt_db "CreateTableSelectCol"
```

The output can be found in `outputs/codex/spider-dev/zeroshot/CreateTableSelectCol_normalized_limit_3`.

## Evaluation

We recommend using the official [test-suite evaluation scripts](https://github.com/taoyds/test-suite-sql-eval) for the execution accuracy.

## Citation and Contact

If you use our prompt constructions in your work, please cite our paper and the previous papers.

```
@article{chang2023prompt,
  title={How to Prompt LLMs for Text-to-SQL: A Study in Zero-shot, Single-domain, and Cross-domain Settings},
  author={Chang, Shuaichen and Fosler-Lussier, Eric},
  journal={arXiv preprint arXiv:2305.11853},
  year={2023}
}
@article{rajkumar2022evaluating,
  title={Evaluating the Text-to-SQL Capabilities of Large Language Models},
  author={Rajkumar, Nitarshan and Li, Raymond and Bahdanau, Dzmitry},
  journal={arXiv preprint arXiv:2204.00498},
  year={2022}
}
@article{liu2023comprehensive,
  title={A comprehensive evaluation of ChatGPT's zero-shot Text-to-SQL capability},
  author={Liu, Aiwei and Hu, Xuming and Wen, Lijie and Yu, Philip S},
  journal={arXiv preprint arXiv:2303.13547},
  year={2023}
}
@article{pourreza2023din,
  title={DIN-SQL: Decomposed In-Context Learning of Text-to-SQL with Self-Correction},
  author={Pourreza, Mohammadreza and Rafiei, Davood},
  journal={arXiv preprint arXiv:2304.11015},
  year={2023}
}
@article{chen2023teaching,
  title={Teaching Large Language Models to Self-Debug},
  author={Chen, Xinyun and Lin, Maxwell and Sch{\"a}rli, Nathanael and Zhou, Denny},
  journal={arXiv preprint arXiv:2304.05128},
  year={2023}
}
```

Please contact Shuaichen Chang (chang.1692[at]osu.edu) for questions and suggestions. Thank you!

