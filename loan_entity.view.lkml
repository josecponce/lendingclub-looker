view: loan_entity {
  sql_table_name: lendingclub.loan_entity ;;

  dimension: months_to_last_payment {
    type: number
    sql: TIMESTAMPDIFF(MONTH, DATE_FORMAT(STR_TO_DATE(${TABLE}.issue_d, '%M-%Y'), '%Y-%m-01'), DATE_FORMAT(STR_TO_DATE(${TABLE}.last_pymnt_d, '%M-%Y'), '%Y-%m-01')) ;;
  }

  dimension: months_since_issue_date {
    type: number
    sql: TIMESTAMPDIFF(MONTH, DATE_FORMAT(STR_TO_DATE(${TABLE}.issue_d, '%M-%Y'), '%Y-%m-01'), DATE_FORMAT(CURDATE(), '%Y-%m-01')) ;;
  }

  measure: average_months_to_last_payment {
    type: average
    sql: ${months_to_last_payment} ;;
  }

  measure: 75_percentile_months_to_last_payment {
    type: percentile
    percentile: 75
    sql: ${months_to_last_payment} ;;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: acc_now_delinq {
    type: string
    sql: ${TABLE}.acc_now_delinq ;;
  }

  dimension: acc_open_past_24mths {
    type: string
    sql: ${TABLE}.acc_open_past_24mths ;;
  }

  dimension: addr_state {
    type: string
    sql: ${TABLE}.addr_state ;;
  }

  dimension: all_util {
    type: string
    sql: ${TABLE}.all_util ;;
  }

  dimension: monthly_income_combined {
    type: number
    value_format: "#"
    sql: GREATEST(${annual_income}, ${annual_income_joint}) / 12 ;;
  }

  dimension: annual_income {
    type: number
    sql: ${TABLE}.annual_inc ;;
  }

  dimension: annual_income_joint {
    type: number
    sql: ${TABLE}.annual_inc_joint ;;
  }

  dimension: application_type {
    type: string
    sql: ${TABLE}.application_type ;;
  }

  dimension: avg_cur_bal {
    type: string
    sql: ${TABLE}.avg_cur_bal ;;
  }

  dimension: bc_open_to_buy {
    type: string
    sql: ${TABLE}.bc_open_to_buy ;;
  }

  dimension: bc_util {
    type: string
    sql: ${TABLE}.bc_util ;;
  }

  dimension: chargeoff_within_12_mths {
    type: string
    sql: ${TABLE}.chargeoff_within_12_mths ;;
  }

  dimension: collection_recovery_fee {
    type: string
    sql: ${TABLE}.collection_recovery_fee ;;
  }

  dimension: collections_12_mths_ex_med {
    type: string
    sql: ${TABLE}.collections_12_mths_ex_med ;;
  }

  dimension: debt_settlement_flag {
    type: string
    sql: ${TABLE}.debt_settlement_flag ;;
  }

  dimension: debt_settlement_flag_date {
    type: string
    sql: ${TABLE}.debt_settlement_flag_date ;;
  }

  dimension: deferral_term {
    type: string
    sql: ${TABLE}.deferral_term ;;
  }

  dimension: delinq_2yrs {
    type: string
    sql: ${TABLE}.delinq_2yrs ;;
  }

  dimension: delinq_amnt {
    type: string
    sql: ${TABLE}.delinq_amnt ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: disbursement_method {
    type: string
    sql: ${TABLE}.disbursement_method ;;
  }

  dimension: dti {
    type: string
    sql: ${TABLE}.dti ;;
  }

  dimension: dti_joint {
    type: string
    sql: ${TABLE}.dti_joint ;;
  }

  dimension_group: earliest_credit_line {
    type: time
    datatype: date
    timeframes: [
      raw,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: STR_TO_DATE(${TABLE}.earliest_cr_line, '%M-%Y') ;;
  }

  dimension: months_since_earliest_credit_line {
    type: number
    sql: TIMESTAMPDIFF(MONTH, DATE_FORMAT(${earliest_credit_line_raw}, '%Y-%m-01'), DATE_FORMAT(CURDATE(), '%Y-%m-01')) ;;
  }

  dimension: months_since_earlies_credit_line_tier {
    type: tier
    tiers: [0, 12, 24, 36, 48, 60, 72, 84, 96, 108, 120]
    style: integer
    sql: ${months_since_earliest_credit_line} ;;
  }

  dimension: emp_length {
    type: string
    sql: ${TABLE}.emp_length ;;
  }

  dimension: emp_title {
    type: string
    sql: ${TABLE}.emp_title ;;
  }

  dimension: fico_range_high {
    type: string
    sql: ${TABLE}.fico_range_high ;;
  }

  dimension: fico_range_low {
    type: string
    sql: ${TABLE}.fico_range_low ;;
  }

  dimension: funded_amnt {
    type: string
    sql: ${TABLE}.funded_amnt ;;
  }

  dimension: funded_amnt_inv {
    type: string
    sql: ${TABLE}.funded_amnt_inv ;;
  }

  dimension: grade {
    type: string
    sql: ${TABLE}.grade ;;
  }

  dimension: hardship_amount {
    type: string
    sql: ${TABLE}.hardship_amount ;;
  }

  dimension: hardship_dpd {
    type: string
    sql: ${TABLE}.hardship_dpd ;;
  }

  dimension: hardship_end_date {
    type: string
    sql: ${TABLE}.hardship_end_date ;;
  }

  dimension: hardship_flag {
    type: string
    sql: ${TABLE}.hardship_flag ;;
  }

  dimension: hardship_last_payment_amount {
    type: string
    sql: ${TABLE}.hardship_last_payment_amount ;;
  }

  dimension: hardship_length {
    type: string
    sql: ${TABLE}.hardship_length ;;
  }

  dimension: hardship_loan_status {
    type: string
    sql: ${TABLE}.hardship_loan_status ;;
  }

  dimension: hardship_payoff_balance_amount {
    type: string
    sql: ${TABLE}.hardship_payoff_balance_amount ;;
  }

  dimension: hardship_reason {
    type: string
    sql: ${TABLE}.hardship_reason ;;
  }

  dimension: hardship_start_date {
    type: string
    sql: ${TABLE}.hardship_start_date ;;
  }

  dimension: hardship_status {
    type: string
    sql: ${TABLE}.hardship_status ;;
  }

  dimension: hardship_type {
    type: string
    sql: ${TABLE}.hardship_type ;;
  }

  dimension: home_ownership {
    type: string
    sql: ${TABLE}.home_ownership ;;
  }

  dimension: il_util {
    type: string
    sql: ${TABLE}.il_util ;;
  }

  dimension: initial_list_status {
    type: string
    sql: ${TABLE}.initial_list_status ;;
  }

  dimension: inq_fi {
    type: string
    sql: ${TABLE}.inq_fi ;;
  }

  dimension: inq_last_12m {
    type: string
    sql: ${TABLE}.inq_last_12m ;;
  }

  dimension: inq_last_6mths {
    type: string
    sql: ${TABLE}.inq_last_6mths ;;
  }

  dimension: installment {
    type: number
    sql: ${TABLE}.installment ;;
  }

  dimension: int_rate {
    type: string
    sql: ${TABLE}.int_rate ;;
  }

  dimension_group: issue_d {
    type: time
    datatype: date
    timeframes: [
      raw,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: STR_TO_DATE(${TABLE}.issue_d, '%M-%Y') ;;
  }

  dimension: last_credit_pull_d {
    type: string
    sql: ${TABLE}.last_credit_pull_d ;;
  }

  dimension: last_fico_range_high {
    type: number
    sql: ${TABLE}.last_fico_range_high ;;
  }

  dimension: last_fico_range_low {
    type: number
    sql: ${TABLE}.last_fico_range_low ;;
  }

  dimension: last_pymnt_amnt {
    type: string
    sql: ${TABLE}.last_pymnt_amnt ;;
  }

  dimension: last_pymnt_d {
    type: string
    sql: ${TABLE}.last_pymnt_d ;;
  }

  dimension: loan_amnt {
    type: string
    sql: ${TABLE}.loan_amnt ;;
  }

  dimension: loan_status {
    type: string
    sql: REPLACE(${TABLE}.loan_status, 'Does not meet the credit policy. Status:', '') ;;
  }

  dimension: max_bal_bc {
    type: string
    sql: ${TABLE}.max_bal_bc ;;
  }

  dimension: member_id {
    type: string
    sql: ${TABLE}.member_id ;;
  }

  dimension: mo_sin_old_il_acct {
    type: string
    sql: ${TABLE}.mo_sin_old_il_acct ;;
  }

  dimension: mo_sin_old_rev_tl_op {
    type: string
    sql: ${TABLE}.mo_sin_old_rev_tl_op ;;
  }

  dimension: mo_sin_rcnt_rev_tl_op {
    type: string
    sql: ${TABLE}.mo_sin_rcnt_rev_tl_op ;;
  }

  dimension: mo_sin_rcnt_tl {
    type: string
    sql: ${TABLE}.mo_sin_rcnt_tl ;;
  }

  dimension: mort_acc {
    type: string
    sql: ${TABLE}.mort_acc ;;
  }

  dimension: mths_since_last_delinq {
    type: number
    sql: COALESCE(${TABLE}.mths_since_last_delinq, 200) ;;
  }

  dimension: mths_since_last_delinq_tier {
    type: tier
    tiers: [0, 10, 20, 30, 40, 50, 60, 70, 80]
    style: integer
    sql: ${mths_since_last_delinq} ;;
  }

  dimension: mths_since_last_major_derog {
    type: string
    sql: ${TABLE}.mths_since_last_major_derog ;;
  }

  dimension: mths_since_last_record {
    type: string
    sql: ${TABLE}.mths_since_last_record ;;
  }

  dimension: mths_since_rcnt_il {
    type: string
    sql: ${TABLE}.mths_since_rcnt_il ;;
  }

  dimension: mths_since_recent_bc {
    type: string
    sql: ${TABLE}.mths_since_recent_bc ;;
  }

  dimension: mths_since_recent_bc_dlq {
    type: string
    sql: ${TABLE}.mths_since_recent_bc_dlq ;;
  }

  dimension: mths_since_recent_inq {
    type: string
    sql: ${TABLE}.mths_since_recent_inq ;;
  }

  dimension: mths_since_recent_revol_delinq {
    type: string
    sql: ${TABLE}.mths_since_recent_revol_delinq ;;
  }

  dimension: next_pymnt_d {
    type: string
    sql: ${TABLE}.next_pymnt_d ;;
  }

  dimension: num_accts_ever_120_pd {
    type: string
    sql: ${TABLE}.num_accts_ever_120_pd ;;
  }

  dimension: num_actv_bc_tl {
    type: string
    sql: ${TABLE}.num_actv_bc_tl ;;
  }

  dimension: num_actv_rev_tl {
    type: string
    sql: ${TABLE}.num_actv_rev_tl ;;
  }

  dimension: num_bc_sats {
    type: string
    sql: ${TABLE}.num_bc_sats ;;
  }

  dimension: num_bc_tl {
    type: string
    sql: ${TABLE}.num_bc_tl ;;
  }

  dimension: num_il_tl {
    type: string
    sql: ${TABLE}.num_il_tl ;;
  }

  dimension: num_op_rev_tl {
    type: string
    sql: ${TABLE}.num_op_rev_tl ;;
  }

  dimension: num_rev_accts {
    type: string
    sql: ${TABLE}.num_rev_accts ;;
  }

  dimension: num_rev_tl_bal_gt_0 {
    type: string
    sql: ${TABLE}.num_rev_tl_bal_gt_0 ;;
  }

  dimension: num_sats {
    type: string
    sql: ${TABLE}.num_sats ;;
  }

  dimension: num_tl_120dpd_2m {
    type: string
    sql: ${TABLE}.num_tl_120dpd_2m ;;
  }

  dimension: num_tl_30dpd {
    type: string
    sql: ${TABLE}.num_tl_30dpd ;;
  }

  dimension: num_tl_90g_dpd_24m {
    type: string
    sql: ${TABLE}.num_tl_90g_dpd_24m ;;
  }

  dimension: num_tl_op_past_12m {
    type: string
    sql: ${TABLE}.num_tl_op_past_12m ;;
  }

  dimension: open_acc {
    type: string
    sql: ${TABLE}.open_acc ;;
  }

  dimension: open_acc_6m {
    type: string
    sql: ${TABLE}.open_acc_6m ;;
  }

  dimension: open_act_il {
    type: string
    sql: ${TABLE}.open_act_il ;;
  }

  dimension: open_il_12m {
    type: string
    sql: ${TABLE}.open_il_12m ;;
  }

  dimension: open_il_24m {
    type: string
    sql: ${TABLE}.open_il_24m ;;
  }

  dimension: open_rv_12m {
    type: string
    sql: ${TABLE}.open_rv_12m ;;
  }

  dimension: open_rv_24m {
    type: string
    sql: ${TABLE}.open_rv_24m ;;
  }

  dimension: orig_projected_additional_accrued_interest {
    type: string
    sql: ${TABLE}.orig_projected_additional_accrued_interest ;;
  }

  dimension: out_prncp {
    type: string
    sql: ${TABLE}.out_prncp ;;
  }

  dimension: out_prncp_inv {
    type: string
    sql: ${TABLE}.out_prncp_inv ;;
  }

  dimension: payment_plan_start_date {
    type: string
    sql: ${TABLE}.payment_plan_start_date ;;
  }

  dimension: pct_tl_nvr_dlq {
    type: string
    sql: ${TABLE}.pct_tl_nvr_dlq ;;
  }

  dimension: percent_bc_gt_75 {
    type: number
    sql: ${TABLE}.percent_bc_gt_75 ;;
  }

  dimension: percent_bc_gt_75_tier {
    type: tier
    tiers: [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
    style: interval
    sql: ${TABLE}.percent_bc_gt_75 ;;
  }

  dimension: policy_code {
    type: string
    sql: ${TABLE}.policy_code ;;
  }

  dimension: public_record {
    type: number
    sql: ${TABLE}.pub_rec ;;
  }

  dimension: public_record_bankruptcies {
    type: number
    sql: ${TABLE}.pub_rec_bankruptcies ;;
  }

  dimension: purpose {
    type: string
    sql: ${TABLE}.purpose ;;
  }

  dimension: pymnt_plan {
    type: string
    sql: ${TABLE}.pymnt_plan ;;
  }

  dimension: recoveries {
    type: string
    sql: ${TABLE}.recoveries ;;
  }

  dimension: revol_bal {
    type: string
    sql: ${TABLE}.revol_bal ;;
  }

  dimension: revol_bal_joint {
    type: string
    sql: ${TABLE}.revol_bal_joint ;;
  }

  dimension: revol_util {
    type: number
    sql: REPLACE(${TABLE}.revol_util, '%', '') ;;
  }

  dimension: revol_util_tier {
    type: tier
    tiers: [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
    style: interval
    sql: REPLACE(${TABLE}.revol_util, '%', '') ;;
  }

  dimension: sec_app_chargeoff_within_12_mths {
    type: string
    sql: ${TABLE}.sec_app_chargeoff_within_12_mths ;;
  }

  dimension: sec_app_collections_12_mths_ex_med {
    type: string
    sql: ${TABLE}.sec_app_collections_12_mths_ex_med ;;
  }

  dimension: sec_app_earliest_cr_line {
    type: string
    sql: ${TABLE}.sec_app_earliest_cr_line ;;
  }

  dimension: sec_app_fico_range_high {
    type: string
    sql: ${TABLE}.sec_app_fico_range_high ;;
  }

  dimension: sec_app_fico_range_low {
    type: string
    sql: ${TABLE}.sec_app_fico_range_low ;;
  }

  dimension: sec_app_inq_last_6mths {
    type: string
    sql: ${TABLE}.sec_app_inq_last_6mths ;;
  }

  dimension: sec_app_mort_acc {
    type: string
    sql: ${TABLE}.sec_app_mort_acc ;;
  }

  dimension: sec_app_mths_since_last_major_derog {
    type: string
    sql: ${TABLE}.sec_app_mths_since_last_major_derog ;;
  }

  dimension: sec_app_num_rev_accts {
    type: string
    sql: ${TABLE}.sec_app_num_rev_accts ;;
  }

  dimension: sec_app_open_acc {
    type: string
    sql: ${TABLE}.sec_app_open_acc ;;
  }

  dimension: sec_app_open_act_il {
    type: string
    sql: ${TABLE}.sec_app_open_act_il ;;
  }

  dimension: sec_app_revol_util {
    type: string
    sql: ${TABLE}.sec_app_revol_util ;;
  }

  dimension: settlement_amount {
    type: string
    sql: ${TABLE}.settlement_amount ;;
  }

  dimension: settlement_date {
    type: string
    sql: ${TABLE}.settlement_date ;;
  }

  dimension: settlement_percentage {
    type: string
    sql: ${TABLE}.settlement_percentage ;;
  }

  dimension: settlement_status {
    type: string
    sql: ${TABLE}.settlement_status ;;
  }

  dimension: settlement_term {
    type: string
    sql: ${TABLE}.settlement_term ;;
  }

  dimension: sub_grade {
    type: string
    sql: ${TABLE}.sub_grade ;;
  }

  dimension: tax_liens {
    type: number
    sql: ${TABLE}.tax_liens ;;
  }

  dimension: term {
    type: string
    sql: ${TABLE}.term ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: tot_coll_amt {
    type: string
    sql: ${TABLE}.tot_coll_amt ;;
  }

  dimension: tot_cur_bal {
    type: string
    sql: ${TABLE}.tot_cur_bal ;;
  }

  dimension: tot_hi_cred_lim {
    type: string
    sql: ${TABLE}.tot_hi_cred_lim ;;
  }

  dimension: total_acc {
    type: string
    sql: ${TABLE}.total_acc ;;
  }

  dimension: total_bal_ex_mort {
    type: string
    sql: ${TABLE}.total_bal_ex_mort ;;
  }

  dimension: total_bal_il {
    type: string
    sql: ${TABLE}.total_bal_il ;;
  }

  dimension: total_bc_limit {
    type: string
    sql: ${TABLE}.total_bc_limit ;;
  }

  dimension: total_cu_tl {
    type: string
    sql: ${TABLE}.total_cu_tl ;;
  }

  dimension: total_il_high_credit_limit {
    type: string
    sql: ${TABLE}.total_il_high_credit_limit ;;
  }

  dimension: total_pymnt {
    type: string
    sql: ${TABLE}.total_pymnt ;;
  }

  dimension: total_pymnt_inv {
    type: string
    sql: ${TABLE}.total_pymnt_inv ;;
  }

  dimension: total_rec_int {
    type: string
    sql: ${TABLE}.total_rec_int ;;
  }

  dimension: total_rec_late_fee {
    type: string
    sql: ${TABLE}.total_rec_late_fee ;;
  }

  dimension: total_rec_prncp {
    type: string
    sql: ${TABLE}.total_rec_prncp ;;
  }

  dimension: total_rev_hi_lim {
    type: string
    sql: ${TABLE}.total_rev_hi_lim ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  dimension: verification_status {
    type: string
    sql: ${TABLE}.verification_status ;;
  }

  dimension: verification_status_joint {
    type: string
    sql: ${TABLE}.verification_status_joint ;;
  }

  dimension: combined_verification_status {
    type: string
    sql: COALESCE(${verification_status_joint}, ${verification_status}) ;;
  }

  dimension: zip_code {
    type: zipcode
    sql: ${TABLE}.zip_code ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: percent {
    type: percent_of_total
    value_format: "000.00"
    sql: ${count} ;;
  }
}
