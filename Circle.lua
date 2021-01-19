require("Shape")

Circle = {} -- metatable de Circle
setmetatable(Circle, {__index = Shape}) -- un cercle est une sorte (hérite) de Shape
function Circle:new(pX, pY, pRadius) -- constructeur de Circle
    self = Shape:new(pX, pY) -- appelle le constructeur de Shape pour hériter de x et de y et des methodes de Shapehape
    setmetatable(self, {__index = Circle}) -- self est un Circle (qui hérite de Shape)
    self.radius = pRadius or 0 -- initialisation de radius
    return self -- retourne self, l'objet crée
end
function Circle:Radius()
    print("fonction Circle.Radius() appelée ", self.Radius)
    return self.radius
end
function Circle:Area() -- méthode area propre aux cercles
    print("fonction Circle.Area() appelée ", self.Area)
    return math.pow((math.pi * self.radius), 2);
end
function Circle:Print()
    print("fonction Circle.Print() appelée ", self.Print)
    print("Circle : ", self:X(), self:Y(), self:Radius(), self:Area())
end
function Circle:Draw()
    print("fonction Circle.Draw() appelée ", self.Draw);
end

return Circle