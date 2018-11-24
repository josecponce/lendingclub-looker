view: batch_step_execution_context {
  sql_table_name: lendingclub.BATCH_STEP_EXECUTION_CONTEXT ;;

  dimension: serialized_context {
    type: string
    sql: ${TABLE}.SERIALIZED_CONTEXT ;;
  }

  dimension: short_context {
    type: string
    sql: ${TABLE}.SHORT_CONTEXT ;;
  }

  dimension: step_execution_id {
    type: number
    sql: ${TABLE}.STEP_EXECUTION_ID ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
