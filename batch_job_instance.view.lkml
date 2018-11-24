view: batch_job_instance {
  sql_table_name: lendingclub.BATCH_JOB_INSTANCE ;;

  dimension: job_instance_id {
    type: number
    sql: ${TABLE}.JOB_INSTANCE_ID ;;
  }

  dimension: job_key {
    type: string
    sql: ${TABLE}.JOB_KEY ;;
  }

  dimension: job_name {
    type: string
    sql: ${TABLE}.JOB_NAME ;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}.VERSION ;;
  }

  measure: count {
    type: count
    drill_fields: [job_name]
  }
}
