class Posting < ActiveRecord::Base
	include Supertag::Taggable 
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :body, presence:true, length: { maximum: 1000 }
	validates :user_id, presence: true
end
