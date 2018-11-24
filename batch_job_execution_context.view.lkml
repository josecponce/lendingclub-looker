view: batch_job_execution_context {
  sql_table_name: lendingclub.BATCH_JOB_EXECUTION_CONTEXT ;;

  dimension: job_execution_id {
    type: number
    sql: ${TABLE}.JOB_EXECUTION_ID ;;
  }

  dimension: serialized_context {
    type: string
    sql: ${TABLE}.SERIALIZED_CONTEXT ;;
  }

  dimension: short_context {
    type: string
    sql: ${TABLE}.SHORT_CONTEXT ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
