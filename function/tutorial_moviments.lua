
function moviments_load()
	mx = 0
	my = 0
	cx = 60
	cy = 540
	r = 50

	background = love.graphics.newImage( "Imagens/gray.jpeg")
	control1 = love.graphics.newImage( "Imagens/wasd.png")
	control2 = love.graphics.newImage( "Imagens/arrow.png")
	toque = love.audio.newSource( "Audios/toque.wav", "stream" )
end

function moviments_update(dt)
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

function moviments_draw()
	love.graphics.draw( background )
	love.graphics.rectangle( "line", 120, 50, 600, 400) -- quadro onde serão digitadas as informações
	love.graphics.print( "MOVIMENTS", 390, 70) -- Titulo do quadro
	love.graphics.print( "YOU CAN MOVE YOUR PLAYER BY USING ONE( OR BOTH) OF THESE CONTROLS:", 180, 90) -- Primeira linha
	love.graphics.draw(control1, 220, 170) love.graphics.draw(control2, 480, 183) -- desenhos dos controles disponiveis
	love.graphics.print( "PAY ATTENTION TO THE LEFT OF YOUR SCREEN, THERE IS 1 LIFE AND A TIME FOR EVERY PHASE", 130, 310)
	love.graphics.print("TIP: MOVE IN THE DIAGONAL IS FASTER THAN OTHERS DIRECTIONS...", 130, 340)
	love.graphics.print( 'PRESS BUTTON "E" TO PAUSE THE GAME OR "C" TO KEEP PLAYING!', 130, 365)

	love.graphics.circle("line", cx, cy, r)
	love.graphics.print( "BACK", cx - 20, cy - 8)

end
