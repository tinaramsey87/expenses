class Product
  attr_reader(:description, :id)

  define_method(:initialize) do |attributes|
    @description = attributes[:description]
    @id = attributes[:id]
  end

  define_singleton_method(:all) do
    returned_products = DB.exec("SELECT * FROM product;")
    products = []
    returned_products.each() do |product|
      description = product.fetch("description")
      id = product.fetch('id').to_i()
      products.push(Product.new({:description => description, :id => id}))
    end
    products
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO product (description) VALUES ('#{@description}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_product|
    self.description().==(another_product.description()).&(self.id().==(another_product.id()))
  end


end
