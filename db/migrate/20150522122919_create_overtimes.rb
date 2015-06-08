class CreateOvertimes < ActiveRecord::Migration
  def change
    create_table :overtimes do |t|
      t.integer :user_id
      t.integer :stimehours
      t.integer :stimeminutes
      t.integer :etimehours
      t.integer :etimeminutes
      t.string  :ETAP
      t.string  :STAP
      t.date    :sdayofot
      t.date    :edayofot

      t.timestamps null: false
    end
  end
end
