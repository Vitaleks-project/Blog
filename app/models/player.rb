class Player < ActiveRecord::Base
  attr_accessible :admin_id, :birthday, :club, :country,
                  :first_name, :last_name, :number, :photo,
                  :position, :club_id
  mount_uploader :photo, ImageUploader

  belongs_to :club
  belongs_to :admin
  has_many :posts

  validates :club_id, presence: true

  def full_name
    [first_name, last_name].compact.join(' ')
  end
end
