class Club < ActiveRecord::Base
  attr_accessible :clubname, :coach, :description, :logo,
                  :logo_stadium, :stadiumname, :uniq_title, :year_of_foundation, :admin_id, :country
  belongs_to :admin
  belongs_to :club_statistic
  has_many :players, :dependent => :destroy
  has_and_belongs_to_many :games

  validates :uniq_title, uniqueness: true,
                         presence: true

  validates :coach, :admin_id, :year_of_foundation, :clubname, presence: true

  mount_uploader :logo, ImageUploader
  mount_uploader :logo_stadium, ImageUploader

  COUNTRY = ["England", "Italy", "France", "Germany", "Portugal", "Spain", "Netherland"]

  def self.search(search)
    where('clubname LIKE ?',  "%#{search}%") || where('stadiumname LIKE ?',  "%#{search}%") || where('coach LIKE ?',  "%#{search}%")
  end
end
