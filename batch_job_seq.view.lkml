view: batch_job_seq {
  sql_table_name: lendingclub.BATCH_JOB_SEQ ;;

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
