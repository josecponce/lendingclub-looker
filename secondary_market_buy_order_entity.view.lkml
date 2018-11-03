view: secondary_market_buy_order_entity {
  sql_table_name: lendingclub.secondary_market_buy_order_entity ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: aid {
    type: number
    value_format_name: id
    sql: ${TABLE}.aid ;;
  }

  dimension: bid_price {
    type: number
    sql: ${TABLE}.bid_price ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created ;;
  }

  dimension: loan_id {
    type: number
    sql: ${TABLE}.loan_id ;;
  }

  dimension: note_id {
    type: number
    sql: ${TABLE}.note_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
