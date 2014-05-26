-- Arrow Entity
-- Variables
local arrow = ...
local arrow.max_dist
local arrow.start{}
-- game must be global
local hero = game:get_hero()
local arrow.angle
local arrow.speed
local arrow.dx
local arrow.dy

-- Functions
-- Not defined: events other than on_update()

-- Initializations
function arrow:on_created()
  arrow.max_dist = 10
  arrow.max_speed = 0.1
  arrow.angle = 0
  arrow.dx = 1
  arrow.dy = 0
  arrow.start.x, arrow.start.y = arrow:get_position()
end

-- Getters and Setters

-- max_dist
function arrow:set_max_dist(dist)
  arrow.max_dist = dist
end

function arrow:get_max_dist()
  return arrow.max_dist
end

-- Angle
function arrow:set_angle(angle)
  arrow.angle = angle
end

function arrow:get_angle()
  return arrow.angle
end

-- speed
function arrow:set_speed(speed)
  arrow.speed = speed
  arrow.dx = arrow.speed * math.cos(arrow.angle)
end

function arrow:get_speed()
  return arrow.speed
end

-- On update
function arrow:on_update()
  local x, y = arrow:get_position()
  local distance = sol.main.get_distance(arrow.start.x, arrow.start.y, x, y)
  if distance < arrow.max_dist then
    arrow:set_position(x + arrow.dx, y + arrow.dy)
  else
    arrow:remove()
  end
end