class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :description
      t.integer :votes
      t.belongs_to :questions, index: true
      t.belongs_to :users
      t.timestamps null: false
    end
  end
end
