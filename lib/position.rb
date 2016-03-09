class Position
  attr_reader :x, :y, :compass, :plateau

  COMPASS = { 0 => 'N', 90 => 'E', 180 => 'S', 270 => 'W' }
  TURN = {'L' => -90, 'R' => 90}

  def initialize(plateau, x, y, direction)
    self.plateau = plateau
    self.x = x
    self.y = y
    self.compass = COMPASS.key(direction)
  end

  def get_position
    "#{self.x} #{self.y} #{COMPASS[self.compass]}"
  end

  def rotate(direction)
    update_compass(TURN[direction]) if TURN.has_key?(direction)
  end

  def forward
    self.y += 1 if self.compass == 0 && self.plateau.is_y_in_bounds?(self.y + 1)
    self.y -= 1 if self.compass == 180 && self.plateau.is_y_in_bounds?(self.y - 1)
    self.x += 1 if self.compass == 90 && self.plateau.is_x_in_bounds?(self.x + 1)
    self.x -= 1 if self.compass == 270 && self.plateau.is_x_in_bounds?(self.x - 1)
  end

  private
  attr_writer :x, :y, :compass, :plateau

  def update_compass(degrees)
    self.compass += degrees
    self.compass += 360 if self.compass < 0
    self.compass -= 360 if self.compass >= 360
  end

end
