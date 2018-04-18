--função para o desenho dos objetos da fase 4

function draw_fase4()

	--Desenhor do player
	love.graphics.draw( Terra, cx1 + 11, cy1 - 31, raioP)
	--Desenho dos objetos que se movem circularmente
	love.graphics.draw( meteoro, ocx1 + 27, ocy1 + 2, raioOC)
	love.graphics.draw( meteoro, ocx2 + 27, ocy2 + 2, raioOC)
	love.graphics.draw( meteoro, ocx3 + 27, ocy3 + 2, raioOC)
	love.graphics.draw( meteoro, ocx4 + 27, ocy4 + 2, raioOC)
	love.graphics.draw( meteoro, ocx5 + 27, ocy5 + 2, raioOC)
	love.graphics.draw( meteoro, ocx6 + 27, ocy6 + 2, raioOC)
	love.graphics.draw( meteoro, ocx7 + 27, ocy7 + 2, raioOC)
	love.graphics.draw( meteoro, ocx8 + 27, ocy8 + 2, raioOC)
	love.graphics.draw( meteoro, ocx9 + 27, ocy9 + 2, raioOC)
	love.graphics.draw( meteoro, ocx10 + 27, ocy10 + 2, raioOC)
	love.graphics.draw( meteoro, ocx11 + 27, ocy11 + 2, raioOC)
	love.graphics.draw( meteoro, ocx12 + 27, ocy12 + 2, raioOC)
	love.graphics.draw( meteoro, ocx13 + 27, ocy13 + 2, raioOC)
	love.graphics.draw( meteoro, ocx14 + 27, ocy14 + 2, raioOC)
	love.graphics.draw( meteoro, ocx15 + 27, ocy15 + 2, raioOC)


	--Desenho dos objetos imoveis
	love.graphics.draw( BRm, ox1 - 59, oy1 + 43, raioI)
	love.graphics.draw( BRm, ox2 - 59, oy2 + 43, raioI)
	love.graphics.draw( BRm, ox3 - 59, oy3 + 43, raioI)
	love.graphics.draw( BRm, ox4 - 59, oy4 + 43, raioI)
	love.graphics.draw( BRm, ox5 - 59, oy5 + 43, raioI)

end
