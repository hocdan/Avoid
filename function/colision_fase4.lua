--Função para cheagem de colisões na fase 4

function colision_fase4()

	checatoque( cx1, cy1, ocx1, ocy1, raioCP)	checatoque( cx1, cy1, ocx6, ocy6, raioCP)	checatoque( cx1, cy1, ocx11, ocy11, raioCP)
	checatoque( cx1, cy1, ocx2, ocy2, raioCP)	checatoque( cx1, cy1, ocx7, ocy7, raioCP)	checatoque( cx1, cy1, ocx12, ocy12, raioCP)
	checatoque( cx1, cy1, ocx3, ocy3, raioCP)	checatoque( cx1, cy1, ocx8, ocy8, raioCP)	checatoque( cx1, cy1, ocx13, ocy13, raioCP)
	checatoque( cx1, cy1, ocx4, ocy4, raioCP)	checatoque( cx1, cy1, ocx9, ocy9, raioCP)	checatoque( cx1, cy1, ocx14, ocy14, raioCP)
	checatoque( cx1, cy1, ocx5, ocy5, raioCP)	checatoque( cx1, cy1, ocx10, ocy10, raioCP)	checatoque( cx1, cy1, ocx15, ocy15, raioCP)

	checatoque( cx1, cy1, ox1, oy1, raioIP)	checatoque( cx1, cy1, ox2, oy2, raioIP) checatoque( cx1, cy1, ox3, oy3, raioIP) checatoque( cx1, cy1, ox4, oy4, raioIP) checatoque( cx1, cy1, ox5, oy5, raioIP)

	if checatoque( cx1, cy1, ocx1, ocy1, raioCP) or	checatoque( cx1, cy1, ocx6, ocy6, raioCP) or checatoque( cx1, cy1, ocx11, ocy11, raioCP) or checatoque( cx1, cy1, ocx2, ocy2, raioCP)
	or checatoque( cx1, cy1, ocx7, ocy7, raioCP) or checatoque( cx1, cy1, ocx12, ocy12, raioCP) or checatoque( cx1, cy1, ocx3, ocy3, raioCP) or checatoque( cx1, cy1, ocx8, ocy8, raioCP)
	or checatoque( cx1, cy1, ocx13, ocy13, raioCP) or checatoque( cx1, cy1, ocx4, ocy4, raioCP) or checatoque( cx1, cy1, ocx9, ocy9, raioCP) or checatoque( cx1, cy1, ocx14, ocy14, raioCP)
	or checatoque( cx1, cy1, ocx5, ocy5, raioCP) or checatoque( cx1, cy1, ocx10, ocy10, raioCP)	or checatoque( cx1, cy1, ocx15, ocy15, raioCP) then
		life = life - 1
	end

	if checatoque( cx1, cy1, ox1, oy1, raioIP) or checatoque( cx1, cy1, ox2, oy2, raioIP) or checatoque( cx1, cy1, ox3, oy3, raioIP)
	or checatoque( cx1, cy1, ox4, oy4, raioIP) or checatoque( cx1, cy1, ox5, oy5, raioIP) then
		life = life - 1
	end
end
