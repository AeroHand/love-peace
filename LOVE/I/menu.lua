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

    if draw_textinput_in_new==1 then
       love.graphics.rectangle("fill", 50, 200, 300, 100)
       love.graphics.setColor(123, 244, 223) 
       love.graphics.print(text,100,240)
    end    

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
                alreadyentername=0
                curstate="game_new"
            end
            if menupointer==2 then
                curstate="game_load"
            end
            if menupointer==3 then
                curstate="setting"
            end
            if menupointer==4 then
                love.quit()
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
                if menunewpointer==1 and alreadyentername==0 then
                    draw_textinput_in_new=1
                    
                    text="Enter your name:"
                    love.keyboard.setKeyRepeat(true)

                end
                if menunewpointer==1 and alreadyentername==1 then
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

function love.keypressed(key)
    if key == "backspace" then
        -- get the byte offset to the last UTF-8 character in the string.
        local byteoffset = utf8.offset(text, -1)
 
        if byteoffset then
            -- remove the last UTF-8 character.
            -- string.sub operates on bytes rather than UTF-8 characters, so we couldn't do string.sub(text, 1, -2).
            text = string.sub(text, 1, byteoffset - 1)
        end
    else
        if not(key=="return" or key ==" ")   then 
            alreadyentername=1
        end    
    end
end

function love.textinput(t)
    text = text .. t
    alreadyentername=1
end