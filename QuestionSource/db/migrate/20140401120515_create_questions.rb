class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.text :desc
      t.date :submitted
      t.integer :score
      t.references :section

      t.timestamps
    end
    add_index :questions, :section_id
  end
end
