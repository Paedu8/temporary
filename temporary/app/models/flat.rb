class Flat < ActiveRecord::Base
	belongs_to :user
	belongs_to :category

  has_attached_file :flat_image, :styles => { :flat_index => "250x350>", :flat_show => "325x475>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :flat_image, :content_type => /\Aimage\/.*\Z/
end
