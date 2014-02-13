class Voting < ActiveRecord::Base
  attr_accessible :admin_id, :title, :current, :questions_attributes
  has_many :questions, :dependent => :destroy
  has_many :targets, :dependent => :destroy
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true


  def self.voting_targets_size
    Voting.find_last_by_current(true).targets.size
  end

  def self.percentage_off
    answer_size = Voting.find_last_by_current(true).questions.first.answers.size
    targets_size = voting_targets_size
    x = []
    y = []
    x << answer_size
    y << targets_size
    combined = x.zip y

    combined.each do |a, b|
      result = (a.to_f / b.to_f) * 100
      @percentage = (result / a).round(1)

      return @percentage.to_f
    end
  end
end
