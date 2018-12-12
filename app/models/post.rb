class Post < ApplicationRecord
    belongs_to :user
    has_many :comments

    acts_as_votable


    def self.search (search)

        if search
            where(['body LIKE ?', "%#{search}%"])
        else

            # cached_votes_total, 
            # cached_votes_score, 
            # cached_votes_up, 
            # cached_votes_down, 
            # cached_weighted_score, 
            # cached_weighted_total, 
            # cached_weighted_average,
            
            
            
            all.order(:created_at => :desc)


        end
    end
end
