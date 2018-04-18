--função que desenha os objetos da fase 1

function draw_fase1()

	--Desenho do player e da chegada
	love.graphics.draw( Terra, cx1-32, cy1-24, raioP)
	love.graphics.draw( finish, ox6 - 80, oy6 - 60)
	--Desenho dos obstaculos fixos
	love.graphics.draw( BR, ox1 + 115, oy1 - 5, raioI)
	love.graphics.draw( BR, ox2 + 115, oy2 - 5, raioI)
	love.graphics.draw( BR, ox3 + 115, oy3 - 5, raioI)
	love.graphics.draw( BR, ox4 + 115, oy4 - 5, raioI)
	love.graphics.draw( BR, ox5 + 115, oy5 - 5, raioI)
	love.graphics.draw( BRm, ox7 - 59, oy7 + 43, raioI - 10)
	love.graphics.draw( BRm, ox8 - 59, oy8 + 43, raioI - 10)
	--Desenho dos obstaculos móveis
	love.graphics.draw( obstac, obx1 + 12, oby1 - 28, raioOB)
	love.graphics.draw( obstac2, obx2 - 28, oby2 - 21, raioOB + 5)
	love.graphics.draw( obstac2, obx3 - 28, oby3 - 21, raioOB + 5)
	love.graphics.draw( obstac2, obx4 - 28, oby4 - 21, raioOB + 5)
	love.graphics.draw( jupiter, obx5 - 60, oby5 - 60)
	--Desenho dos obstaculos circulares
	love.graphics.draw( meteoro, ocx1 + 4, ocy1 + 18, raioOC)
	love.graphics.draw( meteoro, ocx2 + 4, ocy2 + 18, raioOC)
	love.graphics.draw( meteoro, ocx3 + 4, ocy3 + 18, raioOC)
end
