connection: "lendingclub-node-3"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: secondary_market_note_offer {
  join: loan_entity {
    relationship: many_to_one
    sql_on: ${secondary_market_note_offer.loan_id} = ${loan_entity.id} ;;
  }
}

explore: full_order_details_pdt { }

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
