class Celebrity < ApplicationRecord
  validates :name, presence: true
  validates :wiki_page, presence: true
end
