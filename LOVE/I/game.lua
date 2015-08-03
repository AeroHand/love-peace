function drawworld()--绘制世界
    love.graphics.setColor(255, 255, 255)
    local tiletexture=love.graphics.newImage("assets/texture/texture_meat.png")

    for i=1,15 do
       for j=1,15 do
        love.graphics.draw(tiletexture, (i-1)*300-4*dxworld, (j-1)*300-4*dyworld, 0, 1, 1, 5, 5, 0, 0)  --need to rescale in the future to make this part robust
       end
    end 
end

function drawI()   --绘制主人公avatar
    --暂时用个方块代替 :P


end

function drawUI()  --绘制游戏内UI入口
    --绘制内脏状态栏
    love.graphics.setColor(255, 255, 255)
    --绘制左下角数字快捷键栏
    local abilityUI=love.graphics.newImage("assets/UI/skill.png")
    local ww=love.window.getWidth()
    local wh=love.window.getHeight()
    
    for i=1,5 do
      love.graphics.draw(abilityUI, (i-1)*60-60, wh-107, 0, 0.5, 0.5, 5, 5, 0, 0)  --need to rescale in the future to make this part robust
    end 


    --绘制左下角主动攻击栏
    love.graphics.draw(abilityUI, -122, wh-270, 0, 1, 1, 5, 5, 0, 0)  --need to rescale in the future to make this part robust

    --绘制右下角UI按钮栏

    --绘制右上角小地图
    local minimapUI=love.graphics.newImage("assets/UI/minimap.png")
    love.graphics.rectangle("fill", ww/3*2+65, 12, 195, 170) --绘制小地图的部分
    love.graphics.draw(minimapUI, ww/3*2-30, -40, 0, 0.5, 0.5, 5, 5, 0, 0)  --need to rescale in the future to make this part robust
    
end	


function drawgame()
	drawworld()
	drawUI()
	drawI()
end

function animation()
    
end    

function gamecheck()
    if love.keyboard.isDown('w') then
        dyworld=dyworld-1
    end
    if love.keyboard.isDown('a') then
        dxworld=dxworld-1
    end
    if love.keyboard.isDown('s') then
        dyworld=dyworld+1
    end
    if love.keyboard.isDown('d') then
        dxworld=dxworld+1
    end
end    