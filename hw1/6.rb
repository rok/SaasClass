class CartesianProduct
  include Enumerable
  def initialize(a,b)
    @r=[]
    if b != nil
      @r = a.product(b)
    end
  end
  
  def each
    @r.each {|z| yield z}
  end
end

#Examples of use
# c = CartesianProduct.new([:a,:b], [4,5])
# puts c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]

# c = CartesianProduct.new([:a,:b], [])
 #puts c.each { |elt| puts elt.inspect }
# (nothing printed since Cartesian product
# of anything with an empty collection is empty)