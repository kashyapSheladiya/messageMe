class User < ActiveRecord::Base
    validates :username, presence: true, 
              uniqueness: {case_sensitive: false},
              length: {minimum: 5, maximum:15}
    
    has_secure_password

end