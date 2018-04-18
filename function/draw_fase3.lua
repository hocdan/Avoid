--Função para desenhar os objetos da fase 3

function draw_fase3()

	--Desenho do player e da chegada
	love.graphics.draw( Terra, cx1 - 32, cy1 - 24, raioP)
	love.graphics.draw( finish3, cx2 + 56, cy2 - 2, raioF)
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
	--Desenho dos objetos moveis
	love.graphics.draw( Jupiter, obx1 - 60, oby1 - 60)
	love.graphics.draw( obstac, obx2 + 12, oby2 - 28, raioO)
	love.graphics.draw( obstac, obx3 + 12, oby3 - 28, raioO)
	--Desenho dos objetos que se movem circularmente
	love.graphics.draw( meteoro, ocx1 + 4, ocy1 + 18, raioOC)
	love.graphics.draw( meteoro, ocx2 + 4, ocy2 + 18, raioOC)
	love.graphics.draw( meteoro, ocx3 + 4, ocy3 + 18, raioOC)
	love.graphics.draw( meteoro, ocx4 + 4, ocy4 + 18, raioOC)
	--Desenho dos teleportes
	love.graphics.draw( teleporte, opx1 + 80, opy1 - 5, raioT)
	love.graphics.draw( teleporte, opx2 + 80, opy2 - 5, raioT)

end
