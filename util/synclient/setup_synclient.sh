#!/bin/bash
write_to_file() {

  if [ ! -f ~/.profile ] ; then
    touch ~/.profile
  fi

  echo "$1" >> ~/.profile;
}

content="

synclient TapAndDragGesture=0
synclient TapButton1=1
synclient TapButton2=3
synclient TapButton3=2
synclient FingerLow=10
synclient FingerHigh=35
synclient VertScrollDelta=-350
synclient HorizScrollDelta=-350
synclient RTCornerButton=0
synclient RBCornerButton=0
synclient LTCornerButton=0
synclient LBCornerButton=0
synclient PalmDetect=1
synclient MinSpeed=0.5
synclient MaxSpeed=1.7
synclient AccelFactor=0.05
synclient VertTwoFingerScroll=1
synclient HorizTwoFingerScroll=0

# (Optional) Enable Two-Finger Scrolling for SynPS/2 Synaptics TouchPad
synclient EmulateTwoFingerMinZ=4

# (Optional) Enable Two-Finger Scrolling for computer without synclient
# xinput --set-prop --type=int --format=32 "SynPS/2 Synaptics TouchPad" "Synaptics Two-Finger Pressure" 4
# xinput --set-prop --type=int --format=8 "SynPS/2 Synaptics TouchPad" "Synaptics Two-Finger Scrolling" 1 0
";

# execute it
write_to_file "$content"
