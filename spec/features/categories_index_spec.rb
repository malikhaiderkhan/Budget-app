require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  let(:user) { User.create!(name: 'Test', email: 'testing@gmail.com', password: 'f4k3p455w0rd') }

  before(:each) do
    login_as(user, scope: :user)
    visit categories_path
  end

  after(:each) do
    user.destroy if user.persisted?
  end

  scenario 'display monthly budget' do
    expect(page).to have_content('MONTHLY BUDGET')
    expect(page).to have_content('$')
  end

  scenario 'navigate to new category page' do
    click_link('Add New Category')
    expect(page).to have_current_path(new_category_path)
  end
end
