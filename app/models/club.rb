class Club < ActiveRecord::Base
  attr_accessible :clubname, :coach, :description, :logo,
                  :logo_stadium, :stadiumname, :uniq_title, :year_of_foundation, :admin_id
  belongs_to :admin
  has_many :posts

  validates :uniq_title, uniqueness: true,
                         presence: true

  validates :coach, :admin_id, :year_of_foundation, presence: true

  mount_uploader :logo, ImageUploader
  mount_uploader :logo_stadium, ImageUploader
end
