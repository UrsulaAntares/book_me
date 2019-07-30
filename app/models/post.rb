class Post < ApplicationRecord
    belongs_to :artist
    has_one_attached :media
end
