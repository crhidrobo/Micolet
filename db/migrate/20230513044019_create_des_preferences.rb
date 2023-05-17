class CreateDesPreferences < ActiveRecord::Migration[6.1]
  def change
    create_table :des_preferences do |t|
      t.references :user, null: false, foreign_key: true
      t.references :preference, null: false, foreign_key: true
      t.timestamps
    end
  end
end
