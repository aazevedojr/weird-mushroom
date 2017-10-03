class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :bookmark
      t.string :title
      t.references :maker
      t.references :challenge

      t.timestamps
    end
  end
end
