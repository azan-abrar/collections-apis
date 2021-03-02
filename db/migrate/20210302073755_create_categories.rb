class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.references :vertical

      t.string  :name
      t.integer :state, default: 0

      t.timestamps
    end
  end
end
