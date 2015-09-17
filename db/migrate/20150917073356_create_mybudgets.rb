class CreateMybudgets < ActiveRecord::Migration
  def change
    create_table :mybudgets do |t|
      t.string :name, null: false
      t.decimal :open_bal, null: false, default: 0
      t.datetime :value_from
    end
  end
end