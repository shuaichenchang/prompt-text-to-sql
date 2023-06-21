import os
import subprocess
import random
import sqlparse
import tiktoken

spider_train_db_ids = ['department_management', 'farm', 'student_assessment', 'bike_1', 'book_2', 'musical', 'twitter_1', 'product_catalog', 'flight_1',
                       'allergy_1', 'store_1', 'journal_committee', 'customers_card_transactions', 'race_track', 'coffee_shop', 'chinook_1', 'insurance_fnol',
                       'medicine_enzyme_interaction', 'university_basketball', 'phone_1', 'match_season', 'climbing', 'body_builder', 'election_representative',
                       'apartment_rentals', 'game_injury', 'soccer_1', 'performance_attendance', 'college_2', 'debate', 'insurance_and_eClaims',
                       'customers_and_invoices', 'wedding', 'theme_gallery', 'epinions_1', 'riding_club', 'gymnast', 'small_bank_1', 'browser_web', 'wrestler',
                       'school_finance', 'protein_institute', 'cinema', 'products_for_hire', 'phone_market', 'gas_company', 'party_people', 'pilot_record',
                       'cre_Doc_Control_Systems', 'company_1', 'local_govt_in_alabama', 'formula_1', 'machine_repair', 'entrepreneur', 'perpetrator', 'csu_1',
                       'candidate_poll', 'movie_1', 'county_public_safety', 'inn_1', 'local_govt_mdm', 'party_host', 'storm_record', 'election', 'news_report',
                       'restaurant_1', 'customer_deliveries', 'icfp_1', 'sakila_1', 'loan_1', 'behavior_monitoring', 'assets_maintenance', 'station_weather',
                       'college_1', 'sports_competition', 'manufacturer', 'hr_1', 'music_1', 'baseball_1', 'mountain_photos', 'program_share', 'e_learning',
                       'insurance_policies', 'hospital_1', 'ship_mission', 'student_1', 'company_employee', 'film_rank', 'cre_Doc_Tracking_DB', 'club_1',
                       'tracking_grants_for_research', 'network_2', 'decoration_competition', 'document_management', 'company_office', 'solvency_ii',
                       'entertainment_awards', 'customers_campaigns_ecommerce', 'college_3', 'department_store', 'aircraft', 'local_govt_and_lot',
                       'school_player', 'store_product', 'soccer_2', 'device', 'cre_Drama_Workshop_Groups', 'music_2', 'manufactory_1',
                       'tracking_software_problems', 'shop_membership', 'voter_2', 'products_gen_characteristics', 'swimming', 'railway',
                       'customers_and_products_contacts', 'dorm_1', 'customer_complaints', 'workshop_paper', 'tracking_share_transactions', 'cre_Theme_park',
                       'game_1', 'customers_and_addresses', 'music_4', 'roller_coaster', 'ship_1', 'city_record', 'e_government', 'school_bus',
                       'flight_company', 'cre_Docs_and_Epenses', 'scientist_1', 'wine_1', 'train_station', 'driving_school', 'activity_1', 'flight_4',
                       'tracking_orders', 'architecture', 'culture_company']
spider_dev_db_ids = ['concert_singer', 'pets_1', 'car_1', 'flight_2', 'employee_hire_evaluation', 'cre_Doc_Template_Mgt', 'course_teach', 'museum_visit',
                     'wta_1', 'battle_death', 'student_transcripts_tracking', 'tvshow', 'poker_player', 'voter_1', 'world_1', 'orchestra', 'network_1',
                     'dog_kennels', 'singer', 'real_estate_properties']

db_ids_dataset = {
    "spider-train": spider_train_db_ids,
    "spider-dev": spider_dev_db_ids,
}

CLAUSE_KEYWORDS = ['select', 'from', 'where', 'group by', 'order by', 'limit', 'intersect', 'union', 'except']
JOIN_KEYWORDS = ['join', 'on', 'as']
WHERE_OPS = ['not', 'between', 'in', 'like', 'is', 'exists', '=', '>', '<', '>=', '<=', '!=']
UNIT_OPS = ['-', '+', "*", '/']
AGG_OPS = ['max', 'min', 'count', 'sum', 'avg']
COND_OPS = ['and', 'or']
ORDER_OPS = ['desc', 'asc']
SQL_KEYWORDS = []
SQL_KEYWORDS.extend(CLAUSE_KEYWORDS)
SQL_KEYWORDS.extend(JOIN_KEYWORDS)
SQL_KEYWORDS.extend(WHERE_OPS)
SQL_KEYWORDS.extend(UNIT_OPS)
SQL_KEYWORDS.extend(AGG_OPS)
SQL_KEYWORDS.extend(COND_OPS)
SQL_KEYWORDS.extend(ORDER_OPS)

os.environ["DATA_GYM_CACHE_DIR"] = "tmp/data-gym-cache"
encoding = tiktoken.get_encoding("cl100k_base")
chatgpt_encoding = tiktoken.encoding_for_model("gpt-3.5-turbo")


def get_prompt_length(prompt, model="codex"):
    if model == "codex":
        result = subprocess.run(["node", "codex_prompt_length.mjs", prompt], stdout=subprocess.PIPE)
        prompt_len = eval(result.stdout)
        return prompt_len
    elif model == "chatgpt":
        prompt_len = len(chatgpt_encoding.encode(prompt))
        return prompt_len
    elif model == "gpt3.5":
        raise NotImplementedError


def lexical(query, values):
    if isinstance(query, str):
        for placeholder, value in values.items():
            query = query.replace(placeholder, value)
    elif isinstance(query, list):
        for i in range(len(query)):
            if query[i] in values:
                query[i] = values[query[i]]
    return query


def delexical(query):
    values = {}
    new_query = ""
    in_value = False
    in_col = False
    value = ""
    placeholder_id = 0
    new_query = ""
    for char in query:
        if char == "'":
            in_value = not in_value
            value += char
            if not in_value:
                values[f"value_{placeholder_id}"] = value
                new_query += f"value_{placeholder_id}"
                placeholder_id += 1
                value = ""
        else:
            if not in_value:
                new_query += char
            else:
                value += char
    return new_query, values


def format_query(q, format_type):
    if format_type == 'unnormalized':
        return q["query"]
    elif format_type == 'normalized':
        return q["gold"]["query_normalized"]
    else:
        raise ValueError(f"format_type {format_type} not supported")


def _is_whitespace(sqlparse_token):
    return sqlparse_token.ttype == sqlparse.tokens.Whitespace


def normalize_sql(sql_exp, schema):
    sql_exp = sql_exp.replace('"', "'")
    if sql_exp.count("'") % 2 != 0:  # odd number of single quotes, meaning the value is incomplete or value contains a single quote
        ood_quotes = True
    else:
        ood_quotes = False
    if not ood_quotes:
        sql_exp, values = delexical(sql_exp)
        sql_exp = sql_exp.lower()
    sql_exp = sql_exp.rstrip(";")
    parse = sqlparse.parse(sql_exp)
    sql = parse[0]
    flat_tokens = sql.flatten()
    sql_tokens = [
        token.value for token in flat_tokens if not _is_whitespace(token)
    ]
    sql_lower = ' '.join(sql_tokens)
    sql_lower = sql_lower.replace(' . ', '.')
    for op in AGG_OPS:
        sql_lower = sql_lower.replace(f" {op} (", f" {op}(")
    sql_lower = sql_lower.replace('( ', '(')
    sql_lower = sql_lower.replace(' )', ')')
    sql_lower = sql_lower.replace(' ,', ',')
    sql_lower = sql_lower.rstrip(";")
    sql_lower += ';'
    if not ood_quotes:
        sql_tokens = lexical(sql_tokens, values)
        sql_lower = lexical(sql_lower, values)
    else:
        print("Cannot process the following SQL")
        print(sql_exp, sql_tokens)

    return sql_lower


def petershaw_tokenize_sql(sql_exp):
    """
    Code is adapted from https://github.com/google-research/language/blob/master/language/compgen/nqg/tasks/spider/sql_tokenizer.py"""
    sql_exp = sql_exp.lower()
    sql_exp = sql_exp.rstrip(";")
    parse = sqlparse.parse(sql_exp)
    sql = parse[0]
    flat_tokens = sql.flatten()
    sql_tokens = [
        token.value for token in flat_tokens if not _is_whitespace(token)
    ]
    return sql_tokens


def is_number(token):
    """Check if token is a SQL number literal."""
    # Note that Python's is_numeric() will return False for values like 30.3.
    try:
        float(token)
        return True
    except ValueError:
        return False


petershaw_PLACEHOLDER = "___"


def get_petershaw_template(target):
    """
    Code is adapted from https://github.com/google-research/language/blob/master/language/compgen/nqg/tasks/spider/gen_template_split.py
    Anonymize quoted substrings and numbers in SQL."""
    # First, replace any numeric token.
    tokens = petershaw_tokenize_sql(target)
    template_tokens = []
    for token in tokens:
        if is_number(token):
            template_tokens.append(petershaw_PLACEHOLDER)
        else:
            template_tokens.append(token)
    template = " ".join(template_tokens)

    # Second, replace any subspan surrounded by single or double quotes.
    in_quotes = False
    quote_token = None
    new_template = ""
    for char in template:
        if in_quotes:
            if char == quote_token:
                in_quotes = False
                quote_token = None
        else:
            if char in ("'", "\""):
                in_quotes = True
                quote_token = char
                new_template += petershaw_PLACEHOLDER
            else:
                new_template += char
    return new_template


def find_random_examples(test_q, questions, split="template", deduplicate_demo="nlq"):
    assert split in ["sql", "nlq", "template", None]
    assert deduplicate_demo in ["sql", "nlq", "template"]
    questions_shuffled = random.sample(questions, len(questions))

    seen = set()
    new_questions = []
    for q in questions_shuffled:
        if (split == "nlq" and q["question"] == test_q["question"]) \
                or (split == "sql" and q["query"] == test_q["query"]) \
                or (split == "template" and q["sql_template"] == test_q["sql_template"]):
            continue
        if deduplicate_demo == "nlq" and q["question"] not in seen:
            new_questions.append(q)
            seen.add(q["question"])
        elif deduplicate_demo == "sql" and q["query"] not in seen:
            new_questions.append(q)
            seen.add(q["query"])
        elif deduplicate_demo == "template" and q["sql_template"] not in seen:
            new_questions.append(q)
            seen.add(q["sql_template"])
    return new_questions
