require "function/checatoque"
require "function/rectangle"

function tutorial_load()
	mx = 0
	my = 0
	cx = 60
	cy = 540
	r = 50

	background = love.graphics.newImage( "Imagens/gray.jpeg")
	back = love.graphics.newImage( "Imagens/back1.png")
	quadro1 = love.graphics.newImage( "Imagens/move1.1.png")
	quadro2 = love.graphics.newImage( "Imagens/target1.png")
	quadro3 = love.graphics.newImage( "Imagens/enemy2.1.png")
	quadro4 = love.graphics.newImage( "Imagens/enemy1.png")
	toque = love.audio.newSource( "Audios/toque.wav", "stream" )
end

function tutorial_update( dt )
	function love.mousepressed( x, y, button )
		if button == 1 then
			mx = x
			my = y
			if checatoque(mx, my, cx, cy, r) then -- Detecção de toque apenas quando ocorrer click do mouse
			menu() --Havendo click na Coordenadas do botão back, volta para o menu
			love.audio.play( toque )
			end
			if toqueretangulo(mx, my, 100, 20, 300, 180) then
				tutorial_moviments()
				love.audio.play( toque )
			end
			if toqueretangulo(mx, my, 420, 20, 300, 180) then
				tutorial_objectives()
				love.audio.play( toque )
			end
			if toqueretangulo(mx, my, 100, 265, 300, 180) then
				tutorial_enemy()
				love.audio.play( toque )
			end
			if toqueretangulo(mx, my, 420, 265, 300, 180) then
				tutorial_survival()
				love.audio.play( toque )
			end
		end
	end
end

function tutorial_draw()

	love.graphics.draw( background )

	love.graphics.draw( quadro1, 180, 40) -- icone do quadro 1
	love.graphics.rectangle( "line", 100, 20, 300, 180) -- quadro 1
	love.graphics.rectangle( "line", 180, 210, 140, 40) -- mini quadro 1
	love.graphics.print( "MOVIMENTS", 215, 225) -- Info do mini quadro 1

	love.graphics.draw( quadro2, 500, 40) -- icone do quadro 2
	love.graphics.rectangle( "line", 420, 20, 300, 180) -- quadro 2
	love.graphics.rectangle( "line", 500, 210, 140, 40) -- mini quadro 2
	love.graphics.print( "OBJECTIVES", 545, 225) -- Info do mini quadro 2

	love.graphics.draw( quadro3, 180, 285) -- icone do quadro 3
	love.graphics.rectangle( "line", 100, 265, 300, 180) -- quadro 3
	love.graphics.rectangle( "line", 180, 455, 140, 40) -- mini quadro 3
	love.graphics.print( "ENEMIES", 225, 470) -- Info do mini quadro 3

	love.graphics.draw( quadro4, 500, 285) -- icone do quadro 4
	love.graphics.rectangle( "line", 420, 265, 300, 180) -- quadro 4
	love.graphics.rectangle( "line", 500, 455, 140, 40) -- mini quadro 4
	love.graphics.print( "SURVIVAL", 545, 470) -- Info do mini quadro 4

	love.graphics.circle("line", cx, cy, r)
	love.graphics.print( "BACK", cx - 20, cy - 8)
	--love.graphics.draw( back, cx - 48, cy - 48)

end


function menu() -- Função para ser empregada a volta para o menu
	gamestate="menu"
	menu_load()
end
function tutorial_moviments()
	gamestate="tutorial_moviments"
	moviments_load()
end
function tutorial_objectives()
	gamestate="tutorial_objectives"
	objectives_load()
end
function tutorial_enemy()
	gamestate="tutorial_enemy"
	enemy_load()
end
function tutorial_survival()
	gamestate="tutorial_survival"
	tsurvival_load()
end
