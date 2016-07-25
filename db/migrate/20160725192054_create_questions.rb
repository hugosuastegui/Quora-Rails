class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :description
      t.integer :votes, default: 0
      t.belongs_to :users
      t.timestamps null: false
    end
  end
end
