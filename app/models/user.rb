class User < ActiveRecord::Base
	has_many  :shorteners
end
