#!/bin/sh
xinput --set-prop "ETPS/2 Elantech Touchpad" "Synaptics Tap Action"  2, 3, 0, 0, 1, 3, 0
xinput --set-prop "ETPS/2 Elantech Touchpad" "Synaptics Click Action" 1, 3, 2

#$B%?%C%A%Q%C%I$rL58z2=(B
#shft,ctrl,alt$B$G$OL58z2=$5$;$J$$(B(-K)
#$BDd;_;~4V$r(B1s$B$K(B(-i 1)
syndaemon -d -t -i 1 -K
