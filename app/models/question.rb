class Question < ActiveRecord::Base
  attr_accessible :content, :voting_id, :answers_attributes
  belongs_to :voting
  has_many :answers, :dependent => :destroy
  accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
