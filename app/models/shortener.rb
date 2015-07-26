class Shortener < ActiveRecord::Base
	att_accessible :long, :user_id
	belongs_to :user
	validates :short, :length => { :maximum => 10}
	validates :long, :length => { :maximum => 250}
end
