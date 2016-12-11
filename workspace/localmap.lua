-- local map generation from a seed

function roomunpack(rn)
-- 16x16 (256 cells)
	base=0x1000+rn*64
	for j=0,15 do
		for i=0,3 do
			idx = j*16+i
			cell = peek(base+idx)
			cd = unbit4(cell)
			spr(32+cd[1],i*4,8+j*8)
			spr(32+cd[2],i*4+1,8+j*8)
			spr(32+cd[3],i*4+2,8+j*8)
			spr(32+cd[4],i*4+3,8+j*8)
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

function unbit4( byte )
	a=band(x,192)/64
	b=band(x,48)/16
	c=band(x,12)/4
	d=band(x,3)
	return{a,b,c,d}
end

function bit4( a,b,c,d )
	return a*64+b*16+c*4+d
end

function string2bytes( x )
	printh("I the debug:"..x)
  t = {}
  i=1
  while x>256 do
    t[i] = flr(x/256)
    x = x-t[i]*256
    i=i+1
    printh("..."..t[i])
  end
  t[i]=x
  printh(t[i])
  return t
end

