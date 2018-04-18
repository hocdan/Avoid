require "function/checatoque"
require "function/win5"
require "function/colision_fase5"
require "function/draw_fase5"
require "function/beyondtouch"

function fase5_load()

	raioP = 20 -- raio do player
	raioS = 60 -- raio do Sol
	raioSP = 80 -- soma dos raios do player e do Sol
	raioM = 10 -- raio de Mercurio
	raioMP = 30 -- soma dos raios do player e de Mercurio
	raioV = 15 -- raio de Vênus
	raioVP = 35 -- soma dos raios do player e de Venus
	raioMa = 20 -- raio de Marte
	raioMaP = 40 -- soma dos raios do player e de Marte
	raioSa = 30 -- raio de Saturno
	raioSaP = 50 -- soma dos raios do player e de Saturno
	raioJ = 40 -- raio de Jupiter
	raioJP = 60 -- soma dos raios do player e de Jupiter
	raioN = 25 -- raio de Netuno
	raioNP = 45 -- soma dos raios do player e de Netuno
	raioU = 20 -- raio de Urano
	raioUP = 40 -- soma dos raios do player e de Urano
	life = 1
	background = love.graphics.newImage( "Imagens/universo5.1.jpg")
	painel = love.graphics.newImage( "Imagens/barra1.png")
	morte = love.audio.newSource( "Audios/death.mp3", "stream" )
	audio = love.audio.newSource( "Audios/Blue-Ridge.mp3", "stream")
	love.audio.pause()


	--Passagem do tempo
	tempo_total = 21
	tempo_orig = 21
	--Angulos
	angulo1 = 1
	angulo2 = 0.5
	angulo3 = 2

	--Dados do player e da chegada
	cx1, cy1, sp = 20, 560, 100
	Terra = love.graphics.newImage( "Imagens/terra4.1.png")
	finish5 = love.graphics.newImage( "Imagens/portal1.png")

	--Dados do Sol e dos planetas
	px1, py1 = 400, 300
	Sol = love.graphics.newImage( "Imagens/Sol1.1.png")
	Mercurio = love.graphics.newImage( "Imagens/mercurio1.1.png")
	Venus = love.graphics.newImage( "Imagens/Venus1.1.png")
	Marte = love.graphics.newImage( "Imagens/marte1.1.png")
	Saturno = love.graphics.newImage( "Imagens/saturno1.png")
	Jupiter = love.graphics.newImage( "Imagens/jupiter1.1.png")
	Netuno = love.graphics.newImage( "Imagens/Netuno2.1.png")
	Urano = love.graphics.newImage( "Imagens/Urano1.1.png")


end

function fase5_update(dt)
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
	--Movimento dos planetas
	angulo1 = angulo1 + dt
	angulo2 = angulo2 - dt
	angulo3 = angulo3 - dt
	--Mercurio
	px2 = 375 + math.cos( angulo1 ) * 110	py2 = 270 + math.sin( angulo1 ) * 110
	--Vênus
	px3 = 390 - math.cos( angulo1 ) * 120	py3 = 280 - math.sin( angulo1 ) * 120
	--Chegada
	cx2 = 400 + math.cos( angulo2 ) * 180	cy2 = 240 + math.sin( angulo2 ) * 180
	--Marte
	px4 = 400 - math.cos( angulo1 ) * 180	py4 = 300 - math.sin( angulo1 ) * 180
	--Saturno
	px5 = 395 + math.cos( angulo1 ) * 260	py5 = 290 + math.sin( angulo1 ) * 260
	--Jupiter
	px6 = 320 - math.cos( angulo2 ) * 300	py6 = 270 - math.sin( angulo2 ) * 300
	--Netuno
	px7 = 350 + math.cos( angulo1 ) * 380	py7 = 290 + math.sin( angulo1 ) * 380
	--Urano
	px8 = 400 - math.cos( angulo3 ) * 400	py8 = 200 - math.sin( angulo3 ) * 400

	--Checagem de toque
	colision_fase5()

	if life == 0 then
		love.audio.play( morte )
		cx1, cy1 = 20, 560
		tempo_total = tempo_orig
		life = life + 1
	end
end

end

function fase5_draw()
	love.graphics.draw( background)
	love.graphics.draw( painel, 0, 0)
	love.graphics.circle( "line", cx1, cy1, raioP)
	love.graphics.print( "Vida: " .. life , 0, 17)
	if tempo_total >= 10 then
		love.graphics.print( "0:" .. math.floor(tempo_total), 60, 17)
	else
		love.graphics.print( "0:0" .. math.floor(tempo_total), 60, 17)
	end

	--Desenho dos objetos
	draw_fase5()

end

function menu()
	gamestate = "menu"
	menu_load()
end

function win5()
	gamestate = "win5"
	win5_load()
end
