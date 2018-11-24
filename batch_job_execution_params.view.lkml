view: batch_job_execution_params {
  sql_table_name: lendingclub.BATCH_JOB_EXECUTION_PARAMS ;;

  dimension_group: date_val {
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
    sql: ${TABLE}.DATE_VAL ;;
  }

  dimension: double_val {
    type: number
    sql: ${TABLE}.DOUBLE_VAL ;;
  }

  dimension: identifying {
    type: string
    sql: ${TABLE}.IDENTIFYING ;;
  }

  dimension: job_execution_id {
    type: number
    sql: ${TABLE}.JOB_EXECUTION_ID ;;
  }

  dimension: key_name {
    type: string
    sql: ${TABLE}.KEY_NAME ;;
  }

  dimension: long_val {
    type: number
    sql: ${TABLE}.LONG_VAL ;;
  }

  dimension: string_val {
    type: string
    sql: ${TABLE}.STRING_VAL ;;
  }

  dimension: type_cd {
    type: string
    sql: ${TABLE}.TYPE_CD ;;
  }

  measure: count {
    type: count
    drill_fields: [key_name]
  }
}
