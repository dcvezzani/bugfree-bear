class AddListOrderToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :list_order, :integer
  end
end
