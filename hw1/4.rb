class Dessert
  attr_accessor :name, :calories
  def initialize(name, calories)
    @name = name
    @calories = calories
  end

  def healthy?
    if @calories < 200
      return true
    else
      return false
    end   
  end
  
  def delicious?
    return true
  end
end

class JellyBean < Dessert
  attr_accessor :name, :calories, :flavor
  def initialize(name, calories, flavor)
    @name = name
    @calories = calories
    @flavor = flavor
  end
  
  def delicious?
    if @flavor == "black licorice"
      return false
    end
    return true
  end
end

#a = Dessert.new("Sadje", 100)
#b = Dessert.new("Potica", 9001)
#c = JellyBean.new("JellyBeanLik", 100, "licorice")
#d = JellyBean.new("JellyBeanDog", 100, "dog")
#
#[a,b,c,d].each do |a|
#  puts a.name
#  puts a.calories
#  puts a.healthy?
#  puts a.delicious?
#end

#dessert
#  should be able to set and get a dessert's name and calories [20 points] (FAILED)
#  should return true if a dessert has fewer than 200 calories [10 points]
#  should return true for any dessert [20 points]
#
#jellybean
#  should be a subclass of Dessert [10 points]
#  should be able to set and get a jellybean's flavor [20 points] (FAILED)
#  should return true unless the flavor is black licorice [20 points] (FAILED)