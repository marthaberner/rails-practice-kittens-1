require 'rails_helper'

feature 'Categorizations' do
  scenario 'Categorization cannot be blank' do
    user = create_user email: "user@example.com"
    Category.create!(name: "Cutest!")
    Kitten.create!(image: "http://i.imgur.com/tOzb0dUb.jpg")

    visit root_path
    click_on "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_on "Login"

    find(".kitten-link").click
    click_on "Add Category"

    expect(page).to have_content("Category has already been taken")
  end
end