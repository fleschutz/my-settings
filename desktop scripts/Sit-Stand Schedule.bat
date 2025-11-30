@echo off
chcp 65001 >NUL

echo.
echo 				Sit-Stand Schedule for Your Health
echo 				==================================
echo.
echo Prolonged sitting and prolonged standing are related to various health risks. To reduce the risks individuals
echo need to adopt healthy working routines. This means a healthier life style and healthier behaviour at work,
echo together with organisations that promote and facilitate healthier working. Movement and exercise are an important
echo part of tackling a sedentary lifestyle and an important musculoskeletal disorder (MSD) prevention measure.
echo There is growing evidence that workplace physical activity interventions can also positively influence physical
echo activity behaviour.
echo.
echo The ideal sit-stand schedule follows a sit-stand duration that ranges from 1:1 to 3:1, so as to optimize sitting
echo and standing for bodily comfort and productivity. Break up sitting by standing, such as alternating 30-90 min of
echo sitting and 30 min of standing – but avoid standing beyond 4 hours a day (risk of foot, leg, and back pain).
echo.
echo.
echo Listen to Your Body!
echo --------------------
echo Try standing for 15 minutes every hour to start, but let your comfort guide adjustments. If your legs feel heavy
echo or your feet ache, take a seated break. If you're sitting and notice sluggishness creeping in, stand and stretch.
echo This adaptive approach makes the standing desk schedule sustainable in the long term.
echo.
echo.
echo NOTE: Move this window to the right side - it will inform you when to switch positions.
echo.
timeout 20


:loop
cls
title 🡇 Sit down
echo 🡇 Sit Down for 45 min
echo ---------------------
echo Listen to your body! If you notice sluggishness creeping in, stand and stretch.
timeout 2700
rundll32 user32.dll,MessageBeep

cls
title 🡅 Stand up 🕺
echo 🡅 Stand Up for 15 min 🕺
echo -----------------------
echo Listen to your body! If your legs feel heavy or your feet ache, take a seated break.
timeout 900
rundll32 user32.dll,MessageBeep

goto loop
