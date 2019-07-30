explore: query_history_core {
  extension: required
  join: databases {
    type: left_outer
    sql_on: ${query_history.database_name} = ${databases.database_name} ;;
    relationship: many_to_one
  }
  join: warehouse_metering_history {
    relationship: many_to_one
    type: left_outer
    sql_on: ${warehouse_metering_history.warehouse_name} = ${query_history.warehouse_name} AND ${query_history.start_raw} BETWEEN ${warehouse_metering_history.start_raw} AND ${warehouse_metering_history.end_raw} ;;
  }
}

explore: query_history{
  extends: [query_history_config]
}
