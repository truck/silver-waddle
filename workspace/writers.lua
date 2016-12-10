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

function bubblewrite( string,x,y,w,h )
	border(x,y,w,h)
	clip(x+8,y+8,w*8-8,h*8-8)
	print(string,x+8,y+8,1)
	clip()
end

function texter( string,x,y,w,h )
	x1 = x*8
	y1 = y*8
	w = w*2
	h = h*8
  s = 0

	for i=1,#string do
		char = sub(string,i,i)
		print(char,x1+s*4,y1)
		s=s+1
		if s>w then
			y1=y1+8
			s=0
		end
	end
end
