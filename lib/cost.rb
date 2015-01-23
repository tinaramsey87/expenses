class Cost

  attr_reader(:amount, :date, :id)

  define_method(:initialize) do |attributes|
    @amount = attributes[:amount]
    @date = attributes[:date]
    @id = attributes[:id]
  end

  define_singleton_method(:all) do
    returned_costs = DB.exec("SELECT * FROM cost;")
    costs = []
    returned_costs.each() do |cost|
      amount = cost.fetch("amount").to_f()
      date = cost.fetch("date")
      id = cost.fetch("id").to_i()
      costs.push(Cost.new({:amount => amount, :date => date, :id => id}))
    end
    costs
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO cost (amount, date) VALUES ('#{@amount}', '#{@date}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  define_method(:==) do |another_cost|
    self.amount().==(another_cost.amount()).&(self.date().==(another_cost.date())).&(self.id().==(another_cost.id()))
  end
end
