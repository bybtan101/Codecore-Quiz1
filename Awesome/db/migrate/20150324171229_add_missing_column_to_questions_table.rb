class AddMissingColumnToQuestionsTable < ActiveRecord::Migration
  def change
    add_column :questions, :view_counter, :integer
  end
end
