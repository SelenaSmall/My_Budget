class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.integer :wages
      t.integer :other_income
      t.integer :income_total

      t.timestamps null: false
    end
  end
end
