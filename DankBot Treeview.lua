--DankBot Treeview v1.1 by ThunderAxe31. Generates a graphical output as .bmp file for DankBot v3.0 or later.

local font_height = 11
local font_width  =  8
local Courier_size11 = {}
Courier_size11[32]={
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[33]={
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[34]={
0,0,1,0,1,0,0,0,
0,0,1,0,1,0,0,0,
0,0,1,0,1,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[35]={
0,0,0,1,0,1,0,0,
0,0,0,1,0,1,0,0,
0,1,1,1,1,1,1,0,
0,0,1,0,1,0,0,0,
0,0,1,0,1,0,0,0,
0,0,1,0,1,0,0,0,
1,1,1,1,1,1,0,0,
0,1,0,1,0,0,0,0,
0,1,0,1,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[36]={
0,0,0,1,0,0,0,0,
0,0,1,1,1,0,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,0,0,0,
0,0,1,1,1,0,0,0,
0,0,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,0,1,1,1,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[37]={
0,1,0,0,0,0,0,0,
1,0,1,0,0,0,1,0,
0,1,0,0,0,1,0,0,
0,0,0,0,1,0,0,0,
0,0,0,1,0,0,0,0,
0,0,1,0,0,0,0,0,
0,1,0,0,0,1,0,0,
1,0,0,0,1,0,1,0,
0,0,0,0,0,1,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[38]={
0,0,1,1,0,0,0,0,
0,1,0,0,0,0,0,0,
0,1,0,0,0,0,0,0,
0,0,1,0,0,0,0,0,
0,1,1,0,0,0,0,0,
1,0,0,1,0,0,1,0,
1,0,0,1,0,1,0,0,
1,0,0,0,1,0,0,0,
0,1,1,1,0,1,1,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[39]={
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[40]={
0,0,0,0,1,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,0,1,0,0,0}
Courier_size11[41]={
0,0,1,0,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,1,0,0,0,0,0}
Courier_size11[42]={
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,1,1,0,1,1,0,0,
0,0,1,1,1,0,0,0,
1,1,1,1,1,1,1,0,
0,0,1,1,1,0,0,0,
0,1,1,0,1,1,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[43]={
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
1,1,1,1,1,1,1,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[44]={
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[45]={
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
1,1,1,1,1,1,1,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[46]={
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[47]={
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,1,0,
0,0,0,0,0,1,0,0,
0,0,0,0,1,0,0,0,
0,0,0,1,0,0,0,0,
0,0,1,0,0,0,0,0,
0,1,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[48]={
0,0,1,1,1,0,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,0,1,1,1,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[49]={
0,0,0,1,0,0,0,0,
0,1,1,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,1,1,1,1,1,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[50]={
0,0,1,1,1,0,0,0,
0,1,0,0,0,1,0,0,
0,0,0,0,0,1,0,0,
0,0,0,0,0,1,0,0,
0,0,0,0,1,0,0,0,
0,0,0,1,0,0,0,0,
0,0,1,0,0,0,0,0,
0,1,0,0,0,0,0,0,
0,1,1,1,1,1,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[51]={
0,0,1,1,1,0,0,0,
0,1,0,0,0,1,0,0,
0,0,0,0,0,1,0,0,
0,0,0,0,0,1,0,0,
0,0,0,1,1,0,0,0,
0,0,0,0,0,1,0,0,
0,0,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,0,1,1,1,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[52]={
0,0,0,0,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,1,0,1,0,0,0,
0,0,1,0,1,0,0,0,
0,1,0,0,1,0,0,0,
0,1,1,1,1,1,0,0,
0,0,0,0,1,0,0,0,
0,0,0,1,1,1,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[53]={
0,1,1,1,1,1,0,0,
0,1,0,0,0,0,0,0,
0,1,0,0,0,0,0,0,
0,1,0,0,0,0,0,0,
0,1,1,1,1,0,0,0,
0,0,0,0,0,1,0,0,
0,0,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,0,1,1,1,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[54]={
0,0,0,1,1,0,0,0,
0,0,1,0,0,0,0,0,
0,1,0,0,0,0,0,0,
0,1,0,0,0,0,0,0,
0,1,1,1,1,0,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,0,1,1,1,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[55]={
0,1,1,1,1,1,0,0,
0,1,0,0,0,1,0,0,
0,0,0,0,0,1,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[56]={
0,0,1,1,1,0,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,0,1,1,1,0,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,0,1,1,1,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[57]={
0,0,1,1,1,0,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,0,1,1,1,1,0,0,
0,0,0,0,0,1,0,0,
0,0,0,0,0,1,0,0,
0,0,0,0,1,0,0,0,
0,0,1,1,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[58]={
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[59]={
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[60]={
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,1,0,0,0,0,
0,0,1,0,0,0,0,0,
0,1,0,0,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[61]={
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,1,1,1,1,1,0,0,
0,0,0,0,0,0,0,0,
0,1,1,1,1,1,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[62]={
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,0,1,0,0,
0,0,0,0,1,0,0,0,
0,0,0,1,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[63]={
0,0,1,1,1,0,0,0,
0,1,0,0,0,1,0,0,
0,0,0,0,0,1,0,0,
0,0,0,0,0,1,0,0,
0,0,0,0,1,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[64]={
0,0,1,1,1,1,0,0,
0,1,0,0,0,0,1,0,
1,0,0,1,1,0,1,0,
1,0,1,0,1,0,1,0,
1,0,1,0,1,0,1,0,
1,0,1,0,1,0,1,0,
1,0,0,1,1,1,0,0,
0,1,0,0,0,0,0,0,
0,0,1,1,1,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[65]={
0,0,1,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,1,0,1,0,0,0,
0,0,1,0,1,0,0,0,
0,1,0,0,0,1,0,0,
0,1,1,1,1,1,0,0,
0,1,0,0,0,1,0,0,
1,1,1,0,1,1,1,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[66]={
1,1,1,1,1,1,0,0,
0,1,0,0,0,0,1,0,
0,1,0,0,0,0,1,0,
0,1,0,0,0,0,1,0,
0,1,1,1,1,1,0,0,
0,1,0,0,0,0,1,0,
0,1,0,0,0,0,1,0,
0,1,0,0,0,0,1,0,
1,1,1,1,1,1,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[67]={
0,0,1,1,1,1,0,0,
0,1,0,0,0,0,1,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
0,1,0,0,0,0,1,0,
0,0,1,1,1,1,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[68]={
1,1,1,1,1,0,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,0,1,0,
0,1,0,0,0,0,1,0,
0,1,0,0,0,0,1,0,
0,1,0,0,0,0,1,0,
0,1,0,0,0,0,1,0,
0,1,0,0,0,1,0,0,
1,1,1,1,1,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[69]={
1,1,1,1,1,1,1,0,
0,1,0,0,0,0,1,0,
0,1,0,0,0,0,0,0,
0,1,0,0,1,0,0,0,
0,1,1,1,1,0,0,0,
0,1,0,0,1,0,0,0,
0,1,0,0,0,0,0,0,
0,1,0,0,0,0,1,0,
1,1,1,1,1,1,1,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[70]={
1,1,1,1,1,1,1,0,
0,1,0,0,0,0,1,0,
0,1,0,0,0,0,0,0,
0,1,0,0,1,0,0,0,
0,1,1,1,1,0,0,0,
0,1,0,0,1,0,0,0,
0,1,0,0,0,0,0,0,
0,1,0,0,0,0,0,0,
1,1,1,1,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[71]={
0,0,1,1,1,1,0,0,
0,1,0,0,0,0,1,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,1,1,1,0,
1,0,0,0,0,0,1,0,
0,1,0,0,0,0,1,0,
0,0,1,1,1,1,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[72]={
1,1,1,0,1,1,1,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,1,1,1,1,1,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
1,1,1,0,1,1,1,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[73]={
0,1,1,1,1,1,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,1,1,1,1,1,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[74]={
0,0,1,1,1,1,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,1,0,0,0,
1,0,0,0,1,0,0,0,
1,0,0,0,1,0,0,0,
0,1,1,1,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[75]={
1,1,1,0,0,1,1,0,
0,1,0,0,0,1,0,0,
0,1,0,0,1,0,0,0,
0,1,0,0,1,0,0,0,
0,1,0,1,0,0,0,0,
0,1,1,1,0,0,0,0,
0,1,0,0,1,0,0,0,
0,1,0,0,0,1,0,0,
1,1,1,0,0,1,1,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[76]={
1,1,1,1,1,0,0,0,
0,0,1,0,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,1,0,0,0,1,0,
1,1,1,1,1,1,1,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[77]={
1,1,0,0,0,1,1,0,
0,1,0,0,0,1,0,0,
0,1,1,0,1,1,0,0,
0,1,1,0,1,1,0,0,
0,1,0,1,0,1,0,0,
0,1,0,1,0,1,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
1,1,1,0,1,1,1,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[78]={
1,1,0,0,1,1,1,0,
0,1,0,0,0,1,0,0,
0,1,1,0,0,1,0,0,
0,1,1,0,0,1,0,0,
0,1,0,1,0,1,0,0,
0,1,0,0,1,1,0,0,
0,1,0,0,1,1,0,0,
0,1,0,0,0,1,0,0,
1,1,1,0,0,1,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[79]={
0,0,1,1,1,0,0,0,
0,1,0,0,0,1,0,0,
1,0,0,0,0,0,1,0,
1,0,0,0,0,0,1,0,
1,0,0,0,0,0,1,0,
1,0,0,0,0,0,1,0,
1,0,0,0,0,0,1,0,
0,1,0,0,0,1,0,0,
0,0,1,1,1,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[80]={
1,1,1,1,1,1,0,0,
0,1,0,0,0,0,1,0,
0,1,0,0,0,0,1,0,
0,1,0,0,0,0,1,0,
0,1,1,1,1,1,0,0,
0,1,0,0,0,0,0,0,
0,1,0,0,0,0,0,0,
0,1,0,0,0,0,0,0,
1,1,1,1,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[81]={
0,0,1,1,1,0,0,0,
0,1,0,0,0,1,0,0,
1,0,0,0,0,0,1,0,
1,0,0,0,0,0,1,0,
1,0,0,0,0,0,1,0,
1,0,0,0,0,0,1,0,
1,0,0,0,0,0,1,0,
0,1,0,0,0,1,0,0,
0,0,1,1,1,0,0,0,
0,0,1,1,0,1,1,0,
0,0,0,0,0,0,0,0}
Courier_size11[82]={
1,1,1,1,1,1,0,0,
0,1,0,0,0,0,1,0,
0,1,0,0,0,0,1,0,
0,1,0,0,0,0,1,0,
0,1,1,1,1,1,0,0,
0,1,0,0,1,0,0,0,
0,1,0,0,1,0,0,0,
0,1,0,0,0,1,0,0,
1,1,1,0,0,1,1,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[83]={
0,1,1,1,1,1,0,0,
1,0,0,0,0,0,1,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
0,1,1,1,1,1,0,0,
0,0,0,0,0,0,1,0,
0,0,0,0,0,0,1,0,
1,0,0,0,0,0,1,0,
0,1,1,1,1,1,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[84]={
1,1,1,1,1,1,1,0,
1,0,0,1,0,0,1,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,1,1,1,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[85]={
1,1,1,0,1,1,1,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,0,1,1,1,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[86]={
1,1,1,0,1,1,1,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,0,1,0,1,0,0,0,
0,0,1,0,1,0,0,0,
0,0,1,0,1,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[87]={
1,1,1,0,1,1,1,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,1,0,1,0,1,0,0,
0,1,0,1,0,1,0,0,
0,1,0,1,0,1,0,0,
0,0,1,0,1,0,0,0,
0,0,1,0,1,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[88]={
1,1,1,0,1,1,1,0,
0,1,0,0,0,1,0,0,
0,0,1,0,1,0,0,0,
0,0,1,0,1,0,0,0,
0,0,0,1,0,0,0,0,
0,0,1,0,1,0,0,0,
0,0,1,0,1,0,0,0,
0,1,0,0,0,1,0,0,
1,1,1,0,1,1,1,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[89]={
1,1,1,0,1,1,1,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,0,1,0,1,0,0,0,
0,0,1,0,1,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,1,1,1,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[90]={
1,1,1,1,1,1,1,0,
1,0,0,0,0,1,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,1,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,1,0,0,0,0,0,
0,1,0,0,0,0,1,0,
1,1,1,1,1,1,1,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[91]={
0,0,1,1,1,0,0,0,
0,0,1,0,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,1,1,1,0,0,0}
Courier_size11[92]={
0,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
0,1,0,0,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,0,1,0,0,
0,0,0,0,0,0,1,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[93]={
0,0,1,1,1,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,1,0,0,0,
0,0,1,1,1,0,0,0}
Courier_size11[94]={
0,0,0,1,0,0,0,0,
0,0,1,0,1,0,0,0,
0,1,0,0,0,1,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[95]={
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
1,1,1,1,1,1,1,0}
Courier_size11[96]={
0,0,1,0,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[97]={
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,1,1,1,1,0,0,0,
0,0,0,0,0,1,0,0,
0,1,1,1,1,1,0,0,
1,0,0,0,0,1,0,0,
1,0,0,0,0,1,0,0,
0,1,1,1,1,0,1,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[98]={
1,1,0,0,0,0,0,0,
0,1,0,0,0,0,0,0,
0,1,0,0,0,0,0,0,
0,1,1,1,1,1,0,0,
0,1,0,0,0,0,1,0,
0,1,0,0,0,0,1,0,
0,1,0,0,0,0,1,0,
0,1,0,0,0,0,1,0,
1,1,1,1,1,1,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[99]={
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,1,1,1,1,1,0,0,
1,0,0,0,0,0,1,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,1,0,
0,1,1,1,1,1,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[100]={
0,0,0,0,1,1,0,0,
0,0,0,0,0,1,0,0,
0,0,0,0,0,1,0,0,
0,1,1,1,1,1,0,0,
1,0,0,0,0,1,0,0,
1,0,0,0,0,1,0,0,
1,0,0,0,0,1,0,0,
1,0,0,0,0,1,0,0,
0,1,1,1,1,1,1,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[101]={
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,1,1,1,1,1,0,0,
1,0,0,0,0,0,1,0,
1,1,1,1,1,1,1,0,
1,0,0,0,0,0,0,0,
1,0,0,0,0,0,1,0,
0,1,1,1,1,1,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[102]={
0,0,0,1,1,0,0,0,
0,0,1,0,0,0,0,0,
0,0,1,0,0,0,0,0,
0,1,1,1,1,0,0,0,
0,0,1,0,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,1,0,0,0,0,0,
0,1,1,1,1,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[103]={
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,1,1,1,1,1,1,0,
1,0,0,0,0,1,0,0,
1,0,0,0,0,1,0,0,
1,0,0,0,0,1,0,0,
0,1,1,1,1,1,0,0,
0,0,0,0,0,1,0,0,
0,0,0,0,0,1,0,0,
0,1,1,1,1,0,0,0}
Courier_size11[104]={
1,1,0,0,0,0,0,0,
0,1,0,0,0,0,0,0,
0,1,0,0,0,0,0,0,
0,1,0,1,1,0,0,0,
0,1,1,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
1,1,1,0,1,1,1,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[105]={
0,0,0,1,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,1,1,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,1,1,1,1,1,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[106]={
0,0,0,0,1,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,1,1,1,1,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,1,0,0,0,
0,0,0,0,1,0,0,0,
0,1,1,1,0,0,0,0}
Courier_size11[107]={
1,1,0,0,0,0,0,0,
0,1,0,0,0,0,0,0,
0,1,0,0,0,0,0,0,
0,1,0,0,1,1,0,0,
0,1,0,0,1,0,0,0,
0,1,0,1,0,0,0,0,
0,1,1,1,0,0,0,0,
0,1,0,0,1,0,0,0,
1,1,0,0,0,1,1,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[108]={
0,0,1,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,1,1,1,1,1,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[109]={
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
1,1,1,0,1,0,0,0,
0,1,0,1,0,1,0,0,
0,1,0,1,0,1,0,0,
0,1,0,1,0,1,0,0,
0,1,0,1,0,1,0,0,
1,1,0,1,0,1,1,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[110]={
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
1,1,0,1,1,0,0,0,
0,1,1,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
1,1,1,0,1,1,1,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[111]={
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,1,1,1,1,1,0,0,
1,0,0,0,0,0,1,0,
1,0,0,0,0,0,1,0,
1,0,0,0,0,0,1,0,
1,0,0,0,0,0,1,0,
0,1,1,1,1,1,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[112]={
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
1,1,1,1,1,1,0,0,
0,1,0,0,0,0,1,0,
0,1,0,0,0,0,1,0,
0,1,0,0,0,0,1,0,
0,1,0,0,0,0,1,0,
0,1,1,1,1,1,0,0,
0,1,0,0,0,0,0,0,
1,1,1,0,0,0,0,0}
Courier_size11[113]={
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,1,1,1,1,1,1,0,
1,0,0,0,0,1,0,0,
1,0,0,0,0,1,0,0,
1,0,0,0,0,1,0,0,
1,0,0,0,0,1,0,0,
0,1,1,1,1,1,0,0,
0,0,0,0,0,1,0,0,
0,0,0,0,1,1,1,0}
Courier_size11[114]={
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
1,1,1,0,1,1,0,0,
0,0,1,1,0,0,1,0,
0,0,1,0,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,1,0,0,0,0,0,
1,1,1,1,1,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[115]={
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,1,1,1,1,1,0,0,
1,0,0,0,0,0,1,0,
0,1,1,1,0,0,0,0,
0,0,0,0,1,1,0,0,
1,0,0,0,0,0,1,0,
0,1,1,1,1,1,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[116]={
0,0,0,0,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,1,0,0,0,0,0,
0,1,1,1,1,0,0,0,
0,0,1,0,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,1,0,0,0,0,0,
0,0,1,0,0,1,0,0,
0,0,0,1,1,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[117]={
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
1,1,0,0,1,1,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,1,0,0,1,1,0,0,
0,0,1,1,0,1,1,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[118]={
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
1,1,1,0,1,1,1,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,0,1,0,1,0,0,0,
0,0,1,0,1,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[119]={
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
1,1,1,0,1,1,1,0,
0,1,0,0,0,1,0,0,
0,1,0,1,0,1,0,0,
0,1,0,1,0,1,0,0,
0,0,1,0,1,0,0,0,
0,0,1,0,1,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[120]={
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
1,1,1,0,1,1,1,0,
0,1,0,0,0,1,0,0,
0,0,1,1,1,0,0,0,
0,0,1,1,1,0,0,0,
0,1,0,0,0,1,0,0,
1,1,1,0,1,1,1,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[121]={
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
1,1,1,0,1,1,1,0,
0,1,0,0,0,1,0,0,
0,1,0,0,0,1,0,0,
0,0,1,0,1,0,0,0,
0,0,1,0,1,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,1,1,0,0,0,0,0}
Courier_size11[122]={
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
1,1,1,1,1,1,0,0,
1,0,0,0,1,0,0,0,
0,0,0,1,0,0,0,0,
0,0,1,0,0,0,0,0,
0,1,0,0,0,1,0,0,
1,1,1,1,1,1,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}
Courier_size11[123]={
0,0,0,0,1,1,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,1,1,0,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,0,1,1,0,0}
Courier_size11[124]={
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0}
Courier_size11[125]={
0,1,1,0,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,0,1,1,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,1,1,0,0,0,0,0}
Courier_size11[126]={
0,0,0,0,0,0,0,0,
0,1,1,0,0,0,1,0,
1,0,0,1,0,0,1,0,
1,0,0,0,1,1,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0}

local function get_file_pos(image_height, image_width, x, y)
	return 54 +(image_height -y)*(image_width*3 +image_width%4) +(x-1)*3
end

local function draw_dot(red, green, blue, file, image_height, image_width, x, y)
	if ((y+3) < image_height) and ((x+3) < image_width) and ((y-2) > 0) and ((x-2) > 0) then
		file:seek("set", get_file_pos(image_height, image_width, x, y))
		file:write(string.char(blue) .. string.char(green) .. string.char(red))
		file:seek("set", get_file_pos(image_height, image_width, x, y+1))
		file:write(string.char(blue) .. string.char(green) .. string.char(red))
		file:seek("set", get_file_pos(image_height, image_width, x+1, y))
		file:write(string.char(blue) .. string.char(green) .. string.char(red))
		file:seek("set", get_file_pos(image_height, image_width, x+1, y+1))
		file:write(string.char(blue) .. string.char(green) .. string.char(red))
		file:seek("set", get_file_pos(image_height, image_width, x, y-1))
		file:write(string.char(blue) .. string.char(green) .. string.char(red))
		file:seek("set", get_file_pos(image_height, image_width, x, y-2))
		file:write(string.char(blue) .. string.char(green) .. string.char(red))
		file:seek("set", get_file_pos(image_height, image_width, x, y+2))
		file:write(string.char(blue) .. string.char(green) .. string.char(red))
		file:seek("set", get_file_pos(image_height, image_width, x, y+3))
		file:write(string.char(blue) .. string.char(green) .. string.char(red))
		file:seek("set", get_file_pos(image_height, image_width, x+1, y-1))
		file:write(string.char(blue) .. string.char(green) .. string.char(red))
		file:seek("set", get_file_pos(image_height, image_width, x+1, y-2))
		file:write(string.char(blue) .. string.char(green) .. string.char(red))
		file:seek("set", get_file_pos(image_height, image_width, x+1, y+2))
		file:write(string.char(blue) .. string.char(green) .. string.char(red))
		file:seek("set", get_file_pos(image_height, image_width, x+1, y+3))
		file:write(string.char(blue) .. string.char(green) .. string.char(red))
		file:seek("set", get_file_pos(image_height, image_width, x-1, y))
		file:write(string.char(blue) .. string.char(green) .. string.char(red))
		file:seek("set", get_file_pos(image_height, image_width, x-2, y))
		file:write(string.char(blue) .. string.char(green) .. string.char(red))
		file:seek("set", get_file_pos(image_height, image_width, x+2, y))
		file:write(string.char(blue) .. string.char(green) .. string.char(red))
		file:seek("set", get_file_pos(image_height, image_width, x+3, y))
		file:write(string.char(blue) .. string.char(green) .. string.char(red))
		file:seek("set", get_file_pos(image_height, image_width, x-1, y+1))
		file:write(string.char(blue) .. string.char(green) .. string.char(red))
		file:seek("set", get_file_pos(image_height, image_width, x-2, y+1))
		file:write(string.char(blue) .. string.char(green) .. string.char(red))
		file:seek("set", get_file_pos(image_height, image_width, x+2, y+1))
		file:write(string.char(blue) .. string.char(green) .. string.char(red))
		file:seek("set", get_file_pos(image_height, image_width, x+3, y+1))
		file:write(string.char(blue) .. string.char(green) .. string.char(red))
		file:seek("set", get_file_pos(image_height, image_width, x-1, y-1))
		file:write(string.char(blue) .. string.char(green) .. string.char(red))
		file:seek("set", get_file_pos(image_height, image_width, x+2, y-1))
		file:write(string.char(blue) .. string.char(green) .. string.char(red))
		file:seek("set", get_file_pos(image_height, image_width, x+2, y+2))
		file:write(string.char(blue) .. string.char(green) .. string.char(red))
		file:seek("set", get_file_pos(image_height, image_width, x-1, y+2))
		file:write(string.char(blue) .. string.char(green) .. string.char(red))
	end
end

local function draw_string(text, font, file, image_height, image_width, x_pos, y_pos)
	for i=1, string.len(text) do
		local character = string.byte(string.sub(text, i, i))
		if character < 32 or character > 126 then
			character = 63 --if it's an unknown character, replace with "?"
		end
		
		local pixel_index = 1
		for y=1, font_height do
			for x=1, font_width do
				if font[character][pixel_index] == 1 then
					if ((y_pos +y) < image_height) and ((x_pos +x) < image_width) then --failsafe in case of attempt of drawing out of bounds
						file:seek("set", get_file_pos(image_height, image_width, x_pos +x, y_pos +y))
						file:write(string.char(0x00) .. string.char(0x00) .. string.char(0x00))
					end
				end
				pixel_index = pixel_index +1
			end
		end
		x_pos = x_pos +font_width
	end
end

local function fill_color(red, green, blue, file, image_height, image_width, x_start, y_start, x_dist, y_dist)
	for y=1, y_dist do
		for x=1, x_dist do
			if ((y_start +y) <= image_height) and ((x_start +x) <= image_width) then --failsafe in case of attempt of drawing out of bounds
				file:seek("set", get_file_pos(image_height, image_width, x_start +x, y_start +y))
				file:write(string.char(blue) .. string.char(green) .. string.char(red))
			end
		end
	end
end

local function draw_line(red, green, blue, file, image_height, image_width, x0, y0, x1, y1)
	local dx = x1 - x0;
	local dy = y1 - y0;
	local stepx, stepy
	
	if dy < 0 then
		dy = -dy
		stepy = -1
	else
		stepy = 1
	end
	
	if dx < 0 then
		dx = -dx
		stepx = -1
	else
		stepx = 1
	end
	
	draw_dot(red, green, blue, file, image_height, image_width, x0, y0)
	
	if dx > dy then
		local fraction = dy - bit.rshift(dx, 1)
		while x0 ~= x1 do
			if fraction >= 0 then
				y0 = y0 + stepy
				fraction = fraction - dx
			end
			x0 = x0 + stepx
			fraction = fraction + dy
			if (y0 < image_height) and (x0 < image_width) then --failsafe in case of attempt of drawing out of bounds
				if stepy == 1 then
					file:seek("set", get_file_pos(image_height, image_width, x0, y0))
					file:write(string.char(blue) .. string.char(green) .. string.char(red))
					file:seek("set", get_file_pos(image_height, image_width, x0+1, y0+1))
					file:write(string.char(blue) .. string.char(green) .. string.char(red))
					file:seek("set", get_file_pos(image_height, image_width, x0, y0+1))
					file:write(string.char(blue) .. string.char(green) .. string.char(red))
				else
					file:seek("set", get_file_pos(image_height, image_width, x0+1, y0))
					file:write(string.char(blue) .. string.char(green) .. string.char(red))
					file:seek("set", get_file_pos(image_height, image_width, x0, y0+1))
					file:write(string.char(blue) .. string.char(green) .. string.char(red))
					file:seek("set", get_file_pos(image_height, image_width, x0, y0))
					file:write(string.char(blue) .. string.char(green) .. string.char(red))
				end
			end
		end
	else
		local fraction = dx - bit.rshift(dy, 1)
		while y0 ~= y1 do
			if fraction >= 0 then
				x0 = x0 + stepx
				fraction = fraction - dy
			end
			y0 = y0 + stepy
			fraction = fraction + dx
			if (y0 < image_height) and (x0 < image_width) then --failsafe in case of attempt of drawing out of bounds
				if stepy == 1 then
					file:seek("set", get_file_pos(image_height, image_width, x0, y0))
					file:write(string.char(blue) .. string.char(green) .. string.char(red))
					file:seek("set", get_file_pos(image_height, image_width, x0+1, y0+1))
					file:write(string.char(blue) .. string.char(green) .. string.char(red))
					file:seek("set", get_file_pos(image_height, image_width, x0+1, y0))
					file:write(string.char(blue) .. string.char(green) .. string.char(red))
				else
					file:seek("set", get_file_pos(image_height, image_width, x0+1, y0))
					file:write(string.char(blue) .. string.char(green) .. string.char(red))
					file:seek("set", get_file_pos(image_height, image_width, x0, y0+1))
					file:write(string.char(blue) .. string.char(green) .. string.char(red))
					file:seek("set", get_file_pos(image_height, image_width, x0, y0))
					file:write(string.char(blue) .. string.char(green) .. string.char(red))
				end
			end
		end
	end
end

function export_treeview()
	local horizontal_span =  8
	local vertical_span   =  8
	local line_span	   =  2
	
	local title = "DankBot Treeview v1.1 by ThunderAxe31"
	
	local columns_title = {}
	for i=1, #state do
		columns_title[i] = {}
		columns_title[i]["action"] = "Action " .. i
		columns_title[i]["type"] = "Type: " .. action[i].func.name
		columns_title[i]["date"] = state[i]["date"]
		for z=1, #state[i] do
			columns_title[i][z] = "Alt " .. z .. " (" .. #state[i][z] .. "/" .. (action[i][z]["custom_states"] or global_max_states) .. ")"
		end
	end
	
	local time_unit = "Frame: "
	if get_emu_time == emu.totalexecutedcycles then
		time_unit = "Cycle: "
	end
	local min_wait  = 0
	local cells = {}
	for x=1, #state do	
		cells[x] = {}
		for z=1, #state[x] do
			cells[x][z] = {}
			local current_wait  = 0
			local states_copied = 1
			while states_copied <= #state[x][z] do
				for i=1, #state[x][z] do
					if current_wait == state[x][z][i]["wait"] then
						cells[x][z][states_copied] = {}
						cells[x][z][states_copied][1] = "State " .. x .. "-" .. z .. "-" .. i
						cells[x][z][states_copied][2] = "Wait: "  .. state[x][z][i]["wait"]
						cells[x][z][states_copied][3] = time_unit .. state[x][z][i]["cycle"]
						cells[x][z][states_copied][4] = "RNG: "   .. string.format("%X", state[x][z][i]["rng"])
						cells[x][z][states_copied]["cycle"] = state[x][z][i]["cycle"]
						cells[x][z][states_copied]["wait"]  = state[x][z][i]["wait"]
						cells[x][z][states_copied]["origin"] = {z, i}
						cells[x][z][states_copied]["parent"] = state[x][z][i]["parent"]
						states_copied = states_copied +1
					end
				end
				current_wait = current_wait +1
			end
		end
	end
	
	local row1_width  = string.len(title)*font_width +horizontal_span*2
	
	local columns1_width = {}
	for i=1, #columns_title do
		columns1_width[i] = math.max(
		string.len(columns_title[i]["action"]),
		string.len(columns_title[i]["type"]),
		string.len(columns_title[i]["date"])
		)*font_width +horizontal_span*2
	end
	local row2_width = 0
	for i=1, #columns1_width do
		row2_width = row2_width +columns1_width[i]
	end
	
	local columns2_width = {}
	for x=1, #cells do
		for z=1, #cells[x] do
			columns2_width[x] = 0
			for i=1, #state[x][z] do
				columns2_width[x] = math.max(math.max(string.len(cells[x][z][i][1]),string.len(cells[x][z][i][2]),string.len(cells[x][z][i][3]),string.len(cells[x][z][i][4]))*font_width +horizontal_span*2,columns2_width[x])
			end
			columns2_width[x] = math.max(string.len(columns_title[x][z])*font_width +horizontal_span*2, columns2_width[x])
		end
	end
	local row3_width = 0
	for i=1, #state do
		row3_width = row3_width +columns2_width[i]
	end
	
	
	local row1_height = vertical_span*2 +font_height
	local row2_height = vertical_span*2 +font_height*3 +line_span*2
	local row3_height = 0
	local columns_height = {}
	for x=1, #cells do
		columns_height[x] = 0
		for z=1, #cells[x] do
			columns_height[x] = columns_height[x] +vertical_span*2 +font_height
			for i=1, #state[x][z] do
				columns_height[x] = columns_height[x] +vertical_span*2 +font_height*4 +line_span*3
			end
		end
		row3_height = math.max(columns_height[x], row3_height)
	end
	
	--this is where it begins writing the file
	local image_width  = math.max(row1_width, row2_width, row3_width)
	local image_height = row1_height +row2_height +row3_height
	
	--first off, delete existing file by overiting with an empty string
	local file_img = io.open("Treeview.bmp", "w")
	if not file_img then
		return false
	end
	io.output(file_img)
	if not io.write("") then
		if file_img then
			io.close(file_img)
		end
		return false
	end
	if file_img then
		io.close(file_img)
	end
	
	--open the file again, but this time in append mode
	file_img = io.open("Treeview.bmp", "ab")
	if not file_img then
		return false
	end
	io.output(file_img)
	
	--now, write the .bmp header
	local bit_and = bit.band or AND
	
	local row_padding = image_width%4
	local row_padding_data = ""
	for i=1, row_padding do
		row_padding_data = row_padding_data .. "\0"
	end
	
	local bitmap_width_byte1  = bit_and(image_width, 0x000000FF)
	local bitmap_width_byte2  = bit_and(image_width, 0x0000FF00)     /0x100
	local bitmap_width_byte3  = bit_and(image_width, 0x00FF0000)   /0x10000
	local bitmap_width_byte4  = bit_and(image_width, 0xFF000000) /0x1000000
	
	local bitmap_height_byte1 = bit_and(image_height, 0x000000FF)
	local bitmap_height_byte2 = bit_and(image_height, 0x0000FF00)     /0x100
	local bitmap_height_byte3 = bit_and(image_height, 0x00FF0000)   /0x10000
	local bitmap_height_byte4 = bit_and(image_height, 0xFF000000) /0x1000000
	
	local bitmap_size = (image_width*3 +row_padding) *image_height
	local bitmap_size_byte1 = bit_and(bitmap_size, 0x000000FF)
	local bitmap_size_byte2 = bit_and(bitmap_size, 0x0000FF00)     /0x100
	local bitmap_size_byte3 = bit_and(bitmap_size, 0x00FF0000)   /0x10000
	local bitmap_size_byte4 = bit_and(bitmap_size, 0xFF000000) /0x1000000
	
	local file_size = bitmap_size +54
	local file_size_byte1 = bit_and(file_size, 0x000000FF)
	local file_size_byte2 = bit_and(file_size, 0x0000FF00)     /0x100
	local file_size_byte3 = bit_and(file_size, 0x00FF0000)   /0x10000
	local file_size_byte4 = bit_and(file_size, 0xFF000000) /0x1000000
	
	if not io.write(
	"BM" .. string.char(file_size_byte1) .. string.char(file_size_byte2) .. string.char(file_size_byte3) .. string.char(file_size_byte4)
	.. "\0\0\0\0\54\0\0\0\40\0\0\0" ..
	string.char(bitmap_width_byte1) .. string.char(bitmap_width_byte2) .. string.char(bitmap_width_byte3) .. string.char(bitmap_width_byte4) ..
	string.char(bitmap_height_byte1) .. string.char(bitmap_height_byte2) .. string.char(bitmap_height_byte3) .. string.char(bitmap_height_byte4) ..
	"\1\0\24\0\0\0\0\0" ..
	string.char(bitmap_size_byte1) .. string.char(bitmap_size_byte2) .. string.char(bitmap_size_byte3) .. string.char(bitmap_size_byte4) ..
	"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0") then
		if file_img then
			io.close(file_img)
		end
		return false
	end
	
	--for now, save a blank canvas on disk
	for y=image_height, 1, -1 do
		for x=1, image_width do
			if not io.write(string.char(0xFF) .. string.char(0xFF) .. string.char(0xFF)) then
				if file_img then
					io.close(file_img)
				end
				return false
			end
		end
		if not io.write(row_padding_data) then
			if file_img then
				io.close(file_img)
			end
			return false
		end
	end
	if file_img then
		io.close(file_img)
	end
	
	--we now open the file again for overwriting the pixels directely into the bitmap of the file
	file_img = io.open("Treeview.bmp", "rb+")
	if not file_img then
		return false
	end
	
	--we adjust the column width, in case the top caption is so long to cause the overall table to horizontally enlarge
	local new_column_width = math.floor(image_width/#columns_title)
	for i=1, #columns1_width do
		columns1_width[i] = math.max(columns1_width[i], columns2_width[i], new_column_width)
		columns2_width[i] = math.max(columns1_width[i], columns2_width[i], new_column_width)
	end
	
	
	draw_string(title,Courier_size11,file_img,image_height,image_width,
	math.floor(image_width/2 -(string.len(title)*font_width)/2),
	math.floor(row1_height/2 -font_height/2))
	
	local column_offset = 0
	for i=1, #columns_title do
		local row_offset = row1_height
		draw_string(columns_title[i]["action"],Courier_size11,file_img,image_height,image_width,
		math.floor(columns1_width[i]/2 -(string.len(columns_title[i]["action"])*font_width)/2) +column_offset,
		math.floor(row2_height/2 -font_height/2 -font_height -line_span) +row_offset)
		draw_string(columns_title[i]["type"],Courier_size11,file_img,image_height,image_width,
		math.floor(columns1_width[i]/2 -(string.len(columns_title[i]["type"])*font_width)/2) +column_offset,
		math.floor(row2_height/2 -font_height/2) +row_offset)
		draw_string(columns_title[i]["date"],Courier_size11,file_img,image_height,image_width,
		math.floor(columns1_width[i]/2 -(string.len(columns_title[i]["date"])*font_width)/2) +column_offset,
		math.floor(row2_height/2 -font_height/2 +font_height +line_span) +row_offset)
		
		row_offset = row_offset +row2_height
		
		for z=1, #columns_title[i] do
			row_offset = row_offset +vertical_span*2 +font_height
			
			for x=1, #cells[i][z] do
				local new_red   = 0
				local new_green = 0
				local new_blue  = 0
				if cells[i][z][x]["wait"] < 17 then
					new_red   =   0
					new_green = 255
					new_blue  = 255 -cells[i][z][x]["wait"]*15
				elseif cells[i][z][x]["wait"] < 34 then
					new_red   = cells[i][z][x]["wait"]*15 -255
					new_green = 255
					new_blue  =   0
				else
					new_red   = 255
					new_green = math.max(0, 765 -cells[i][z][x]["wait"]*15)
					new_blue  =   0
				end
				fill_color(new_red, new_green, new_blue, file_img,image_height,image_width,
				column_offset, row_offset, columns1_width[i], vertical_span*2 +font_height*4 +line_span*3)
				
				cells[i][z][x]["x_center"] = math.floor(column_offset+columns1_width[i]/2)
				cells[i][z][x]["y_center"] = math.floor(row_offset+(vertical_span*2 +font_height*4 +line_span*3)/2)
				
				row_offset = row_offset +vertical_span*2 +font_height*4 +line_span*3
			end
		end
		
		column_offset = column_offset +columns1_width[i] -- -horizontal_span/2 --add this to lessen the in-between-span
	end
	
	local fastest = {1, 1}
	local fastest_cycle = cells[#cells][1][1]["cycle"]
	for z=1, #cells[#cells] do
		for i=1, #cells[#cells][z] do
			if cells[#cells][z][i]["cycle"] < fastest_cycle then
				fastest = {z, i}
				fastest_cycle = cells[#cells][z][i]["cycle"]
			end
		end
	end
	cells[#cells][fastest[1]][fastest[2]]["fastest"] = true
	
	for x=#cells, 2, -1 do
		for z=1, #cells[x] do
			for i=1, #cells[x][z] do
				local new_red   = 0xC0
				local new_green = 0xC0
				local new_blue  = 0xC0
				if cells[x][z][i]["fastest"] then
					new_red   = 0x60
					new_green = 0xA0
					new_blue  = 0xFF
				end
				
				local x2 = 0
				local y2 = 0
				
				for z2=1, #cells[x-1] do 
					for i2=1, #cells[x-1][z2] do --search for the parent... yeah it's a crappy solution, but it works...
						if (cells[x-1][z2][i2]["origin"][1] == cells[x][z][i]["parent"][1]) and
						   (cells[x-1][z2][i2]["origin"][2] == cells[x][z][i]["parent"][2]) then
							x2 = cells[x-1][z2][i2]["x_center"]
							y2 = cells[x-1][z2][i2]["y_center"]
							if cells[x][z][i]["fastest"] then
								cells[x-1][z2][i2]["fastest"] = true
							end
							--let's get out of there.
							z2 = #cells[x-1]+1
							break
						end
					end
				end
				draw_line(new_red, new_green, new_blue, file_img, image_height, image_width,
				cells[x][z][i]["x_center"], cells[x][z][i]["y_center"], x2, y2)
				
				draw_dot(new_red, new_green, new_blue, file_img, image_height, image_width, x2, y2)
			end
		end
	end
	
	column_offset = 0
	for i=1, #columns_title do
		local row_offset = row1_height
		
		row_offset = row_offset +row2_height
		
		for z=1, #columns_title[i] do
			draw_string(columns_title[i][z],Courier_size11,file_img,image_height,image_width,
			math.floor(columns1_width[i]/2 -(string.len(columns_title[i][z])*font_width)/2) +column_offset,
			vertical_span +row_offset)
			
			row_offset = row_offset +vertical_span*2 +font_height
			
			for x=1, #cells[i][z] do
				draw_string(cells[i][z][x][1],Courier_size11,file_img,image_height,image_width,
				math.floor(columns1_width[i]/2 -(string.len(cells[i][z][x][1])*font_width)/2) +column_offset,
				vertical_span +row_offset)
				draw_string(cells[i][z][x][2],Courier_size11,file_img,image_height,image_width,
				math.floor(columns1_width[i]/2 -(string.len(cells[i][z][x][2])*font_width)/2) +column_offset,
				vertical_span +font_height +line_span +row_offset)
				draw_string(cells[i][z][x][3],Courier_size11,file_img,image_height,image_width,
				math.floor(columns1_width[i]/2 -(string.len(cells[i][z][x][3])*font_width)/2) +column_offset,
				vertical_span +font_height*2 +line_span*2 +row_offset)
				draw_string(cells[i][z][x][4],Courier_size11,file_img,image_height,image_width,
				math.floor(columns1_width[i]/2 -(string.len(cells[i][z][x][4])*font_width)/2) +column_offset,
				vertical_span +font_height*3 +line_span*3 +row_offset)
				
				row_offset = row_offset +vertical_span*2 +font_height*4 +line_span*3
			end
		end
		
		column_offset = column_offset +columns1_width[i] -- -horizontal_span/2 --add this to lessen the in-between-span
	end
	
	if file_img then
		io.close(file_img)
	end
	return true
end

return true
