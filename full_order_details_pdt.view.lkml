include: "lendingclub.model.lkml"

view: full_order_details_pdt {
  derived_table: {
    explore_source: secondary_market_note_offer {
      column: months_since_issue_date {
        field: loan_entity.months_since_issue_date
      }
      column: payments_made {
        field: secondary_market_note_offer.payments_made
      }

      column: grade {
        field: secondary_market_note_offer.grade
      }

      column: sub_grade {
        field: secondary_market_note_offer.sub_grade
      }

      column: ytm_range {
        field: secondary_market_note_offer.ytm_range
      }

      column: accrued_interest {
        field: secondary_market_note_offer.accrued_interest
      }

      column: application_type {
        field: secondary_market_note_offer.application_type
      }

      column: ask_price {
        field: secondary_market_note_offer.ask_price
      }

      column: sum_ask_price {
        field: secondary_market_note_offer.sum_ask_price
      }

      column: min_ask_price {
        field: secondary_market_note_offer.min_ask_price
      }

      column: credit_score_trend {
        field: secondary_market_note_offer.credit_score_trend
      }

      column: days_since_last_payment {
        field: secondary_market_note_offer.days_since_last_payment
      }

      column: fico_end_range_from {
        field: secondary_market_note_offer.fico_end_range_from
      }

      column: fico_end_range_to {
        field: secondary_market_note_offer.fico_end_range_to
      }

      column: interest_rate {
        field: secondary_market_note_offer.interest_rate
      }

      column: listed {
        field: secondary_market_note_offer.listed_date
      }

      column: loan_class {
        field: secondary_market_note_offer.loan_class
      }

      column: loan_id {
        field: secondary_market_note_offer.loan_id
      }

      column: loan_maturity {
        field: secondary_market_note_offer.loan_maturity
      }

      column: markup_discount {
        field: secondary_market_note_offer.markup_discount
      }

      column: never_late {
        field: secondary_market_note_offer.never_late
      }

      column: note_id {
        field: secondary_market_note_offer.note_id
      }

      column: order_id {
        field: secondary_market_note_offer.order_id
      }

      column: original_note_amount {
        field: secondary_market_note_offer.original_note_amount
      }

      column: outstanding_principal {
        field: secondary_market_note_offer.outstanding_principal
      }

      column: m_outstanding_principal {
        field: secondary_market_note_offer.m_outstanding_principal
      }

      column: principal_plus_interest {
        field: secondary_market_note_offer.principal_plus_interest
      }

      column: remaining_payments {
        field: secondary_market_note_offer.remaining_payments
      }

      column: status {
        field: secondary_market_note_offer.status
      }

      column: ytm {
        field: secondary_market_note_offer.ytm
      }

      column: m_ytm {
        field: secondary_market_note_offer.m_ytm
      }

      column: max_ytm {
        field: secondary_market_note_offer.max_ytm
      }

      column: orig_fico_range_low {
        field: loan_entity.fico_range_low
      }

      column: orig_fico_range_high {
        field: loan_entity.fico_range_high
      }

      column: loan_loan_id {
        field: loan_entity.id
      }

      column: purpose {
        field: loan_entity.purpose
      }

      column: monthly_income_combined {
        field: loan_entity.monthly_income_combined
      }

      column: annual_income {
        field: loan_entity.annual_income
      }

      column: annual_income_joint {
        field: loan_entity.annual_income_joint
      }

      derived_column: fico_change_since_loan_orig_low {
        sql: fico_end_range_from - orig_fico_range_low ;;
      }

      derived_column: fico_change_since_loan_orig_high {
        sql: fico_end_range_to - orig_fico_range_high ;;
      }
    }

    indexes: ["order_id", "loan_id", "status", "fico_end_range_from"]
    sql_trigger_value: select concat(concat(coalesce((select max(created) from load_control_entity where datagroup = 'loan'),'none'), '_'), coalesce((select max(created) from load_control_entity where datagroup = 'secondary_market_note_offer'), 'none')) ;;
  }

  dimension: loan_loan_id {
    type: number
    sql: ${TABLE}.loan_loan_id ;;
  }

  dimension: payments_made {
    type: number
    sql: ${TABLE}.payments_made ;;
  }

  dimension: grade {
    type: string
    sql: ${TABLE}.grade;;
  }

  dimension: sub_grade {
    type: string
    sql: ${TABLE}.sub_grade;;
  }

  dimension: ytm_range {
    type: string
    sql: ${TABLE}.ytm_range;;
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

  dimension: listed {
    type: date
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
    sql: ${TABLE}.order_id;;
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

  measure: m_outstanding_principal {
    type: sum
    sql:${TABLE}.outstanding_principal ;;
  }

  measure: m_ytm {
    type: average
    value_format: "#.##"
    sql: ${TABLE}.m_ytm ;;
  }

  measure: max_ytm {
    type: max
    value_format: "#.##"
    sql: ${ytm} ;;
  }


  dimension: orig_fico_range_low {
    sql: ${TABLE}.orig_fico_range_low;;
  }

  dimension: orig_fico_range_high {
    sql: ${TABLE}.orig_fico_range_high;;
  }

  dimension: fico_change_since_loan_orig_low {
    type: number
    sql: ${TABLE}.fico_change_since_loan_orig_low ;;
  }

  dimension: fico_change_since_loan_orig_high {
    type: number
    sql: ${TABLE}.fico_change_since_loan_orig_high ;;
  }

  dimension: months_since_issue_date {
    type: number
    sql:  ${TABLE}.months_since_issue_date ;;
  }

  dimension: purpose {
    type: string
    sql: ${TABLE}.purpose ;;
  }

  dimension: monthly_income_combined {
    type: number
    sql: ${TABLE}.monthly_income_combined ;;
  }

  dimension: annual_income {
    type: number
    sql: ${TABLE}.annual_income ;;
  }

  dimension: annual_income_joint {
    type: number
    sql: ${TABLE}.annual_income_joint ;;
  }

  measure: sum_ask_price {
    type: sum
    sql: ${TABLE}.sum_ask_price ;;
  }

  measure: min_ask_price {
    type: min
    sql: ${TABLE}.min_ask_price ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
