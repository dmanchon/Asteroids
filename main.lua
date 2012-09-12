function draw_ship(x,y)
   love.graphics.draw(ship, x, y)
end


function love.draw()
   draw_ship(xpos,ypos)
   love.graphics.print("Asteroids test..",400,300)
 
   xmax = xpos + ship:getImageData():getWidth()
   ymax = ypos + ship:getImageData():getHeight()
   -- check boundaries
   w = love.graphics.getWidth()
   h = love.graphics.getHeight()

   if xmax > w  then
      draw_ship(xmax-w,ypos)
      love.graphics.print("OK1",100,100)
   elseif ymax > h then
      draw_ship(xpos,ymax-h)
      love.graphics.print("OK2",200,100)
   end
   
   if ypos > (ship:getImageData():getHeight()+h) then
      ypos = ymax-h
   elseif xpos > (ship:getImageData():getWidth()+w) then
      xpos = xmax-w
   end

end

function love.update(dt)
   xpos = xpos + dt*50
   ypos = ypos + dt*50
   
   

 


end

function love.load()
   --love.graphics.setScissor( 0, 0, 640, 480 )



   ship = love.graphics.newCanvas(40,30)
   love.graphics.setCanvas(ship)
   love.graphics.setColor(255,255,255)
   love.graphics.polygon('line', 
			 0, 0, 
			 20, 30, 
			 40, 0,
			 20,10)
   love.graphics.setCanvas()
   love.graphics.setColor(255,255,255)




   xpos=0
   ypos=0
end

