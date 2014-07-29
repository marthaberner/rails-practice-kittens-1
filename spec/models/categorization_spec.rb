require 'rails_helper'

describe Categorization do
  it 'validates the presence of a category' do
    categorization = Categorization.new(category: Category.new)

    expect(categorization).to have(0).errors_on(:category)

    categorization.category = nil
    expect(categorization).to have(1).errors_on(:category)

  end
end