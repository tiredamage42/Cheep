class Post < ApplicationRecord
    belongs_to :user
    has_many :comments


    def self.search (search)

        if search
            where(['body LIKE ?', "%#{search}%"])
        else
            all
        end
    end
end
