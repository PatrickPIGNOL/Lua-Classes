require("Rectangle")

Square = {}
setmetatable(Square, {__index = Rectangle}) -- le caré est une sorte de rectangle (où chaque coté est égal)
function Square:new(pX, pY, pSide) -- constructeur du caré
    self = Rectangle:new(pX, pY, pSide, pSide) --appelle simplement le constructeur parent en vérouillant les dimensions herite de tous les autres attributs et méthodes
    setmetatable(self, {__index = Square}) -- self est de type Square (qui herite de Rectangle)
    return self --retourne self l'objet créé
end

return Square