class NormalIssue < Issue
  attr_accessible :body, :title
end

=begin
Issue.all.each{|issue|
  issue.type = "NormalIssue"
  issue.save!
}
=end
