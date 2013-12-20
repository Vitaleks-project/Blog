class News < ActiveRecord::Base
  require 'uri'

  attr_accessible :admin_id, :title, :url
  belongs_to :admin

  validates :admin_id, :title, presence: true
  validates :url, format: /^(https?:\/\/)?([\w\.]+)\.([a-z]{2,6}\.?)(\/[\w\.]*)*\/?$/, presence: true

end
