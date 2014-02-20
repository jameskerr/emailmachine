class AddIssueNumberToTemplates < ActiveRecord::Migration
  def change
  	add_column :templates, :issue_number, :integer
  end
end
