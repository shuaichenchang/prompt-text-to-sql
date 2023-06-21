import argparse
from database_prompt_construction import generate_db_prompt
from sql_generation import get_prompt_length

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
    for db_id in spider_dev_db_ids:
        print('\n' * 5)
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
