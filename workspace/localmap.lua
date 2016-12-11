-- local map generation from a seed

function roomunpack( s )
-- 16x16 (256 cells)
-- border
	for j=1,16 do
		for i=1,16 do
			idx = j*16+i
			cell = sub(s,idx,idx)
			print(cell,i*4,j*8-8,10)
		end
	end
end

function roompack()
	r = ''
	s = '.+|-'
	for i=1,256 do
		x=flr(rnd(#s)+1)
		c = sub(s,x,x)
		r=r..c
	end
	return r
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

function int2bytes( x )
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

function dumpbytes( t )
	for i=1,count(t) do
		print(t[i],0,8*i,9)
	end
end
