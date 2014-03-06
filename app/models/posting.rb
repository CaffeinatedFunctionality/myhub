class Posting < ActiveRecord::Base
	include Supertag::Hashtaggable 
	include Supertag::Usertaggable 
	include Supertag::Moneytaggable 
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :body, presence:true, length: { maximum: 1000 }
	validates :user_id, presence: true
end
