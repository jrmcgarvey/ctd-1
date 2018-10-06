# parent class
class LivingThings
  attr_reader :cell

  def initialize
    @cell = cell
  end

  def can_reproduce
  end

  def can_perish
  end
end
