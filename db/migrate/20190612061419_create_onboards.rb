class CreateOnboards < ActiveRecord::Migration[5.2]
  def change
    create_table :onboards do |t|
      t.string :name
      t.string :job
      t.string :species1
      t.string :species2
      t.integer :howmany

      t.timestamps
    end
  end
end
