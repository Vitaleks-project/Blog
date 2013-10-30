class Player < ActiveRecord::Base
  attr_accessible :admin_id, :birthday, :club, :country,
                  :first_name, :last_name, :number, :photo,
                  :position, :club_id

  belongs_to :admin
  belongs_to :club
  has_many :posts

  def full_name
    [first_name, last_name].compact.join(' ')
  end
end
