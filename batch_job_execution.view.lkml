view: batch_job_execution {
  sql_table_name: lendingclub.BATCH_JOB_EXECUTION ;;

  dimension_group: create {
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
    sql: ${TABLE}.CREATE_TIME ;;
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

  dimension: job_configuration_location {
    type: string
    sql: ${TABLE}.JOB_CONFIGURATION_LOCATION ;;
  }

  dimension: job_execution_id {
    type: number
    sql: ${TABLE}.JOB_EXECUTION_ID ;;
  }

  dimension: job_instance_id {
    type: number
    sql: ${TABLE}.JOB_INSTANCE_ID ;;
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

  dimension: version {
    type: number
    sql: ${TABLE}.VERSION ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
