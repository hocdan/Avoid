--Função para colisões da fase 3

function colision_fase3()

	--Checagem de toque
	checatoque( cx1, cy1, ox1, oy1, raioIP)	checatoque( cx1, cy1, ox10, oy10, raioIP)
	checatoque( cx1, cy1, ox2, oy2, raioIP)	checatoque( cx1, cy1, ox11, oy11, raioIP)
	checatoque( cx1, cy1, ox3, oy3, raioIP)	checatoque( cx1, cy1, ox12, oy12, raioIP)
	checatoque( cx1, cy1, ox4, oy4, raioIP) checatoque( cx1, cy1, ox13, oy13, raioIP)
	checatoque( cx1, cy1, ox5, oy5, raioIP) checatoque( cx1, cy1, ox14, oy14, raioIP)
	checatoque( cx1, cy1, ox6, oy6, raioIP)	checatoque( cx1, cy1, ox15, oy15, raioIP)
	checatoque( cx1, cy1, ox7, oy7, raioIP) checatoque( cx1, cy1, ox16, oy16, raioIP)
	checatoque( cx1, cy1, ox8, oy8, raioIP)	checatoque( cx1, cy1, ox17, oy17, raioIP)
	checatoque( cx1, cy1, ox9, oy9, raioIP)

	checatoque( cx1, cy1, obx1, oby1, raioOP + 40)	checatoque( cx1, cy1, obx3, oby3, raioOP)
	checatoque( cx1, cy1, obx2, oby2, raioOP)

	checatoque( cx1, cy1, ocx1, ocy1, raioCP)	checatoque( cx1, cy1, ocx3, ocy3, raioCP)
	checatoque( cx1, cy1, ocx2, ocy2, raioCP)	checatoque( cx1, cy1, ocx4, ocy4, raioCP)

	if checatoque( cx1, cy1, ox1, oy1, raioIP) or checatoque( cx1, cy1, ox10, oy10, raioIP) or checatoque( cx1, cy1, ox2, oy2, raioIP)	or checatoque( cx1, cy1, ox11, oy11, raioIP) or checatoque( cx1, cy1, ox3, oy3, raioIP)
	or checatoque( cx1, cy1, ox12, oy12, raioIP) or checatoque( cx1, cy1, ox4, oy4, raioIP) or checatoque( cx1, cy1, ox13, oy13, raioIP) or checatoque( cx1, cy1, ox5, oy5, raioIP) or checatoque( cx1, cy1, ox14, oy14, raioIP)
	or checatoque( cx1, cy1, ox6, oy6, raioIP)	or checatoque( cx1, cy1, ox15, oy15, raioIP) or checatoque( cx1, cy1, ox7, oy7, raioIP) or checatoque( cx1, cy1, ox16, oy16, raioIP) or checatoque( cx1, cy1, ox8, oy8, raioIP)
	or	checatoque( cx1, cy1, ox17, oy17, raioIP) or checatoque( cx1, cy1, ox9, oy9, raioIP) then
		life = life - 1
	end

	if checatoque( cx1, cy1, obx1, oby1, raioOP + 40) or checatoque( cx1, cy1, obx3, oby3, raioOP) or checatoque( cx1, cy1, obx2, oby2, raioOP) then
		life = life - 1
	end

	if checatoque( cx1, cy1, ocx1, ocy1, raioCP) or checatoque( cx1, cy1, ocx3, ocy3, raioCP) or checatoque( cx1, cy1, ocx2, ocy2, raioCP)	or checatoque( cx1, cy1, ocx4, ocy4, raioCP) then
		life = life -1
	end

end

