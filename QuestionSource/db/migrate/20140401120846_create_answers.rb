class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :desc
      t.date :submitted
      t.integer :score
      t.string :user
      t.references :question

      t.timestamps
    end
    add_index :answers, :question_id
  end
end
