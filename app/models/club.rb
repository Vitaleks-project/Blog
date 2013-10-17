class Club < ActiveRecord::Base
  attr_accessible :clubname, :coach, :description, :logo,
                  :logo_stadium, :stadiumname, :uniq_title, :year_of_foundation, :admin_id
  belongs_to :admin
  mount_uploader :logo, ImageUploader
  mount_uploader :logo_stadium, ImageUploader
end
