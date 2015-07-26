class Shortener < ActiveRecord::Base
	belong_to: user
	validates: short, length => { :maximum 10}
	validates: long, length => { :maximum 250}
end
