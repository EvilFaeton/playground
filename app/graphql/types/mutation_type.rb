# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :add_product_to_cart, mutation: Mutations::AddProductToCart
    field :release_cart, mutation: Mutations::ReleaseCart
  end
end
