#!/usr/bin/env bash
ps=TW_focal.ps
cpt=topo.cpt
catalog=201807030920.list

# generate cpt file
gmt makecpt -Cearth -T-1000/1000/10 > $cpt
# plot topography
gmt grdimage ../TW_topo.grd -R120.70/121.10/23.00/23.40 -JM13 -BWeSn -Ba -C$cpt -P -X3 -Y10 -K > $ps
# plot the coast
gmt pscoast -R -JM -Df -W1 -K -O >> $ps
#plot faults
gmt psxy ../CGS_fault.gmt -R -JM -W2,250/0/0 -O -K >>$ps
# plot the scale bar
gmt psscale -C$cpt -Dx14/0+w9/.5+e -Ba100+l"Elevation (m)" -O -K >> $ps
# plot Earthquakes
awk '{print $8,$9,$11/12}' $catalog | gmt psxy -R -JM -Sc -K -O >> $ps
# plot focal mechanism
gmt psmeca 201807030920.foc -R -JM -Sa1.0/14p/6 -Gred -O >> $ps
