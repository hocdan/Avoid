--Função para desenhar os objetos da fase 2

function draw_fase2()
	--Desenho do player e da chegada
	love.graphics.draw( Terra, cx1 - 32, cy1 - 24, raioP)
	love.graphics.draw( finish2, cx2 + 90, cy2 - 7, raioF)

	--Desenho dos portais
	love.graphics.draw( teleporte, px1 + 80, py1 - 5, raioT)
	love.graphics.draw( teleporte, px2 + 80, py2 - 5, raioT)
	love.graphics.draw( teleporte, px3 + 80, py3 - 5, raioT)
	love.graphics.draw( teleporte, px4 + 80, py4 - 5, raioT)


	--Desenho dos objetos imoveis
	love.graphics.draw( BRm, ox1 - 59, oy1 + 43, raioI)
	love.graphics.draw( BRm, ox2 - 59, oy2 + 43, raioI)
	love.graphics.draw( BRm, ox3 - 59, oy3 + 43, raioI)
	love.graphics.draw( BRm, ox4 - 59, oy4 + 43, raioI)
	love.graphics.draw( BRm, ox5 - 59, oy5 + 43, raioI)
	love.graphics.draw( BRm, ox6 - 59, oy6 + 43, raioI)
	love.graphics.draw( BRm, ox7 - 59, oy7 + 43, raioI)
	love.graphics.draw( BRm, ox8 - 59, oy8 + 43, raioI)
	love.graphics.draw( BRm, ox9 - 59, oy9 + 43, raioI)
	love.graphics.draw( BRm, ox10 - 59, oy10 + 43, raioI)
	love.graphics.draw( BRm, ox11 - 59, oy11 + 43, raioI)
	love.graphics.draw( BRm, ox12 - 59, oy12 + 43, raioI)
	love.graphics.draw( BRm, ox13 - 59, oy13 + 43, raioI)
	love.graphics.draw( BRm, ox14 - 59, oy14 + 43, raioI)
	love.graphics.draw( BRm, ox15 - 59, oy15 + 43, raioI)
	love.graphics.draw( BRm, ox16 - 59, oy16 + 43, raioI)
	love.graphics.draw( BRm, ox17 - 59, oy17 + 43, raioI)
	love.graphics.draw( BRm, ox18 - 59, oy18 + 43, raioI)
	love.graphics.draw( BRm, ox19 - 59, oy19 + 43, raioI)
	love.graphics.draw( BRm, ox20 - 59, oy20 + 43, raioI)
	love.graphics.draw( BRm, ox21 - 59, oy21 + 43, raioI)
	love.graphics.draw( BRm, ox22 - 59, oy22 + 43, raioI)
	love.graphics.draw( BRm, ox23 - 59, oy23 + 43, raioI)


	--Desenho dos objetos moveis
	love.graphics.draw( obstac, obx1 + 12, oby1 - 28, raioO)
	love.graphics.draw( obstac, obx2 + 12, oby2 - 28, raioO)
	love.graphics.draw( obstac, obx3 + 12, oby3 - 28, raioO)
	love.graphics.draw( obstac, obx4 + 12, oby4 - 28, raioO)

	--Desenho dos objetos que se movem circularmente
	love.graphics.draw( meteoro, ocx1 + 4, ocy1 + 18, raioOC)
	love.graphics.draw( meteoro, ocx2 + 4, ocy2 + 18, raioOC)
end
