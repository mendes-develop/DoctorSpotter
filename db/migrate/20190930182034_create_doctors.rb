class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :image_url
      t.belongs_to :insurance, null: false, foreign_key: true
      t.belongs_to :specialty, null: false, foreign_key: true
      t.integer :fee

      t.timestamps
    end
  end
end
