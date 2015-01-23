class Category
  attr_reader(:name, :percentage, :id)

  define_method(:initialize) do |attributes|
    @name = attributes[:name]
    @id = attributes[:id]
    @percentage = attributes[:percentage]
  end

  define_singleton_method(:all) do
    returned_categories = DB.exec("SELECT * FROM categories;")
    categories = []
    returned_categories.each() do |category|
      name = category.fetch("name")
      id = category.fetch('id').to_i()
      categories.push(Category.new({:name => name, :id => id}))
    end
    categories
  end

  define_singleton_method(:find) do |id|
    found_category = nil
    Category.all().each() do |category|
      if category.id().==(id)
        found_category = category
      end
    end
    found_category
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO categories (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_category|
    self.name().==(another_category.name()).&(self.id().==(another_category.id()))
  end

  define_method(:add_product) do |product, cost|
    DB.exec("INSERT INTO categories_costs_products (category_id, cost_id, product_id) VALUES (#{self.id()}, #{cost.id()}, #{product.id()});")
  end

  define_method(:products) do
    category_products = DB.exec("SELECT product.* FROM product
      JOIN categories_costs_products ON (product.id = categories_costs_products.product_id)
      categories JOIN categories_cost_products ON (category_id = categories_costs_products.category_id)
      cost JOIN categories_costs_products ON (cost_id = categories_costs_products.cost_id)
      WHERE product.id = 1;")
    products = []
    category_products.each() do |id|
      product_id = id.fetch("product_id").to_i()
      cost_id = id.fetch("cost_id").to_i()
      category_id = id.fetch("category_id").to_i()
      products.push({:category_id => category_id, :product_id => product_id, :cost_id => cost_id})
    end
    products
  end

end
