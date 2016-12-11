-- local map generation from a seed

function roomunpack(rn)
-- 16x16 (256 cells)
--	cls()
	base=0x1000+rn*64
	for j=0,15 do
		for i=0,3 do
			idx = j*4+i
			cell = peek(base+idx)
			cd = unbit4(cell)
			x=i*32
			y=j*8
			spr(32+cd[1],x,y)
			spr(32+cd[2],x+8,y)
			spr(32+cd[3],x+16,y)
			spr(32+cd[4],x+24,y)
		end
	end
end
-- ok we're going to use the shared memory between gfx and map
-- for the rooms. each room is 64 bytes of data (256 chunks.)

function roompack(rn)
	base=0x1000+rn*64
	for i=0,63 do
		c = bit4(flr(rnd(4)),flr(rnd(4)),flr(rnd(4)),flr(rnd(4)))
		poke(base+i,c)
	end
end

-- we can have around 18500 '16' rooms in memory
-- so over 1000 rooms at 16x16
-- there are 256^4 (4294967296) possibilities

function unbit4( x )
	a=band(x,192)/64
	b=band(x,48)/16
	c=band(x,12)/4
	d=band(x,3)
	t={a,b,c,d}
	return t
end

function bit4( a,b,c,d )
	return a*64+b*16+c*4+d
end

function debugtable( t )
	for i in all(t) do print(i) end
end
