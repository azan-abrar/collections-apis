class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.references :category

      t.string  :name
      t.string  :author
      t.integer :state, default: 0

      t.timestamps
    end
  end
end
