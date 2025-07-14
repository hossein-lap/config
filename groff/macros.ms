\" Bullet list
\" .bl ITEM
.de bl
.IP \[bu] 3
..
\" Checked list
\" .bc ITEM
.de bc
.IP \[OK] 3
..
\" Unchecked list
\" .bb ITEM
.de bb
.IP \[sq] 3
..
\" Boxed code-block
\" .cb CODE ./cb
.nr ln 1
.de cb
.QS
\".B1
.ft CR
.sp 1n
.br
.sp 1n
.nf
.in +1m
.nm +0 1 1 -5
..
.de /cb
.br
.sp 1n
.nm
.fi
.ft
.in
\".B2
.QE
..
