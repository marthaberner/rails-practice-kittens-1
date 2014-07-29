require 'rails_helper'

describe Categorization do
  it 'Validates the presence of a category' do
    category = Category.create(name: 'Fuzzy')
    kitten = Kitten.create(image: 'some_image')
    categorization = Categorization.new(category_id: category.id, kitten_id: kitten.id )

    expect(categorization.valid?).to eq true

    categorization.category_id = nil
    expect(categorization.valid?).to eq false
  end

  it 'Validates that a categorization is unique' do
    category = Category.create(name: 'Fuzzy')
    kitten = Kitten.create(image: 'some_image')
    new_kitten = Kitten.create(image: 'some__other_image')
    Categorization.create(category_id: category.id, kitten_id: kitten.id )
    categorization_copy = Categorization.new(category_id: category.id, kitten_id: new_kitten.id )

    expect(categorization_copy.valid?).to eq true

    categorization_copy.kitten_id = kitten.id
    expect(categorization_copy.valid?).to eq false
  end
end