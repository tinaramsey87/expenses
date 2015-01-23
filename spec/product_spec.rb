require('spec_buddy')

describe(Product) do

  describe('#description') do
    it("Describes product bought") do
      test_product = Product.new({:description => "burgers"})
      expect(test_product.description).to(eq("burgers"))
    end
  end

  describe("#id") do
    it("returns the id number of the product") do
      test_product = Product.new({:description => "burgers"})
      test_product.save()
      expect(test_product.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe(".all") do
    it("the list of all products, it is empty at first") do
      expect(Product.all).to(eq([]))
    end
  end

  describe("#save") do
    it('saves a new product to the list') do
      test_product = Product.new({:description => "burgers"})
      test_product.save()
      expect(Product.all).to(eq([test_product]))
    end
  end

  describe('#==') do
  it("is the same product if it has the same description and id") do
    test_product = Product.new({:description => "burgers"})
    test_product2 = Product.new({:description => "burgers"})
    expect(test_product).to(eq(test_product2))
    end
  end
end
