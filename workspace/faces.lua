-- make a face

function facebase( x,ft )
	x=x or 0
	face = unpackface(ft)
	cl = {6,14,12,3}
	fns = {
	 [1] = function(x) roundhair(x) end,
	 [2] = function(x) bluehat(x) end,
	 [3] = function(x) wizardhat(x) end,
	 [4] = function(x) nothorns(x) end }

	fns[ face['h']+1 ](x)

	circfill(x+20,100,20,cl[face['s']+1])
	circfill(x+20,130,15,cl[face['s']+1])

	spr(face['m']+16,x+12,104)
	spr(face['m']+16,x+20,104,1,1,true)

	spr(face['n']+20,x+12,88)
	spr(face['n']+20,x+20,88,1,1,true)

	spr(face['i']+24,x+6,78)
	spr(face['i']+24,x+26,78,1,1,true)

	spr(face['e']+28,x+2,104)
	spr(face['e']+28,x+30,104,1,1,true)

end

-- return: mouth, nose, eyes, ears, hat, skin
function unpackface( f )
	s = flr(f/1024)
	f = f-(s*1024)
	h = flr(f/256)
	f = f-(h*256)
	e = flr(f/64)
	f=f-(e*64)
	i = flr(f/16)
	f=f-(i*16)
	n = flr(f/4)
	m = f-(n*4)
--	print("m:"..m..",n:"..n..",i:"..i..",e:"..e..",h:"..h..",s:"..s,0,40,7)
	return({m=m,n=n,i=i,e=e,h=h,s=s})
end

function randomface()
	-- return flr(rnd(4)) +  --mouth
	-- flr(rnd(4))*4+ -- nose
	-- flr(rnd(4))*16+ -- eyes
	-- flr(rnd(4))*64+ -- ears
	-- flr(rnd(4))*256+ -- hat
	-- flr(rnd(4))*1024 -- skin
	return flr(rnd(4096))
end

function roundhair( x )
	for i=1,20,3 do
		r = (7.5+i)*(1/35)
		x1 = sin(r)*20
		y1 = cos(r)*20
		circfill(x+20+x1,100+y1,4,4)
	end
end

function bluehat( x )
	rectfill(x,77,x+40,80,1)
	rectfill(x+10,74,x+30,77,1)
end

function wizardhat( x )
	rectfill(x,77,x+40,80,11)
	for i=-10,10 do
		line(x+20,60,x+20+i,81,11)
	end
end

function nothorns( x )
	circfill(x+20,80,20,6)
	circfill(x+10,85,10,0)
	circfill(x+30,85,10,0)
end
