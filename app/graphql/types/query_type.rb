# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :cart, Types::CartType, null: false
    field :products, [Types::ProductType], null: false

    def cart
      context[:cart]
    end

    def products
      Product.all
    end
  end
end
