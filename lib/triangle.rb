class Triangle
  attr_reader :a, :b, :c
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    validate_triangle
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end

  def validate_triangle
    real_triangle = [(a + b > c), (a + c > b), (b + c > a)]
    [a, b, c].each do |side|
      real_triangle << false if side <= 0
    raise TriangleError if real_triangle.include?(false)
    end
  end

  class TriangleError < StandardError
  end

end



# class Triangle
#
#   class TriangleError < StandardError
#
#   end
#
#
#   attr_accessor :x, :y, :z
#   def initialize(x, y, z)
#     @x = x
#     @y = y
#     @z = z
#   end
#
#   def kind
#     if kosher_triangle == true && kosher_triangle2 == true
#       puts true
#     else
#       raise TriangleError
#     end
#
#     if x == y && y == z && x == z
#       :equilateral
#     elsif x != y && y != z && z != x
#       :scalene
#     else
#       :isosceles
#     end
#   end
#
#   def kosher_triangle
#     x.positive? && y.positive? && z.positive?
#   end
#
#   def kosher_triangle2
#     x + y > z && x + z > y && y + z > x
#   end
# end
