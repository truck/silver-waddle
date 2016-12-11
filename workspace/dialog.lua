-- dialog bits

function dialogbox( face,left,txt )
	if left then
		x = 0
		bx = 6
	else
		x = 86
		bx = 0
	end
	w = 8
	facebase(x,face)
	txt = textprep(txt,w)
--	print(txt,0,10,8)
	bubblewrite(txt, bx,10, w,5, 6,0)
end

function textprep( text,w )
	sp = " "
	str = ''
	tmp = ''
	x = 0
	zz=0
	w = w*2-1
	for i=1,#text do
		ch = sub(text,i,i)
		if ch == '~' then
			str = str .. tmp .. repeats('^',w-x-1)
			tmp = ''
			x = 0
		else
			tmp = tmp..ch
			x=x+1
			if ch == sp then
				str = str .. tmp
				tmp = ''
			end
			if x == w-1 then
				str = str .. repeats(sp,#tmp) .. tmp
				print(x..':'..tmp,0,10+8*zz,9)
				zz=zz+1
				x = #tmp
				tmp = ''
			end
		end
	end
	return str
end
