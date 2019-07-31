class UserArtist < ApplicationRecord
    belongs_to :user 
    belongs_to :artist

    def other_users
        User.all.select do |user|
            user != current_user
        end
    end
    
end
