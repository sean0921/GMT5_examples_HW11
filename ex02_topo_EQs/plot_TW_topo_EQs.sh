#!/usr/bin/env bash
ps=TW_topo_EQs.ps
cpt=topo.cpt
cpt2=EQ.cpt
catalog=CWB_2016_2018_M2.catalog

# generate cpt file
gmt makecpt -Cearth -T-5000/5000/100 > $cpt
# plot topography
gmt grdimage ../TW_topo.grd -R118/123/21.5/26.5 -JM13 -BWeSn -Ba -C$cpt -P -X1 -Y1 -K > $ps
# plot the coast
gmt pscoast -R -JM -Df -W1 -K -O >> $ps
# plot the scale bar
gmt psscale -C$cpt -Dx14/0+w9/.5+e -Ba500+l"Elevation (m)" -O -K >> $ps
# plot Earthquakes
gmt makecpt -Cseis -T0/300/1 > $cpt2
awk '{print $8,$9,$10,$11/15}' ../CWB_2016_2018_M2.catalog | gmt psxy -R -JM -C$cpt2 -Sc -O >> $ps

