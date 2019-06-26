class CreateCombinationarrays < ActiveRecord::Migration[5.2]
  def change
    create_table :combinationarrays do |t|
      t.references :combination, foreign_key: true, index: true
      t.string :name, index: true
      t.string :job, index: true
      t.string :species1, index: true
      t.string :species2, index: true
      t.integer :howmany, index: true

      t.timestamps
    end
  end
end
