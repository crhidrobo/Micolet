class CreateSurveys < ActiveRecord::Migration[6.1]
  def change
    create_table :surveys do |t|
      t.string :title
      t.string :question
      t.timestamps
    end
  end
end
