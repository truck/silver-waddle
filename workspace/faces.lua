-- make a face

function facebase( x,ft )
	x=x or 0
	face = unpackface(ft)
	cl = {14,12,3}
	cl[0]=6
	circfill(x+20,100,20,cl[face['s']])
	circfill(x+20,130,15,cl[face['s']])

	spr(face['m']+16,x+12,104)
	spr(face['m']+16,x+20,104,1,1,true)

	spr(face['n']+20,x+12,88)
	spr(face['n']+20,x+20,88,1,1,true)

	spr(face['i']+24,x+6,78)
	spr(face['i']+24,x+26,78,1,1,true)

	spr(face['e']+28,x+2,104)
	spr(face['e']+28,x+30,104,1,1,true)

	-- spr(face['h']+16,x+12,104)
	-- spr(face['h']+16,x+20,104,1,1,true)

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
	print("m:"..m..",n:"..n..",i:"..i..",e:"..e..",h:"..h..",s:"..s,0,40,7)
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
