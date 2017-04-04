class BasicTplay
  def initialize
    @percentage = 1
    @description = "normal"
  end

  def details
    return @description
  end
end

class TplayDecorator

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  # decorator class -- this serves as the superclass for all the concrete decorators
  # the base/super class decorator (i.e. no actual decoration yet), each concrete decorator (i.e. subclass) will add its own decoration

  def initialize(real_tplay)
    @percentage = 1
    @real_tplay = real_tplay
    @feature = ""
  end



  # override the details method to include the description of the extra feature
  def details
    return @feature + ". " + @real_car.details
  end

end


class SellingDecorator < TplayDecorator
  def initialize(real_tplay)
    super(real_tplay)
    @percentage = 1
    @feature = "Hot!!!"
  end

  # override the details method to include the description of the extra feature and its corresponding price
  def details
    return @feature
  end
end

class BazheDecorator < TplayDecorator
  def initialize(real_tplay)
    super(real_tplay)
    @percentage = 0.8
  end

  # override the details method to include the description of the extra feature and its corresponding price
  def price
    return @percentage
  end
end

class WuzheDecorator < TplayDecorator
  def initialize(real_tplay)
    super(real_tplay)
    @percentage = 0.5
  end

  # override the details method to include the description of the extra feature and its corresponding price
  def price
    return @percentage
  end
end

c = BasicTplay.new
puts c.details
puts

c = SellingDecorator.new(c)
puts c.details
puts

c = BazheDecorator.new(c)
puts c.price
puts

c = WuzheDecorator.new(c)
puts c.price
puts