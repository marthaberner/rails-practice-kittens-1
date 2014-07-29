require 'rails_helper'

feature 'Categorizations' do
  scenario 'Categorization cannot be blank' do
    user = create_user email: "user@example.com"
    login(user)
    Kitten.create!(image: "http://i.imgur.com/tOzb0dUb.jpg")
    visit root_path
    find(".kitten-link").click
    click_on "Add Category"

    expect(page).to have_content("Category can't be blank")
  end

  def login(user)
    visit root_path
    click_on "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_on "Login"
  end
end