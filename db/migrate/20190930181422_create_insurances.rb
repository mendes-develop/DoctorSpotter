class CreateInsurances < ActiveRecord::Migration[6.0]
  def change
    create_table :insurances do |t|
      t.string :name
      t.float :coverage

      t.timestamps
    end
  end
end
