import os
import json
import sqlite3
import subprocess

DATA_PATH = "data_processed"


def get_prompt_length(prompt):
    result = subprocess.run(["node", "codex_prompt_length.mjs", prompt], stdout=subprocess.PIPE)
    prompt_len = eval(result.stdout)
    return prompt_len


def is_number(token):
    """Check if token is a SQL number literal."""
    try:
        float(token)
        return True
    except ValueError:
        return False


prompt_length_by_db = {'department_management': 178, 'farm': 285, 'student_assessment': 696, 'bike_1': 418, 'book_2': 112, 'musical': 129, 'twitter_1': 221,
                       'product_catalog': 460, 'flight_1': 238, 'allergy_1': 166, 'store_1': 980, 'journal_committee': 152, 'customers_card_transactions': 367,
                       'race_track': 113, 'coffee_shop': 245, 'chinook_1': 1216, 'insurance_fnol': 482, 'medicine_enzyme_interaction': 177,
                       'university_basketball': 181, 'phone_1': 235, 'match_season': 233, 'climbing': 129, 'body_builder': 128, 'election_representative': 128,
                       'apartment_rentals': 557, 'game_injury': 198, 'soccer_1': 781, 'performance_attendance': 166, 'college_2': 1081, 'debate': 194,
                       'insurance_and_eClaims': 565, 'customers_and_invoices': 869, 'wedding': 193, 'theme_gallery': 171, 'epinions_1': 239, 'riding_club': 318,
                       'gymnast': 155, 'small_bank_1': 126, 'browser_web': 170, 'wrestler': 143, 'school_finance': 224, 'protein_institute': 237, 'cinema': 212,
                       'products_for_hire': 720, 'phone_market': 181, 'gas_company': 215, 'party_people': 264, 'pilot_record': 215,
                       'cre_Doc_Control_Systems': 841, 'company_1': 251, 'local_govt_in_alabama': 235, 'formula_1': 863, 'machine_repair': 243,
                       'entrepreneur': 122, 'perpetrator': 128, 'csu_1': 261, 'candidate_poll': 144, 'movie_1': 106, 'county_public_safety': 177, 'inn_1': 126,
                       'local_govt_mdm': 617, 'party_host': 179, 'storm_record': 178, 'election': 201, 'news_report': 176, 'restaurant_1': 268,
                       'customer_deliveries': 945, 'icfp_1': 195, 'sakila_1': 1588, 'loan_1': 255, 'behavior_monitoring': 1020, 'assets_maintenance': 1207,
                       'station_weather': 236, 'college_1': 647, 'sports_competition': 332, 'manufacturer': 198, 'hr_1': 703, 'music_1': 408,
                       'baseball_1': 2344, 'mountain_photos': 177, 'program_share': 247, 'e_learning': 489, 'insurance_policies': 383, 'hospital_1': 1452,
                       'ship_mission': 129, 'student_1': 87, 'company_employee': 198, 'film_rank': 186, 'cre_Doc_Tracking_DB': 789, 'club_1': 179,
                       'tracking_grants_for_research': 790, 'network_2': 102, 'decoration_competition': 168, 'document_management': 591, 'company_office': 183,
                       'solvency_ii': 691, 'entertainment_awards': 181, 'customers_campaigns_ecommerce': 675, 'college_3': 492, 'department_store': 1009,
                       'aircraft': 414, 'local_govt_and_lot': 955, 'school_player': 275, 'store_product': 305, 'soccer_2': 189, 'device': 177,
                       'cre_Drama_Workshop_Groups': 1953, 'music_2': 322, 'manufactory_1': 128, 'tracking_software_problems': 529, 'shop_membership': 260,
                       'voter_2': 270, 'products_gen_characteristics': 460, 'swimming': 248, 'railway': 255, 'customers_and_products_contacts': 500,
                       'dorm_1': 255, 'customer_complaints': 426, 'workshop_paper': 158, 'tracking_share_transactions': 434, 'cre_Theme_park': 1231,
                       'game_1': 229, 'customers_and_addresses': 508, 'music_4': 192, 'roller_coaster': 136, 'ship_1': 122, 'city_record': 260,
                       'e_government': 799, 'school_bus': 173, 'flight_company': 199, 'cre_Docs_and_Epenses': 482, 'scientist_1': 137, 'wine_1': 165,
                       'train_station': 184, 'driving_school': 582, 'activity_1': 270, 'flight_4': 525, 'tracking_orders': 468, 'architecture': 169,
                       'culture_company': 218, 'concert_singer': 252, 'pets_1': 160, 'car_1': 257, 'flight_2': 151, 'employee_hire_evaluation': 234,
                       'cre_Doc_Template_Mgt': 308, 'course_teach': 162, 'museum_visit': 176, 'wta_1': 352, 'battle_death': 194,
                       'student_transcripts_tracking': 889, 'tvshow': 236, 'poker_player': 135, 'voter_1': 189, 'world_1': 376, 'orchestra': 271,
                       'network_1': 166, 'dog_kennels': 676, 'singer': 126, 'real_estate_properties': 585}
OOD_SCHEMA_MAXLEN = 1000


def normalize_create_table(table_name, create_table_statement):
    create_table_statement = create_table_statement.strip()
    create_table_statement = create_table_statement.replace("`", "\"").replace("'", "\"").replace("[", "\"").replace("]", "\"")
    create_table_statement = create_table_statement.replace("\"", '')
    create_table_statement = create_table_statement.replace('\t', ' ').replace('\n', ' ')
    create_table_statement = ' '.join(create_table_statement.split())
    create_table_statement_split = [""]
    num_left = 0
    for tok in create_table_statement:
        if tok == "(":
            num_left += 1
            create_table_statement_split[-1] += tok
        elif tok == ")":
            num_left -= 1
            create_table_statement_split[-1] += tok
        elif tok != ',':
            create_table_statement_split[-1] += tok
        if tok == ',':
            if num_left == 1:
                create_table_statement_split.append("")
                continue
            else:
                create_table_statement_split[-1] += tok
                continue
    create_table_statement = create_table_statement_split
    new_create_table_statement = []
    for i, x in enumerate(create_table_statement):
        if i == 0:
            x = x.split('(')
            x1 = x[0].strip()
            x2 = ','.join(x[1:]).strip()
            new_create_table_statement.append(x1 + " (")
            new_create_table_statement.append(x2 + ",")
        elif i == len(create_table_statement) - 1:
            x = x.split(')')
            x1 = ')'.join(x[:-1]).strip()
            x2 = x[-1].strip()
            new_create_table_statement.append(x1)
            new_create_table_statement.append(x2 + ")")
        else:
            new_create_table_statement.append(x.strip() + ",")

    return '\n'.join(new_create_table_statement)


def get_foreign_keys(db_id, table, create_table_statement):
    foreign_keys = []
    for row in create_table_statement.split('\n'):
        if row.lower().startswith("foreign key") and row.lower().count("foreign key") == 1:
            if " on " in row:
                row = row.split(" on ")[0]
            if " ON " in row:
                row = row.split(" ON ")[0]
            # row.replace(" ON DELETE CASCADE", "")
            # row.replace(" on delete cascade", "")
            row = row.replace(",", " ").replace("(", "  ").replace(")", "  ")
            row = row.split()
            if len(row) != 6:  # multiple keys
                # print(db_id, create_table_statement)
                for i, tok in enumerate(row):
                    if tok.lower() == "references":
                        references_pos = i
                num_keys = references_pos - 2
                # print(num_keys)
                # print(row)
                for i in range(num_keys):
                    key = f"{table}.{row[2 + i]} = {row[4 + num_keys - 1]}.{row[4 + num_keys + i]}"
                    foreign_keys.append(key)
                # print(foreign_keys)
                continue
            else:
                # assert len(row) == 6
                key = f"{table}.{row[2]} = {row[4]}.{row[5]}"
                foreign_keys.append(key)
    return foreign_keys


def extract_tablecolumn_prompt(prompt_db, db_id, db_path, limit_value=3, normalization=True):
    table_query = "SELECT * FROM sqlite_master WHERE type='table';"
    tables = sqlite3.connect(db_path).cursor().execute(table_query).fetchall()
    prompt = ""
    foreign_keys = []
    for table in tables:
        table_name = table[1]
        if normalization:
            table_name = table_name.lower()
        create_table_statement = table[-1]
        create_table_statement = normalize_create_table(table_name, create_table_statement)
        foreign_keys_one_table = get_foreign_keys(db_id, table_name, create_table_statement)
        table_info_query = f"PRAGMA table_info({table_name});"
        headers = [x[1] for x in sqlite3.connect(db_path).cursor().execute(table_info_query).fetchall()]
        if normalization:
            foreign_keys_one_table = [x.lower() for x in foreign_keys_one_table]
            headers = [x.lower() for x in headers]
        foreign_keys.extend(foreign_keys_one_table)
        table_statement = ""
        if prompt_db.startswith("Table(Columns)"):
            table_statement += f"{table_name}({', '.join(headers)});\n"
        if prompt_db.startswith("Columns=[]"):
            table_statement += f"Table {table_name}, Columns = [{', '.join(headers)}];\n"
        prompt += table_statement
    if "+FK" in prompt_db:
        prompt += "Foreign_keys = [" + ', '.join(foreign_keys) + "];\n"
    prompt += '\n'
    return prompt


def extract_create_table_prompt(prompt_db, db_id, db_path, limit_value=3, normalization=True):
    table_query = "SELECT * FROM sqlite_master WHERE type='table';"
    tables = sqlite3.connect(db_path).cursor().execute(table_query).fetchall()
    prompt = ""
    for table in tables:
        table_name = table[1]
        if normalization:
            table_name = table_name.lower()
        create_table_statement = table[-1]

        table_info_query = f"PRAGMA table_info({table_name});"
        top_k_row_query = f"SELECT * FROM {table_name} LIMIT {limit_value};"
        headers = [x[1] for x in sqlite3.connect(db_path).cursor().execute(table_info_query).fetchall()]
        if normalization:
            create_table_statement = normalize_create_table(table_name, create_table_statement)
            create_table_statement = create_table_statement.lower()
            top_k_row_query = top_k_row_query.lower()
            headers = [x.lower() for x in headers]
        top_k_rows = sqlite3.connect(db_path).cursor().execute(top_k_row_query).fetchall()

        prompt += create_table_statement + ";\n"
        if limit_value > 0:
            if prompt_db.startswith("CreateTableSelectRow"):
                prompt += f"/*\n3 example rows:\n{top_k_row_query}\n{'    '.join(headers)}\n"
                for row in top_k_rows:
                    row = [str(x) for x in row]
                    row = [x if x is not None else "" for x in row]

                    prompt += '    '.join(row) + "\n"
                prompt += "*/\n"
            elif prompt_db.startswith("CreateTableInsertRow"):
                for row in top_k_rows:
                    if normalization:
                        insert_statement = f"insert into {table_name} (" + ', '.join(headers) + ") values "
                    else:
                        insert_statement = f"INSERT INTO {table_name} (" + ', '.join(headers) + ") VALUES "
                    row = [x if x is not None else "" for x in row]
                    row = [str(x) if is_number(x) else '"' + str(x) + '"' for x in row]
                    insert_statement += "(" + ', '.join(row) + ");"
                    prompt += insert_statement + "\n"
        prompt += "\n"

    return prompt


def extract_create_table_prompt_column_example(prompt_db, db_id, db_path, limit_value=3, normalization=True):
    table_query = "SELECT * FROM sqlite_master WHERE type='table';"
    tables = sqlite3.connect(db_path).cursor().execute(table_query).fetchall()
    prompt = ""
    for table in tables:
        table_name = table[1]
        if normalization:
            table_name = table_name.lower()
        create_table_statement = table[-1]

        table_info_query = f"PRAGMA table_info({table_name});"
        headers = [x[1] for x in sqlite3.connect(db_path).cursor().execute(table_info_query).fetchall()]
        if normalization:
            create_table_statement = normalize_create_table(table_name, create_table_statement)
            create_table_statement = create_table_statement.lower()
            headers = [x.lower() for x in headers]
        prompt += create_table_statement + ";\n"
        if limit_value > 0:
            prompt_columns = []
            for col_name in headers:
                if col_name.lower() == "index":
                    top_k_rows = list(range(limit_value))
                    top_k_rows = '    '.join([str(x) for x in top_k_rows])
                else:
                    top_k_row_query = f"SELECT distinct \"{col_name}\" FROM {table_name} LIMIT {limit_value};"
                    top_k_rows = sqlite3.connect(db_path).cursor().execute(top_k_row_query).fetchall()
                    top_k_rows = [x[0].strip() if isinstance(x[0], str) else x[0] for x in top_k_rows]  # remove \n and space prefix and suffix in cell value
                    top_k_rows = [x if x is not None else "" for x in top_k_rows]
                    top_k_rows = ', '.join([str(x) if is_number(x) else '"' + str(x) + '"' for x in top_k_rows][:limit_value])

                prompt_columns.append(f"{col_name}: {top_k_rows};")

            prompt += "/*\n"
            prompt += f"Columns in {table_name} and {limit_value} distinct examples in each column:\n"
            prompt += "\n".join(prompt_columns)
            prompt += "\n*/\n"
        prompt += "\n"

    return prompt


def generate_db_prompt(dataset, db_id, prompt_db="CreateTableSelect", limit_value=3, normalization=True):
    db_dir = f"{DATA_PATH}/{dataset}/database"
    table_path = f"{DATA_PATH}/{dataset}/tables/tables.json"

    db_path = os.path.join(db_dir, db_id, db_id + ".sqlite")
    if prompt_db.startswith("Table(Columns)") or prompt_db.startswith("Columns=[]"):
        schema_prompt = extract_tablecolumn_prompt(prompt_db, db_id, db_path, limit_value=limit_value, normalization=normalization)
    elif prompt_db.startswith("CreateTable"):
        if prompt_db.startswith("CreateTableSelectCol"):
            schema_prompt = extract_create_table_prompt_column_example(prompt_db, db_id, db_path, limit_value=limit_value, normalization=normalization)
        else:
            schema_prompt = extract_create_table_prompt(prompt_db, db_id, db_path, limit_value=limit_value, normalization=normalization)
    else:
        print(prompt_db)
        raise NotImplementedError
    prompt = schema_prompt + "-- Using valid SQLite, answer the following questions for the tables provided above.\n"
    return (prompt)
