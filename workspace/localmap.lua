-- local map generation from a seed

function roomunpack( s )
-- 16x16 (256 cells)
-- border



end

function roompack()
	r = ''
	s = 'abcd'
	for i=1,16 do
		x=flr(rnd(#s)+1)
		c = sub(s,x,x)
		r=r..c
	end
	return r
end

-- we can have around 18500 rooms in memory
