view: batch_step_execution {
  sql_table_name: lendingclub.BATCH_STEP_EXECUTION ;;

  dimension: commit_count {
    type: number
    sql: ${TABLE}.COMMIT_COUNT ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}.END_TIME ;;
  }

  dimension: exit_code {
    type: string
    sql: ${TABLE}.EXIT_CODE ;;
  }

  dimension: exit_message {
    type: string
    sql: ${TABLE}.EXIT_MESSAGE ;;
  }

  dimension: filter_count {
    type: number
    sql: ${TABLE}.FILTER_COUNT ;;
  }

  dimension: job_execution_id {
    type: number
    sql: ${TABLE}.JOB_EXECUTION_ID ;;
  }

  dimension_group: last_updated {
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
    sql: ${TABLE}.LAST_UPDATED ;;
  }

  dimension: process_skip_count {
    type: number
    sql: ${TABLE}.PROCESS_SKIP_COUNT ;;
  }

  dimension: read_count {
    type: number
    sql: ${TABLE}.READ_COUNT ;;
  }

  dimension: read_skip_count {
    type: number
    sql: ${TABLE}.READ_SKIP_COUNT ;;
  }

  dimension: rollback_count {
    type: number
    sql: ${TABLE}.ROLLBACK_COUNT ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.START_TIME ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.STATUS ;;
  }

  dimension: step_execution_id {
    type: number
    sql: ${TABLE}.STEP_EXECUTION_ID ;;
  }

  dimension: step_name {
    type: string
    sql: ${TABLE}.STEP_NAME ;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}.VERSION ;;
  }

  dimension: write_count {
    type: number
    sql: ${TABLE}.WRITE_COUNT ;;
  }

  dimension: write_skip_count {
    type: number
    sql: ${TABLE}.WRITE_SKIP_COUNT ;;
  }

  measure: count {
    type: count
    drill_fields: [step_name]
  }
}
