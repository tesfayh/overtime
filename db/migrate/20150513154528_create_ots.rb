class CreateOts < ActiveRecord::Migration
  def change
    create_table :ots do |t|
      t.integer :starting_time
      t.integer :ending_time
      t.date    :sdayofOt
      t.date    :edayofOt
      t.string  :STAP
      t.string  :ETAP
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
