-- classe mère
Object = {} -- metatable de Shape
setmetatable(Object, {__index = Object}) -- un Object à la metatable d'un Oject
function Shape:new(pX, pY)-- constructeur de shape
    self = {} --self est un nouvel objet de type table ( {} )
    setmetatable(self, {__index = Object}) --self est un Object
    return self --retourne self, le nouvel Object créé
end

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

-----------------------

Rectangle = {} -- metatable de Rectangle
setmetatable(Rectangle, {__index = Shape}) -- un rectangle est une sorte de Shape
function Rectangle:new(pX, pY, pWidth, pHeight) -- constructeur du rectangle
    self = Shape:new(pX, pY) -- appelle le constructeur parent pour hériter de x et de y
    setmetatable(self, {__index = Rectangle}) -- self est un Rectangle (qui hérite de Shape)
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
function Rectangle:Draw()
    print("fonction Rectangle.Draw() appelée ", self.Draw);
    --love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

------------------

Square = {}
setmetatable(Square, {__index = Rectangle}) -- le caré est une sorte de rectangle où chaque coté est égal
function Square:new(pX, pY, pSide) -- constructeur du caré
    self = Rectangle:new(pX, pY, pSide, pSide) --appelle simplement le constructeur parent en vérouillant les dimensions herite de tous les autres champs et méthodes
    setmetatable(self, {__index = Square}) -- self est un Square
    return self --retourne self l'objet créé
end

function Test()
    local vCircle = Circle:new(10, 20, 30)
    local vRectangle = Rectangle:new(40, 50, 60, 70)
    local vSquare = Square:new(80, 90, 100)
    vCircle:Print()
    vRectangle:Print()
    vSquare:Print()
end

Test()


    