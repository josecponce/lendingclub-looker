view: secondary_market_buy_order_response_entity {
  sql_table_name: lendingclub.secondary_market_buy_order_response_entity ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: bid_price {
    type: number
    sql: ${TABLE}.bid_price ;;
  }

  dimension: buy_order_id {
    type: number
    sql: ${TABLE}.buy_order_id ;;
  }

  dimension: execution_status {
    type: string
    sql: ${TABLE}.execution_status ;;
  }

  dimension: loan_id {
    type: number
    sql: ${TABLE}.loan_id ;;
  }

  dimension: note_id {
    type: number
    sql: ${TABLE}.note_id ;;
  }

  dimension: outstanding_accrued_interest {
    type: number
    sql: ${TABLE}.outstanding_accrued_interest ;;
  }

  dimension: outstanding_principal {
    type: number
    sql: ${TABLE}.outstanding_principal ;;
  }

  dimension: txn_id {
    type: number
    sql: ${TABLE}.txn_id ;;
  }

  dimension: yield_to_maturity {
    type: number
    sql: ${TABLE}.yield_to_maturity ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
