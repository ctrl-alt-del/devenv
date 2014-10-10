#!/bin/bash
write_to_file() {

  # check if file exists. If not, create it
  if [ ! -f ~/.profile ] ; then
    # if not create the file
    touch ~/.profile
  fi

  content="
  synclient TapAndDragGesture=0
  synclient TapButton1=1
  synclient TapButton2=3
  synclient TapButton3=2
  synclient FingerHigh=45
  synclient VertScrollDelta=-350
  synclient HorizScrollDelta=-350
  synclient RTCornerButton=0
  synclient RBCornerButton=0
  synclient LTCornerButton=0
  synclient LBCornerButton=0
  synclient PalmDetect=1
  synclient MinSpeed=0.7
  synclient MaxSpeed=1.7
  ";

  echo "$content" >> ~/.profile;
}

# execute it
write_to_file
