require "function/checatoque"
require "function/win3"
require "function/colision_fase3"
require "function/draw_fase3"
require "function/beyondtouch"

function fase3_load()
	raioI = 30 --raio dos obstaculos fixos
	raioP = 25 --raio do player
	raioIP = 55 --soma do raio dos obstaculos imoveis com o raio do player
	raioO = 20 --raio dos objetos moveis
	raioOP = 45 --soma do raio do player e dos objetos moveis
	raioOC = 10 --raio dos objetos que se movem circulamente
	raioCP = 35 --soma do raio dos objetos que se movem circulamente com o raio do player
	raioT = 40 --raio do teleporte
	raioTP = 65 --soma do raio do player e do teleporte
	raioFP = 65 --soma do raio do player e da chegada
	life = 1
	background = love.graphics.newImage( "Imagens/universo1.png")
	painel = love.graphics.newImage( "Imagens/barra1.png")
	morte = love.audio.newSource( "Audios/death.mp3", "stream" )
	audio = love.audio.newSource( "Audios/Melt.mp3", "stream")
	love.audio.pause()


	--Dados do tempo
	tempo_total = 21
	tempo_orig = 21

	--Dados do player e da chegada
	cx1, cy1, sp = 400, 570, 200
	cx2, cy2 = 395, 45
	Terra = love.graphics.newImage( "Imagens/Terra4.png")
	finish3 = love.graphics.newImage( "Imagens/finish2.2.png")

	--Dados dos objetos imoveis
	ox1, oy1 = 150, 490		ox4, oy4 = 520, 490
	ox2, oy2 = 210, 490		ox5, oy5 = 580, 490 --primeira fileira
	ox3, oy3 = 270, 490		ox6, oy6 = 640, 490

	ox7, oy7 = 150, 310		ox10, oy10 = 520, 310
	ox8, oy8 = 210, 310		ox11, oy11 = 580, 310 --segunda fileira
	ox9, oy9 = 270, 310		ox12, oy12 = 640, 310

	ox13, oy13 = 335, 130	ox14, oy14 = 395, 130	ox15, oy15 = 455, 130 --terceira fileira( meio )

	ox16, oy16 = 150, 130	ox17, oy17 = 640, 130 -- quarta fileira
	BRm = love.graphics.newImage( "Imagens/blackhole1.5.png")

	--Dados dos objetos moveis
	obx1, oby1, ob1sp, dir1 = 395, 300, 300, 1
	obx2, oby2, ob2sp, dir2 = 60, 320, 260, 1
	obx3, oby3, ob3sp, dir3 = 730, 320, 260, 1
	obstac = love.graphics.newImage( "Imagens/obstac4.png")
	Jupiter = love.graphics.newImage( "Imagens/jupiter1.png")

	--Dados dos teleportes
	opx1, opy1 = 210, 400	opx2, opy2 = 580, 400 -- teleportes entre a primeira e segunda fileira
	teleporte = love.graphics.newImage( "Imagens/Teleporte2.png")


	--Dados dos objetos que se movem circularmente
	angulo1 = 1
	meteoro = love.graphics.newImage( "Imagens/meteor1.png")

end


function fase3_update(dt)
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
	tempo_total = tempo_total - dt

	if tempo_total < 0 then
		life = life - 1
	end

	--Movimentos dos objetos moveis
	if oby1 < 240 then
		dir1 = 1
	elseif oby1 > 465 then
		dir1 = -1
	end

	oby1 = oby1 + ob1sp * dir1 * dt

	if oby2 < 250 then
		dir2 = 1
	elseif oby2 > 490 then
		dir2 = -1
	end

	oby2 = oby2 + ob2sp * dir2 * dt

	if oby3 < 250 then
		dir3 = 1
	elseif oby3 > 490 then
		dir3 = -1
	end

	oby3 = oby3 + ob3sp * dir3 * dt

	--Movimento de teleporte dos portais
	checatoque( cx1, cy1, opx1, opy1, raioTP)
	if checatoque( cx1, cy1, opx1, opy1, raioTP) then
		cx1 = 395
		cy1 = 250
	end
	checatoque( cx1, cy1, opx2, opy2, raioTP)
	if checatoque( cx1, cy1, opx2, opy2, raioTP) then
		cx1 = 395
		cy1 = 250
	end

	--Movimento dos objetos que se movem circularmente
	angulo1 = angulo1 + dt

	ocx1 = 140 + math.cos( angulo1 ) * 100
	ocy1 = 130 + math.sin( angulo1 ) * 100
	ocx2 = 140 - math.cos( angulo1 ) * 100
	ocy2 = 130 - math.sin( angulo1 ) * 100

	ocx3 = 630 + math.cos( angulo1 ) * 100
	ocy3 = 130 + math.sin( angulo1 ) * 100
	ocx4 = 630 - math.cos( angulo1 ) * 100
	ocy4 = 130 - math.sin( angulo1 ) * 100

	--Checagem das colisões da fase 3
	colision_fase3()

	if life == 0 then
		love.audio.play( morte )
		cx1, cy1 = 400, 570
		tempo_total = tempo_orig
		life = life + 1
	end

	--Passagem de fase
	checatoque( cx1, cy1, cx2, cy2, raioFP)
	if checatoque( cx1, cy1, cx2, cy2, raioFP) then
		win3()
	end
end

end


function fase3_draw()
	love.graphics.draw( background )
	love.graphics.draw( painel, 0, 0)
	--Desenho da vida e do tempo
	love.graphics.print( "Life: " .. life, 20, 17)
	if tempo_total >= 10 then
		love.graphics.print( "0:" .. math.floor(tempo_total), 70, 17)
	else
		love.graphics.print( "0:0" .. math.floor(tempo_total), 70, 17)
	end

	--Desenho dos objetos da fase 3
	draw_fase3()

end

--função para troca de fase
function menu()
	gamestate = "menu"
	menu_load()
end

function win3()
	gamestate = "win3"
	win3_load()
end
