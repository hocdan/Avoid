

require "function/rectangle"
require "function/circle"
require "function/checatoque"


function win5_load()
	--pre carregando as coordenada do mouse
	mx = 0
	my = 0
	--Coordenadas dos botõe de voltar e proximo nivel
	cx1 = 40
	cy1 = 550
	cx2 = 760
	cy2 = 550
	raio = 30
	--Coordenadas e dimensões da caixa de texto
	rx1 = 150
	ry1 = 200
	rw = 500
	rh = 60

	background = love.graphics.newImage( "Imagens/universo7.jpg")
	toque = love.audio.newSource( "Audios/toque.wav", "stream" )


end


function win5_update(dt)
	--checando se o mouse apertou em determinado botão do menu
	function love.mousepressed(x, y, button)
		if button ==1 then --se o botao esquerdo do mouse foi pressionado entao...
			mx = x
			my = y
			if checatoque( mx, my, cx1, cy1, raio) then
				menu()
				love.audio.play( toque )
			end
			if checatoque( mx, my, cx2, cy2, raio) then
				fase1()
				love.audio.play( toque )
			end
		end
	end
end

function win5_draw()

	love.graphics.draw( background )
	love.graphics.setColor( 255, 255, 255)
	love.graphics.rectangle("line", rx1, ry1, rw, rh)
	love.graphics.print( "YOU ARE IN HOME NOW! WHAT DO YOU WANT TO DO?", rx1 + 80, ry1 + 15)
	love.graphics.circle("line", cx1, cy1, raio)
	love.graphics.print( "BACK", cx1 - 15, cy1 - 8)
	love.graphics.circle("line", cx2, cy2, raio)
	love.graphics.print( "AGAIN!", cx2 - 17, cy2 - 7)

end


function menu() -- Função para ser empregada a volta para o menu
	gamestate="menu"
	menu_load()
end

function fase1() -- Função para ser empregada a fase 1
	gamestate="fase1"
	fase1_load()
end
