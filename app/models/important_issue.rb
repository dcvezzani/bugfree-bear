class ImportantIssue < Issue
  attr_accessible :body, :title

  def self.max_list_order
    fnd = ImportantIssue.find_by_sql("select MAX(list_order) from issues")
    fnd.first.attributes["max"].to_i
  end

  def next_issue
    fnd = ImportantIssue.find_by_sql(["select id, list_order from (select id, list_order from issues order by list_order asc) as ordered_issues where ordered_issues.list_order > ? limit 1", list_order])

    if(fnd.length > 0)
      ImportantIssue.find fnd.first.id
    else
      nil
    end
  end

  def prev_issue
    fnd = ImportantIssue.find_by_sql(["select id, list_order from (select id, list_order from issues order by list_order desc) as ordered_issues where ordered_issues.list_order < ? limit 1", list_order])

    if(fnd.length > 0)
      ImportantIssue.find fnd.first.id
    else
      nil
    end
  end

  def swap_with!(replace_issue)
    if(replace_issue.nil?)
      return true
    end

    tmp_list_order = replace_issue.list_order
    replace_issue.list_order = self.list_order
    self.list_order = tmp_list_order
    
    ImportantIssue.transaction do
      if(!replace_issue.save or !self.save)
        raise "Unable to swap ImportantIssue (id: #{self.id}) with ImportantIssue (id: #{replace_issue.id}) "
      end
    end

    true
  end
end

=begin
cnt = 0
ImportantIssue.all.each{|issue|
  issue.list_order = (cnt+=1)
  issue.save!
}
=end
