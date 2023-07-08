-- defining a simple game object
GameObject = {
    name = "Object",
    health = 100,
    isDead = false
}

-- function to create a new game object
function GameObject:new(o, name, health)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.name = name or "Object"
    self.health = health or 100
    self.isDead = false
    return o
end

-- function to take damage
function GameObject:takeDamage(damage)
    self.health = self.health - damage

    -- Check if the object has died
    if self.health <= 0 then
        self:die()
    end
end

-- function for object death
function GameObject:die()
    self.isDead = true
    print(self.name .. " has died.")
end

-- usage
player1 = GameObject:new(nil, "Player1", 120)
player1:takeDamage(130) -- this will trigger the death of the player
