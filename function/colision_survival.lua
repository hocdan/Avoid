--Função para checagem de colisões no modo Survival

function colision_survival()
		--Checagem de toque

	if flag1 then
		checatoque( cx1, cy1, ox1, oy1, raioIP)
		if checatoque( cx1, cy1, ox1, oy1, raioIP) then
			life = life - 1
		end
	end
	if flag2 then
		checatoque( cx1, cy1, ox2, oy2, raioIP)
		if checatoque( cx1, cy1, ox2, oy2, raioIP) then
			life = life - 1
		end
	end
	if flag3 then
		checatoque( cx1, cy1, ox3, oy3, raioIGP)
		checatoque( cx1, cy1, ox4, oy4, raioIP)
		if checatoque( cx1, cy1, ox3, oy3, raioIGP) or checatoque( cx1, cy1, ox4, oy4, raioIP) then
			life = life - 1
		end
	end
	if flag4 then
		checatoque( cx1, cy1, ocx1, ocy1, raioMP)
		checatoque( cx1, cy1, ocx2, ocy2, raioMP)
		if checatoque( cx1, cy1, ocx1, ocy1, raioMP) or checatoque( cx1, cy1, ocx2, ocy2, raioMP) then
			life = life - 1
		end
	end
	if flag5 then
		checatoque( cx1, cy1, ocx4, ocy4, raioMP)
		if checatoque( cx1, cy1, ocx4, ocy4, raioMP) then
			life = life - 1
		end
	end
	checatoque( cx1, cy1, cx2, cy2, raioP + raioP)
	if checatoque( cx1, cy1, cx2, cy2, raioP + raioP) then
		life = life - 1
	end
end
