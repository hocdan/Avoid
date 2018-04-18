
io.stdout:setvbuf("no")
io.stdout:setvbuf "no"

require "function/menu"
require "levels/fase1"
require "levels/fase2"
require "levels/fase3"
require "levels/fase4"
require "levels/fase5"
require "levels/survival"
require "function/win"
require "function/win2"
require "function/win3"
require "function/win4"
require "function/win5"
require "function/tutorial"
require "function/tutorial_moviments"
require "function/tutorial_objectives"
require "function/tutorial_enemy"
require "function/tutorial_survival"
require "function/circle"
require "function/rectangle"

function love.keypressed(key)
	if key == "escape" then
		love.event.quit()
	end
end

function love.load()
	gamestate = "menu"
	menu_load()
end

function love.update(dt)
	if gamestate == "menu" then
		menu_update(dt)
	elseif gamestate == "tutorial" then
		tutorial_update(dt)
	elseif gamestate == "tutorial_moviments" then
		moviments_update(dt)
	elseif gamestate == "tutorial_objectives" then
		objectives_update(dt)
	elseif gamestate == "tutorial_enemy" then
		enemy_update(dt)
	elseif gamestate == "tutorial_survival" then
		tsurvival_update(dt)
	elseif gamestate == "fase1" then
		fase1_update(dt)
	elseif gamestate == "win" then
		win_update(dt)
	elseif gamestate == "fase2" then
		fase2_update(dt)
	elseif gamestate == "win2" then
		win2_update(dt)
	elseif gamestate == "fase3" then
		fase3_update(dt)
	elseif gamestate == "win3" then
		win3_update(dt)
	elseif gamestate == "fase4" then
		fase4_update(dt)
	elseif gamestate == "win4" then
		win4_update(dt)
	elseif gamestate == "fase5" then
		fase5_update(dt)
	elseif gamestate == "win5" then
		win5_update(dt)
	elseif gamestate == "survival" then
		survival_update(dt)
	end
end

function love.draw()

	if gamestate == "menu" then
		menu_draw()
	elseif gamestate == "tutorial" then
		tutorial_draw()
	elseif gamestate == "tutorial_moviments" then
		moviments_draw()
	elseif gamestate == "tutorial_objectives" then
		objectives_draw()
	elseif gamestate == "tutorial_enemy" then
		enemy_draw()
	elseif gamestate == "tutorial_survival" then
		tsurvival_draw()
	elseif gamestate == "fase1" then
		fase1_draw()
	elseif gamestate == "win" then
		win_draw()
	elseif gamestate == "fase2" then
		fase2_draw()
	elseif gamestate == "win2" then
		win2_draw()
	elseif gamestate == "fase3" then
		fase3_draw()
	elseif gamestate == "win3" then
		win3_draw()
	elseif gamestate == "fase4" then
		fase4_draw()
	elseif gamestate == "win4" then
		win4_draw()
	elseif gamestate == "fase5" then
		fase5_draw()
	elseif gamestate == "win5" then
		win5_draw()
	elseif gamestate == "survival" then
		survival_draw()
	end
end
