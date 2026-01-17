#!/bin/bash

WXINFO=$(~/.private/weather.wrapper.sh)

WX=$(echo ${WXINFO} | cut -f1 -d\|)
WXTMP=$(echo ${WXINFO} | cut -f2 -d\|)

echo "${WXTMP} ${WX}" 
