#!/usr/bin/env bash

sudo sfdisk -u S /dev/sdb <<EOF
/dev/sdb1 : start=       63, size=  3903732, Id=82
/dev/sdb2 : start=  3903795, size=   385560, Id=83
/dev/sdb3 : start=  4289355, size= 39070080, Id=83
/dev/sdb4 : start= 43359435, size= 19555125, Id=83
EOF
