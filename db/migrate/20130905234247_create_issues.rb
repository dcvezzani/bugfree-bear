class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.text :body

      t.timestamps
    end
  end
end
