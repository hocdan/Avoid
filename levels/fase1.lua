require "function/checatoque"
require "function/win"
require "function/menu"
require "function/colision_fase1"
require "function/draw_fase1"
require "function/beyondtouch"


function fase1_load()

	raioI = 40 --raio dos obstaculos fixos
	raioP = 25 --raio do player
	raioIP = 65 --soma do raio dos obstaculos imoveis com o raio do player
	raioOB = 20 --raio dos obstaculos móveis
	raioOP = 45 --soma do raio dos obstaculos moveis com o raio do player
	raioOC = 10 --raio dos objetos que se movem circulamente
	raioCP = 35 --soma do raio dos objetos que se movem circulamente com o raio do player
	life = 1
	stop = false

	--Dados do painel e da imagem de fundo
	background = love.graphics.newImage( "Imagens/Universo.jpg" )
	painel = love.graphics.newImage( "Imagens/barra1.png")
	morte = love.audio.newSource( "Audios/death.mp3", "stream" )
	audio = love.audio.newSource( "Audios/Valley-Sunrise.mp3", "stream")


	--Tempo para passar de fase
	tempo_total = 9
	tempo_orig = 9


	--angulo do movimento circular dos planetas
	angulo1, angulo2 = 1, 1
	meteoro = love.graphics.newImage( "Imagens/meteor1.png")

	--coordenadas e velocidade do player( alem do desenho do player e da chegada)
	cx1, cy1, sp = 40, 90, 300
	Terra = love.graphics.newImage( "Imagens/Terra4.png")
	finish = love.graphics.newImage( "Imagens/finish0.2.png")

	--coordenadas dos objetos fixos
	ox1, oy1 = 160, 40
	ox2, oy2 = 160, 130
	ox3, oy3 = 160, 220
	ox4, oy4 = 160, 310
	ox5, oy5 = 410, 400
	ox6, oy6 = 700, 65
	ox7, oy7 = 585, 200
	ox8, oy8 = 520, 200
	BR = love.graphics.newImage( "Imagens/blackhole1.4.png")
	BRm = love.graphics.newImage( "Imagens/blackhole1.5.png")


	--coordenadas e velocidades do obstáculos
	obx1, oby1, ob1sp, dir1 = 160, 450, 400, 1
	obx2, oby2, ob2sp, dir2 = 320, 170, 260, 1
	obx3, oby3, ob3sp, dir3 = 410, 100, 280, 1
	obx4, oby4, ob4sp, dir4 = 390, 30, 250, 1
	obx5, oby5, ob5sp, dir5 = 700, 390, 300, 1
	obstac = love.graphics.newImage( "Imagens/obstac4.png")
	obstac2 = love.graphics.newImage( "Imagens/obstac3.png")
	jupiter = love.graphics.newImage( "Imagens/jupiter1.png")


end


function fase1_update( dt )
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
--Função para clique fora da tela
	mx, my = love.mouse.getPosition()
	beyondtouch( mx, my)

--Pause do jogo todo:
if not stop then
	--Tempo passando
	tempo_total = tempo_total - dt

	if tempo_total <= 0 then
		life = life - 1
		tempo_total = tempo_orig
	end

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

	--Movimento dos obstáculos

	if oby1 < 393 then
		dir1 = 1
	elseif oby1 > 580 then
		dir1 = -1
	end

	oby1 = oby1 + ob1sp * dir1 * dt

	if obx2 < 230 then
		dir2 = 1
	elseif obx2 > 450 then
		dir2 = -1
	end

	obx2 = obx2 + ob2sp * dir2 * dt

	if obx3 < 230 then
		dir3 = 1
	elseif obx3 > 560 then
		dir3 = -1
	end

	obx3 = obx3 + ob3sp * dir3 * dt

	if obx4 < 230 then
		dir4 = 1
	elseif obx4 > 560 then
		dir4 = -1
	end

	obx4 = obx4 + ob4sp * dir4 * dt

	if oby5 < 210 then
		dir5 = 1
	elseif oby5 > 540 then
		dir5 = -1
	end

	oby5 = oby5 + ob5sp * dir5 * dt

	--Movimento circular dos obstáculos

	angulo1 = angulo1 + dt

	ocx1 = 410 + math.cos( angulo1 ) * 180
	ocy1 = 400 + math.sin( angulo1 ) * 180

	ocx2 = 410 + math.cos( angulo1 ) * 140
	ocy2 = 400 + math.sin( angulo1 ) * 140

	ocx3 = 410 + math.cos( angulo1 ) * 100
	ocy3 = 400 + math.sin( angulo1 ) * 100


	--Checagem do toque a todo momento
	colision_fase1()

	--Respawn do jogador
	if life == 0 then
		love.audio.play( morte )
		cx1 = 40
		cy1	= 90
		life = 1
		tempo_total = tempo_orig
	end
--Finalização do pause
end

end


function fase1_draw()

	--Desenho do fundo
	love.graphics.draw( background)
	--Desenhando o tempo
	love.graphics.draw( painel, 0, 0)
	love.graphics.print( "Life: " .. life, 10, 17)
	love.graphics.print( "0:0" .. math.floor(tempo_total), 70, 17 )
	--Desenho dos objetos
	draw_fase1()

end

--função para troca de fase
function menu()
	gamestate = "menu"
	menu_load()
end

function win()
	gamestate = "win"
	win_load()
end
