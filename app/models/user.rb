class User < ActiveRecord::Base
  #relational database:
    #each User has zero or many orders
  has_many :orders
  #here we load the gem 'bcrypt-ruby' to encrypt the password before saving in the table users.
  has_secure_password
  #email_regex reference: Ruby on Rails Tutorial-Learn Rails by Example (Michael Hartl)-http://ruby.railstutorial.org/
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates column email: presence (can't be black), must be a real email (email_regex) and
  # uniqueness (two users with the same email can't be created). Furthermore, it is case_sensitive
  # false, so if "Test@email.com" exist, "test@email.com" can't be creates as well.
  validates :email,       presence: true,
                          format: { with: email_regex },
                          uniqueness: { case_sensitive: false }
  #validates column name: presence (can't be black).
  validates :name,        presence: true
  #validates column password: presence (can't be black).
  validates :password,    presence: true
end
