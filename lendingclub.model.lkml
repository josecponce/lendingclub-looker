connection: "lendingclub-node-3"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: secondary_market_note_offer {
  join: loan_entity {
    relationship: many_to_one
    sql_on: ${secondary_market_note_offer.loan_id} = ${loan_entity.id} ;;
  }
  join: loan_secondary_market_buy_order_entity {
    from: secondary_market_buy_order_entity
    relationship: one_to_many
    sql_on: ${secondary_market_note_offer.loan_id} = ${loan_secondary_market_buy_order_entity.loan_id} ;;
  }
  join: loan_secondary_market_buy_order_response_entity {
    from: secondary_market_buy_order_response_entity
    relationship: one_to_one
    sql_on: ${loan_secondary_market_buy_order_entity.id} = ${loan_secondary_market_buy_order_response_entity.buy_order_id} ;;
  }
}

explore: full_order_details_pdt {
  join: loan_secondary_market_buy_order_entity {
    from: secondary_market_buy_order_entity
    relationship: one_to_many
    sql_on: ${full_order_details_pdt.loan_id} = ${loan_secondary_market_buy_order_entity.loan_id} ;;
  }
  join: loan_secondary_market_buy_order_response_entity {
    from: secondary_market_buy_order_response_entity
    relationship: one_to_one
    sql_on: ${loan_secondary_market_buy_order_entity.id} = ${loan_secondary_market_buy_order_response_entity.buy_order_id} ;;
  }
}

explore: loan_entity {}

explore: secondary_market_buy_order_entity {
  join: secondary_market_buy_order_response_entity {
    relationship: one_to_one
    sql_on: ${secondary_market_buy_order_entity.id} = ${secondary_market_buy_order_response_entity.buy_order_id} ;;
  }
}

explore: batch_job_instance {
  join: batch_job_execution {
    relationship: one_to_many
    type: left_outer
    sql_on: ${batch_job_instance.job_instance_id} = ${batch_job_execution.job_instance_id} ;;
  }
  join: batch_job_execution_context {
    relationship: one_to_one
    type: left_outer
    sql_on: ${batch_job_execution.job_execution_id} = ${batch_job_execution_context.job_execution_id} ;;
  }
  join: batch_job_execution_params {
    relationship: one_to_many
    type: left_outer
    sql_on: ${batch_job_execution.job_execution_id} = ${batch_job_execution_params.job_execution_id} ;;
  }
  join: batch_step_execution {
    relationship: one_to_many
    type: left_outer
    sql_on: ${batch_job_execution.job_execution_id} = ${batch_step_execution.job_execution_id} ;;
  }
  join: batch_step_execution_context {
    relationship: one_to_one
    type: left_outer
    sql_on: ${batch_step_execution.step_execution_id} = ${batch_step_execution_context.step_execution_id} ;;
  }
}
