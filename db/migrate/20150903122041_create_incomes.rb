class CreateIncomes < ActiveRecord::Migration

  def change
    create_table :incomes do |t|
      t.decimal :wages, null: false, default: 0
      t.decimal :other_income, null: false, default: 0
      t.datetime :value_from
    end
  end
end
