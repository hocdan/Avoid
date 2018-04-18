require "function/checatoque"
require "function/win2"
require "function/draw_fase2"
require "function/colision_fase2"
require "function/beyondtouch"

function fase2_load()
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
	background = love.graphics.newImage( "Imagens/universo3.png" )
	painel = love.graphics.newImage( "Imagens/barra1.png")
	morte = love.audio.newSource( "Audios/death.mp3", "stream" )
	audio = love.audio.newSource( "Audios/Blue-World.mp3", "stream")
	love.audio.pause()

	--Tempo para passar de fase
	tempo_total = 16
	tempo_orig = 16

	--Dados do player e da chegada
	cx1, cy1, sp = 40, 90, 200
	cx2, cy2, raioF = 750, 60, 40
	Terra = love.graphics.newImage( "Imagens/Terra4.png")
	finish2 = love.graphics.newImage( "Imagens/finish3.png")


	--angulo do movimento circular dos planetas
	angulo1, angulo2 = 1, 1
	meteoro = love.graphics.newImage( "Imagens/meteor1.png")

	--Dados dos objetos imoveis
	BRm = love.graphics.newImage( "Imagens/blackhole1.5.png")
	ox1, oy1 = 155, 30
	ox2, oy2 = 155, 90
	ox3, oy3 = 155, 150
	ox4, oy4 = 155, 210
	ox5, oy5 = 155, 270
	ox6, oy6 = 93, 270
	ox7, oy7 = 33, 270
	ox8, oy8 = 219, 270
	ox9, oy9 = 280, 270
	ox10, oy10 = 341, 270
	ox11, oy11 = 401, 270
	ox12, oy12 = 461, 270
	ox13, oy13 = 521, 270
	ox14, oy14 = 581, 270
	ox15, oy15 = 642, 270
	ox16, oy16 = 703, 270
	ox17, oy17 = 764, 270
	ox18, oy18 = 521, 330
	ox19, oy19 = 401, 565
	ox20, oy20 = 280, 330
	ox21, oy21 = 155, 565
	ox22, oy22 = 430, 135
	ox23, oy23 = 590, 135

	--Dados dos objetos moveis
	obx1, oby1, dir1, ob1sp = 521, 540, 1, 250
	obx2, oby2, dir2, ob2sp = 401, 400, 1, 260
	obx3, oby3, dir3, ob3sp = 280, 460, 1, 240
	obx4, oby4, dir4, ob4sp = 155, 500, 1, 280
	obstac = love.graphics.newImage( "Imagens/obstac4.png")

	--Dados dos portais
	px1, py1 = 62, 190
	px2, py2 = 740, 420
	px3, py3 = 62, 450
	px4, py4 = 262, 190
	teleporte = love.graphics.newImage( "Imagens/Teleporte2.png")
end

function fase2_update(dt)
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

	--Movimento dos objetos

	if oby1 < 385 then
		dir1 = 1
	elseif oby1 > 578 then
		dir1 = -1
	end

	oby1 = oby1 + ob1sp * dir1 * dt

	if oby2 < 315 then
		dir2 = 1
	elseif oby2 > 525 then
		dir2 = -1
	end

	oby2 = oby2 + ob2sp * dir2 * dt

	if oby3 < 385 then
		dir3 = 1
	elseif oby3 > 578 then
		dir3 = -1
	end

	oby3 = oby3 + ob3sp * dir3 * dt

	if oby4 < 330 then
		dir4 = 1
	elseif oby4 > 525 then
		dir4 = -1
	end

	oby4 = oby4 + ob4sp * dir4 * dt

	--Movimento de teleporte
	checatoque( cx1, cy1, px1, py1, raioTP)
	checatoque( cx1, cy1, px3, py3, raioTP)

	if checatoque( cx1, cy1, px1, py1, raioTP) then
		cx1, cy1 = 740, 430
	end
	if checatoque( cx1, cy1, px3, py3, raioTP) then
		cx1, cy1 = 262, 190
	end

	--Movimento circular dos obstáculos

	angulo1 = angulo1 + dt

	ocx1 = 410 + math.cos( angulo1 ) * 100
	ocy1 = 120 + math.sin( angulo1 ) * 100

	ocx2 = 600 - math.cos( angulo1 ) * 100
	ocy2 = 120 - math.sin( angulo1 ) * 100

	--Checagem da colisões pela função
	colision_fase2()

	--Checagem da vida
	if life < 1 then
		love.audio.play( morte )
		cx1, cy1 = 40, 90
		life = 1
		tempo_total = tempo_orig
	end
end

end

function fase2_draw()

	love.graphics.draw( background)
	love.graphics.draw( painel, 0, 0)
	love.graphics.print( "Life: " .. life, 10, 17)
	if tempo_total >= 10 then
		love.graphics.print( "0:" .. math.floor(tempo_total), 70, 17 )
	else
		love.graphics.print( "0:0" .. math.floor(tempo_total), 70, 17 )
	end

	--Desenho dos objetos pela função
	draw_fase2()

end

--função para troca de fase
function menu()
	gamestate = "menu"
	menu_load()
end

function win2()
	gamestate = "win2"
	win2_load()
end
