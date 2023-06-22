import argparse
from database_prompt_construction import generate_db_prompt
from sql_generation import get_prompt_length
from utils import spider_train_db_ids, spider_dev_db_ids

if __name__ == "__main__":
    parser = argparse.ArgumentParser()

    parser.add_argument('--db_id', help='db_id in spider-dev or spider-train', choices=spider_dev_db_ids + spider_train_db_ids, default="network_1")
    supported_db_prompts = ["Table(Columns)", "Columns=[]", "Columns=[]+FK", "CreateTable", "CreateTableInsertRow", "CreateTableSelectRow",
                            "CreateTableSelectCol"]
    parser.add_argument('--prompt_db', default="CreateTableSelectCol", type=str, choices=supported_db_prompts, help='prompt for db')

    args = parser.parse_args()
    prompt_db = args.prompt_db
    db_id = args.db_id
    if db_id in spider_dev_db_ids:
        dataset = "spider-dev"
    elif db_id in spider_train_db_ids:
        dataset = "spider-train"
    else:
        raise ValueError("db_id not supported")

    print(db_id)
    if prompt_db in ["Table(Columns)", "Columns=[]", "Columns=[]+FK", "CreateTable"]:
        limit_value = 0
    elif prompt_db in ["CreateTableInsertRow", "CreateTableSelectRow", "CreateTableSelectCol"]:
        limit_value = 3
    else:
        raise ValueError("Unknown prompt_db")
    prompt_length_by_db = {}
    prompt = generate_db_prompt(dataset, db_id, prompt_db=prompt_db, limit_value=limit_value, normalization=True)
    print(prompt)
    prompt_len = get_prompt_length(prompt)
    print("prompt length:", prompt_len)
