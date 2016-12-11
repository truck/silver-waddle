-- local map generation from a seed

function mapunpack( s )
-- 16x16 (256 cells)
-- border



end

function roompack()
	r = ''
	s = 'abcdefg'
	for i=1,16 do
		x=flr(rnd(#s)+1)
		c = sub(s,x,x)
		r=r..c
	end
	return r
end
