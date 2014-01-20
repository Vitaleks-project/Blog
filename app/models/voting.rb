class Voting < ActiveRecord::Base
  attr_accessible :admin_id, :title, :questions_attributes
  has_many :questions, :dependent => :destroy
  has_many :targets, :dependent => :destroy
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
