display.setStatusBar(display.HiddenStatusBar)

local physics = require "physics"

physics.start()
physics.setGravity(0,0)

--system.setAccelerometerInterval(100)

-- menu screen objects
local menuScreenGroup -- display.newGroup()
local mmScreen
local playBtn

-- in-game screen objects
local background
local paddle
local brick
local ball

-- HUD elements for the score and level
local scoreText
local scoreNum
local levelText
local levelNum

-- alert display group for the win/lose conditions
local alertDisplayGroup -- display.newGroup()
local alertBox
local conditionDisplay
local messageText

--the following variables hold the values for the bricks display group,score,ball velocirti, and in game eventes
local _W = display.contentWidth / 2
local _H = display.contentHeight /2
local bricks = display.newGroup()
local brickWidth = 35
local brickHeight = 15
local row
local column
local score = 0
local scoreIncrease = 100
local currentLevel
local vx =3
local vy = -3
local gameEvent = ""

-- return info about the system on which the app is running
local isSimulator = "simulator" == system.getInfo("environment")

function main()
	mainMenu()

end

--[[
This empty space will hold other functions and methods to run the
application

]]


--------------------------------------------------------
function mainMenu()
menuScreenGroup = display.newGroup()

mmScreen = display.newImage("mmScreen.png")

mmScreen.x = _W
mmScreen.y = _H

playBtn = display.newImage("playbtn.png")
playBtn:setReferencePoint(display.CenterReferencePoint)
playBtn.x = _W; playBtn.y = _H + 50
playBtn.name = "playbutton"

menuScreenGroup:insert(mmScreen)
menuScreenGroup:insert(playBtn)

playBtn:addEventListener("tap", loadGame)

end -- mainMenu

----------------------------------------------------
function loadGame(event)
	if event.target.name == "playbutton" then

		transition.to(menuScreenGroup, {time = 0, alpha=0, onComplete = addGameScreen})

		playBtn:removeEventListener("tap", loadGame)
	end
	
end -- loadGame
--------------------------------------------------------------
function addGameScreen( ... )
	background = display.newImage("images/bg.png",0,0,true)
	background.x = _W
	background.y = _H

	paddle = display.newImage("images/paddle.png")
	paddle.x = 240; paddle.y = 300
	paddle.name = "paddle"

	ball = display.newImage("images/ball.png")
	ball.x = 240; ball.y = 290
	ball.name = "ball"

	scoreText = display.newText("score:",5,2,  "Arial", 14)
	scoreText:setTextColor(255, 255, 255, 255)
	scoreNum = display.newText("0",54,2,"Arial",14)
	scoreNum:setTextColor(255, 255, 255, 255)

	levelText = display.newText("Level:",420,2,"Arial",14)
	levelText:setTextColor(255, 255, 255, 255)

	levelNum = display.newText("1",460,2,"Arial",14)
	levelNum:setTextColor(255, 255, 255, 255)

	gameLevel1()
end-- addGameScreen
----------------------------------------------------------------


function gameLevel1()
	
	currentLevel = 1

	bricks:toFront()

	local numOfRows = 4
	local numOfColumns = 4
	local brickPlacement = {x = (_W) - (brickWidth * numOfColumns) / 2 + 20, y=50}

	for row = 0, numOfRows - 1 do
		for column = 0, numOfColumns - 1 do
			local brick = display.newImage("images/brick.png")
			brick.name = "brick"
			brick.x = brickPlacement.x + (column * brickWidth)
			brick.y = brickPlacement.y + (row * brickHeight)
			physics.addBody(brick, "static", {density = 1, friction = 0, bounce = 0})
			bricks.insert(bricks,brick)
		end
	end
end-- gameLevel1
-------------------------------------------------------------
function gameLevel2()
	
	currentLevel = 2

	bricks:toFront()

	local numOfRows = 5
	local numOfColumns = 8
	local brickPlacement = {x = (_W) - (brickWidth * numOfColumns) / 2 + 20, y=50}

	for row = 0, numOfRows - 1 do
		for column = 0, numOfColumns - 1 do
			local brick = display.newImage("images/brick.png")
			brick.name = "brick"
			brick.x = brickPlacement.x + (column * brickWidth)
			brick.y = brickPlacement.y + (row * brickHeight)
			physics.addBody(brick, "static", {density = 1, friction = 0, bounce = 0})
			bricks.insert(bricks,brick)
		end
	end
end-- gameLevel2
----------------------------------------------------------------
-- Callin main
main()


