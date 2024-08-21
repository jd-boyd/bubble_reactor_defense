-- Tile Reactor Defense for TIC-80

Events = require("events")
MC_Game = require("mc_lib")
M3_Game = require("m3_lib")
mc = {}
m3 = {}
events = Events:new()

function TIC()
    -- if btnp(4) then -- 'Z' key to shoot
    --     MC_Game:add_bullet(SCREEN_WIDTH // 2, SCREEN_HEIGHT - 10)
    -- end
    handle_input()

    mc:update()

    cls(0)
    mc:draw()    
    m3:draw()
end

function BOOT()
   mc = MC_Game:new()
   m3 = M3_Game:new()
   mc:init(events)
   m3:init(events)   
end

-- Handle input
function handle_input()
 if btnp(0) then -- Up
    m3:move_up()
 elseif btnp(1) then -- Down
    m3:move_down()
 elseif btnp(2) then -- Left
    m3:move_left()
 elseif btnp(3) then -- Right
    m3:move_right()    
 elseif btnp(4) then -- Select -- d
    if m3.input_mode == InputModes.Select then
       m3.input_mode = InputModes.Swap
    else
       m3.input_mode = InputModes.Select
    end
 end
end


-- <TILES>
-- 000:4444444433344433333434424234334444433044343332423242332432443444
-- 002:bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
-- 003:0000000000000000000000003340433003444300034443000344430000444000
-- 016:bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbeebebbbbedeeeebbedededeeeeeeeee
-- 017:bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbebeebbeededeebdedededeeeeeeeee
-- 018:bbbbbbbbbbbbbbbbbbbbbbbbbbb6bbbbb6b6b6bbbb6666bbbbb6bbbbbbb6bbbb
-- 019:e0ccc0e00eeeee0000e4e00000e4e00000e4e00000e4e00000eee000000e0000
-- 160:0000000001111111010000010111101101101110011011100110111001100000
-- 161:0000000011111100011101101101101010011010100100101110001011111110
-- 162:000000000fffffff0ff0000f0f00f00f0ff0ffff0ff00f000ff00ff00ff00ff0
-- 163:00000000fffffff0000000f0000ff0f000f0fff00ff0fff00ffff0f0000ffff0
-- 176:0111111101111111011111110111111101111111111111110111111100000000
-- 177:1110011011111010100000101000001010000010100000101111111000000000
-- 178:0fffffff0fffffff0fffffff0fffffff0fffffff0fffffff0fffffff00000000
-- 179:000000f000fff0f00ff0f0f00ff0f0f0ffff00f0fffff0f0ff00fff000000000
-- 192:0000000002222222022222220222222202222222022222220222222202222222
-- 193:0000000022222220222222202222222022222220222222202222222022222220
-- 194:0000000006666666066666660666666606666666066666660666666606666666
-- 195:0000000066666660666666606666666066666660666666606666666066666660
-- 208:2222222222222222222222222222222222222222222222222222222222222222
-- 209:2222222022222220222222202222222022222220222222202222222000000000
-- 210:6666666666666666666666666666666666666666666666666666666666666666
-- 211:6666666066666660666666606666666066666660666666606666666000000000
-- 213:ccccccccc0000000c0000000c0000000c0000000c0000000c0000000c0000000
-- 214:cccccccc00000000000000000000000000000000000000000000000000000000
-- 215:cccccccc0000000c0000000c0000000c0000000c0000000c0000000c0000000c
-- 224:000000000aaaaaaa0aaaaaaa0aaaaaaa0aaaaaaa0aaaaaaa0aaaaaaa0aaaaaaa
-- 225:00000000aaaaaaa0aaaaaaa0aaaaaaa0aaaaaaa0aaaaaaa0aaaaaaa0aaaaaaa0
-- 226:0000000003333333033333330333333303333333033333330333333303333333
-- 227:0000000033333330333333303333333033333330333333303333333033333330
-- 229:c0000000c0000000c0000000c0000000c0000000c0000000c0000000c0000000
-- 231:0000000c0000000c0000000c0000000c0000000c0000000c0000000c0000000c
-- 240:aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
-- 241:aaaaaaa0aaaaaaa0aaaaaaa0aaaaaaa0aaaaaaa0aaaaaaa0a000aaa000000000
-- 242:3333333333333333333333333333333333333333333333333333333333333333
-- 243:3333333033333330333333303333333033333330333333303333333000000000
-- 245:c0000000c0000000c0000000c0000000c0000000c0000000c0000000cccccccc
-- 246:00000000000000000000000000000000000000000000000000000000cccccccc
-- 247:0000000c0000000c0000000c0000000c0000000c0000000c0000000ccccccccc
-- </TILES>

-- <MAP>
-- 000:202020202020202020202020202020101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 001:202020202020202020202020202020101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 002:202020202020202020202020202020101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 003:202020202020202020202020202020101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 004:202020202020202020202020202020101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 005:202020202020202020202020202020101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 006:202020202020202020202020202020101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 007:202020202020202020202020202020101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 008:202020202020202020202020202020101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 009:202020202020202020202020202020101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 010:202020202020202020202020202020101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 011:202020202020202020202020202020101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 012:202020202020202020202020202020101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 013:202020202020202020202020202020101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 014:202020202020202020202020202020101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 015:200111202021110120202120111120101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 016:000000000000000000000000000000101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- </MAP>

-- <WAVES>
-- 000:00000000ffffffff00000000ffffffff
-- 001:0123456789abcdeffedcba9876543210
-- 002:0123456789abcdef0123456789abcdef
-- </WAVES>

-- <SFX>
-- 000:000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000304000000000
-- </SFX>

-- <TRACKS>
-- 000:100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- </TRACKS>

-- <PALETTE>
-- 000:1a1c2c5d275db13e53ef7d57ffcd75a7f07038b76425717929366f3b5dc941a6f673eff7f4f4f494b0c2566c86333c57
-- </PALETTE>

