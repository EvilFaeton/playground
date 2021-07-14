require 'rails_helper'

RSpec.describe AppSchema do
  it "gql schema is valid" do
    query = <<~GQL.squish
    {
      __schema {
        queryType {
          name
        }
      }
    }
    GQL
    expect{ described_class.execute(query: query) }.not_to raise_error
  end
end