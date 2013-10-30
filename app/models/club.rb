class Club < ActiveRecord::Base
  attr_accessible :clubname, :coach, :description, :logo,
                  :logo_stadium, :stadiumname, :uniq_title, :year_of_foundation, :admin_id
  belongs_to :admin
  has_many :posts
  has_many :players

  validates :uniq_title, uniqueness: true,
                         presence: true

  validates :coach, :admin_id, :year_of_foundation, presence: true

  mount_uploader :logo, ImageUploader
  mount_uploader :logo_stadium, ImageUploader

  def self.search(search)
    where('clubname LIKE ?',  "%#{search}%") || where('stadiumname LIKE ?',  "%#{search}%") || where('coach LIKE ?',  "%#{search}%")
  end
end
