class Dessert
  def initialize(name, calories)
    @name = name
    @calories = calories
  end

  def healthy?
    return @calories < 200
  end

  def delicious?
    true
  end
end

class JellyBean < Dessert
  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor
  end

  def delicious?
    if @flavor == 'black licorice'
      return false
    else
      return super
    end
  end

  attr_reader :flavor
  attr_writer :flavor
end
