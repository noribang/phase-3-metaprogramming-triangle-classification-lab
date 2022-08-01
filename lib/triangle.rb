require 'pry'

class Triangle
  # write code here
  attr_accessor :side1, :side2, :side3
  attr_reader :arr_sides
  

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @arr_sides = [side1, side2, side3]
  end

  def kind
    validate_triangle

    if self.side1 == self.side2 && self.side2 == self.side3
      :equilateral
    elsif side1 == side2 || side2 == side3 || side1 == side3
      :isosceles
    else
      :scalene
    end

      # else
    #   begin
    #     raise TriangleError
    #   # rescue TriangleError => error
    #   #   puts error.message
    #   end
    # end

  end

  def sides_greater_than_zero?
    [side1, side2, side3].all?(&:positive?)
    # arr_sides.each do |side|
    #   if side > 0
    #    puts "side: #{side} > 0"
    #   end
    # end
  end

  def valid_triangle_inequality?
    side1 + side2 > side3 && side1 + side3 > side2 && side2 + side3 > side1
  end

  def validate_triangle
    raise TriangleError unless sides_greater_than_zero? && valid_triangle_inequality?
  end

  # Custom error
  class TriangleError < StandardError
    # def message
    #   "Invalid triangle!"
    # end
  end

end

# binding.pry
