-- various writer functions

function border( x,y,w,h )
	x1=x*8
	y1=y*8
	spr(1,x1,y1)
	spr(1,x1+w*8,y1,1,1,true)
	spr(1,x1,y1+h*8,1,1,false,true)
	spr(1,x1+w*8,y1+h*8,1,1,true,true)

	for i=x+1,w-1 do
		spr(2,x1+i*8,y1)
		spr(2,x1+i*8,y1+h*8)
	end

	for i=y+1,h-1 do
		spr(3,x1,y1+i*8)
		spr(3,x1+w*8,y1+i*8)
	end

	for i=x+1,w-1 do
		for j=y+1,h-1 do
			spr(9,x1+i*8,y1+j*8)
		end
	end
end

function bubblewrite( string,x,y,w,h,c1,c2 )
	border(x,y,w,h)
	while #string > 1 do
		string = texter(string,x+1,y+1,w-1,h-1,c1,c2)
	end
	string = texter("#####-----#####",x+1,y+1,w-1,h-1,c1,c2)
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

function niceprint( string,x,y,c1,c2 )
	print(string,x,y,c1)
	print(string,x+1,y,c2)
end
