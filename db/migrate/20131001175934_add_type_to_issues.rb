class AddTypeToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :type, :string
  end
end
