class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.belongs_to :mybudget, index: true
      t.string :income, null: false, limit: 100 
      t.decimal :amount, null: false, default: 0
      t.datetime :value_from
    end
  end
end