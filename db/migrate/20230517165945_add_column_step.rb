class AddColumnStep < ActiveRecord::Migration[6.1]
  def change
    add_column :survery_answers, :step, :integer
  end
end
