function draworgan()
	--draw body background
    love.graphics.draw(bodyUI, 0, 0, 0, 1, 1, 5, 5, 0, 0)
    
   



end

function organcheck()
	
	if love.keyboard.isDown('escape') then
        curstate="game"
    end
end
