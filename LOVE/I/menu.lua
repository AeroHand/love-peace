function drawmenu()

    if menupointer==1 then
      love.graphics.setColor(123, 244, 223)
    else
      love.graphics.setColor(230, 44, 123)   
    end
      
    love.graphics.rectangle("line", 300, 170, 200, 60)
    love.graphics.print("start new game",340,200)

    if menupointer==2 then
      love.graphics.setColor(123, 244, 223)
    else
      love.graphics.setColor(230, 44, 123)  
    end

    love.graphics.rectangle("line", 300, 270, 200, 60)
    love.graphics.print("load old game",340,300)
    
    if menupointer==3 then
      love.graphics.setColor(123, 244, 223)
    else
      love.graphics.setColor(230, 44, 123)  
    end

    love.graphics.rectangle("line", 300, 370, 200, 60)
    love.graphics.print("settings",380,400)
    
    if menupointer==4 then
      love.graphics.setColor(123, 244, 223)
    else
      love.graphics.setColor(230, 44, 123)  
    end

    love.graphics.rectangle("line", 300, 470, 200, 60)
    love.graphics.print("exit",400,490)

end

function drawgamenew()
    
    if menunewpointer==1 then
      love.graphics.setColor(123, 244, 223)
    else
      love.graphics.setColor(230, 44, 123)  
    end

    love.graphics.rectangle("line", 100, 100, 200, 460)
    love.graphics.print("Choose Taod",160,150)

    if menunewpointer==2 then
      love.graphics.setColor(123, 244, 223)
    else
      love.graphics.setColor(230, 44, 123)  
    end

    love.graphics.rectangle("line", 500, 100, 200, 460)
    love.graphics.print("Under Construction",520,140)

end

function drawgameload()
                                                                                               
end    

function menucheck(key)
    if curstate=="menu" then
 		if key=="up" then
            menupointer=menupointer-1
        end
        if key=="down" then
            menupointer=menupointer+1
        end
        
        if key=="return" or key==" " then
            if menupointer==1 then
                curstate="game_new"
            end
            if menupointer==2 then
                curstate="game_load"
            end
            if menupointer==3 then
                curstate="setting"
            end
            if menupointer==4 then
                return 0
            end    
        end
        if menupointer<1 then
            menupointer=4
        end
        if menupointer>4 then
            menupointer=1
        end
    else
        if curstate=="game_new" then
            if key=="left" then
                menunewpointer=menunewpointer-1
            end
            if key=="right" then
                menunewpointer=menunewpointer+1
            end

            if key=="return" or key==" " then
                if menunewpointer==1 then
                    curstate="game"
                end
                if menunewpointer==2 then
                    --under construction
                end  
             end

             if menunewpointer<1 then
                menunewpointer=2
             end
             if menunewpointer>2 then
                menunewpointer=1
             end
        end
    end        
end	