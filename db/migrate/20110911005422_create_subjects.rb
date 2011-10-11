class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :term
    end
    add_index :subjects, :term
  end
end