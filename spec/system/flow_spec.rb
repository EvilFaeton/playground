require 'rails_helper'

RSpec.describe 'Flow spec', type: :system do
  describe 'buy flow' do
    let!(:product) { create(:product) }
    it 'shows the right content' do
      visit root_path
      click_on 'Add to cart'
      expect(page).to have_content('TOTAL:')
      click_on 'Purchase!'
      expect(page).to have_content('You cart is empty')
    end
  end
end