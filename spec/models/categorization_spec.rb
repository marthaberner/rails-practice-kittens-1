require 'rails_helper'

describe Categorization do
  it 'Validates the presence of a category' do
    category = Category.create!(name: 'Fuzzy')
    kitten = Kitten.create!(image: 'some_image')
    categorization = Categorization.new(category_id: category.id, kitten_id: kitten.id )

    expect(categorization.valid?).to eq true

    categorization.category_id = nil
    expect(categorization.valid?).to eq false
  end

  it 'Validates that a categorization is unique' do
    category = Category.create!(name: 'Fuzzy')
    kitten = Kitten.create!(image: 'some_image')
    Categorization.create!(category: category, kitten_id: kitten.id )
    categorization = Categorization.new(category: category)

    expect(categorization.valid?).to eq true

    categorization.kitten_id = kitten.id
    expect(categorization.valid?).to eq false
    expect(categorization.errors[:category]).to include("has already been taken")
  end
end