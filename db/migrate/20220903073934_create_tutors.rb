class CreateTutors < ActiveRecord::Migration[7.0]
  def change
    create_table :tutors do |t|
      t.string :name
      t.string :email, index: true
      t.references :course, foreign_key: true
      t.timestamps
    end
  end
end
