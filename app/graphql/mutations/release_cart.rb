# frozen_string_literal: true

module Mutations
  class ReleaseCart < BaseMutation
    field :success, Boolean, null: false

    def resolve
      context[:cart].update!(active: false)
      { success: true }
    end
  end
end
