local Grid = {height=GRID_HEIGHT, width=GRID_WIDTH}
local Set = require('set')
local Pt = require('pt')

function Grid:new (w, h)
   o = {   height = h,
	   width = w,
	   tile_cnt=0
   }   
   setmetatable(o, self)
   self.__index = self
   
   for y=1, h do
      o[y] = {}
      for x=1, w do
	 o[y][x] = 0
      end
   end
  
   return o
end

function Grid:init(tile_cnt)
   self.tile_cnt = tile_cnt
   for y=1, self.height do
      for x=1, self.width do
	 local r =  math.random(1, tile_cnt) -- Six types of tiles
	 --       trace("new tile: " .. r .. " " .. x .. " " .. y)
	 self[y][x] = r
      end
   end
end


function Grid:test()
   for y=1, self.height do
      for x=1, self.width do
	 local r = self[y][x] 
	 --     trace("test tile: " .. r .. " " .. x .. " " .. y)
	 assert (r ~= 0)
	 
      end
   end
end

function Grid:find_matches()
  local matches = {}
  for y=1, self.height do
    for x=1, self.width do
      local tile = self[y][x]
      if x <= self.width - 2 and self[y][x+1] == tile and self[y][x+2] == tile then
        table.insert(matches, Pt:new(x,y))
	table.insert(matches, Pt:new{x=x+1, y=y})
	table.insert(matches, Pt:new{x=x+2, y=y})
      end
      if y <= self.height - 2 and self[y+1][x] == tile and self[y+2][x] == tile then
	 table.insert(matches, Pt:new{x=x, y=y})
	 table.insert(matches, Pt:new{x=x, y=y+1})
	 table.insert(matches, Pt:new{x=x, y=y+2})
      end
    end
  end
  
  match_set = Set:new(matches)
  return match_set:to_list()
end

function Grid:remove_cell(p)
   for y=p.y, 2, -1 do
--      trace('rc: ' .. p.x .. " " .. y)
      self[y][p.x] = self[y-1][p.x]
   end
   local r = math.random(1, self.tile_cnt)
--   trace('nc: ' .. p.x .. " " .. 1 .. " " .. r)   
   self[1][p.x] = r
end

-- Remove matches and fill the grid
function Grid:remove_matches(matches)
 for _, match in ipairs(matches) do
    self:remove_cell(match)
 end
end

function Grid:get(p)
   return self[p.y][p.x]
end

function Grid:set(p, v)
   self[p.y][p.x] = v
end

function Grid:allow_swap(a, b)
   if not self:are_adjacent(a, b) then
      return {false, {}}
   end
   self:swap(a, b)
   local matches = self:find_matches()
   print("Gas m: " .. #matches)
   self:swap(a, b)
   if #matches > 0 then
      return {true, matches}
   end
   return {false, {}}
end

-- Swap tiles
function Grid:swap(a, b)
   local temp = self:get(a)
   self[a.y][a.x] = self:get(b)
   self[b.y][b.x] = temp
end

-- Check if two tiles are adjacent
function Grid:are_adjacent(a, b)
 return math.abs(a.x - b.x) + math.abs(a.y - b.y) == 1
end

return Grid
