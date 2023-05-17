class CreateSurveryAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :survery_answers do |t|
      t.references :survey, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :answer
      t.timestamps
    end
  end
end
