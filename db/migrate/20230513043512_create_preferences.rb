# TABLA DE PREFENCIAS DE USUARIO
class CreatePreferences < ActiveRecord::Migration[6.1]
  def change
    create_table :preferences do |t|
      t.string :preference
      t.string :description
      t.timestamps
    end
  end
end
