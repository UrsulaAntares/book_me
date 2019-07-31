class Post < ApplicationRecord
    belongs_to :artist
    has_one_attached :media

    def content_type
        self.media.blob.content_type
    end

    def video?
        self.content_type.include?("video")
    end

    def image?
        self.content_type.include?("image" || "jpeg")
    end
end
