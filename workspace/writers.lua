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

