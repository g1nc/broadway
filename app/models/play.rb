class Play < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :reiews
	has_attached_file :image, styles: { medium: "325x475>", thumb: "250x350>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
