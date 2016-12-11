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
-- and since there are, you know, only 1024 um hold on there are 1024
