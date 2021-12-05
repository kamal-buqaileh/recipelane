class Recipe < ApplicationRecord
  belongs_to :author, optional: true
end
