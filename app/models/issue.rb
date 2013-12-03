class Issue < ActiveRecord::Base
  attr_accessible :body, :title

  validates :title, :body, presence: true
  validates :title, uniqueness: true

  def important?
    is_a?(ImportantIssue)
  end

  def display_title
    title.split(/-/).map{|word| word.capitalize}.join(" ")
  end
end
