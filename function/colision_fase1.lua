--função que checa as colisões da fase 1

function colision_fase1()

	--Checagem do toque a todo momento

	checatoque ( cx1, cy1, ox1, oy1, raioIP)
	checatoque ( cx1, cy1, ox2, oy2, raioIP)
	checatoque ( cx1, cy1, ox3, oy3, raioIP)
	checatoque ( cx1, cy1, ox4, oy4, raioIP)
	checatoque ( cx1, cy1, ox5, oy5, raioIP)
	checatoque ( cx1, cy1, ox6, oy6, raioIP+20)
	checatoque ( cx1, cy1, ox7, oy7, raioIP)
	checatoque ( cx1, cy1, ox8, oy8, raioIP)

	checatoque ( cx1, cy1, obx1, oby1, raioOP)
	checatoque ( cx1, cy1, obx2, oby2, raioOP + 5)
	checatoque ( cx1, cy1, obx3, oby3, raioOP + 5)
	checatoque ( cx1, cy1, obx4, oby4, raioOP + 5)
	checatoque ( cx1, cy1, obx5, oby5, raioOP + 20)

	checatoque ( cx1, cy1, ocx1, ocy1, raioCP)
	checatoque ( cx1, cy1, ocx2, ocy2, raioCP)
	checatoque ( cx1, cy1, ocx3, ocy3, raioCP)

	--Colisão com os obstaculos imoveis
	if checatoque ( cx1, cy1, ox1, oy1, raioIP) then
		life = life - 1
	end
	if checatoque ( cx1, cy1, ox2, oy2, raioIP) then
		life = life - 1
	end
	if checatoque ( cx1, cy1, ox3, oy3, raioIP) then
		life = life - 1
	end
	if checatoque ( cx1, cy1, ox4, oy4, raioIP) then
		life = life - 1
	end
	if checatoque ( cx1, cy1, ox5, oy5, raioIP) then
		life = life - 1
	end
	if checatoque ( cx1, cy1, ox7, oy7, raioIP) then
		life = life - 1
	end
	if checatoque ( cx1, cy1, ox8, oy8, raioIP) then
		life = life - 1
	end
	if checatoque ( cx1, cy1, ox6, oy6, raioIP+20) then
		win()
	end

	--Colisão com os obstaculos moveis
	if checatoque ( cx1, cy1, obx1, oby1, raioOP) then
		life = life - 1
	end
	if checatoque ( cx1, cy1, obx2, oby2, raioOP + 5) then
		life = life - 1
	end
	if checatoque ( cx1, cy1, obx3, oby3, raioOP + 5) then
		life = life - 1
	end
	if checatoque ( cx1, cy1, obx4, oby4, raioOP + 5) then
		life = life - 1
	end
	if checatoque ( cx1, cy1, obx5, oby5, raioOP + 40) then
		life = life - 1
	end

	--Colisão com os objetos de trajetória circular
	if checatoque ( cx1, cy1, ocx1, ocy1, raioCP) then
		life = life - 1
	end
	if checatoque ( cx1, cy1, ocx2, ocy2, raioCP) then
		life = life - 1
	end
	if checatoque ( cx1, cy1, ocx3, ocy3, raioCP) then
		life = life - 1
	end
end
