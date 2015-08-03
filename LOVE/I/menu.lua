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
    for i=1,4 do
      for j=0,1 do
        local countfile=j*4+i  
        if countfile==menuloadpointer then
            love.graphics.setColor(123, 244, 223)
        else
            love.graphics.setColor(230, 44, 123)
        end
        
        love.graphics.rectangle("line", i*200-150, j*250+100, 100, 200)
        love.graphics.print("save "..tonumber(countfile),i*200-150,j*250+100)
        if filetoload[countfile][1] then
          love.graphics.print(filetoload[countfile][1],i*200-150,j*250+120)
          love.graphics.print(filetoload[countfile][2],i*200-150,j*250+140)
        end  
      end
    end                                                                                           
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
                menunewpointer=1
                curstate="game_new"
            end
            if menupointer==2 then
                menuloadpointer=1
                preloadfile()
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
                    newfile()
                    love.keyboard.setKeyRepeat(true)
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
        else
            if  curstate=="game_load" then
                if key=="left" then
                    menuloadpointer=menuloadpointer-1

                     if menuloadpointer==0 then
                        menuloadpointer=4
                     end

                     if menuloadpointer==4 then
                        menuloadpointer=8
                     end

                end
                if key=="right" then
                    menuloadpointer=menuloadpointer+1
                     if menuloadpointer==5 then
                        menuloadpointer=1
                     end

                     if menuloadpointer==9 then
                        menuloadpointer=5
                     end
                end

               
                
                if key=="up" then
                    menuloadpointer=menuloadpointer-4
                end
                if key=="down" then
                    menuloadpointer=menuloadpointer+4
                end

                if menuloadpointer<1 then
                    menuloadpointer=menuloadpointer+8
                end
                
                if menuloadpointer>8 then
                    menuloadpointer=menuloadpointer-8
                end        
            end    
        end
    end        
end	

function love.keypressed(key)   --谜之失效了
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

function newfile()

      local file = assert(io.open("sav\\gameinfo.txt","r"))
      local data = file:read("*a"); -- 读取所有内容
      data=tonumber(data)+1
      file:close()
      
      if data>8 then
         --存档过多！
         
      else
        local file = assert(io.open("sav\\gameinfo.txt","w+"))
        file:write(data)
        --file:write("successfully load")
        file:close()
        
        local file = assert(io.open("sav\\save"..tostring(data)..".txt","w"))
        --新建一个存档
        file:write("Toad\n")
        file:write(text)
        file:close()
      end
end

function preloadfile()
    local file = assert(io.open("sav\\gameinfo.txt","r"))
    local data = file:read("*a"); -- 读取所有内容
    savenum=tonumber(data)
    file:close()

    
    for i=1,savenum,1 do
       local file = assert(io.open("sav\\save"..tostring(i)..".txt","r"))
       filetoload[i]={}
       local data = file:read("*line"); 
       filetoload[i][1]=line  --character name
       local data = file:read("*line"); 
       filetoload[i][2]=line  --custom name
    end   

    for i=savenum+1,8,1 do
       filetoload[i]={}
       filetoload[i][1]="No Save Found"  --character name
       filetoload[i][2]="" 
    end   

end

function readfile()

end    