--Funçao para checagem de colisão da fase 5

function colision_fase5()

		--Checagem de toque
	checatoque( cx1, cy1, cx2, cy2, raioP+raioP)
	checatoque( cx1, cy1, px1, py1, raioSP)
	checatoque( cx1, cy1, px2, py2, raioMP)
	checatoque( cx1, cy1, px3, py3, raioVP)
	checatoque( cx1, cy1, px4, py4, raioMaP)
	checatoque( cx1, cy1, px5, py5, raioSaP)
	checatoque( cx1, cy1, px6, py6, raioJP)
	checatoque( cx1, cy1, px7, py7, raioNP)
	checatoque( cx1, cy1, px8, py8, raioUP)

	if checatoque( cx1, cy1, px1, py1, raioSP) or checatoque( cx1, cy1, px2, py2, raioMP) or checatoque( cx1, cy1, px3, py3, raioVP)
	or checatoque( cx1, cy1, px4, py4, raioMaP) or checatoque( cx1, cy1, px5, py5, raioSaP) or checatoque( cx1, cy1, px6, py6, raioJP) or checatoque( cx1, cy1, px7, py7, raioNP) or
	checatoque( cx1, cy1, px8, py8, raioUP) then
		life = life - 1
	end
	if checatoque( cx1, cy1, cx2, cy2, raioP+raioP) then
		win5()
	end
end
