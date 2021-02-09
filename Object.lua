-- classe mère
Object = {} -- metatable de Object
setmetatable(Object, {__index = Object}) -- un Object à la metatable d'un Object
function Object:new(pX, pY)-- constructeur de Object
    self = {} --self est un nouvel objet de type table ( {} )
    setmetatable(self, {__index = Object}) --self est un Object
    return self --retourne self, le nouvel Object créé
end

return Object