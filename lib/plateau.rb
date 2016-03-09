class Plateau
  attr_accessor :top_x, :top_y

  def initialize(top_x, top_y)
      self.top_x = top_x
      self.top_y = top_y
  end

  def is_x_in_bounds?(value)
    value <= self.top_x && value >= 0
  end

  def is_y_in_bounds?(value)
    value <= self.top_y && value >= 0
  end

end
