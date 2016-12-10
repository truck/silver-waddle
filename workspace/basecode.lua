-- pico-8 game shell
-- truck

function _init()
	--
	text="oh. my. god. becky. look at her butt. it is so big! it's like one of those rap guys girlfriends. but. who understands those rap guys anyway. "
	return text
end

function _draw()
	texter(text,0,0,15,8)
	statusbar()
	--
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
	print("L3 H ***** W:--> ",0,8*16)
end
