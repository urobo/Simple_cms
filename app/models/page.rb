require 'lib/position_mover'

class Page < ActiveRecord::Base
	include PositionMover

	has_many :sections
	belongs_to :subject
	has_and_belongs_to_many :editors, :class_name => "AdminUser"

	validates_presence_of :name
	validates_length_of :name, :maximum => 255
	validates_presence_of :permalink
	validates_length_of :permalink, :within => 3..255
	validates_uniqueness_of :permalink

	scope :visible, where(:visible => true)
	scope :invisible, where(:visible => false)
	scope :sorted, order('pages.position ASC')
end
