require("Circle")
require("Rectangle")
require("Square")

function Test()
    local vCircle = Circle:new(10, 20, 30)
    local vRectangle = Rectangle:new(40, 50, 60, 70)
    local vSquare = Square:new(80, 90, 100)
    vCircle:Print()
    vRectangle:Print()
    vSquare:Print()
end

Test()


    