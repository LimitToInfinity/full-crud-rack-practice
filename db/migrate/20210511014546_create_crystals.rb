class CreateCrystals < ActiveRecord::Migration[5.2]
  def change
    create_table :crystals do |t|
      t.string :kind
      t.string :color
      t.boolean :shiny
      t.integer :dopeness
    end
  end
end
