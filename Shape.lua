require("Object")

Shape = {} -- metatable de Shape
setmetatable(Shape, {__index = Object}) -- une shape à la metatable d'un Object
function Shape:new(pX, pY)-- constructeur de shape
    self = {} --self est un nouvel objet de type table ( {} )
    setmetatable(self, {__index = Shape}) --self est une Shape
    self.x = pX or 0 --initialisation de x
    self.y = pY or 0 --initialisation de y
    return self --retourne self, l'objet créé
end
function Shape:X()
    print("fonction Shape.X() appelée ", self.X)
    return self.x
end
function Shape:Y()
    print("fonction Shape.Y() appelée ", self.Y)
    return self.y
end

return Shape