function drawbody()

	--timer

	bodytimer=bodytimer+bodycount

	if bodytimer>100 then
		bodycount=-10
    end
    if bodytimer<-100 then
    	bodycount=10
    end

	--draw body background
    love.graphics.draw(bodyUI, 0, 0, 0, 1.2, 1.2, 5, 5, 0, 0)
    

    --draw body parts in bag
    
    
    love.graphics.draw(listedbody[1], ww/3, 120+bodytimer/100, 0 , 0.5, 0.5, 250, 100, 0, 0)

    --draw body in ur real body
    
    love.graphics.draw(f_now, ww/3*2, 120+bodytimer/100, 0 , 0.5, 0.5, 250, 100, 0, 0)
    love.graphics.draw(body_now, ww/3*2, 100+bodytimer/100, 0 , 0.5, 0.5, 250, 100, 0, 0)

    love.graphics.draw(lh_now, ww/3*2, 100+bodytimer/100, 0 , 0.5, 0.5, 250, 100, 0, 0)
    love.graphics.draw(rh_now, ww/3*2, 100+bodytimer/100, 0 , 0.5, 0.5, 250, 100, 0, 0)

    love.graphics.draw(head_now, ww/3*2, 100, bodytimer/600 , 0.5, 0.5, 250, 100, 0, 0)



end

function bodycheck()
	if love.keyboard.isDown('escape') then
        curstate="game"
    end

    if love.keyboard.isDown('c') then
        local tempbody=listedbody[1]
        listedbody[1]=rh_now
        rh_now=tempbody
        body[1]=not(body[1])
    end


end