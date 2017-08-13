-- COPYRIGHT: KISELEV NIKOLAY
-- Licence: MIT
-- Bexolder
-- Version: 0.0.1.0

love.graphics.setBackgroundColor(hc("#000000"))
local elsearch = love.arch()
local slide = "Settings:\nScreen Mode 1 — «3»\nScreen Mode 2 — «4»\nScreen Mode 3 — «5»\nMute Music — «m»\n"
if love.system.getOS() == "Android" or love.system.getOS() == "iOS" then
	slide = "Settings:\nMute Music — «tap here»\n"
end
menc = {{hc("#8c9880")}, {hc("#8c9880")}, {hc("#8c9880")}}
if musicplay then
	love.audio.play(Source)
	message = "music is on"			
else
	love.audio.stop(Source)
	message = "music is off"
end

function love.keypressed(key)
	if key == "3" then
		love.window.setMode(2, 1, {borderless = true, fullscreen = true})
		fit()
	elseif key == "5" then
		love.window.setMode(300, 300, {borderless = false, fullscreen = false})
		fit()
	elseif key == "4" then
		love.window.setMode(600, 300, {borderless = true, fullscreen = false})
		fit()
	elseif key == "m" then
		musicplay = not musicplay
		if musicplay then
			love.audio.play(Source)
			message = "music is on"			
		else
			love.audio.stop(Source)
			message = "music is off"
		end
	end
end

function love.mousepressed(x, y)
	x, y = fixmou(x, y)
	if x > 0.02 and x < 0.34 and y > 0.3 and y < 0.55 then
		love.filesystem.load("j.lua")()
	elseif x > 0.02 and x < 0.15 and y > 0.55 and y < 0.7 then
		--
	elseif x > 0.02 and x < 0.14 and y > 0.8 and y < 0.95 then
		love.arch(elsearch)
	elseif x > 0.5 and x <= 1 then
		musicplay = not musicplay
		if musicplay then
			love.audio.play(Source)
			message = "music is on"			
		else
			love.audio.stop(Source)
			message = "music is off"
		end
	end
end

function love.update(dt)
	x, y = fixmou(love.mouse.getX(), love.mouse.getY())
	if x ~= 2 and y ~= 2 then
		turnin = {(x - 0.5) * 15, (y - 0.5) * 10}
		if x > 0.02 and x < 0.34 and y > 0.3 and y < 0.55 then
			menc[1] = {hc("#d0d4c4")}
		else
			menc[1] = {hc("#8c9880")}
		end
		if x > 0.02 and x < 0.15 and y > 0.55 and y < 0.7 then
			menc[2] = {hc("#d0d4c4")}
		else
			menc[2] = {hc("#8c9880")}
		end
		if x > 0.02 and x < 0.14 and y > 0.8 and y < 0.95 then
			menc[3] = {hc("#d0d4c4")}
		else
			menc[3] = {hc("#8c9880")}
		end
	end
end

function love.draw()
	love.graphics.scale(s, s)
	love.graphics.translate(t[1], t[2])
	love.graphics.setLineStyle("smooth")
	love.graphics.setLineWidth(1)
	love.graphics.setColor(hc("#303030"))
	love.graphics.paradraw(mn, 850, 500, -5)
	love.graphics.paradraw(cl, 1000, 350, -2)
	love.graphics.paradraw(fr, 1000, 525, 4)
	love.graphics.paradraw(hm, 700, 550, 7)
	love.graphics.setFont(aqua[1])
	love.graphics.setColor(hc("#d0d4c4"))
	love.graphics.print("Somethings", 45 + turnin[1], 110 + turnin[2])
	love.graphics.setFont(aqua[2])
	love.graphics.setColor(menc[1])
	love.graphics.print("Journal", 46 + turnin[1], 300 + turnin[2])
	love.graphics.setFont(aqua[3])
	love.graphics.setColor(menc[2])	
	love.graphics.print("Book", 50 + turnin[1], 440 + turnin[2])
	love.graphics.setFont(aqua[4])
	love.graphics.setColor(menc[3])	
	love.graphics.print("Back", 50 + turnin[1], 620 + turnin[2])
	love.graphics.setFont(aqua[5])
	love.graphics.setColor(hc("#ffffff"))
	love.graphics.print(slide.."\n\n"..message, 900 + turnin[1] * 1.3, 300 + turnin[2] * 1.3)
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.draw(mesh, meshp.x1, meshp.y1)
	love.graphics.draw(mesh, meshp.x2, meshp.y2)
end