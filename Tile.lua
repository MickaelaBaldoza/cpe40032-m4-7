--[[
   CMPE40032
    Candy Crush Clone (Match 3 Game)

    -- Tile Class --



    The individual tiles that make up our game board. Each Tile can have a
    color and a variety, with the varietes adding extra points to the matches.
]]

Tile = Class{}

function Tile:init(x, y, color, variety)
    -- board positions
    self.gridX = x
    self.gridY = y

    -- coordinate positions
    self.x = (self.gridX - 1) * 32
    self.y = (self.gridY - 1) * 32

    -- tile appearance/points
    self.color = color
    self.variety = variety

    --initialize shiny tile w/ 10% chance
    self.shiny = math.random(1, 10) == 5
end

function Tile:update(dt)

end

--[[
    Function to swap this tile with another tile, tweening the two's positions.
]]
function Tile:swap(tile)

end

function Tile:render(x, y)
    -- draw shadow
    love.graphics.setColor(34, 32, 52, 255)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
    self.x + x + 2, self.y + y + 2)

    --if it is shiny, draw a yellowish shadow instead of dark 
    if self.shiny then 
        love.graphics.setBlendMode('add') 
        love.graphics.setColor(252, 194, 1, 200)
        love.graphics.rectangle('line', (self.gridX - 1 )* 32 + (VIRTUAL_WIDTH - 272), (self.gridY - 1)* 32 +16, 32, 32, 4)
        love.graphics.setBlendMode('alpha')
    end 
    -- draw tile itself
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x, self.y + y)
end