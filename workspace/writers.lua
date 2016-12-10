-- various writer functions

function border( x,y,w,h )
	x1=x*8
	y1=y*8
	print(x1..':'..y1..":"..w..":"..h,0,10,8)
	spr(1,x1,y1)
	spr(1,x1+w*8,y1,1,1,true)
	spr(1,x1,y1+h*8,1,1,false,true)
	spr(1,x1+w*8,y1+h*8,1,1,true,true)

	for i=1,w-1 do
		spr(2,x1+i*8,y1)
		spr(2, x1+i*8,y1+h*8, 1,1, false, true)
	end

	for i=1,h-1 do
		spr(3, x1,y1+i*8)
		spr(3, x1+w*8,y1+i*8, 1,1, true)
	end

	for i=1,w-1 do
		for j=1,h-1 do
			spr(9,x1+i*8,y1+j*8)
		end
	end
end

function bubblewrite( string,x,y,w,h,c1,c2 )
	border(x,y,w,h)
	string = texter(string,x+1,y+1,w-1,h-1,c1,c2)
	return string
end

function texter( string,x,y,w,h,c1,c2 )
	x1 = x*8
	y1 = y*8
	w = w*2-1
	h = y1+h*7
  s = 0

	for i=1,#string do
		char = sub(string,1,1)
		niceprint(char,x1+s*4,y1,c1,c2)
		s=s+1
		string=sub(string,2,#string)
		if s>w then
			y1=y1+7
			s=0
		end
		if y1 > h then
			break
		end
	end
	return string
end

function niceprint( string,x,y,c1,c2,yinc )
	yinc = yinc or 0
	print(string,x,y,c1)
	print(string,x+1,y+yinc,c2)
end

function statusbar(top)
	top = top or 0

	rectfill(0,top,128,top+7,10)
	rectfill(0,top+1,128,top+6,7)
	rectfill(0,top+2,128,top+5,15)
-- health
  x = 8
  h = dude['lives']*2
  for i=2,7,2 do
  	if h >= i then
 			spr(5,x,top)
 		else
  		if i-1 == h then
  			spr(6,x,top)
	  	else
  			spr(7,x,top)
	  	end
	  end
  	x=x+8
  end

  w = {11,12,13}
  a = {11,14}

  spr(w[dude['weapon']],6*8,top)
  spr(w[dude['armor']],8*8,top)
  sc = zpad(dude['score'],6)
  niceprint(sc,8*12,top+1,1,12,1)

end

function zpad( x,n )
	s = repeats('0',n) .. x
	return sub(s,#s-n,n)
end

function repeats( s,n )
	return n>0 and s .. repeats(s,n-1) or ""
end
