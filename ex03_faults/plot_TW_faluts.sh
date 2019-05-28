#!/usr/bin/env bash
ps=TW_faults.ps


# plot coast
gmt pscoast -R118/123/21.5/26.5 -JM15 -BWeSn -Ba -Df -W1 -P -X3 -Y10 -K > $ps

# plot faults
gmt psxy ../tai.prn_new_3d -R -JM -W1,100/100/100 -V -K -O >> $ps
gmt psxy ../CGS_fault.gmt -R -JM -W2,250/0/0 -O >>$ps



