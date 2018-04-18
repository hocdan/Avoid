
function objectives_load()
	mx = 0
	my = 0
	cx = 60
	cy = 540
	r = 50

	background = love.graphics.newImage( "Imagens/gray.jpeg")
	portal1 = love.graphics.newImage( "Imagens/finish0.3.png")
	portal2 = love.graphics.newImage( "Imagens/finish3.png")
	portal3 = love.graphics.newImage( "Imagens/finish2.2.png")
	portal4 = love.graphics.newImage( "Imagens/finish6.2.png")
	portal5 = love.graphics.newImage( "Imagens/Portal.png")
	toque = love.audio.newSource( "Audios/toque.wav", "stream" )
end

function objectives_update(dt)
	function love.mousepressed( x, y, button )
		if button == 1 then
			mx = x
			my = y
			if checatoque(mx, my, cx, cy, r) then -- Detecção de toque apenas quando ocorrer click do mouse
			tutorial() --Havendo click na Coordenadas do botão back, volta para o menu
			love.audio.play( toque )
			end
		end
	end
end

function objectives_draw()
	love.graphics.draw( background )
	love.graphics.rectangle( "line", 120, 20, 600, 400) -- quadro onde serão digitadas as informações
	love.graphics.print( "OBJECTIVES", 390, 40) -- Titulo do quadro
	love.graphics.print("IN THIS GAME, YOU ARE THE EARTH! AND YOU ARE FAR FAR FAR AWAY FROM HOME...\nNOW, THE ONLY WAY TO GO BACK IS GOING THROUGH PORTALS AROUND THE PHASES!", 160, 70)
	love.graphics.print("LOOK FOR THESE PORTALS ON EACH PHASE:", 290, 110)
	love.graphics.draw( portal1, 140, 170) love.graphics.draw( portal3, 265, 175) love.graphics.draw( portal4, 370, 170) love.graphics.draw( portal2, 450, 160) love.graphics.draw( portal5, 570, 160)
	love.graphics.print("TIP: PATIENCE IS THE KEY 4 WIN...HAHA", 160, 300)


	love.graphics.circle("line", cx, cy, r)
	love.graphics.print( "BACK", cx - 20, cy - 8)


end
