---------------------------
-- PlAtFoRm GaMe v0.01   --
-- NcC1704 *FUN PROJECT* --
---------------------------
display.setStatusBar( display.HiddenStatusBar )
local physics = require "physics"
physics.start()


--achtergrond
local Lucht = display.newRect (0,0,display.contentWidth,display.contentHeight)
	Lucht.anchorX = 0 
	Lucht.anchorY = 0
Lucht:setFillColor (120/255,200/255,255/255) -- ROZE

local Grond1 = display.newImage ("IMG/grond.png")
Grond1.width=display.contentWidth
Grond1.anchorX = 0 
Grond1.anchorY = 0
physics.addBody(Grond1, "static", {density=.1, bounce=0.1, friction=.2 })
Grond1.y = display.contentHeight-82

-- Obstakel
DING = display.newRect (display.contentWidth/2,display.contentHeight/2,100,100)
DING.anchorY = 0
physics.addBody(DING, "dynamic", {density=.1, bounce=0.1, friction=.2 })
DING:setFillColor (255/255,1/255,255/255) -- BLAUW

-- bedieningsknoppen
local ButtonL = display.newCircle (50,display.contentHeight-150,50)
	ButtonL.anchorX = 0 
	ButtonL.anchorY = 0
ButtonL:setFillColor (1/255,1/255,255/255) -- BLAUW
local TekstL = display.newText ("L",100, 30, font, 50)
TekstL.x=ButtonL.x+ButtonL.width/2
TekstL.y=ButtonL.y+ButtonL.height/2
TekstL:setFillColor (255/255,255/255,255/255)

local ButtonR = display.newCircle (display.contentWidth-150,display.contentHeight-150,50)
	ButtonR.anchorX = 0 
	ButtonR.anchorY = 0
ButtonR:setFillColor (255/255,1/255,1/255) -- ROOD
local TekstR = display.newText ("R",100, 30, font, 50)
TekstR.x=ButtonR.x+ButtonR.width/2
TekstR.y=ButtonR.y+ButtonR.height/2
TekstR:setFillColor (255/255,255/255,255/255)

function ButtonR:touch(event)

    if event.phase == "began" then
        -- This happens on finger touching
        if DING.x>0 then
        	DING.x=DING.x+20
        end
        print "RECHTS"
    elseif event.phase == "ended" then
            -- This happens when the finger is lifted
     print "RECHTS UIT"   
    
    end

    -- if you want to prevent the touch event from propagating (aka triggering other images touch event) you must return true
    return true
end

function ButtonL:touch(event)

    if event.phase == "began" then
        -- This happens on finger touching
        if DING.x>50 then
        	DING.x=DING.x-20
        	end
        print "LINKS"
    elseif event.phase == "ended" then
            -- This happens when the finger is lifted
     print "LINKS UIT"   
    
    end

    -- if you want to prevent the touch event from propagating (aka triggering other images touch event) you must return true
    return true
 end




ButtonL:addEventListener( "touch", ButtonL )
ButtonR:addEventListener( "touch", ButtonR )