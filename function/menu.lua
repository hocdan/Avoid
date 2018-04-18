
require "function/rectangle"
require "function/circle"
require "function/checatoque"


function menu_load()
	--pre carregando as coordenadas do mouse
	mx = 0
	my = 0

	background = love.graphics.newImage( "Imagens/universo6.jpg")
	audio5 = love.audio.newSource( "Audios/sunrise.mp3", "stream")
	toque = love.audio.newSource( "Audios/toque.wav", "stream" )
	love.audio.setVolume( 0.5 )
	love.audio.pause()
end


function menu_update(dt)
	love.audio.play( audio5 )
	--checando se o mouse apertou em determinado botão do menu
	function love.mousepressed(x, y, button)
		if button ==1 then --se o botao esquerdo do mouse foi pressionado entao...
			mx = x
			my = y
			if gamestate=="menu" then
				if toqueretangulo(mx,my,335,274,100, 25) then
					tutorial()
					love.audio.play( toque)
				end
				if toqueretangulo(mx, my, 335, 310, 100, 25 ) then
					love.audio.pause()
					fase1()
				end
				if toqueretangulo(mx, my, 335, 386, 100, 25 ) then
					love.audio.play( toque)
					love.event.push("quit")
				end
				if toqueretangulo(mx, my, 335, 346, 100, 25 ) then
					survival()
					love.audio.pause( )
					love.audio.play( toque)
				end
			end
		end
	end


end



function menu_draw()
	love.graphics.draw( background )
	love.graphics.rectangle( "line", 280, 140, 200, 100)--coordenadas do eixo x,y e largura e altura do retangulo
	love.graphics.print( "AVOID PLANET 1.0", 317, 186)--coordenadas da frase
	love.graphics.rectangle( "line", 335, 274, 100, 25)
	love.graphics.print ("TUTORIAL", 359, 280)
	love.graphics.rectangle( "line", 335, 310, 100, 25)
	love.graphics.print( "STORY MODE", 348, 318)
	love.graphics.rectangle( "line", 335, 346, 100, 25)
	love.graphics.print( "SURVIVAL MODE", 336, 352)
	love.graphics.rectangle( "line", 335, 386, 100, 25)
	love.graphics.print( "EXIT", 373, 392)

end

--declarando as partes que serão carregadas
function fase1()
	gamestate="fase1"
	fase1_load()
end

function tutorial()
	gamestate="tutorial"
	tutorial_load()
end

function survival()
	gamestate="survival"
	survival_load()
end
