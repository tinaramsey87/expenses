require('spec_buddy')

describe(Category) do
  describe("#name") do
    it('returns the name of the product category') do
      test_category = Category.new({:name => "Food"})
      expect(test_category.name()).to(eq("Food"))
    end
  end

  describe("#id") do
    it("returns an id number for the name") do
      test_category = Category.new({:name => "Food"})
      test_category.save()
      expect(test_category.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe(".all") do
    it("the list of the names, its empty at first") do
    expect(Category.all).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a new name to the category list") do
      test_category = Category.new({:name => "Food"})
      test_category.save()
      expect(Category.all).to(eq([test_category]))
    end
  end

  describe("#==") do
    it("is the same category if the name is the same") do
      test_category = Category.new({:name => "Food"})
      test_category2 = Category.new({:name => "Food"})
    expect(test_category).to(eq(test_category2))
    end
  end

    describe(".find") do
    it("returns a category by its ID number") do
      test_category = Category.new({:name => "Food"})
      test_category.save()
      test_category2 = Category.new({:name => "Clothes"})
      test_category2.save()
      expect(Category.find(test_category2.id())).to(eq(test_category2))
    end
  end

  describe("#add_product") do
    it("adds a new product to the category") do
      test_category = Category.new({:name => "Food"})
      test_category.save()
      test_product = Product.new({:description => "bananas"})
      test_product.save()
      test_cost = Cost.new({:amount => 5.75, :date => "2015-01-17"})
      test_cost.save()
      test_category.add_product(test_product, test_cost)
      expect(test_category.products()).to(eq([test_product, test_cost]))
    end
  end

  describe("#products") do
    it("return list of products in category -- it is empty at first") do
      test_category = Category.new({:name => "Food"})
      expect(test_category.products()).to(eq[])
    end
  end
  # describe("#percentage") do
  #   it("returns the percentage of money spent on the category") do
  #     test_category = Category.new(:name => "Food")
  #     expect(test_category.percentage()).to(eq())
  #   end
  # end
end
