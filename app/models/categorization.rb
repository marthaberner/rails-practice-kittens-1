class Categorization < ActiveRecord::Base
  belongs_to :category

  # validates :category_id, presence:  true
  # OR
  validates_presence_of :category
end


