function checaToqueC(posxT, posyT, posxR, posyR, r)
	

	if (posxR - posxT)^2 + (posyR - posyT)^2 < r^2 then
		return true
	else 
		return false	
	end
end




