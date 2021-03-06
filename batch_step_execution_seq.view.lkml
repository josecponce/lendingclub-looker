view: batch_step_execution_seq {
  sql_table_name: lendingclub.BATCH_STEP_EXECUTION_SEQ ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: unique_key {
    type: string
    sql: ${TABLE}.UNIQUE_KEY ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
