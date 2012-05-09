require 'digest/sha1'

class AdminUser < ActiveRecord::Base
	EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

	has_and_belongs_to_many :pages
	has_many :section_edits
	has_many :sections, :through => :section_edits

	validates :first_name, :presence => true, :length =>{:maximum => 25}
	validates :last_name, :presence => true, :length => {:maximum => 50}

	validates :username, :presence => true, :length => {:within => 8..25}, :uniqueness => true
	validates :email, :presence => true, :length => {:maximum => 100}, :format => EMAIL_REGEX, :confirmation => true

	validates_length_of :password, :within => 8..25, :on => :create

	before_save :create_hashed_password
	after_save :clear_password

	#scope :named, lambda {|first,last| where (:first_name => first, :last_name => last)}
	
	scope :sorted, order("admin_users.last_name ASC, admin_users.first_name ASC")
	attr_protected :hashed_password, :salt
	attr_accessor :password

	def name 
		"#{first_name} #{last_name}"
	end

	def self.authenticate(username="",password="")
		user = AdminUser.find_by_username(username)
		if user && user.password_match?(password)
			return user
		else
			return false
		end
	end

	def password_match?(password="")
		hashed_password == AdminUser.hash_with_salt(password,salt)
	end

	def self.make_salt(username="")
		Digest::SHA1.hexdigest("Use #{username} with #{Time.now} to make salt")
	end

	def self.hash_with_salt(password="", salt="")
		Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
	end

	private
	
	def create_hashed_password
		unless password.blank?
			self.salt = AdminUser.make_salt(username) if salt.blank?
			self.hashed_password = AdminUser.hash_with_salt(password,salt)			
		end
	end

	def clear_password
		self.password = nil
	end

end