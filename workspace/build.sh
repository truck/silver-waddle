#!/bin/zsh
tf=$(tempfile)
for i in $(<addfiles); do
	cat $i >> $tf
done
lua2pico.lua $tf ../ld37.p8 >! ../tmp.p8
rm $tf
