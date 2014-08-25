#!/bin/bash
write_to_file() {

  if [ ! -f ~/.profile ] ; then
    touch ~/.profile
  fi

  content="
  synclient TapAndDragGesture=0
  synclient TapButton1=1
  synclient TapButton2=3
  synclient TapButton3=0
  synclient FingerHigh=50
  synclient VertScrollDelta=-400
  synclient HorizScrollDelta=-400
  synclient RTCornerButton=0
  synclient RBCornerButton=0
  synclient LTCornerButton=0
  synclient LBCornerButton=0
  synclient PalmDetect=1
  synclient MinSpeed=0.7
  synclient MaxSpeed=1.7
  synclient PalmDetect=1
  ";

  echo "$content" >> ~/.profile;
}

# execute it
write_to_file
