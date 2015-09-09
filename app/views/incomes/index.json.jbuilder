json.array!(@incomes) do |income|
  json.extract! income, :id, :wages, :other_income, :income_total, :income_id
  json.url income_url(income, format: :json)
end
