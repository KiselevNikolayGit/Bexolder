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
  print("started love.load of main.lua")
  love.filesystem.load("animate.lua")()
end
