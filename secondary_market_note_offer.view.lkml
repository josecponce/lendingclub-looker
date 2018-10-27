view: secondary_market_note_offer {
  sql_table_name: lendingclub.secondary_market_note_offer ;;

  dimension: payments_made {
    type: number
    sql: ${loan_maturity} - ${remaining_payments} ;;
  }

  dimension: accrued_interest {
    type: number
    sql: ${TABLE}.accrued_interest ;;
  }

  dimension: application_type {
    type: string
    sql: ${TABLE}.application_type ;;
  }

  dimension: ask_price {
    type: number
    sql: ${TABLE}.ask_price ;;
  }

  dimension: credit_score_trend {
    type: string
    sql: ${TABLE}.credit_score_trend ;;
  }

  dimension: days_since_last_payment {
    type: number
    sql: ${TABLE}.days_since_last_payment ;;
  }

  dimension: fico_end_range_from {
    type: number
    sql: ${TABLE}.fico_end_range_from ;;
  }

  dimension: fico_end_range_to {
    type: number
    sql: ${TABLE}.fico_end_range_to ;;
  }

  dimension: interest_rate {
    type: number
    sql: ${TABLE}.interest_rate ;;
  }

  dimension_group: listed {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.listed ;;
  }

  dimension: loan_class {
    type: string
    sql: ${TABLE}.loan_class ;;
  }

  dimension: loan_id {
    type: number
    sql: ${TABLE}.loan_id ;;
  }

  dimension: loan_maturity {
    type: number
    sql: ${TABLE}.loan_maturity ;;
  }

  dimension: markup_discount {
    type: number
    sql: ${TABLE}.markup_discount ;;
  }

  dimension: never_late {
    type: yesno
    sql: ${TABLE}.never_late ;;
  }

  dimension: note_id {
    type: number
    sql: ${TABLE}.note_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: original_note_amount {
    type: number
    sql: ${TABLE}.original_note_amount ;;
  }

  dimension: outstanding_principal {
    type: number
    sql: ${TABLE}.outstanding_principal ;;
  }

  dimension: principal_plus_interest {
    type: number
    sql: ${TABLE}.principal_plus_interest ;;
  }

  dimension: remaining_payments {
    type: number
    sql: ${TABLE}.remaining_payments ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: ytm {
    type: number
    sql: ${TABLE}.ytm ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
