function drawworld()--绘制世界
    love.graphics.setColor(255, 255, 255)
    

    for i=1,15 do
       for j=1,15 do
        love.graphics.draw(tiletexture, (i-1)*300-4*dxworld, (j-1)*300-4*dyworld, 0, 1, 1, 5, 5, 0, 0)  --need to rescale in the future to make this part robust
       end
    end 
end

function drawI()   --绘制主人公avatar
    --暂时用个方块代替 :P
    local ww=love.window.getWidth()
    local wh=love.window.getHeight()
    love.graphics.draw(mainchar[maincharfps], ww/2, wh/2, 0, 1, 1, 5, 5, 0, 0)  --need to rescale in the future to make this part robust
end

function drawUI()  --绘制游戏内UI入口
    --绘制内脏状态栏
    love.graphics.setColor(255, 255, 255)
    --绘制左下角数字快捷键栏
    

    
    for i=1,5 do
      love.graphics.draw(abilityUI, (i-1)*60-60, wh-107, 0, 0.5, 0.5, 5, 5, 0, 0)  --need to rescale in the future to make this part robust
    end 


    --绘制左下角主动攻击栏
    love.graphics.draw(abilityUI, -122, wh-270, 0, 1, 1, 5, 5, 0, 0)  --need to rescale in the future to make this part robust

    --绘制右下角UI按钮栏
    --绘制右上角小地图 
    love.graphics.rectangle("fill", ww/3*2+65, 12, 195, 170) --绘制小地图的部分
    love.graphics.draw(minimapUI, ww/3*2-30, -40, 0, 0.5, 0.5, 5, 5, 0, 0)  --need to rescale in the future to make this part robust
    
    
end	

function drawbullet()
    for i=1,bulletnum do
       love.graphics.draw(mainchar[maincharfps], bullet[i][1], bullet[i][2], 0, 0.5, 0.5, 5, 5, 0, 0)
    end
end    

function drawgame()
	drawworld()
	drawUI()
	drawbullet()
    drawI()

end
 

function gamecheck()
    if love.keyboard.isDown('w') then
        dyworld=dyworld-1
        changebullet(-1,0)
    end
    if love.keyboard.isDown('a') then
        dxworld=dxworld-1
        changebullet(0,-1)
    end
    if love.keyboard.isDown('s') then
        dyworld=dyworld+1
        changebullet(1,0)
    end
    if love.keyboard.isDown('d') then
        dxworld=dxworld+1
        changebullet(0,1)
    end
    
    shotup=0
    shotleft=0
    if love.keyboard.isDown('up') then
        shotleft=-1
    end    
    if love.keyboard.isDown('down') then
        shotleft=1
    end  
    if love.keyboard.isDown('left') then
        shotup=-1
    end  
    if love.keyboard.isDown('right') then
        shotup=1
    end

    createbullet(shotup,shotleft)  

    for i=1,bulletnum do
       bullet[i][1]=bullet[i][1]+bullet[i][3]
       bullet[i][2]=bullet[i][2]+bullet[i][4]
       --处理每个子弹逻辑
    end
       

    maincharfps=maincharfps+1
    if maincharfps>24 then 
        maincharfps=1
    end    
end    


function preloadimage(imagefile,imagenumber,temptable)
    for i=1,imagenumber do
        temptable[i] = love.graphics.newImage(imagefile..tostring(i)..".png")
    end    
end    

function createbullet(sx,sy)
  if (not(sx==0)) or (not(sy==0)) then  
    bulletnum=bulletnum+1
    bullet[bulletnum]={}
    bullet[bulletnum][1]=ww/2+10
    bullet[bulletnum][2]=wh/2+10
     fixedbulletspd=bulletspd
    if (sx+sy)==0 or (sx+sy)==-2 or (sx+sy)==2 then
        fixedbulletspd=0.414*bulletspd
    end        
    bullet[bulletnum][3]=sx*fixedbulletspd
    bullet[bulletnum][4]=sy*fixedbulletspd
  end  
end    

function changebullet(xd,yd)
    for i=1,bulletnum do
       bullet[i][1]=bullet[i][1]+xd
       bullet[i][2]=bullet[i][2]+yd
    end   
end    