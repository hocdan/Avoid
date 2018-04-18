
function enemy_load()
	mx = 0
	my = 0
	cx = 60
	cy = 540
	r = 50

	background = love.graphics.newImage( "Imagens/gray.jpeg")
	enemy1 = love.graphics.newImage( "Imagens/blackhole1.5.png")
	enemy2 = love.graphics.newImage( "Imagens/obstac4.png")
	enemy3 = love.graphics.newImage( "Imagens/meteor1.png")
	enemy4 = love.graphics.newImage( "Imagens/Teleporte2.png")
	toque = love.audio.newSource( "Audios/toque.wav", "stream" )
end

function enemy_update(dt)
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

function enemy_draw()
	love.graphics.draw( background )
	love.graphics.rectangle( "line", 120, 20, 600, 420) -- quadro onde serão digitadas as informações
	love.graphics.print( "ENEMIES", 395, 40) -- Titulo do quadro
	love.graphics.print( "THERE ARE SOME OBSTACLES ON YOUR WAY, AVOID THEM TO REACH PORTALS AND \nBE MUCH CLOSER FROM HOME!", 140, 70)
	love.graphics.print( "FOR EXAMPLE, YOU WILL SEE THINGS LIKE THESE:", 260, 120)
	love.graphics.draw( enemy1, 200, 180) love.graphics.draw( enemy2, 380, 205) love.graphics.draw( enemy3, 540, 210)
	love.graphics.print( "DO NOT TOUCH THEM AND YOU WILL BE FINE...AFTER ALL 1 HIT AND DEAD (MUAHAHA)", 140, 300)
	love.graphics.print( "THIS ONE CAN BE FRIENDLY OR NOT...\nIT IS A TELEPORT, SO BE CAREFUL ON THE OTHER SIDE", 300, 360)
	love.graphics.draw( enemy4, 170, 320)


	love.graphics.circle("line", cx, cy, r)
	love.graphics.print( "BACK", cx - 20, cy - 8)


end
