view: users {
sql_table_name: @{DATABASE_NAME}.ACCOUNT_USAGE.USERS ;;


  dimension: USER_ID {
    type: number
    primary_key: yes
    description: "Internal/system-generated identifier for the user."
    sql: ${TABLE}.USER_ID ;;
  }

  dimension: TYPE {
    type: string
    description: "Specifies the type of user."
    sql: ${TABLE}.TYPE ;;
  }

  dimension: SNOWFLAKE_LOCK {
    type: string
    description: "Specifies whether a temporary lock has been placed on the user’s account."
    sql: ${TABLE}.SNOWFLAKE_LOCK ;;
  }

  dimension: SCHEMA_NAME {
    type: string
    description: "When the user TYPE is SNOWFLAKE_SERVICE, it specifies the service’s schema name; otherwise, it’s NULL."
    sql: ${TABLE}.SCHEMA_NAME ;;
  }

  dimension: SCHEMA_ID {
    type: number
    description: "When the user TYPE is SNOWFLAKE_SERVICE, it specifies the internal, Snowflake-generated identifier for the service’s schema; otherwise, it’s NULL."
    sql: ${TABLE}.SCHEMA_ID ;;
  }

  dimension_group: PASSWORD_LAST_SET_TIME {
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
    description: "The timestamp on which the last non-null password was set for the user."
    sql: ${TABLE}.PASSWORD_LAST_SET_TIME ;;
  }

  dimension: OWNER {
    type: string
    description: "Specifies the role with the OWNERSHIP privilege on the object."
    sql: ${TABLE}.OWNER ;;
  }

  dimension: NAME {
    type: string
    description: "A unique identifier for the user."
    sql: ${TABLE}.NAME ;;
  }

  dimension: MUST_CHANGE_PASSWORD {
    type: yesno
    description: "Specifies whether the user is forced to change their password on their next login."
    sql: ${TABLE}.MUST_CHANGE_PASSWORD ;;
  }

  dimension: LOGIN_NAME {
    type: string
    description: "Name that the user enters to log into the system."
    sql: ${TABLE}.LOGIN_NAME ;;
  }

  dimension_group: LOCKED_UNTIL_TIME {
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
    description: "Specifies the number of minutes until the temporary lock on the user login is cleared."
    sql: ${TABLE}.LOCKED_UNTIL_TIME ;;
  }

  dimension_group: LAST_SUCCESS_LOGIN {
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
    description: "Date and time when the user last logged in to Snowflake."
    sql: ${TABLE}.LAST_SUCCESS_LOGIN ;;
  }

  dimension: LAST_NAME {
    type: string
    description: "Last name of the user."
    sql: ${TABLE}.LAST_NAME ;;
  }

  dimension: HAS_RSA_PUBLIC_KEY {
    type: yesno
    description: "Specifies whether RSA public key authentication is set up for the user."
    sql: ${TABLE}.HAS_RSA_PUBLIC_KEY ;;
  }

  dimension: HAS_PASSWORD {
    type: yesno
    description: "Specifies whether a password was created for the user."
    sql: ${TABLE}.HAS_PASSWORD ;;
  }

  dimension: HAS_MFA {
    type: yesno
    description: "Specifies whether the user is enrolled for multi-factor authentication."
    sql: ${TABLE}.HAS_MFA ;;
  }

  dimension: FIRST_NAME {
    type: string
    description: "First name of the user."
    sql: ${TABLE}.FIRST_NAME ;;
  }

  dimension: EXT_AUTHN_UID {
    type: string
    description: "The authorization ID used for Duo Security."
    sql: ${TABLE}.EXT_AUTHN_UID ;;
  }

  dimension: EXT_AUTHN_DUO {
    type: yesno
    description: "Specifies whether Duo Security is enabled for the user."
    sql: ${TABLE}.EXT_AUTHN_DUO ;;
  }

  dimension_group: EXPIRES_AT {
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
    description: "The date and time when the user’s status is set to EXPIRED."
    sql: ${TABLE}.EXPIRES_AT ;;
  }

  dimension: EMAIL {
    type: string
    description: "Email address for the user."
    sql: ${TABLE}.EMAIL ;;
  }

  dimension: DISPLAY_NAME {
    type: string
    description: "Name displayed for the user in the Snowflake web interface."
    sql: ${TABLE}.DISPLAY_NAME ;;
  }

  dimension: DISABLED {
    type: string
    description: "Specifies whether the user account is disabled."
    sql: ${TABLE}.DISABLED ;;
  }

  dimension_group: DELETED_ON {
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
    description: "Date and time when the user’s account was deleted."
    sql: ${TABLE}.DELETED_ON ;;
  }

  dimension: DEFAULT_WAREHOUSE {
    type: string
    description: "The virtual warehouse that is active by default for the user’s session upon login."
    sql: ${TABLE}.DEFAULT_WAREHOUSE ;;
  }

  dimension: DEFAULT_SECONDARY_ROLE {
    type: string
    description: "Specifies the default secondary role for the user."
    sql: ${TABLE}.DEFAULT_SECONDARY_ROLE ;;
  }

  dimension: DEFAULT_ROLE {
    type: string
    description: "The role that is active by default for the user’s session upon login."
    sql: ${TABLE}.DEFAULT_ROLE ;;
  }

  dimension: DEFAULT_NAMESPACE {
    type: string
    description: "The namespace (database and schema) active by default for the user’s session."
    sql: ${TABLE}.DEFAULT_NAMESPACE ;;
  }

  dimension: DATABASE_NAME {
    type: string
    description: "When the user TYPE is SNOWFLAKE_SERVICE, it specifies the service’s database name."
    sql: ${TABLE}.DATABASE_NAME ;;
  }

  dimension: DATABASE_ID {
    type: number
    description: "When the user TYPE is SNOWFLAKE_SERVICE, it specifies the internal database identifier."
    sql: ${TABLE}.DATABASE_ID ;;
  }

  dimension_group: CREATED_ON {
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
    description: "Date and time when the user’s account was created."
    sql: ${TABLE}.CREATED_ON ;;
  }

  dimension: COMMENT {
    type: string
    description: "Comment for the user."
    sql: ${TABLE}.COMMENT ;;
  }

  dimension_group: BYPASS_MFA_UNTIL {
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
    description: "The number of minutes to temporarily bypass MFA for the user."
    sql: ${TABLE}.BYPASS_MFA_UNTIL ;;
  }
}
