class Book < ActiveRecord::Base
  belongs_to :user

  has_attached_file :thumbnail, styles: { medium: "500x300>", thumb: "100x100>" }
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/
end
