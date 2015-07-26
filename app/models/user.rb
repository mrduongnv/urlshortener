class User < ActiveRecord::Base
	has_many  :shorteners
	attr_accessible :username, :email
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :username, :presence => true, :length => { :maximum => 50 }
	validates :email, :presence => true, :format => { :with => email_regex }
end
