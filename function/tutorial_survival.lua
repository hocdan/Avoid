
function tsurvival_load()
	mx = 0
	my = 0
	cx = 60
	cy = 540
	r = 50

	background = love.graphics.newImage( "Imagens/gray.jpeg")
	killer =love.graphics.newImage( "Imagens/supernova1.1.png")
	toque = love.audio.newSource( "Audios/toque.wav", "stream" )
end

function tsurvival_update(dt)
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

function tsurvival_draw()
	love.graphics.draw( background )
	love.graphics.rectangle( "line", 120, 20, 600, 400) -- quadro onde serão digitadas as informações
	love.graphics.print( "SURVIVAL MODE", 360, 40) -- Titulo do quadro
	love.graphics.print( "IN THIS MODE, THE MAIN OBJECTIVE IS SURVIVE AS MUCH AS POSSIBLE WITHOUT \nBE TOUCHED BY THE SHINY BUBBLE", 140, 70)
	love.graphics.draw( killer, 190, 145) love.graphics.print( "<------------       THAT IS THE THING YOU MUST AVOID AT ALL COST!!!", 270, 160)
	love.graphics.print("EVERY 20 SECONDS WILL INCREASE THE CURRENT ROUND AND THIS WILL INCREASE\nTHE CHALLENGE TOO!\nEVERY 5 ENERGY WILL INCREASE YOUR SCORE WITH A GREAT AMOUNT OF POINTS!\nDO YOUR BEST AND MAKE THE HIGHEST HIGHSCORE!!!", 140, 270)


	love.graphics.circle("line", cx, cy, r)
	love.graphics.print( "BACK", cx - 20, cy - 8)


end
