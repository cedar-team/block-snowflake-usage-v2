view: metering_history {
  sql_table_name: @{DATABASE_NAME}.ACCOUNT_USAGE.METERING_HISTORY ;;

  # Field Descriptions from Snowflake Documentation: https://docs.snowflake.net/manuals/sql-reference/account-usage/metering_history.html

  # DIMENSIONS #

  dimension: pk {
    primary_key: yes
    sql: CONCAT(${service_type},${name},${start_raw}) ;;
  }

  dimension: service_type {
    type: string
    sql: ${TABLE}.SERVICE_TYPE ;;
    description: "Type of service (e.g., COMPUTE, CLOUD_SERVICES, STORAGE)"
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_month,
      day_of_week,
      day_of_year,
      week,
      week_of_year,
      month,
      month_num,
      quarter,
      year
    ]
    sql: ${TABLE}.START_TIME ;;
    alias: [usage_hour]
    description: "The date and beginning of the hour (in the UTC time zone) in which the service usage took place"
  }

  dimension_group: end {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_month,
      day_of_week,
      day_of_year,
      week,
      week_of_year,
      month,
      month_num,
      quarter,
      year
    ]
    sql: ${TABLE}.END_TIME ;;
    description: "The date and end of the hour (in the UTC time zone) in which the service usage took place"
  }

  dimension: entity_id {
    type: number
    sql: ${TABLE}.ENTITY_ID ;;
    description: "Internal/system-generated identifier for the entity"
  }

  dimension: name {
    type: string
    sql: ${TABLE}.NAME ;;
    description: "Name of the entity (warehouse, database, etc.)"
  }

  dimension: budget_id {
    type: number
    sql: ${TABLE}.BUDGET_ID ;;
    description: "Identifier for the budget associated with this usage"
  }

  # MEASURES #

  measure: count {
    type: count
    drill_fields: [service_type, name]
  }

  measure: total_credits_used_compute {
    type: sum
    sql: ${TABLE}.CREDITS_USED_COMPUTE ;;
    description: "Total compute credits used"
  }

  measure: total_credits_used_cloud_services {
    type: sum
    sql: ${TABLE}.CREDITS_USED_CLOUD_SERVICES ;;
    description: "Total cloud services credits used"
  }

  measure: total_credits_used {
    type: sum
    sql: ${TABLE}.CREDITS_USED ;;
    description: "Total credits used (compute + cloud services)"
  }

  measure: total_bytes {
    type: sum
    sql: ${TABLE}.BYTES ;;
    description: "Total bytes processed"
  }

  measure: total_rows {
    type: sum
    sql: ${TABLE}.ROWS ;;
    description: "Total rows processed"
  }

  measure: total_files {
    type: sum
    sql: ${TABLE}.FILES ;;
    description: "Total files processed"
  }

  measure: average_credits_used_compute {
    type: average
    sql: ${TABLE}.CREDITS_USED_COMPUTE ;;
    description: "Average compute credits used per hour"
  }

  measure: average_credits_used_cloud_services {
    type: average
    sql: ${TABLE}.CREDITS_USED_CLOUD_SERVICES ;;
    description: "Average cloud services credits used per hour"
  }

  measure: average_credits_used {
    type: average
    sql: ${TABLE}.CREDITS_USED ;;
    description: "Average total credits used per hour"
  }

  measure: current_four_weeks_credits_used {
    type: sum
    sql: ${TABLE}.CREDITS_USED ;;
    filters: {field: start_date value: "last 4 weeks"}
    drill_fields: [service_type, name, total_credits_used]
  }

  measure: prior_four_weeks_credits_used {
    type: sum
    sql: ${TABLE}.CREDITS_USED ;;
    filters: {field: start_date value: "8 weeks ago for 4 weeks"}
    drill_fields: [service_type, name, total_credits_used]
  }

}
