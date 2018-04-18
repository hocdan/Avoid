require "function/checatoque"
require "function/win4"
require "function/colision_fase4"
require "function/draw_fase4"
require "function/beyondtouch"

function fase4_load()

	raioI  = 30 --raio dos obstaculos fixos
	raioP  = 20 --raio do player
	raioIP = 50 --soma do raio dos obstaculos imoveis com o raio do player
	raioOC = 15 --raio dos objetos que se movem circulamente
	raioCP = 50 --soma do raio dos objetos que se movem circulamente com o raio do player
	raioF  = 40  --raio da chegada
	raioFP = 60 --soma do raio do player e da chegada
	life = 1
	background = love.graphics.newImage( "Imagens/universo2.jpg")
	painel = love.graphics.newImage( "Imagens/barra1.png")
	morte = love.audio.newSource( "Audios/death.mp3", "stream" )
	audio = love.audio.newSource( "Audios/Pond-at-Twilight.mp3", "stream")
	love.audio.pause()


	--Dados do tempo
	tempo_total = 21
	tempo_orig = 21
	tempo_parada = 0
	rodar = true

	--Dados do player e da chegada
	cx1, cy1, sp = 50, 300, 200
	cx2, cy2 = 750, 50
	Terra = love.graphics.newImage( "Imagens/terra4.1.png")
	finish4 = love.graphics.newImage( "Imagens/finish6.2.png")

	--Dados dos objetos que se movem circularmente
	angulo1 = 1
	meteoro = love.graphics.newImage( "Imagens/meteor1.1.png")

	--Dados dos objetos imoveis
	ox1, oy1 = 680, 40
	ox2, oy2 = 300, 400
	ox3, oy3 = 205, 45
	ox4, oy4 = 535, 560
	ox5, oy5 = 760, 560
	BRm = love.graphics.newImage( "Imagens/blackhole1.5.png")

end

function fase4_update(dt)
	love.audio.play( audio )
--Função para pausar o jogo
	function love.keypressed(key)
		if key == "e" then
			stop = true
		end
		if key == "c" then
			stop = false
		end
	end

	mx, my = love.mouse.getPosition()
	beyondtouch( mx, my)

--Pause do jogo todo:
if not stop then
	--Movimento do jogador
	if (love.keyboard.isDown("w") or love.keyboard.isDown("up") ) and cy1 > 26 then
		cy1 = cy1 - sp * dt
	end

	if (love.keyboard.isDown("a") or love.keyboard.isDown("left") ) and cx1 > 26 then
		cx1 = cx1 - sp * dt
	end

	if (love.keyboard.isDown("s") or love.keyboard.isDown("down") ) and cy1 < 575 then
		cy1 = cy1 + sp  * dt
	end

	if (love.keyboard.isDown("d") or love.keyboard.isDown("right") ) and cx1 < 775 then
		cx1 = cx1 + sp * dt
	end

	--Passagem do tempo
	if rodar then
		tempo_total = tempo_total - dt
	end

	if tempo_total <= 0 then
		tempo_total = tempo_parada
		rodar = false
	end
	--Checagem de toque somente apos o tempo passar
	if tempo_total == tempo_parada then
		checatoque( cx1, cy1, cx2, cy2, raioFP)
		if checatoque( cx1, cy1, cx2, cy2, raioFP) then
			win4()
		end
	end

	--Movimento circular
	angulo1 = angulo1 + dt

	ocx1 = 40 - math.cos( angulo1 ) * 100		ocy1 = 100 - math.sin( angulo1 ) * 100
	ocx2 = 80 - math.cos( angulo1 ) * 100		ocy2 = 120 - math.sin( angulo1 ) * 100
	ocx3 = 140 + math.cos( angulo1 ) * 100		ocy3 = 200 + math.sin( angulo1 ) * 100
	ocx4 = 130 - math.cos( angulo1 ) * 150		ocy4 = 300 - math.sin( angulo1 ) * 150
	ocx5 = 240 + math.cos( angulo1 ) * 200		ocy5 = 100 + math.sin( angulo1 ) * 100
	ocx6 = 300 + math.cos( angulo1 ) * 240		ocy6 = 400 + math.sin( angulo1 ) * 240
	ocx7 = 400 + math.cos( angulo1 ) * 130		ocy7 = 200 + math.sin( angulo1 ) * 130
	ocx8 = 500 + math.cos( angulo1 ) * 120		ocy8 = 500 + math.sin( angulo1 ) * 120
	ocx9 = 200 - math.cos( angulo1 ) * 180		ocy9 = 400 - math.sin( angulo1 ) * 180
	ocx10 = 100 + math.cos( angulo1 ) * 150		ocy10 = 460 + math.sin( angulo1 ) * 150
	ocx11 = 600 + math.cos( angulo1 ) * 200		ocy11 = 300 + math.sin( angulo1 ) * 200
	ocx12 = 700 + math.cos( angulo1 ) * 100		ocy12 = 400 + math.sin( angulo1 ) * 100
	ocx13 = 620 - math.cos( angulo1 ) * 170 	ocy13 = 260 - math.sin( angulo1 ) * 170
	ocx14 = 690 + math.cos( angulo1 ) * 120 	ocy14 = 300 + math.sin( angulo1 ) * 120
	ocx15 = 430 + math.cos( angulo1 ) * 300 	ocy15 = 360 + math.sin( angulo1 ) * 300

	--Função para colisão da fase 4
	colision_fase4()

	if life == 0 then
		love.audio.play( morte )
		cx1, cy1 = 50, 300
		tempo_total = tempo_orig
		life = life + 1
		rodar = true
	end
end

end

function fase4_draw()
	love.graphics.draw( background )
	love.graphics.draw( painel, 0, 0)
	love.graphics.print( "Life: " .. life , 12, 17)
	if tempo_total >= 10 then
		love.graphics.print( "0:" .. math.floor(tempo_total), 55, 17)
	else
		love.graphics.print( "0:0" .. math.floor(tempo_total), 55, 17)
	end
	if tempo_total <= 0 then
		love.graphics.draw( finish4, cx2 + 63, cy2 - 4, raioF)
	end

	--função para o desenho dos objetos da fase 4
	draw_fase4()

end

function menu()
	gamestate = "menu"
	menu_load()
end

function win4()
	gamestate = "win4"
	win4_load()
end
