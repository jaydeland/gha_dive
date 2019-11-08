#!/bin/sh -l

export DIVE_REPORT_JSON='diveReport.json'
export DIVE_REPORT_TXT='diveReport.txt'

echo "Scanning Docker image: $1"

wget https://github.com/wagoodman/dive/releases/download/v0.8.1/dive_0.8.1_linux_amd64.deb
sudo apt install ./dive_0.8.1_linux_amd64.deb
rm dive_0.8.1_linux_amd64.deb*
dive --ci --highestWastedBytes "100000000" -j $DIVE_REPORT_JSON --highestUserWastedPercent "0.5" --lowestEfficiency "0.8" $1 | tee $DIVE_REPORT_TXT
echo ::set-output name=dive_report::$DIVE_REPORT_TXT
