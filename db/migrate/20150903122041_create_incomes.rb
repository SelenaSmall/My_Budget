class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.integer :wages, null:false
      t.integer :other_income, null:false
      t.integer :income_total, null:false

      t.timestamps null: false
    end
  end
end
