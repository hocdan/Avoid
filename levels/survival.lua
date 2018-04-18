require "function/checatoque"
require "function/colision_survival"
require "function/beyondtouch"

function survival_load()
	raioP = 20
	raioI = 30
	raioIG = 60
	raioIP = 50 -- soma dos raios do player e dos objetos imoveis
	raioIGP = 80 -- soma dos raios do player e do objeto imovel gigante
	raioM = 15
	raioMP = 35 -- soma dos raios do player e dos objetos moveis
	angulo1 = 1
	angulo2 = 1
	background = love.graphics.newImage( "Imagens/universo4.jpg")
	painel = love.graphics.newImage( "Imagens/barra1.png")
	morte = love.audio.newSource( "Audios/death.mp3", "stream" )
	audio3  = love.audio.newSource( "Audios/universe.mp3", "stream")

	--Dados do player e do "perseguidor"
	cx1, cy1, sp = 400, 300, 200
	life = 1
	cx2, cy2, sp2 = 600, 100, 90

	--Dados do Tempo
	tempo_total = 1
	round_atual = 1
	pontos = 0
	energia = 1
	c = 1
	highscore = 0

	--Dados dos objetos
	meteoro = love.graphics.newImage( "Imagens/meteor1.1.png")
	BRm = love.graphics.newImage( "Imagens/blackhole1.5.png")
	BN = love.graphics.newImage( "Imagens/blackhole1.png")
	Terra = love.graphics.newImage( "Imagens/terra4.1.png")
	inimigo = love.graphics.newImage( "Imagens/supernova1.1.png")

	--Flags para surgimento dos obstaculos
	flag1, flag2, flag3, flag4, flag5, stop = false, false, false, false, false, false

	--Dados do objetos imoveis
	ox1, oy1 = 200, 200 	ox3, oy3 = 200, 460
	ox2, oy2 = 600, 200 	ox4, oy4 = 600, 500

end

function survival_update(dt)
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

--Função para volta do menu
function love.mousepressed(x, y, button)
	if button ==1 then --se o botao esquerdo do mouse foi pressionado entao...
		mx = x
		my = y
		if gamestate == "survival" then
			if toqueretangulo( mx, my, 580, 42, 80, 20) then
				menu()
				love.audio.pause( audio3 )
			end
		end
	end
end

if not stop and gamestate == "survival" then
	audio = love.audio.play( audio3 )
	--Movimento do jogador
	if (love.keyboard.isDown("w") or love.keyboard.isDown("up") ) and cy1 > 97 then
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
	--Movimento do "perseguidor"
	if cx2 < cx1 then
		cx2 = cx2 + sp2 * dt
	end
	if cx2 > cx1 then
		cx2 = cx2 - sp2 * dt
	end
	if cy2 < cy1 then
		cy2 = cy2 + sp2 * dt
	end
	if cy2 > cy1 then
		cy2 = cy2 - sp2 * dt
	end
	--Aumento gradativo do "perseguidor"
	if pontos > 200 then
		sp2 = 110
	end
	if pontos > 600 then
		sp2 = 120
	end
	if pontos > 1000 then
		sp2 = 130
	end
	if pontos > 2000 then
		sp2 = 140
	end
	--Checagem da vida
	if life == 0 then
		love.audio.play( morte )
		cx1, cy1 = 400, 300
		cx2, cy2 = 600, 100
		energia = 1
		round_atual = 1
		tempo_total = 1
		life = life + 1
		if pontos > highscore then
			highscore = pontos
		end
		pontos = 0
		sp2 = 90
		flag1, flag2, flag3, flag4, flag5 = false, false, false, false, false
	end
	--Passagem do tempo e contagem de pontos
	tempo_total = tempo_total + dt
	if tempo_total >= 59 then
		tempo_total = 0
		pontos = pontos + 1000
		round_atual = round_atual + 1
		energia = energia + 1
	end
	if tempo_total > 20 and tempo_total < 21 then
		round_atual = round_atual + 0.01
		pontos = pontos + 5
	elseif tempo_total > 40 and tempo_total < 41 then
		round_atual = round_atual + 0.01
		pontos = pontos + 6
	end
	--Contagem de energia
	if energia == 5 and c == 1 then
		pontos = pontos + 500
		c = c + 1
	elseif energia == 10 and c == 2 then
		pontos = pontos + 1000
		c = c + 1
	elseif energia == 15 and c == 3 then
		pontos = pontos + 2000
		c = c + 1
	elseif energia == 20 and c == 4 then
		pontos = pontos + 4000
		c = c + 1
	end
	--Contagem para o surgimento dos obstaculos
	if tempo_total > 20 and life == 1 then
		flag1 = true
	end
	if tempo_total > 40 and life == 1 then
		flag2 = true
	end
	if energia >= 2 then
		flag3 = true
	end
	if tempo_total > 20 and life == 1 and energia >= 2 then
		flag4 = true
	end
	if energia >= 3 then
		flag5 = true
	end
	--Movimento circular dos obstaculos
	angulo1 = angulo1 + dt		angulo2 = angulo2 - dt

	ocx1 = 180 + math.cos( angulo1 ) * 120		ocy1 = 200 + math.sin( angulo1 ) * 120
	ocx2 = 580 - math.cos( angulo2 ) * 120 		ocy2 = 200 - math.sin( angulo2 ) * 120

	ocx4 = 580 + math.cos( angulo2 ) * 120		ocy4 = 500 + math.sin( angulo2 ) * 120

	--Checagem de colisão
	colision_survival()
end

end

function survival_draw()
	love.graphics.draw( background )
	love.graphics.draw( painel, 0, 0)
	love.graphics.print( "Life: " .. life, 10, 17)
	if tempo_total < 10 then
		love.graphics.print( "0:0" .. math.floor(tempo_total), 60, 17)
	else
		love.graphics.print( "0:" .. math.floor(tempo_total), 60, 17)
	end
	if c > 4 then
		love.graphics.print( "ENERGY: MAX REACHED", 110, 17)
	else
		love.graphics.print( "ENERGY: " .. energia, 110, 17)
	end
	love.graphics.print( "ROUND " .. math.ceil(round_atual), 370, 17)
	love.graphics.print( "SCORE: " .. pontos, 370, 47)
	love.graphics.print( "HIGHSCORE: " .. highscore, 200, 17)

	--Desenho da volta para o menu
	love.graphics.rectangle( "line", 520, 12, 200, 60)
	love.graphics.print( "GO TO MENU?", 580, 18)
	love.graphics.rectangle( "line", 580, 42, 80, 20)
	love.graphics.print( "YES", 610, 46)
	--Desenho do player e do inimigo
	love.graphics.draw( Terra, cx1 + 11, cy1 - 31, raioP)
	love.graphics.draw( inimigo, cx2 + 12, cy2 - 33, raioP)
	--Desenho dos obstaculos
	if flag1 then
		love.graphics.draw( BRm, ox1 - 59, oy1 + 43, raioI)
	end
	if flag2 then
		love.graphics.draw( BRm, ox2 - 59, oy2 + 43, raioI)
	end
	if flag3 then
		love.graphics.draw( BN, ox3 + 70, oy3 + 140, raioIG)
		love.graphics.draw( BRm, ox4 - 59, oy4 + 43, raioI)
	end
	--Desenho dos obstaculos moveis
	if flag4 then
		love.graphics.draw( meteoro, ocx1 + 27, ocy1 + 2, raioM) -- circular
		love.graphics.draw( meteoro, ocx2 + 27, ocy2 + 2, raioM) -- circular
	end
	if flag5 then
		love.graphics.draw( meteoro, ocx4 + 27, ocy4 + 2, raioM) -- circular
	end
end

function menu()
	gamestate="menu"
	menu_load()
end
