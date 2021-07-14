require 'rails_helper'

RSpec.describe Mutations::ReleaseCart do
  let!(:cart) { create(:cart) }

  it "releases cart" do
    query = <<~GQL.squish
    mutation {
      releaseCart(input: {}) {
        success
      }
    }
    GQL
    AppSchema.execute(query: query, context: {cart: cart})
    expect(Cart.where(active: true).count.zero?).to be_truthy
  end
end