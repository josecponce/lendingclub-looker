view: secondary_market_note_offer {
  sql_table_name: lendingclub.secondary_market_note_offer ;;

  #calculated fields
  dimension: payments_made {
    type: number
    sql: ${loan_maturity} - ${remaining_payments} ;;
  }

  dimension: grade {
    type: string
    sql: SUBSTRING(${loan_class}, 1, 1);;
  }

  dimension: sub_grade {
    type: string
    sql: SUBSTRING(${loan_class}, 2, 1);;
  }

  dimension: ytm_range {
    type: tier
    style: interval
    tiers: [-30, -25, -20, -15, -10, -5, 0, 5, 10, 15, 20, 25, 30]
    sql: ${ytm};;
  }

  #table fields
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
    link: {
      label: "Buy Now"
      url: "http://node-3:8080/secondary-trade/buy?loanId={{loan_id._value}}&orderId={{order_id._value}}&noteId={{note_id._value}}&bidPrice={{value}}"
    }
    sql: ${TABLE}.ask_price ;;
  }

  measure: sum_ask_price {
    type: sum
    sql: ${ask_price} ;;
  }

  measure: min_ask_price {
    type: min
    sql: ${ask_price} ;;
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
    type: string
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
    type: string
    sql: ${TABLE}.note_id ;;
  }

  dimension: order_id {
    primary_key: yes
    type: string
    link: {
      label: "offer details"
      url: "https://www.lendingclub.com/foliofn/browseNotesLoanPerf.action?showfoliofn=true&loan_id={{loan_id._value}}&order_id={{value}}&note_id={{note_id._value}}"
    }
    link: {
      label: "original loan details"
      url: "https://www.lendingclub.com/foliofn/loanDetail.action?loan_id={{loan_id._value}}"
    }

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

  #measures
  measure: m_outstanding_principal {
    type: sum
    sql: ${outstanding_principal} ;;
  }

  measure: m_ytm {
    type: average
    value_format: "#.##"
    sql: ${ytm} ;;
  }

  measure: max_ytm {
    type: max
    value_format: "#.##"
    sql: ${ytm} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
