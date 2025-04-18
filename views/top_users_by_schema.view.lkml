view: top_users_by_schema {
  derived_table: {
    sql:
      SELECT
        database_name,
        schema_name,
        user_name,
        start_time,
        RANK() OVER (PARTITION BY database_name, schema_name ORDER BY COUNT(*) DESC) AS user_rank
      FROM ${query_history.SQL_TABLE_NAME}
      GROUP BY database_name, schema_name, user_name
      QUALIFY RANK() OVER (PARTITION BY database_name, schema_name ORDER BY COUNT(*) DESC) <= 50
    ;;
  }

  dimension: database_name {
    type: string
    sql: ${TABLE}.database_name ;;
  }

  dimension: schema_name {
    type: string
    sql: ${TABLE}.schema_name ;;
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}.user_name ;;
  }


  dimension: user_rank {
    type: number
    sql: ${TABLE}.user_rank ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      day_of_month,
      day_of_week,
      month_name,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.START_TIME ;;
    description: "Statement start time (in the UTC time zone)"
  }

  measure: query_count {
    type: count
  }

}
