class Type < ApplicationRecord
    validates :title, presence: true
    has_many :bookmarks
end
