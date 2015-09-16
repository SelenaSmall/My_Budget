class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.decimal :outgoing, null: false, default: 0
      t.decimal :oneoff, null: false, default: 0
	  t.datetime :value_from
    end
  end
end