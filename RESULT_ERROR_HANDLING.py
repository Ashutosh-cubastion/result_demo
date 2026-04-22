import pandas as pd
import numpy as np
import re
import traceback


print("NumPy version:", np.__version__)
print("Pandas version:", pd.__version__)


# =============================================================================
# FILE PATHS — update these before running
# =============================================================================

CANDIDATE_CSV = r"C:\Users\AshutoshMishra\CTGD_DEMO_2026\python\data\candidates_final.csv"
VACANCY_CSV   = r"C:\Users\AshutoshMishra\CTGD_DEMO_2026\python\data\vacancy_table_raw.csv"




step_log = {}

def log_step(name, ok, note=""):
    step_log[name] = ok
    tag = "PASS" if ok else "FAIL"
    print(f"  [{tag}] {name}{(' — ' + note) if note else ''}")

def _header(title):
    print(f"\n{'='*60}")
    print(f"  {title}")
    print(f"{'='*60}")


# =============================================================================
# SANITY CHECK FUNCTIONS
# =============================================================================

CANDIDATE_REQUIRED_COLS = [
    "regno", "rollno", "cand_name", "dob",
    "cat1", "cat2", "cat3", "gender",
    "statecode_considered", "naxal_district", "border_district",
    "parta_gi", "partb_ga", "normalized_score", "total_marks", "ncc_marks",
    "rejection_provision", "post_pref", "agerelax_code",
    "exs_reservation", "service_period",
    "ht_rlx_code", "chst_rlx_code", "height_relax", "chest_relax", "height_chest_relax",
]

VALID_CAT1     = {0, 1, 2, 6, 9}
VALID_CAT2     = {3}
VALID_GENDER   = {1, 2, 3}
VALID_AGERELAX = {1, 2, 3, 4, 5, 6}


def check_candidate_df(df):
    _header("CANDIDATE_DF SANITY CHECK")
    failures = 0

    print("\n[1] Required Columns")
    missing_cols = [c for c in CANDIDATE_REQUIRED_COLS if c not in df.columns]
    if missing_cols:
        print(f"    FAIL - Missing columns: {missing_cols}")
        failures += 1
    else:
        print(f"    All {len(CANDIDATE_REQUIRED_COLS)} required columns present:")
        print(f"    {CANDIDATE_REQUIRED_COLS}")

    print("\n[2] Row Count")
    print(f"    Total rows: {len(df):,}")

    print("\n[3] Duplicate Checks")
    try:
        dup_rollno = df['rollno'].duplicated().sum()
        dup_regno  = df['regno'].duplicated().sum()
        if dup_rollno:
            print(f"    FAIL - Duplicate rollno found: {dup_rollno} rows")
            failures += 1
        else:
            print("    No duplicate rollno")
        if dup_regno:
            print(f"    FAIL - Duplicate regno found: {dup_regno} rows")
            failures += 1
        else:
            print("    No duplicate regno")
    except Exception as e:
        print(f"    WARN - Could not check duplicates: {e}")

    print("\n[4] DOB Checks")
    try:
        if not pd.api.types.is_datetime64_any_dtype(df['dob']):
            print("    FAIL - dob column is NOT datetime — run pd.to_datetime(candidate_df['dob']) first")
            failures += 1
        else:
            print("    dob column is datetime type")
            null_dob = df['dob'].isnull().sum()
            if null_dob:
                print(f"    WARN - {null_dob} rows have NULL dob")
            else:
                print("    No NULL dob values")
    except Exception as e:
        print(f"    WARN - Could not check dob: {e}")

    print("\n[5] Gender Check")
    try:
        invalid_gender = df[~df['gender'].isin(VALID_GENDER)]
        if len(invalid_gender):
            print(f"    FAIL - {len(invalid_gender)} rows with invalid gender (expected {VALID_GENDER})")
            print(f"    Values found: {df['gender'].value_counts().to_dict()}")
            failures += 1
        else:
            print(f"    All gender values valid: {df['gender'].value_counts().to_dict()}")
    except Exception as e:
        print(f"    WARN - Could not check gender: {e}")

    print("\n[6] cat1 (Category) Check")
    try:
        cat1_vals    = df['cat1'].dropna().astype(float).astype(int)
        invalid_cat1 = cat1_vals[~cat1_vals.isin(VALID_CAT1)]
        if len(invalid_cat1):
            print(f"    FAIL - {len(invalid_cat1)} rows with invalid cat1 (expected {VALID_CAT1})")
            print(f"    Values found: {invalid_cat1.value_counts().to_dict()}")
            failures += 1
        else:
            print(f"    All cat1 values valid. Distribution: {cat1_vals.value_counts().to_dict()}")
        null_cat1 = df['cat1'].isnull().sum()
        if null_cat1:
            print(f"    WARN - {null_cat1} NULL cat1 values")
    except Exception as e:
        print(f"    WARN - Could not validate cat1: {e}")

    print("\n[7] cat2 Check (should be 3 or NULL)")
    try:
        cat2_nonnull = df['cat2'].dropna()
        invalid_cat2 = cat2_nonnull[~cat2_nonnull.astype(float).astype(int).isin(VALID_CAT2)]
        if len(invalid_cat2):
            print(f"    FAIL - {len(invalid_cat2)} rows with unexpected cat2 values: {invalid_cat2.unique()[:10]}")
            failures += 1
        else:
            print(f"    cat2 values OK — {(df['cat2'].dropna().astype(float).astype(int) == 3).sum()} candidates have cat2=3 (OBC)")
    except Exception as e:
        print(f"    WARN - Could not validate cat2: {e}")

    print("\n[8] agerelax_code Check")
    try:
        arc_series = df['agerelax_code'].dropna()
        arc_int    = arc_series.astype(float).astype(int)
        invalid_arc = arc_int[~arc_int.isin(VALID_AGERELAX)]
        if len(invalid_arc):
            print(f"    FAIL - {len(invalid_arc)} rows with invalid agerelax_code: {invalid_arc.unique()[:10]}")
            failures += 1
        else:
            print(f"    agerelax_code values OK. Distribution: {arc_int.value_counts().to_dict()}")
            print(f"    NULL agerelax_code: {df['agerelax_code'].isnull().sum()} rows")
    except Exception as e:
        print(f"    WARN - Could not validate agerelax_code: {e}")

    print("\n[12] Naxal / Border District Flags")
    for col in ['naxal_district', 'border_district']:
        try:
            if col in df.columns:
                unique_vals = set(df[col].dropna().unique())
                valid_sets  = [{"Yes", "No"}, {True, False}, {0, 1}]
                if not any(unique_vals <= v for v in valid_sets):
                    print(f"    FAIL - {col} has unexpected values: {unique_vals}")
                    failures += 1
                else:
                    print(f"    {col} values OK: {df[col].value_counts().to_dict()}")
        except Exception as e:
            print(f"    WARN - Could not check {col}: {e}")

    print("\n[14] post_pref Check")
    try:
        null_post  = df['post_pref'].isnull().sum()
        empty_post = (df['post_pref'].astype(str).str.strip() == '').sum()
        if null_post or empty_post:
            print(f"    WARN - {null_post} NULL + {empty_post} empty post_pref entries")
        else:
            print("    post_pref has no NULL/empty values")
    except Exception as e:
        print(f"    WARN - Could not check post_pref: {e}")

    print("\n[16] rejection_provision Check")
    try:
        if 'rejection_provision' in df.columns:
            rejected = (df['rejection_provision'].notnull() &
                        (df['rejection_provision'].astype(str).str.strip() != '')).sum()
            print(f"    rejection_provision — {rejected} candidates have a rejection flag")
            print(f"    Distribution: {df['rejection_provision'].value_counts(dropna=False).to_dict()}")
    except Exception as e:
        print(f"    WARN - Could not check rejection_provision: {e}")

    print("\n[18] service_period Format Check (for ARC code 3)")
    try:
        arc3_mask       = df['agerelax_code'].dropna().astype(float).astype(int) == 3
        arc3_index      = df['agerelax_code'].dropna().astype(float).astype(int)[arc3_mask].index
        arc3_candidates = df.loc[arc3_index]
        if len(arc3_candidates):
            bad_sp   = arc3_candidates['service_period'].isna().sum()
            pattern  = r'\d+ Year[s]* \d+ Month[s]* \d+ Day[s]*'
            valid_sp = arc3_candidates['service_period'].dropna().str.match(pattern).sum()
            total_sp = arc3_candidates['service_period'].dropna().shape[0]
            if bad_sp:
                print(f"    FAIL - {bad_sp} ex-servicemen (ARC=3) have NULL service_period")
                failures += 1
            elif valid_sp < total_sp:
                print(f"    WARN - {total_sp - valid_sp} service_period entries do not match 'X Years Y Months Z Days' format")
            else:
                print(f"    All {len(arc3_candidates)} ex-servicemen have valid service_period format")
        else:
            print("    No ARC code 3 (ex-servicemen) candidates in dataset")
    except Exception as e:
        print(f"    WARN - Could not check service_period: {e}")

    _header("CANDIDATE_DF SUMMARY")
    if failures == 0:
        print("    All checks passed. Dataset is ready for processing.")
    else:
        print(f"    {failures} CRITICAL issue(s) found. Fix before proceeding!")

    return failures == 0


VACANCY_REQUIRED_COLS = [
    "state_code", "gender", "post_code", "area", "category_code",
    "initial", "current", "allocated", "allocated_hc",
]


def check_vacancy_df(df):
    _header("VACANCY_DF SANITY CHECK")
    failures = 0

    print("\n[1] Required Columns")
    missing_cols = [c for c in VACANCY_REQUIRED_COLS if c not in df.columns]
    present_cols = [c for c in VACANCY_REQUIRED_COLS if c in df.columns]
    if missing_cols:
        print(f"    FAIL - Missing columns: {missing_cols}")
        failures += 1
    else:
        print(f"    All {len(VACANCY_REQUIRED_COLS)} required columns present:")
        print(f"    {present_cols}")

    print("\n[7] Vacancy Counts Non-Negative")
    for col in ['initial', 'current', 'allocated', 'allocated_hc']:
        try:
            if col in df.columns:
                neg = (df[col] < 0).sum()
                if neg:
                    print(f"    FAIL - {neg} negative values in '{col}'")
                    failures += 1
                else:
                    print(f"    '{col}' — no negative values (total={df[col].sum():,})")
        except Exception as e:
            print(f"    WARN - Could not check '{col}': {e}")

    print("\n[8] current <= initial Check")
    try:
        if 'initial' in df.columns and 'current' in df.columns:
            over = (df['current'] > df['initial']).sum()
            if over:
                print(f"    FAIL - {over} rows where current > initial")
                failures += 1
            else:
                print("    current <= initial for all rows")
    except Exception as e:
        print(f"    WARN - Could not check current vs initial: {e}")

    print("\n[9] allocated_hc <= initial Check")
    try:
        if 'initial' in df.columns and 'allocated_hc' in df.columns:
            over_hc = (df['allocated_hc'] > df['initial']).sum()
            if over_hc:
                print(f"    FAIL - {over_hc} rows where allocated_hc > initial")
                failures += 1
            else:
                print("    allocated_hc <= initial for all rows")
    except Exception as e:
        print(f"    WARN - Could not check allocated_hc vs initial: {e}")

    _header("VACANCY_DF SUMMARY")
    if failures == 0:
        print("    All checks passed. Vacancy data is ready.")
    else:
        print(f"    {failures} CRITICAL issue(s) found. Fix before proceeding!")

    return failures == 0


CUTOFF_REQUIRED_COLS = ["serial_id", "category", "total"]
EXPECTED_CUTOFF_CATS = {0, 1, 2, 3, 6, 9}
CUTOFF_CAT_NAMES     = {0: "UR", 1: "SC", 2: "ST", 3: "OBC/EXS", 6: "EWS", 9: "Migrated/UR"}


def check_cutoff_df(df):
    _header("CUTOFF_DF SANITY CHECK")
    failures = 0

    print("\n[1] Required Columns")
    missing_cols = [c for c in CUTOFF_REQUIRED_COLS if c not in df.columns]
    present_cols = list(df.columns)
    if missing_cols:
        print(f"    FAIL - Missing columns: {missing_cols}")
        failures += 1
    else:
        print(f"    All required columns present:")
        print(f"    {present_cols}")

    print("\n[2] Expected Categories Present")
    try:
        if 'category' in df.columns:
            present_cats = set(df['category'].astype(int).unique())
            missing_cats = EXPECTED_CUTOFF_CATS - present_cats
            extra_cats   = present_cats - EXPECTED_CUTOFF_CATS
            if missing_cats:
                print(f"    FAIL - Missing categories: {missing_cats}")
                failures += 1
            else:
                print(f"    All expected categories present: {sorted(present_cats)}")
            if extra_cats:
                print(f"    WARN - Extra/unexpected categories found: {extra_cats}")
    except Exception as e:
        print(f"    WARN - Could not check categories: {e}")

    print("\n[3] Duplicate Category Check")
    try:
        if 'category' in df.columns:
            dup_cats = df['category'].duplicated().sum()
            if dup_cats:
                print(f"    FAIL - {dup_cats} duplicate category entries")
                failures += 1
            else:
                print("    No duplicate categories")
    except Exception as e:
        print(f"    WARN - Could not check duplicate categories: {e}")

    print("\n[5] Cutoff Table (for manual verification)")
    try:
        if 'category' in df.columns and 'total' in df.columns:
            display_df = df[['category', 'total']].copy()
            display_df['category_name'] = display_df['category'].map(CUTOFF_CAT_NAMES).fillna("Unknown")
            print(display_df[['category', 'category_name', 'total']].to_string(index=False))
    except Exception as e:
        print(f"    WARN - Could not display cutoff table: {e}")

    _header("CUTOFF_DF SUMMARY")
    if failures == 0:
        print("    All checks passed. Cutoff table is ready.")
    else:
        print(f"    {failures} CRITICAL issue(s) found. Fix before proceeding!")

    return failures == 0


# =============================================================================
# PROCESSING FUNCTIONS
# =============================================================================

def get_merit(candidate_df):
    candidate_df['merit'] = None

    candidates = candidate_df[
        candidate_df['normalized_score'].notnull()
    ].sort_values(
        by=['total_marks', 'parta_gi', 'partb_ga', 'dob', 'cand_name'],
        ascending=[False, False, False, True, True]
    )

    candidates['merit'] = range(1, len(candidates) + 1)

    rollno_to_merit = candidates.set_index('rollno')['merit'].to_dict()
    candidate_df['merit'] = candidate_df['rollno'].map(rollno_to_merit)

    return "merit updated successfully for {merit} candidates".format(merit=len(candidates))


def get_cutoff(cutoff_df, candidate_df):
    cutoff = 'cutoff_flag'
    sorted_candidates = candidate_df[candidate_df['merit'].notnull()].sort_values(by='merit')

    candidate_df[cutoff] = None
    cutoff_dict = {}

    for index, row in cutoff_df.iterrows():
        category = int(row['category'])
        total    = float(row['total'])
        cutoff_dict[category] = total

    def calculate_cutoff(candidate):
        cutoff = ''
        if candidate['normalized_score'] >= cutoff_dict[9]:
            cutoff += '9'
        for cat in [0, 1, 2, 6]:
            if (candidate['cat1'] == cat) & (cat in cutoff_dict):
                if candidate['normalized_score'] >= cutoff_dict[cat]:
                    cutoff += str(cat)
        if (candidate['cat2'] == 3) & (3 in cutoff_dict):
            if candidate['normalized_score'] >= cutoff_dict[3]:
                cutoff += '3'
        return cutoff

    sorted_candidates[cutoff] = sorted_candidates.apply(lambda row: calculate_cutoff(row), axis=1)
    candidate_df.update(sorted_candidates)

    return f"{cutoff} updated successfully"


def get_dob_flag(candidate_df, arc_df):
    dob_flag      = 'dob_flag'
    dob_to_date   = pd.to_datetime('01/02/2007', format="%m/%d/%Y")
    dob_from_date = pd.to_datetime('01/01/2002', format="%m/%d/%Y")

    arc_year_dict = dict(zip(arc_df['arc_code'].astype(str), arc_df['arc_year']))

    candidate_df[dob_flag] = ''

    def calculate_verification_flag(row):
        dob = row['dob']
        verification_flag = ''

        if dob >= dob_to_date:
            verification_flag = 'U'
        elif dob_from_date < dob < dob_to_date:
            verification_flag = '9'
        elif dob <= dob_from_date:
            agerelax_code = row['agerelax_code']

            if pd.isna(agerelax_code) or agerelax_code == '':
                agerelax_code = '99'
            if isinstance(agerelax_code, str) and len(agerelax_code.strip()) == 1:
                agerelax_code = agerelax_code.strip()

            age_rlx_year = arc_year_dict.get(agerelax_code, 0)

            if agerelax_code == '3':
                ex_service_years  = row['exsm_yrs']
                ex_service_months = row['exsm_months']
                ex_service_days   = row['exsm_days']
                age_rlx_year += int(ex_service_years) if ex_service_years else 0
                new_dob = dob + pd.DateOffset(years=age_rlx_year, months=ex_service_months, days=ex_service_days)
            else:
                extract_year  = dob.year
                extract_month = dob.month
                extract_day   = dob.day
                new_year = extract_year + int(age_rlx_year)
                if extract_month == 2 and extract_day == 29:
                    extract_day = 28
                new_dob = pd.to_datetime(f"{new_year}-{extract_month}-{extract_day}", format='%Y-%m-%d')

            if new_dob > dob_from_date:
                if len(agerelax_code) < 2:
                    verification_flag = '0' + agerelax_code
                else:
                    verification_flag = agerelax_code
            else:
                verification_flag = '99'

        return verification_flag

    sorted_candidates = candidate_df[candidate_df['merit'].notnull()]
    sorted_candidates[dob_flag] = sorted_candidates.apply(calculate_verification_flag, axis=1)
    candidate_df.update(sorted_candidates)

    return f"{dob_flag} updated successfully"


def get_catsel_dob(candidate_df, arc_df):
    dob_flag        = 'dob_flag'
    catsel_dob_flag = 'catsel_dob_flag'
    dob_from_date   = pd.to_datetime('01/01/2002', format="%m/%d/%Y")

    candidate_df[catsel_dob_flag] = ''

    filtered_and_sorted_candidates = candidate_df[
        (candidate_df['merit'].notnull()) &
        (candidate_df[dob_flag].notnull()) &
        (candidate_df[dob_flag] != '')
    ]

    def calculate_catsel_dob(row, dob_flag_name):
        dob_flag = row[dob_flag_name]
        if dob_flag is not None and dob_flag != '' and dob_flag != '9':
            matching_rows = arc_df[arc_df['arc_code'] == dob_flag]
            if not matching_rows.empty:
                catsel        = matching_rows.iloc[0]
                catsel_cat1   = catsel['arc_cat1'].split(',')
                catsel_cat2   = catsel['arc_cat2'].split(',')
                catsel_gender = catsel['arc_gender'].split(',')
                condition     = (str(row['cat1']) in catsel_cat1) & (str(int(row['gender'])) in catsel_gender)
                catsel_dob    = ''

                if row['cat2'] == '3' and row['cat2'] in catsel_cat2:
                    catsel_dob = row['cat2']
                else:
                    if pd.isnull(catsel['arc_year_against_ur']):
                        catsel['arc_year_against_ur'] = 0
                    dob_datetime  = pd.to_datetime(row['dob'])
                    extract_year  = dob_datetime.year
                    extract_month = dob_datetime.month
                    extract_day   = dob_datetime.day
                    if (extract_day == 29) and (extract_month == 2):
                        extract_day = 28
                    new_year            = extract_year + int(catsel['arc_year_against_ur'])
                    new_dob             = pd.to_datetime(f'{new_year}-{extract_month}-{extract_day}')
                    catsel_dob_decision = new_dob > dob_from_date
                    catsel_dob          = '9' if catsel_dob_decision else row['cat1']

                return catsel_dob if condition else ''
            else:
                return ''
        else:
            return dob_flag

    filtered_and_sorted_candidates[catsel_dob_flag] = filtered_and_sorted_candidates.apply(
        calculate_catsel_dob, args=(dob_flag,), axis=1
    )
    candidate_df.update(filtered_and_sorted_candidates)
    return f"{catsel_dob_flag} updated successfully"


def get_catsel(candidate_df):
    cutoff_flag     = 'cutoff_flag'
    catsel_flag     = 'catsel'
    catsel_dob_flag = 'catsel_dob_flag'

    candidate_df[catsel_flag] = ''

    candidates = candidate_df[candidate_df['merit'].notnull()].sort_values(by='rollno')

    def update_cutoff_flag(candidate_record):
        if candidate_record['cat2'] == '3' and candidate_record['exs_reservation'] == "No":
            candidate_record[cutoff_flag] = candidate_record[cutoff_flag].replace('3', '').strip()
        if candidate_record[catsel_dob_flag] in ['1', '2', '6', '4', '5', '7', '8']:
            return candidate_record[cutoff_flag].replace('9', '').strip()
        elif pd.isna(candidate_record[catsel_dob_flag]) or candidate_record[catsel_dob_flag] == '':
            return ''
        else:
            return candidate_record[cutoff_flag]

    candidate_df[catsel_flag] = candidates.apply(update_cutoff_flag, axis=1)
    return f"{catsel_flag} updated successfully"


def update_allocation(candidates_df, state, gender, post, area, category, cat1, allocated_against_ur, candidate, vacancy_dict):
    if str(category) in ['3', '4', '5', '7', '8']:
        key_cat1 = str(state) + str(gender) + str(post) + str(area) + str(cat1)
        if (key_cat1 not in vacancy_dict.keys()) or (vacancy_dict[key_cat1]['initial'] == 0):
            keyCat2 = str(state) + str(gender) + str(post) + str(area) + '9'
            if (keyCat2 not in vacancy_dict.keys()) or (vacancy_dict[keyCat2]['initial'] == 0):
                return False
            else:
                if vacancy_dict[keyCat2]['allocated_hc'] != vacancy_dict[keyCat2]['initial']:
                    vacancy_dict[keyCat2]['allocated_hc'] += 1
                allocated_against_ur = '1'
        else:
            if vacancy_dict[key_cat1]['allocated_hc'] != vacancy_dict[key_cat1]['initial']:
                vacancy_dict[key_cat1]['allocated_hc'] += 1
            else:
                return False

    candidates_df.loc[candidate.name, 'allocated_category']   = category
    candidates_df.loc[candidate.name, 'allocated_state']      = state
    candidates_df.loc[candidate.name, 'allocated_area']       = area
    candidates_df.loc[candidate.name, 'allocated_against_ur'] = allocated_against_ur
    candidates_df.loc[candidate.name, 'allocated_post']       = post
    return True


def allocate_candidates(candidates_df, vacancy_dict):
    filtered_candidates = candidates_df[
        (candidates_df['merit'].notnull()) | (candidates_df['catsel'] != '')
    ].sort_values(by='merit')

    for idx, candidate in filtered_candidates.iterrows():
        allocated       = False
        post_preference = candidate['post_pref']
        DOB             = candidate['dob']
        gender          = candidate['gender']
        state           = int(candidate['statecode_considered'])
        total_marks     = candidate['total_marks']
        part_a          = candidate['parta_gi']
        part_b          = candidate['partb_ga']
        cat1            = str(candidate['cat1'])

        for post in post_preference.split(','):
            catsel = candidate['catsel']

            for category in catsel:
                allocated_against_ur = ''

                def _check_allocate(key):
                    if key not in vacancy_dict or vacancy_dict[key]['current'] <= 0:
                        return False
                    mm     = vacancy_dict[key].get('min_marks_prev', 0)
                    mm_a   = vacancy_dict[key].get('min_marks_parta_prev', 0)
                    mm_b   = vacancy_dict[key].get('min_marks_partb_prev', 0)
                    mm_dob = vacancy_dict[key].get('min_marks_cand_dob_prev', pd.Timestamp.min)
                    if total_marks > mm:
                        return True
                    elif total_marks == mm:
                        if part_a > mm_a:
                            return True
                        elif part_a == mm_a:
                            if part_b > mm_b:
                                return True
                            elif part_b == mm_b:
                                if DOB <= mm_dob:
                                    return True
                    return False

                if str(post) in ['H', 'G']:
                    key = str(39) + str(gender) + str(post) + "G" + str(category)
                    if _check_allocate(key):
                        allocated = update_allocation(candidates_df, 39, gender, vacancy_dict[key]['post_code'], "G", category, cat1, allocated_against_ur, candidate, vacancy_dict)
                        if allocated:
                            vacancy_dict[key]['current']   -= 1
                            vacancy_dict[key]['allocated'] += 1
                            break

                if candidate['naxal_district'] == True:
                    key = str(state) + str(gender) + str(post) + "N" + str(category)
                    if _check_allocate(key):
                        allocated = update_allocation(candidates_df, state, gender, vacancy_dict[key]['post_code'], "N", category, cat1, allocated_against_ur, candidate, vacancy_dict)
                        if allocated:
                            vacancy_dict[key]['current']   -= 1
                            vacancy_dict[key]['allocated'] += 1
                            break

                if candidate['border_district'] == True:
                    key = str(state) + str(gender) + str(post) + "B" + str(category)
                    if _check_allocate(key):
                        allocated = update_allocation(candidates_df, state, gender, vacancy_dict[key]['post_code'], "B", category, cat1, allocated_against_ur, candidate, vacancy_dict)
                        if allocated:
                            vacancy_dict[key]['current']   -= 1
                            vacancy_dict[key]['allocated'] += 1
                            break

                key = str(state) + str(gender) + str(post) + "G" + str(category)
                if _check_allocate(key):
                    allocated = update_allocation(candidates_df, state, gender, vacancy_dict[key]['post_code'], "G", category, cat1, allocated_against_ur, candidate, vacancy_dict)
                    if allocated:
                        vacancy_dict[key]['current']   -= 1
                        vacancy_dict[key]['allocated'] += 1
                        break

            if allocated:
                break

    return vacancy_dict


def adjust_vacancy(candidates_df, vacancy_df):
    vacancy_df['current']           = vacancy_df['initial'] - vacancy_df['allocated_hc']
    vacancy_df['allocated']         = 0
    vacancy_df['left_vacancy']      = 0
    vacancy_df['allocated_hc_prev'] = vacancy_df['allocated_hc']
    vacancy_df['allocated_hc']      = 0
    return vacancy_df


def find_lowest_marks(candidates_df, vacancy_df):
    candidates_df['key'] = (
        candidates_df['allocated_state'].astype(str) +
        candidates_df['gender'].astype(str) +
        candidates_df['allocated_post'].astype(str) +
        candidates_df['allocated_area'].astype(str) +
        candidates_df['allocated_category'].astype(str)
    )
    vacancy_df['key'] = (
        vacancy_df['state_code'].astype(str) +
        vacancy_df['gender'].astype(str) +
        vacancy_df['post_code'].astype(str) +
        vacancy_df['area'].astype(str) +
        vacancy_df['category_code'].astype(str)
    )
    highest_merit_candidates = candidates_df.loc[candidates_df.groupby('key')['merit'].idxmax()]
    vacancy_df_merged = vacancy_df.merge(
        highest_merit_candidates[['key', 'total_marks', 'parta_gi', 'partb_ga', 'dob', 'merit']],
        on='key', how='left'
    )
    vacancy_df_merged['min_marks']          = vacancy_df_merged['total_marks']
    vacancy_df_merged['min_marks_parta']    = vacancy_df_merged['parta_gi']
    vacancy_df_merged['min_marks_partb']    = vacancy_df_merged['partb_ga']
    vacancy_df_merged['min_marks_cand_dob'] = vacancy_df_merged['dob']
    vacancy_df_merged['min_marks_merit']    = vacancy_df_merged['merit']
    return vacancy_df_merged


# =============================================================================
# EXECUTION — every step wrapped, script never crashes
# =============================================================================

_header("LOADING DATA")

candidate_df = None
vacancy_df   = None

try:
    candidate_df = pd.read_csv(CANDIDATE_CSV, encoding='latin1')
    print(f"  candidate_df loaded — {len(candidate_df):,} rows")
    log_step("Load candidate_df", True)
except FileNotFoundError:
    print(f"  File not found: {CANDIDATE_CSV}")
    print(f"  Update CANDIDATE_CSV path at the top of this script.")
    log_step("Load candidate_df", False, f"FileNotFoundError: {CANDIDATE_CSV}")
except Exception as e:
    print(f"  ERROR: {e}")
    log_step("Load candidate_df", False, str(e))

try:
    vacancy_df = pd.read_csv(VACANCY_CSV)
    print(f"  vacancy_df loaded — {len(vacancy_df):,} rows")
    log_step("Load vacancy_df", True)
except FileNotFoundError:
    print(f"  File not found: {VACANCY_CSV}")
    print(f"  Update VACANCY_CSV path at the top of this script.")
    log_step("Load vacancy_df", False, f"FileNotFoundError: {VACANCY_CSV}")
except Exception as e:
    print(f"  ERROR: {e}")
    log_step("Load vacancy_df", False, str(e))

try:
    candidate_df['dob'] = pd.to_datetime(candidate_df['dob'])
    log_step("DOB conversion", True)
except Exception as e:
    print(f"  ERROR converting dob: {e}")
    print(f"  Check the dob column format in your candidate CSV.")
    log_step("DOB conversion", False, str(e))


# ARC TABLE
arc_dict = [
    {'arc_code': 1, 'arc_year': 5,  'arc_cat1': '1,2',       'arc_cat2': None, 'arc_gender': '1,2,3', 'arc_year_against_ur': None},
    {'arc_code': 2, 'arc_year': 3,  'arc_cat1': '6',          'arc_cat2': None, 'arc_gender': '1,2,3', 'arc_year_against_ur': None},
    {'arc_code': 3, 'arc_year': 3,  'arc_cat1': '0,1,2,6,9', 'arc_cat2': '3',  'arc_gender': '1,2,3', 'arc_year_against_ur': None},
    {'arc_code': 4, 'arc_year': 5,  'arc_cat1': '0,9',        'arc_cat2': None, 'arc_gender': '1,2,3', 'arc_year_against_ur': None},
    {'arc_code': 5, 'arc_year': 8,  'arc_cat1': '6',          'arc_cat2': None, 'arc_gender': '1,2,3', 'arc_year_against_ur': 5},
    {'arc_code': 6, 'arc_year': 10, 'arc_cat1': '1,2',        'arc_cat2': None, 'arc_gender': '1,2,3', 'arc_year_against_ur': 5},
]
arc_df = pd.DataFrame(arc_dict)

# CUTOFF TABLE
cutoff_data = [
    {'serial_id': 1, 'category': 0, 'total': 40},
    {'serial_id': 2, 'category': 1, 'total': 32},
    {'serial_id': 3, 'category': 2, 'total': 32},
    {'serial_id': 4, 'category': 3, 'total': 32},
    {'serial_id': 5, 'category': 6, 'total': 40},
    {'serial_id': 6, 'category': 9, 'total': 48},
]
cutoff_df = pd.DataFrame(cutoff_data)


# SANITY CHECKS
if candidate_df is not None:
    try:
        check_candidate_df(candidate_df)
        log_step("Sanity check - candidate_df", True)
    except Exception as e:
        print(f"  ERROR during candidate sanity check: {e}")
        log_step("Sanity check - candidate_df", False, str(e))

if vacancy_df is not None:
    try:
        check_vacancy_df(vacancy_df)
        log_step("Sanity check - vacancy_df", True)
    except Exception as e:
        print(f"  ERROR during vacancy sanity check: {e}")
        log_step("Sanity check - vacancy_df", False, str(e))

try:
    check_cutoff_df(cutoff_df)
    log_step("Sanity check - cutoff_df", True)
except Exception as e:
    print(f"  ERROR during cutoff sanity check: {e}")
    log_step("Sanity check - cutoff_df", False, str(e))


_header("PROCESSING")

# MERIT
try:
    print(get_merit(candidate_df))
    log_step("Merit", True)
except Exception as e:
    print(f"  ERROR in get_merit: {e}")
    print(f"  Detail: {traceback.format_exc()}")
    log_step("Merit", False, str(e))

# CUTOFF FLAG
try:
    print(get_cutoff(cutoff_df, candidate_df))
    log_step("Cutoff flag", True)
except Exception as e:
    print(f"  ERROR in get_cutoff: {e}")
    print(f"  Detail: {traceback.format_exc()}")
    log_step("Cutoff flag", False, str(e))

# DOB PREREQUISITES
try:
    mask = candidate_df['cat1'].isnull()
    candidate_df.loc[mask, 'cat1'] = pd.NA
    candidate_df.loc[~mask, 'cat1'] = candidate_df.loc[~mask, 'cat1'].astype('Int64').astype(str)

    mask = candidate_df['cat2'].isnull()
    candidate_df.loc[mask, 'cat2'] = pd.NA
    candidate_df.loc[~mask, 'cat2'] = candidate_df.loc[~mask, 'cat2'].astype('Int64').astype(str)

    mask = candidate_df['agerelax_code'].isnull()
    candidate_df.loc[mask, 'agerelax_code'] = ''
    candidate_df.loc[~mask, 'agerelax_code'] = candidate_df.loc[~mask, 'agerelax_code'].astype(int).astype(str)

    candidate_df[['exsm_yrs', 'exsm_months', 'exsm_days']] = candidate_df['service_period'].str.extract(
        r'(\d+) Year[s]* (\d+) Month[s]* (\d+) Day[s]*'
    )
    candidate_df[['exsm_yrs', 'exsm_months', 'exsm_days']] = candidate_df[['exsm_yrs', 'exsm_months', 'exsm_days']].apply(pd.to_numeric)
    log_step("DOB prerequisites", True)
except Exception as e:
    print(f"  ERROR in DOB prerequisites: {e}")
    print(f"  Detail: {traceback.format_exc()}")
    log_step("DOB prerequisites", False, str(e))

# DOB FLAG
try:
    print(get_dob_flag(candidate_df, arc_df))
    log_step("DOB flag", True)
except Exception as e:
    print(f"  ERROR in get_dob_flag: {e}")
    print(f"  Detail: {traceback.format_exc()}")
    log_step("DOB flag", False, str(e))

# CATSEL DOB PREREQUISITES
try:
    arc_df['arc_code'] = arc_df['arc_code'].astype(str)
    mask = arc_df['arc_cat2'].isnull()
    arc_df.loc[mask, 'arc_cat2'] = ''
    arc_df['arc_code'] = arc_df['arc_code'].apply(lambda x: str(x).zfill(2))
    log_step("Catsel DOB prerequisites", True)
except Exception as e:
    print(f"  ERROR in catsel DOB prerequisites: {e}")
    log_step("Catsel DOB prerequisites", False, str(e))

# CATSEL DOB FLAG
try:
    print(get_catsel_dob(candidate_df, arc_df))
    log_step("Catsel DOB flag", True)
except Exception as e:
    print(f"  ERROR in get_catsel_dob: {e}")
    print(f"  Detail: {traceback.format_exc()}")
    log_step("Catsel DOB flag", False, str(e))

# CATSEL DOB NULL FIX
try:
    mask = candidate_df['catsel_dob_flag'].isnull()
    candidate_df.loc[mask, 'catsel_dob_flag'] = ''
    candidate_df.loc[~mask, 'catsel_dob_flag'] = candidate_df.loc[~mask, 'catsel_dob_flag'].astype(str)
    log_step("Catsel DOB null fix", True)
except Exception as e:
    print(f"  ERROR in catsel DOB null fix: {e}")
    log_step("Catsel DOB null fix", False, str(e))

# CATSEL FLAG
try:
    print(get_catsel(candidate_df))
    candidate_df['catsel_backup'] = candidate_df['catsel']
    log_step("Catsel flag", True)
except Exception as e:
    print(f"  ERROR in get_catsel: {e}")
    print(f"  Detail: {traceback.format_exc()}")
    log_step("Catsel flag", False, str(e))

# HEIGHT CHEST RELAX — REMOVE 9 FROM CATSEL
try:
    mask = candidate_df['height_chest_relax'] == "Yes"
    candidate_df.loc[mask, 'catsel'] = (
        candidate_df.loc[mask, 'catsel']
        .astype(str)
        .str.replace('9', '', regex=False)
        .str.strip()
    )
    print(f"  Candidates with empty catsel after height_chest_relax fix: {candidate_df[candidate_df['catsel'] == ''].shape[0]}")
    log_step("Height chest relax catsel fix", True)
except Exception as e:
    print(f"  ERROR in height_chest_relax fix: {e}")
    log_step("Height chest relax catsel fix", False, str(e))


_header("ALLOCATION")

cand         = None
vacancy_dict = {}

# ALLOCATION SETUP
try:
    cand = candidate_df.copy()
    vac  = vacancy_df.copy()

    vac['allocated']         = 0
    vac['allocated_hc']      = 0
    vac['allocated_hc_prev'] = 0

    cand[['allocated_category', 'allocated_post', 'allocated_state', 'allocated_area', 'allocated_against_ur']] = None

    mask = cand['post_pref'].isnull()
    cand.loc[mask, 'post_pref'] = ''
    cand.loc[~mask, 'post_pref'] = cand.loc[~mask, 'post_pref'].astype(str)

    mask = cand['catsel'].isnull()
    cand.loc[mask, 'catsel'] = ''
    cand.loc[~mask, 'catsel'] = cand.loc[~mask, 'catsel'].astype(str)

    if 'min_marks_cand_dob_prev' in vac.columns:
        vac['min_marks_cand_dob_prev'] = pd.to_datetime(vac['min_marks_cand_dob_prev'])

    vac['left_vacancy'] = vac['current']
    vac['key'] = (
        vac['state_code'].astype(str) +
        vac['gender'].astype(str) +
        vac['post_code'].astype(str) +
        vac['area'].astype(str) +
        vac['category_code'].astype(str)
    )

    for index, row in vac.iterrows():
        key = row['key']
        vacancy_dict[key] = row.to_dict()
        vacancy_dict[key]['min_marks_prev']         = row.get('min_marks_prev', 0)
        vacancy_dict[key]['min_marks_parta_prev']    = row.get('min_marks_parta_prev', 0)
        vacancy_dict[key]['min_marks_partb_prev']    = row.get('min_marks_partb_prev', 0)
        vacancy_dict[key]['min_marks_cand_dob_prev'] = row.get('min_marks_cand_dob_prev', pd.Timestamp.min)

    log_step("Allocation setup", True)
except Exception as e:
    print(f"  ERROR in allocation setup: {e}")
    print(f"  Detail: {traceback.format_exc()}")
    log_step("Allocation setup", False, str(e))

# FIRST ALLOCATION RUN
updated_vacancy_df = None
try:
    print("  Running first allocation...")
    upd_vacancy_dict   = allocate_candidates(cand, vacancy_dict)
    updated_vacancy_df = pd.DataFrame.from_dict(upd_vacancy_dict, orient='index')

    print(f"  Left vacancy after first run : {updated_vacancy_df['current'].sum()}")
    print(f"  Total initial vacancy        : {updated_vacancy_df['initial'].sum()}")
    print(f"  Candidates allocated         : {cand[cand['allocated_category'].notnull()].shape[0]}")
    log_step("First allocation run", True)
except Exception as e:
    print(f"  ERROR in first allocation run: {e}")
    print(f"  Detail: {traceback.format_exc()}")
    log_step("First allocation run", False, str(e))

# ADJUST LOOP
try:
    test_vac           = updated_vacancy_df.copy()
    updated_vacancy_df = test_vac.copy()

    i = 0
    while (updated_vacancy_df['allocated_hc_prev'] != updated_vacancy_df['allocated_hc']).any():
        i += 1
        print(f"  Adjust Attempt-{i}")

        upd_vacancy_df = adjust_vacancy(cand, updated_vacancy_df)
        upd_vacancy_df['left_vacancy'] = upd_vacancy_df['current']

        vacancy_dict = {}
        upd_vacancy_df['key'] = (
            upd_vacancy_df['state_code'].astype(str) +
            upd_vacancy_df['gender'].astype(str) +
            upd_vacancy_df['post_code'].astype(str) +
            upd_vacancy_df['area'].astype(str) +
            upd_vacancy_df['category_code'].astype(str)
        )

        for index, row in upd_vacancy_df.iterrows():
            key = row['key']
            vacancy_dict[key] = row.to_dict()
            vacancy_dict[key]['allocated_hc_prev'] = row['allocated_hc_prev']

        cand[['allocated_category', 'allocated_state', 'allocated_area', 'allocated_against_ur', 'allocated_post']] = None
        upd_vacancy_dict   = allocate_candidates(cand, vacancy_dict)
        updated_vacancy_df = pd.DataFrame.from_dict(upd_vacancy_dict, orient='index')

    print(f"  Final allocated_hc_prev : {updated_vacancy_df['allocated_hc_prev'].sum()}")
    print(f"  Final allocated_hc      : {updated_vacancy_df['allocated_hc'].sum()}")
    log_step("Adjust loop", True)
except Exception as e:
    print(f"  ERROR in adjust loop: {e}")
    print(f"  Detail: {traceback.format_exc()}")
    log_step("Adjust loop", False, str(e))

# FIND LOWEST MARKS
final_vacancy_df = None
try:
    updated_vacancy_df[['min_marks', 'min_marks_parta', 'min_marks_partb', 'min_marks_cand_dob', 'min_marks_merit']] = None
    final_vacancy_df = find_lowest_marks(cand, updated_vacancy_df)
    print(f"  Total allocated in final vacancy: {final_vacancy_df['allocated'].sum()}")
    log_step("Find lowest marks", True)
except Exception as e:
    print(f"  ERROR in find_lowest_marks: {e}")
    print(f"  Detail: {traceback.format_exc()}")
    log_step("Find lowest marks", False, str(e))

# FINAL ADJUSTMENTS
try:
    cand = cand.sort_values(by="merit", ascending=True)
    final_vacancy_df['left_vacancy'] = final_vacancy_df['current']
    final_vacancy_df['current']      = final_vacancy_df['left_vacancy'] + final_vacancy_df['allocated']
    log_step("Final adjustments", True)
except Exception as e:
    print(f"  ERROR in final adjustments: {e}")
    log_step("Final adjustments", False, str(e))

# WRITE OUTPUT CSVs
_header("WRITING OUTPUT FILES")
try:
    cand.to_csv(r"allocated_candidates_ctgd2025.csv", index=False)
    print("  allocated_candidates_ctgd2025.csv — written")
    log_step("Write allocated_candidates_ctgd2025.csv", True)
except Exception as e:
    print(f"  ERROR writing allocated_candidates_ctgd2025.csv: {e}")
    log_step("Write allocated_candidates_ctgd2025.csv", False, str(e))

try:
    cand[cand['allocated_category'].notnull()].to_csv(r"only_allocated_candidates.csv", index=False)
    print("  only_allocated_candidates.csv — written")
    log_step("Write only_allocated_candidates.csv", True)
except Exception as e:
    print(f"  ERROR writing only_allocated_candidates.csv: {e}")
    log_step("Write only_allocated_candidates.csv", False, str(e))

try:
    final_vacancy_df.to_csv(r"allocated_vacancy_ctgd.csv", index=False)
    print("  allocated_vacancy_ctgd.csv — written")
    log_step("Write allocated_vacancy_ctgd.csv", True)
except Exception as e:
    print(f"  ERROR writing allocated_vacancy_ctgd.csv: {e}")
    log_step("Write allocated_vacancy_ctgd.csv", False, str(e))


# =============================================================================
# FINAL SUMMARY
# =============================================================================

_header("RUN SUMMARY")
passed = [k for k, v in step_log.items() if v]
failed = [k for k, v in step_log.items() if not v]

print(f"\n  Total steps : {len(step_log)}")
print(f"  Passed      : {len(passed)}")
print(f"  Failed      : {len(failed)}")

if failed:
    print("\n  Steps that need attention:")
    for f in failed:
        print(f"    - {f}")
else:
    print("\n  All steps completed successfully.")
