class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :posts, dependent: :destroy

         has_many :active_relationships, foreign_key: "follower_id", dependent: :destroy
         has_many :following, through: :active_relationships, source: :followed
         
         has_many :passive_relationships, foreign_key: "followed_id", dependent: :destroy
         has_many :followers, through: :passive_relationships, source: :follower

         def follow(other)
        	active_relationships.create(followed_id: other.id)
        	
         end
        
         def unfollow(other)
        	active_relationships.find_by(followed_id: other.id).destroy
        	
         end

         def following?(other)
        	following.include?(other)
        	
         end
end
