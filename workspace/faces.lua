-- make a face

function facebase( x,ft )
	x=x or 0


	circfill(x+20,100,20,14)
	circfill(x+20,130,15,14)


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
	print("m:"..m..",n:"..n..",i:"..i..",e:"..e..",h:"..h..",s:"..s)
	return({m,n,i,e,h,s})
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
