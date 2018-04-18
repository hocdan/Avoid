--Função para o desenho dos objetos da fase 5

function draw_fase5()

	--Desenho do player e da chegada
	love.graphics.draw( Terra, cx1 + 11, cy1 - 31, raioP)
	love.graphics.draw( finish5, cx2 + 13, cy2 - 33, raioP)
	--Desenho do Sol
	love.graphics.draw( Sol, px1 + 52, py1 + 100, raioS)
	--Desenho de Mercurio e Venus
	love.graphics.draw( Mercurio, px2 + 8, py2 + 22, raioM)
	love.graphics.draw( Venus, px3 + 30, py3 + 3, raioV)
	--Desenho de Marte
	love.graphics.draw( Marte, px4 + 10, py4 - 30, raioMa)
	--Desenho de Saturno
	love.graphics.draw( Saturno, px5 - 53, py5 + 53, raioSa)
	--Desenho de Jupiter
	love.graphics.draw( Jupiter, px6 + 60, py6 - 4, raioJ)
	--Desenho de Netuno
	love.graphics.draw( Netuno, px7 - 28, py7 - 22, raioN)
	--Desenho de Urano
	love.graphics.draw( Urano, px8 + 25, py8 - 41, raioU)

end
