function draw_ship(x,y)
   love.graphics.draw(ship, x, y)
end


-- datos a guardar por objeto: tipo, hit-box, canvas, x, y, accel, velocidad





function love.draw()
   draw_ship(xpos,ypos)
   
   -- check boundaries
   w = love.graphics.getWidth()
   h = love.graphics.getHeight()

   if (xpos > 0) then
      x_a = w-xpos
      x_b = ship:getImageData():getWidth()-x_a
      if x_b > 0  then
	 draw_ship(-x_a,ypos)
      end
   else
      x_a = -xpos
      x_b = ship:getImageData():getWidth() - x_a
      if x_a > 0 then
	 draw_ship(w-x_a,ypos)
      end
   end

   if (ypos > 0) then
      y_a = h-ypos
      y_b= ship:getImageData():getHeight() - y_a
      if y_b > 0 then
	 draw_ship(xpos,-y_a)
      end
   else
      y_a = -ypos
      y_b= ship:getImageData():getHeight() - y_a
      if y_a > 0 then
	 draw_ship(xpos,h-y_a)
      end
   end
   
   -- take care of corners case
   if ypos > h then
      ypos = 0
   elseif xpos > w then
      xpos = 0
   elseif (-ypos) > ship:getImageData():getHeight() then
      ypos = h-y_a
   elseif (-xpos) > ship:getImageData():getWidth() then
      xpos = w-x_a
   end

   love.graphics.print("x_a="..tostring(x_a), w-400,30)

end

function love.update(dt)

   if love.keyboard.isDown("up") then
      val = val + dt   -- we will increase the variable by 1 for every second the key is held down
   elseif  love.keyboard.isDown("down") then
      val = val - dt
   end 

   if love.keyboard.isDown("left") then
      val2 = val2 - dt   -- we will increase the variable by 1 for every second the key is held down
   elseif  love.keyboard.isDown("right") then
      val2 = val2 + dt
   end 


   xpos = xpos + val2
   ypos = ypos + val

end

function love.load()
   ship = love.graphics.newCanvas(40,30)
   love.graphics.setCanvas(ship)
   love.graphics.setColor(255,255,255)
   love.graphics.setLineWidth(3)
   love.graphics.polygon('line', 
			 0, 0, 
			 15, 30, 
			 30, 0,
			 15,10)

   love.graphics.setCanvas()
   love.graphics.setColor(255,255,255)




   val = 0
   val2 = 0
   xpos=0
   ypos=0
end

