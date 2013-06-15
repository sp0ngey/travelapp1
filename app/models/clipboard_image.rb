class ClipboardImage < ActiveRecord::Base
	attr_accessible :id, :url, :user_id
  validates :url, :user_id, :source, presence: true
  validates :url, :uniqueness => { :scope => :user_id }
	#attr_reader :id
end
