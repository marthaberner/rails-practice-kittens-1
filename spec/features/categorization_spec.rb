require 'rails_helper'

feature 'validating categories' do
  scenario 'user cannot leave category blank' do
    user = create_user
    login(user)
    create_kitten
    visit '/'
    find(".kitten-link").click
    click_on 'Add Category'
    expect(page).to have_content "Category can't be blank"
  end

  def login(user)
    visit root_path
    click_on "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_on "Login"
  end
end