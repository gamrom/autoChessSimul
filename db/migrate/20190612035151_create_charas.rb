class CreateCharas < ActiveRecord::Migration[5.2]
  def change
    create_table :charas do |t|
      t.string :name
      t.string :job
      t.string :species1
      t.string :species2

      t.timestamps
    end
  end
end
