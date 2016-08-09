class Relationship < ActiveRecord::Base
	belongs_to :follower, class_name: "User"
    validates :follewer_id, presence: true
    
	belongs_to :followed, class_name: "User"
	validates :follewed_id, presence: true
end
