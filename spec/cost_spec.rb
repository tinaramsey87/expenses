require('spec_buddy')

describe(Cost) do
  describe("#amount") do
    it('returns the dollar amount paid for a product') do
      test_cost = Cost.new({:amount => 5.75, :date => "2015-01-17"})
      expect(test_cost.amount()).to(eq(5.75))
    end
  end

  describe("#date") do
    it("returns the date the product was purchased") do
      test_cost = Cost.new({:amount => 5.75, :date => "2015-01-17"})
      expect(test_cost.date()).to(eq("2015-01-17"))
    end
  end

  describe("#id") do
    it("returns an id number for the amount") do
      test_cost = Cost.new({:amount => 5.75, :date => "2015-01-17"})
      test_cost.save()
      expect(test_cost.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe(".all") do
    it("the list of the amounts, its empty at first") do
    expect(Cost.all).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a new amount to the cost list") do
      test_cost = Cost.new({:amount => 5.75, :date => "2015-01-17"})
      test_cost.save()
      expect(Cost.all).to(eq([test_cost]))
    end
  end

  describe("#==") do
    it("is the same cost if the amount is the same") do
      test_cost = Cost.new({:amount => 5.75, :date => "2015-01-17"})
      test_cost2 = Cost.new({:amount => 5.75, :date => "2015-01-17"})
    expect(test_cost).to(eq(test_cost2))
    end
  end

end
