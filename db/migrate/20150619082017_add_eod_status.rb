class AddEodStatus < ActiveRecord::Migration
  def change
  	add_column :overtimes, :beforeEOD, :string
  	add_column :overtimes, :EOD,	   :string
  	add_column :overtimes, :afterEOD,  :string
  end
end
