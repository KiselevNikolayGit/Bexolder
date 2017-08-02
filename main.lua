size = 50
love.window.setMode(size, size, {fullscreen = true})
w, h = love.window.getMode()
scale = h / size
trans = (w - (size * scale)) / 2

function love.graphics.fit()
  love.graphics.translate(trans, 0)
  love.graphics.scale(scale, scale)
end

function love.graphics.drawf(im, x, y, r, s)
  love.graphics.draw(im, size * x, size * y, r, s, s, im:getWidth() / 2, im:getHeight() / 2)
end

function rgb(...)
  local rngnb = {...}
  return rngnb
end

job = {}

function job.prepaint(x, y, r, g, b, a)
  brush = {r, g, b}
  if a > 0 then
    paper = (r + g + b) / 3
    how = (paper / 255) + 0.5
    what = how * 4.5
    what = math.floor(what) - 1
    brush = job.c[what]
  end
  return brush[1], brush[2], brush[3], a
end

function job.paint(im, colors)
  imd = im:getData()
  job.c = colors
  imd:mapPixel(job.prepaint)
  im = love.graphics.newImage(imd)
  return im
end

function love.load()
  print("! started main.lua !")
  -- love.filesystem.load("animate.lua")()
  love.filesystem.load("demo.lua")()
end

function love.wheelmoved()
  love.event.quit()
end
