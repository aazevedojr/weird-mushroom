class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :feedback
      t.references :reviewer
      t.references :course

      t.timestamps
    end
  end
end
