require('menu')      --游戏初始菜单入口
require('game')      --游戏主逻辑入口
require('init')      --游戏信息初始化入口
require('body')      --游戏身体入口
require('organ')     --游戏器官入口


function love.load()--载入信息
    initeverything()
end

function love.draw()--逐帧绘制
    if curstate=="menu" then
      drawmenu()   
    else
      if curstate=="game_new" then
        drawgamenew()
      else
        if curstate=="game_load" then
          drawgameload()
        else
          if curstate=="game" then
            drawgame()
          else
            if curstate=="bodymanu" then
              drawbody()
            else
              if curstate=="organmanu" then
                draworgan()
              else
                --todo
              end
            end  
          end  
        end    
      end 
    end  
end

function love.update(dt)--游戏主逻辑
    if curstate=="game" then
       gamecheck()
    end   

    if curstate=="bodymanu" then
       bodycheck()
    end 

    if curstate=="organmanu" then
       organcheck()
    end 

end

function love.keypressed(key)--按键响应
    menucheck(key)
    
end