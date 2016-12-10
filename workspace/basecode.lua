-- pico-8 game shell
-- truck

function _init()
-- only init srand if we want to have the same results
--	srand()
	dude = {
		score = 0,
		lives = 3,
		weapon = 0,
		armor = 0,
		name='bob',
		face=randomface()
	}
	return dude
end

function _draw()
	facebase(0)
	unpackface(dude['face'])
--	statusbar()

end

function _update()
	cls()
end

function getjdir()
 d = 0
 if (btn(0)) then
  d = 4
 end
 if (btn(1)) then
  d = 3
 end
 if (btn(2)) then
  d = 1
 end
 if (btn(3)) then
  d = 2
 end
 return d
end

function statusbar()
-- lame. fix.
	print("L3 H ***** W:--> ",0,8*16)
end
