import os
import json
import shutil
from collections import defaultdict
from utils import get_petershaw_template, normalize_sql, spider_dev_db_ids, spider_train_db_ids


def process_data(questions):
    with open(f"data/spider/tables.json", "r") as f:
        tables = json.load(f)
        schemas = {}
        for table in tables:
            table["columns_in_tables"] = defaultdict(list)
            for col in table["column_names_original"][1:]:
                table["columns_in_tables"][table["table_names_original"][col[0]].lower()].append(col[1].lower())
            table["column_names_original"] = set([x[1].lower() for x in table["column_names_original"][1:]] + ['*'])
            table["table_names_original"] = set([x.lower() for x in table["table_names_original"]])
            schemas[table["db_id"]] = table

    for q in questions:
        # drop unnecessary keys to simplify the data
        for key in ["sql", "query_toks", "query_toks_no_value", "question_toks"]:
            if key in q:
                q.pop(key)

        # obtain SQL template for template-split data
        q["sql_template"] = get_petershaw_template(q["query"])

        # add normalized SQL
        q["gold"] = {}
        q["gold"]["query"] = q["query"]
        gold_sql_nromalized = normalize_sql(q["query"], schemas[q["db_id"]])
        q["gold"]["query_normalized"] = gold_sql_nromalized
    return questions


if __name__ == '__main__':

    for dataset in ["spider-train", "spider-dev"]:
        for folder in ["questions", "database"]:
            if not os.path.exists(f"data_processed/{dataset}/{folder}"):
                os.makedirs(f"data_processed/{dataset}/{folder}")

    with open("data/spider/dev.json", "r") as f:
        spider_dev_questions = json.load(f)
    with open("data/spider/train_spider.json", "r") as f:
        spider_train_questions = json.load(f)

    # process data
    spider_dev_questions = process_data(spider_dev_questions)
    spider_train_questions = process_data(spider_train_questions)

    # copy spider-dev data
    with open(f"data_processed/spider-dev/questions/questions.json", "w") as f:
        json.dump(spider_dev_questions, f, indent=4)
    for db_id in spider_dev_db_ids:
        with open(f"data_processed/spider-dev/questions/{db_id}.json", "w") as f:
            json.dump([q for q in spider_dev_questions if q["db_id"] == db_id], f, indent=4)
        if not os.path.exists(f"data_processed/spider-dev/database/{db_id}"):
            shutil.copytree(f"data/spider/database/{db_id}", f"data_processed/spider-dev/database/{db_id}")
    # copy spider-train data
    with open(f"data_processed/spider-train/questions/questions.json", "w") as f:
        json.dump(spider_train_questions, f, indent=4)
    for db_id in spider_train_db_ids:
        with open(f"data_processed/spider-train/questions/{db_id}.json", "w") as f:
            json.dump([q for q in spider_train_questions if q["db_id"] == db_id], f, indent=4)
        if not os.path.exists(f"data_processed/spider-train/database/{db_id}"):
            shutil.copytree(f"data/spider/database/{db_id}", f"data_processed/spider-train/database/{db_id}")
