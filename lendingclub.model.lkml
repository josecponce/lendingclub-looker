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

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
