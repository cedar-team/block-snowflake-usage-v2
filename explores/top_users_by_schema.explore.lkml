
include: "/views/*.view"

explore: top_users_by_schema {
  join: databases {
    type: left_outer
    sql_on: ${top_users_by_schema.database_name} = ${databases.database_name} ;;
    relationship: many_to_one
  }
}
