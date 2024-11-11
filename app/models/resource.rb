class Resource < ApplicationRecord
  validates :title, :description, :link, uniqueness: true
end
