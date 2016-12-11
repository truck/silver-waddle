-- Dr. One Room on the Island of One Room
-- truck / Ludum Dare 37 "One Room"

cstate = 'dlog'

function _init()
-- only init srand if we want to have the same results
--	srand()
	dude = {
		score = 0,
		lives = 3,
		weapon = 1,
		armor = 1,
		name='Dr. One Room, esq.',
		face=randomface(),
		wtf = 77777
	}
	dumpbytes(int2bytes(dude.wtf))
	return dude
end

function _draw()
--	cls()
	statusbar()
	print()

end

function _update()
  uf = {
  ['intro'] = function() do_intro() end,
  ['help'] = function() do_help() end,
  ['menu'] = function() do_menu() end,
  ['move'] = function() do_move() end,
  ['dlog'] = function() do_dialog() end,
  ['win'] = function() do_win() end,
  ['die'] = function() do_die() end}

	if uf[cstate] then
		uf[cstate]()
	else
		do_bug()
	end

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

function do_intro(  )
end

function do_help(  )
end

function do_menu(  )
end

function do_move(  )
end

function do_dialog(  )
	cls()
	dialogbox(dude.face,true,"oh. my. god.~becky.~look at her butt! it is so big it's like one of those rap guys girlfriends")
end

function do_win(  )
end

function do_die(  )
end

function do_bug(  )
	assert(0==1)
end
