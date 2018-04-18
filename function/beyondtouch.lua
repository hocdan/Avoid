--Função para resolver o bug do tempo

function beyondtouch(x, y)
	if (x > 800 and y > 600) or ( x > 800 and y < 600) or ( x < 800 and y > 600) then
		dt = 0
	elseif ( x < 0 and y < 0 ) or ( x > 0 and y < 0) or ( x < 0 and y > 0 ) then
		dt = 0
	else
		dt = 0.1
	end
end
