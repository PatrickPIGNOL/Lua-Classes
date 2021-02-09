require("Shape")

Rectangle = {} -- metatable de Rectangle
setmetatable(Rectangle, {__index = Shape}) -- un rectangle est une sorte de Shape
function Rectangle:new(pX, pY, pWidth, pHeight) -- constructeur du rectangle
    self = Shape:new(pX, pY) -- appelle le constructeur parent pour hériter de x et de y
    setmetatable(self, {__index = Rectangle}) -- self est de type Rectangle (qui hérite de Shape)
    self.width = pWidth or 0 -- initialisation de width
    self.height = pHeight or 0 -- initialisation de height
    return self --retourne self l'objet créé
end
function Rectangle:Width() -- largeur
    print("fonction Rectangle.Width() appelée ", self.Width)
    return self.width
end
function Rectangle:Height() -- hauteur
    print("fonction Rectangle.Height() appelée ", self.Height)
    return self.height
end
function Rectangle:Area() -- méthode area propre aux rectangles
    print("fonction Rectangle.Area() appelée ", self.Area)
    return self.width * self.height
end
function Rectangle:Print()
    print("fonction Rectangle.Print() appelée ", self.Print);
    print("Rectangle :", self:X(), self:Y(), self:Width(), self:Height(), self:Area())
end

return Rectangle