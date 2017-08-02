print("! demo is start !")

time = 1
frame = 1

back = love.graphics.newImage("PIXEL/back.bmp")
back = job.paint(back, {rgb(24, 53, 43), rgb(33, 63, 51), rgb(52, 75, 58), rgb(97, 116, 77), rgb(133, 139, 98)})
back:setFilter("nearest")

anim = {}
anim.krorog = {}
for i = 1, 5 do
  anim.krorog[i] = love.graphics.newImage("PIXEL/krorog"..tostring(i)..".bmp")
  anim.krorog[i] = job.paint(anim.krorog[i], {rgb(91, 45, 52), rgb(132, 58, 66), rgb(182, 80, 80), rgb(221, 109, 97), rgb(232, 139, 123)})
  anim.krorog[i]:setFilter("nearest")
end

deco = {}
deco.tis = {}
for i = 1, 5 do
  deco.tis[i] = love.graphics.newImage("PIXEL/tis"..tostring(i)..".bmp")
  deco.tis[i] = job.paint(deco.tis[i], {rgb(24, 53, 43), rgb(33, 63, 51), rgb(52, 75, 58), rgb(97, 116, 77), rgb(133, 139, 98)})
  deco.tis[i]:setFilter("nearest")
end

function love.update(dt)
	time = time + dt * 7
	if time <= 5 then
		frame = math.floor(time)
	else
		frame = math.floor(time)
		time = 1
	end		
end

function love.keypressed(key, scancode, isrepeat)
	--
end

function love.mousepressed(x, y, button, isTouch)
	--
end

function love.draw()
	love.graphics.fit()
	love.graphics.setColor(100, 100, 100)
	love.graphics.draw(back)
	love.graphics.setColor(255, 255, 255)
	love.graphics.drawf(anim.krorog[frame], 0, 0, 0, 0.3)
  love.graphics.drawf(deco.tis[1], 1, 1, 0, 1)
end