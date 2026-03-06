/*******************************************************************************
TITLE:
Stable and waterproof OpenSCAD case by pbtec

DESCRIPTION:

highly scalable case for 3D printing. Try it out!

Optimized for Openscad Customizer. Activate it under view/customizer and play around ;-)

No Support needed to print

- for waterproof cases you can use silicone sealing cord with diameters from 1 to 3mm
- to use also without sealing cord. The groove and ridge gives the housing a high stability and tightness.
- Use of Hot melt copper nuts, regular nuts or square nuts
- define outer vertical radius of corners
- echo output in console shows inner and outer size and more
- echo output shows the needed length of the screws
- use screws from m2 up to m5
- default are 4 screws at each corner. For large cases add addtional ones in the middle of both x and y sides if needed
- use several predefined wall mount holder, some with multiple mounting holes (up to 3)
- the screw holes can now be configured to go through the case or not. The regular nut can also be moved to the bottom of the case
- custumizable 1 to 3 holes on each side for cable glands or similar
- holder for up to 3 pcbs or devices
- bottom mounting holes for wall mounting (not recommended for highly water-resistant housings)

Important!
- If you use standard nuts, you need to pause the printer a certain level to insert the nuts
- If you need a stable and waterproof case please print with 100% infill
- I am aware that sometimes, when using too big or too small parameters, there are some rendering issues.
  To prevent such issues change only one parameter at once and check the result.

for waterproofness see https://blog.prusaprinters.org/watertight-3d-printing-part-2_53638/

This work is licensed under a Creative Commons (4.0 International License)
Attribution-Noncommercial-Share Alike
not allowed | Sharing without ATTRIBUTION
allowed     | Remix Culture allowed
not allowed | Commercial Use
not allowed | Free Cultural Works
not allowed | Meets Open Definition

AUTHOR:
pbtec / pb-tec.ch

use https://paypal.me/pbtec if you want to spend me a coold beer. Thanks in advance :-)

VERSION:
V   KZZ DATE     COMMENT
6.0 pb  31.07.21 First Version to share
6.1 pb  15.12.22 Fixed some problems with german characters (Umlaute) in the code
7.0 pb  15.03.25 Added the option to use hot melt copper nut inserts
7.1 pb  16.03.25 Added solution for 3 pcb holders and 3 side wall holes on each side
7.2 pb  16.03.25 Added separate gasket option to print it with flexible material like TPU
7.3 pb  18.04.25 Fixed again some special character in the comments preventing the code to run
7.4 pb	02.05.25 Crazy, I found unexpected characters (-) on line 36, which turned out to be the issue.

*******************************************************************************/

/* [Render quality settings] */
// Set to at least to 150 before render and save as .stl file, otherwise you can go down to 40 for quick 3D view
$fn                       = 80;   // [20:1:300]

/* [View settings] */
// Shows the Bottom of the case
ShowBottom                = true;
// Shows the top of the case
ShowTop                   = true;
// Distance between top and bottom (if both are side by side displayed)
DistanceBetweenObjects    = 10;
// Shows the housing assembled
ShowCaseAssembled         = false;
// Shows the gasket
ShowGasket                = true;
GasketHeight                = 1.5;

/* [Control cuts (use only one at a time)] */
// To see the nuts inside (best view if not assembled showed)
SeeNutCut                 = false;
// To see the groove, ridge and Screw (best view if assembled showed)
SeeGrooveRidgeScrew       = false;

/* [Case settings] */
// Length of the case
Caselength                = 60;
// Width of the case
CaseWidth                 = 100;
// Height of the case
CaseHeight                = 40;
// Splitt the Case height into bottom and top, check for the needed screws in echo output (console)
CutFromTop                = 10.0;
// Thickness for the bottom and top wall (vertical walls needs to be calculated)
BottomTopThickness        = 3.0;
// If this is bigger than the needed cylinder around the screw it will be ignored
CaseRadius                = 12.0;

/* [Groove settings] */
// If using a SealingCord use the SealingCord diameter, otherwise x-times of your 3D Printer Nozzle (0.8/1.2/...) --> Ridge gets perfect for printing
GrooveWidth               = 1.2;   // [0.8:0.1:3]
// Not less than 1mm (for stability) and not more than 3mm --> Best 2mm
GrooveDepth               = 2.0;   // [1.0:0.1:3]
// Space between Groove and Ridge for a perfect fit, usualy 0.2 or 0.3 for FDM depending on your printer quality
Space                     = 0.3;   // [0.0:0.1:0.4]
// Addtional vertical room for the pressed sealing Cord. For sealing cord 1.5mm -->0.5 // for 2mm -->0.8 // for 2.5 -->1.0 // If no sealing cord then set this parameter to 0.
AddGrooveDepthForSealing  = 0.8;   // [0.0:0.1:3]
// Range Inside groove/ridge. Usualy 2 times or more the printer nozzle. For best stability at least 0.8
InnerBorder               = 0.8;   // [0.8:0.1:4]
// Range Outside groove/ridge . Usualy 2 times or more the printer nozzle. For best stability at least 0.8
OuterBorder               = 0.8;   // [0.8:0.1:4]

/* [Case Screw settings] */
//2=m2/2.5=m2.5/3=m3/4=m4/5=m5   // max m5, larger sizes do not fit
MetricScrewSize          = 3.0;     // [2:m2, 2.5: m2.5, 3: m3, 4: m4, 5: m5]
// Chose your Screw head
ScrewHeadType            = 1;      // [1:1 Countersunk head screw, 2: 2 Round or hex screw head - Counterbore, 3: 3 Exposed head - No counter]
// for round or hex screw head select the height of the head
ScrewHeadHeight  = 2.6;   // [0.0:0.1:10]
// for round head screw select the diameter of the head, for hex screw select the diameter size of your Socket wrench diameter
ScrewHeadDiameter  = 6;   // [0.0:0.1:20]
// Screw or hot melt nut Hole deepness (deepness in the Body/Cylinder). If too big, through hole possible
HoleDeepness              = 20.0 ; //[1:0.1:500]
// Number of additional screws along X-side walls (0=none, 1=one at mid-side, 2=two evenly spaced, …)
XAdditionalScrew          = 0;  // [0:1:10]
// Number of additional screws along Y-side walls (0=none, 1=one at mid-side, 2=two evenly spaced, …)
YAdditionalScrew          = 0;  // [0:1:10]
// Optimize additional screw pillars for 3D printing by removing material below
OptimizeAdditionalScrewPillars = true;
// Optimize corner screw pillars for 3D printing by removing material below
OptimizeCornerScrewPillars = true;
// Height of the remaining "floating" pillar at the top (only applies if optimization is enabled)
RemainingPillarHeight     = 10.0; // [1:0.1:100]

/* [Nut general settings] */
NutStyle          = 1;      // [1:1 Hot melt copper nut > New from Version 7.0, 2: 2 Standard nuts > Pause during printing to insert standard nuts, 3: 3 Square nuts > Pause during printing to insert square nuts, 4 : 4 Square nuts with external insert > No need for pause during print - but outer holes are visible]
// Size of material (plastic) above nut/square nut (3mm or better more). Use for NutStyle 2,3 and 4). The more, the more stable but need longer screws. Here you can also move the nut to the bottom of the case (since Version 7.0)
NutSink                   = 4.0; // [0:0.1:500]


/* [Hot melt copper nut settings (use for NutStyle 1) can also be used for self-tapping screws] */
// Hole diameter for self-tapped screw or hot melt copper nut (Measure the diameter))
HoleDiaThread             = 3.2 ; //[1:0.1:10]
// Length of the hot melt copper nut (Measure the length) - It is just used to calculate the min length of the screw to output in console
HolelengthHotMeltNut      = 10 ; //[1:0.1:30]

/* [Standard nut settings (use for NutStyle 2)] */
// Nut Settings / As there are (or I have) many different nuts dimensions, the size must be specified / Do not add separation space, only the real measurement // m2=1.5 // m2.5=1.9 // m3=2.4 // m4=3.2 // n5=3.8
NutHigh                   = 2.4;
// Distance between the paralell sides / Do not add separation space, only the real measurement // m2=3.8 // m2.5=4.9 // m3=5.4 // m4=6.9 // m5=7.9
NutDia                    = 5.4;

/* [Square Nut settings (Use for NutStyle 3 + 4)] */
// Select the high of the square nut / Do not add separation space, only the real measurement
SquareNutHigh             = 1.9;
// Select the size of the square nut / Do not add separation space, only the real measurement
SquareNutSize             = 5.4;
// Square nut insert from which side (NutStyle 4 only)
EdgeSquareNutInsertFrom_X = true;

/* [Wall mount holder settings] */
// Select if you need a mount holder
EnableMountHolder         = false;
// Chose your desired wall mount style
MountHolderStyle          = 5;      // [1:Style 1, 2: Style 2, 3: Style 3, 4 : Style 4, 5 : Style 5]
// Some styles (1-3) allow more than one hole
CountOfMountHolderHoles   = 1;     // [1:One hole centered, 2: Two holes, 3: Three holes]
MountHolderHoleDiameter   = 5;   // [1:0.1:10]
MountHolderThickness      = 4.0;   // [2:0.1:10]

/* [PCB/Device holder 1 settings] */
// Activate customizable PCB/Device holder 1
ShowDeviceHolder1         = false;
// Hole in the cylinder for the screw // 2.9 Screw = 2mm hole
ScrewHoleDiameter1        = 2.6;
// The diamter of the screw cylinder
ScrewCylinderDiameter1    = 7;
// The height of the screw cylinders (also the deepness for the screw hole)
ScrewCylinderHeight1      = 4.0;
// Distance between the holders in X direction
DeviceHolder_X_Distance1  = 20;
// Distance between the holders in Y direction
DeviceHolder_y_Distance1  = 30;
// Move all holders 1 in X direction
Offset_X_1                = 10;
// Move all holders 1 in Y direction
Offset_Y_1                = -20;

/* [PCB/Device holder 2 settings] */
// Activate customizable PCB/Device holder 2
ShowDeviceHolder2         = false;
// Hole in the cylinder for the screw // 2.9 Screw = 2mm hole
ScrewHoleDiameter2        = 2.6;
// The diamter of the screw cylinder
ScrewCylinderDiameter2    = 7;
// The height of the screw cylinders (also the deepness for the screw hole)
ScrewCylinderHeight2      = 10;
// Distance between the holders in X direction
DeviceHolder_X_Distance2  = 15;
// Distance between the holders in Y direction
DeviceHolder_y_Distance2  = 50;
// Move all holders 2 in X direction
Offset_X_2                = -15;
// Move all holders 2 in Y direction
Offset_Y_2                = -10;

/* [PCB/Device holder 3 settings] */
// Activate customizable PCB/Device holder 3
ShowDeviceHolder3         = false;
// Hole in the cylinder for the screw // 2.9 Screw = 2mm hole
ScrewHoleDiameter3        = 3;
// The diamter of the screw cylinder
ScrewCylinderDiameter3    = 9;
// The height of the screw cylinders (also the deepness for the screw hole)
ScrewCylinderHeight3      = 8.0;
// Distance between the holders in X direction
DeviceHolder_X_Distance3  = 40;
// Distance between the holders in Y direction
DeviceHolder_y_Distance3  = 10;
// Move all holders 3 in X direction
Offset_X_3                = 0;
// Move all holders 3 in Y direction
Offset_Y_3                = 0;

/* [Base bottom mounting holes settings. Not recommended for highly water-resistant housings] */
// Activate customizable base bottom mounting holes
ShowBottomMountingHoles     = false;
// Diameter for the mounting holes
BottomMountingHolesDiameter = 3;
// Distance between the mounting holes in X direction
BottomMountingHoles_X_Distance = 40;
// Distance between the mounting holes in Y direction
BottomMountingHoles_y_Distance = 70;
// Move all mounting holes in X direction
BottomMountingHolesOffset_X    = 50;
// Move all mounting holes in Y direction
BottomMountingHolesOffset_Y    = 30;

/* [Wall Holes settings side A (for cable gland cut)] */
// Activate customizable holes for cable gland or similar
ShowSideWallHoles_A        = false;
// Count of holes, if there is an additional screw on X or Y side the hole in the middle is not showed
CountOfSideWallHoles_A     = 1;     //[1:1:3]
// Diameter of the holes
SideWallHoleDiameter_A     = 16.5;  //[1:0.1:80]
// Add or decrease height position (up and down, 0 = centered)
SideWallHoleOffset_Z_A     = 0;
// Add or decrease distance between the holes
SideWallHoleDistance_A     = 20;
// Add or decrease horizontal position of the holes (0 = centered)
SideWallHolePosition_A     = 0;

/* [Wall Holes settings side B (for cable gland cut)] */
// Activate customizable holes for cable gland or similar
ShowSideWallHoles_B        = false;
// Count of holes, if there is an additional screw on X or Y side the hole in the middle is not showed
CountOfSideWallHoles_B     = 1;     //[1:1:3]
// Diameter of the holes
SideWallHoleDiameter_B     = 16.5;  //[1:0.1:80]
// Add or decrease height position (up and down, 0 = centered)
SideWallHoleOffset_Z_B     = 0;
// Add or decrease distance between the holes
SideWallHoleDistance_B     = 20;
// Add or decrease horizontal position of the holes (0 = centered)
SideWallHolePosition_B     = 0;

/* [Wall Holes settings side C (for cable gland cut)] */
// Activate customizable holes for cable gland or similar
ShowSideWallHoles_C        = false;
// Count of holes, if there is an additional screw on X or Y side the hole in the middle is not showed
CountOfSideWallHoles_C     = 1;     //[1:1:3]
// Diameter of the holes
SideWallHoleDiameter_C     = 16.5;  //[1:0.1:80]
// Add or decrease height position (up and down, 0 = centered)
SideWallHoleOffset_Z_C     = 0;
// Add or decrease distance between the holes
SideWallHoleDistance_C     = 20;
// Add or decrease horizontal position of the holes (0 = centered)
SideWallHolePosition_C     = 0;

/* [Wall Holes settings side D (for cable gland cut)] */
// Activate customizable holes for cable gland or similar
ShowSideWallHoles_D        = false;
// Count of holes, if there is an additional screw on X or Y side the hole in the middle is not showed
CountOfSideWallHoles_D     = 1;     //[1:1:3]
// Diameter of the holes
SideWallHoleDiameter_D     = 16.5;  //[1:0.1:80]
// Add or decrease height position (up and down, 0 = centered)
SideWallHoleOffset_Z_D     = 0;
// Add or decrease distance between the holes
SideWallHoleDistance_D     = 20;
// Add or decrease horizontal position of the holes (0 = centered)
SideWallHolePosition_D     = 0;

// =========================  C A L C U L A T E D   S E T T I N G S (do not change!!!) ===================================

// Calculated Screw settings (do not change!!!)
ScrewHoleDia              = MetricScrewSize+1;
ScrewHeadDia              = MetricScrewSize*2;
ScrewCountersink          = (MetricScrewSize+8)/14-0.5;

// Calculated settings for Ridge (do not change!!!)
RidgeHeight               = GrooveDepth-Space;
RidgeWidth                = GrooveWidth-Space;

// Calculated settings for case (do not change!!!)
SideWallThickness             = InnerBorder+GrooveWidth+OuterBorder;
CaseRoundingRadius        = ScrewHoleDia/2+InnerBorder+GrooveWidth+OuterBorder;
ScrewCornerPos            = [Caselength/2-CaseRoundingRadius,CaseWidth/2-CaseRoundingRadius,0];


// Calculated settings for wall mount holder
MountHolderLenght         = MountHolderHoleDiameter*3;

// if both objects showed
X_ObjectPosition = ((ShowBottom)&&(ShowTop)&&(!ShowCaseAssembled)) ? Caselength/2+DistanceBetweenObjects/2:0;

// If the case is assembled showed
Y_TopRotation = ShowCaseAssembled ? 180:0;
Z_TopHigh = ShowCaseAssembled ? CaseHeight:0;

ShowSizes(); // Show the calculated sizes

//===============================================================================
//                                    M A I N
//===============================================================================




// --> Show the bottom of the case
translate([X_ObjectPosition,0,0]) rotate([0,0,0]) difference(){
    union(){
        BodyBottom();
        // **** Add your bottom case additions here ****
        //cylinder(h=20,d=15,center = true); // Example
    }
    // **** Add your bottom case cuts here ****
    //cylinder(h=15,d=20,center = true); // Example
}

// --> Show the top of the case
translate([-X_ObjectPosition,0,Z_TopHigh+0.03]) rotate([0,Y_TopRotation,0]) difference(){
    union(){
        BodyTop();
        // **** Add your bottom top additions here ****
        //cylinder(h=18,d=10,center = true); // Example
    }
    // **** Add your top case cuts here ****
    //cylinder(h=20,d=5,center = true); // Example
}

if (ShowGasket)
{
    translate([-Caselength/2-Caselength-DistanceBetweenObjects,0,0]) Gasket();


}

//===============================================================================
//                                  M O D U L E S
//===============================================================================



module BodyBottom () {
    if(ShowBottom)
    {
        difference(){
            union()
            {
                rotate([  0,  0,  0]) BodyQuarterBottom(Caselength,CaseWidth,CaseHeight-CutFromTop,CaseRoundingRadius,SideWallThickness);
                rotate([  0,  0,180]) BodyQuarterBottom(Caselength,CaseWidth,CaseHeight-CutFromTop,CaseRoundingRadius,SideWallThickness);
                mirror([  0,  1,  0]) BodyQuarterBottom(Caselength,CaseWidth,CaseHeight-CutFromTop,CaseRoundingRadius,SideWallThickness);
                mirror([  1,  0  ,0]) BodyQuarterBottom(Caselength,CaseWidth,CaseHeight-CutFromTop,CaseRoundingRadius,SideWallThickness);

                // Add here additional parts

                if (EnableMountHolder)
                {
                    color("SteelBlue") if (MountHolderStyle!=5)
                    {
                    translate([0,CaseWidth/2,0]) MountHolder(MountHolderThickness,MountHolderHoleDiameter);
                    rotate([0,0,180]) translate([0,CaseWidth/2,0]) MountHolder(MountHolderThickness,MountHolderHoleDiameter);
                    }
                    else
                    {translate([0,CaseWidth/2,0]) MountHolder(MountHolderThickness,MountHolderHoleDiameter);}
                }
                PlaceDeviceHolders(ShowDeviceHolder1, DeviceHolder_X_Distance1, DeviceHolder_y_Distance1, Offset_X_1, Offset_Y_1, "LightSalmon", ScrewCylinderHeight1, ScrewCylinderDiameter1, ScrewHoleDiameter1);
                PlaceDeviceHolders(ShowDeviceHolder2, DeviceHolder_X_Distance2, DeviceHolder_y_Distance2, Offset_X_2, Offset_Y_2, "Khaki",       ScrewCylinderHeight2, ScrewCylinderDiameter2, ScrewHoleDiameter2);
                PlaceDeviceHolders(ShowDeviceHolder3, DeviceHolder_X_Distance3, DeviceHolder_y_Distance3, Offset_X_3, Offset_Y_3, "PaleGreen",   ScrewCylinderHeight3, ScrewCylinderDiameter3, ScrewHoleDiameter3);
            }

            // Add here cut outs

            BodyNutHoles();

            // Optimize corner pillars by cutting material
            for (sx = [-1, 1], sy = [-1, 1]) {
                CornerPillarCut(sx*ScrewCornerPos[0], sy*ScrewCornerPos[1]);
            }

            // Optimize additional screw pillars by cutting material (rectangular cuts)
            for (sy = [-1, 1], i = [1 : max(1, XAdditionalScrew)]) if (XAdditionalScrew > 0) {
                x_i = (i - (XAdditionalScrew+1)/2) * (Caselength - 2*CaseRoundingRadius) / (XAdditionalScrew+1);
                AdditionalScrewPillarCut(x_i, sy*(CaseWidth/2-CaseRoundingRadius), true);
            }
            for (sx = [-1, 1], i = [1 : max(1, YAdditionalScrew)]) if (YAdditionalScrew > 0) {
                y_i = (i - (YAdditionalScrew+1)/2) * (CaseWidth - 2*CaseRoundingRadius) / (YAdditionalScrew+1);
                AdditionalScrewPillarCut(sx*(Caselength/2-CaseRoundingRadius), y_i, false);
            }

            // Add 45° triangular cuts at bottom of floating pillars for printability
            for (sy = [-1, 1], i = [1 : max(1, XAdditionalScrew)]) if (XAdditionalScrew > 0) {
                x_i = (i - (XAdditionalScrew+1)/2) * (Caselength - 2*CaseRoundingRadius) / (XAdditionalScrew+1);
                AdditionalScrewPillarTriangleCut(x_i, sy*(CaseWidth/2-CaseRoundingRadius), true);
            }
            for (sx = [-1, 1], i = [1 : max(1, YAdditionalScrew)]) if (YAdditionalScrew > 0) {
                y_i = (i - (YAdditionalScrew+1)/2) * (CaseWidth - 2*CaseRoundingRadius) / (YAdditionalScrew+1);
                AdditionalScrewPillarTriangleCut(sx*(Caselength/2-CaseRoundingRadius), y_i, false);
            }

            if (ShowBottomMountingHoles)
            {
                translate([BottomMountingHoles_X_Distance/2+BottomMountingHolesOffset_X,BottomMountingHoles_y_Distance/2+BottomMountingHolesOffset_Y,-0.01])cylinder(h=BottomTopThickness+0.02,d=BottomMountingHolesDiameter,center = false);
                translate([BottomMountingHoles_X_Distance/2+BottomMountingHolesOffset_X,-BottomMountingHoles_y_Distance/2+BottomMountingHolesOffset_Y,-0.01])cylinder(h=BottomTopThickness+0.02,d=BottomMountingHolesDiameter,center = false);
                translate([-BottomMountingHoles_X_Distance/2+BottomMountingHolesOffset_X,BottomMountingHoles_y_Distance/2+BottomMountingHolesOffset_Y,-0.01])cylinder(h=BottomTopThickness+0.02,d=BottomMountingHolesDiameter,center = false);
                translate([-BottomMountingHoles_X_Distance/2+BottomMountingHolesOffset_X,-BottomMountingHoles_y_Distance/2+BottomMountingHolesOffset_Y,-0.01])cylinder(h=BottomTopThickness+0.02,d=BottomMountingHolesDiameter,center = false);
            }

            if (SeeNutCut)           { color("red") translate([0,0,CaseHeight/2+CaseHeight-CutFromTop-NutSink]) cube([Caselength+0.1,CaseWidth+0.1,CaseHeight],center=true);}
            if (SeeGrooveRidgeScrew)
            {
                color("red") translate([Caselength-CaseRoundingRadius,0,(CaseHeight+0.1)/2-0.05])   cube([Caselength+0.1,CaseWidth*2+0.1,CaseHeight+0.1],center=true);
                color("red") translate([0,+CaseWidth/2-CaseWidth*2+CaseRoundingRadius,(CaseHeight+0.1)/2-0.05])   cube([Caselength+0.1,CaseWidth*2+0.1,CaseHeight+0.1],center=true);
            }

            // A=+X wall (spread Y), B=-Y wall (spread X), C=-X wall (spread Y), D=+Y wall (spread X)
            SideWallHoleSet(ShowSideWallHoles_A, CountOfSideWallHoles_A, SideWallHoleDiameter_A,
                SideWallHoleOffset_Z_A, SideWallHoleDistance_A, SideWallHolePosition_A,
                [ Caselength/2-SideWallThickness/2, 0], [0,1], [90,0,90]);
            SideWallHoleSet(ShowSideWallHoles_B, CountOfSideWallHoles_B, SideWallHoleDiameter_B,
                SideWallHoleOffset_Z_B, SideWallHoleDistance_B, SideWallHolePosition_B,
                [0, -CaseWidth/2+SideWallThickness/2], [1,0], [90,0,0]);
            SideWallHoleSet(ShowSideWallHoles_C, CountOfSideWallHoles_C, SideWallHoleDiameter_C,
                SideWallHoleOffset_Z_C, SideWallHoleDistance_C, SideWallHolePosition_C,
                [-Caselength/2+SideWallThickness/2, 0], [0,1], [90,0,90]);
            SideWallHoleSet(ShowSideWallHoles_D, CountOfSideWallHoles_D, SideWallHoleDiameter_D,
                SideWallHoleOffset_Z_D, SideWallHoleDistance_D, SideWallHolePosition_D,
                [0,  CaseWidth/2-SideWallThickness/2], [1,0], [90,0,0]);
        }
    }
}

module BodyTop () {
    if (ShowTop)
    {
        difference(){
            union(){
                rotate([  0,  0,  0]) BodyQuarterTop(Caselength,CaseWidth,CutFromTop,CaseRoundingRadius,SideWallThickness);
                rotate([  0,  0,180]) BodyQuarterTop(Caselength,CaseWidth,CutFromTop,CaseRoundingRadius,SideWallThickness);
                mirror([  0,  1,  0]) BodyQuarterTop(Caselength,CaseWidth,CutFromTop,CaseRoundingRadius,SideWallThickness);
                mirror([  1,  0  ,0]) BodyQuarterTop(Caselength,CaseWidth,CutFromTop,CaseRoundingRadius,SideWallThickness);
            }
            TopScrewHoles();
            if (SeeGrooveRidgeScrew)
            {
                color("red") translate([-Caselength+CaseRoundingRadius,0,(CaseHeight+0.1)/2-0.05]) cube([Caselength+0.1,CaseWidth+0.1,CaseHeight+0.1],center=true);
                color("red") translate([0,-CaseWidth+CaseRoundingRadius,(CaseHeight+0.1)/2-0.05]) cube([Caselength+0.1,CaseWidth+0.1,CaseHeight+0.1],center=true);
            }
        }
    }
}

module MountHolder (Thick,Hole) {
    translate([0,0,0.005]) difference(){

        if (MountHolderStyle==1){
            $fn=40;
           roundedBox([Caselength, MountHolderLenght*2, Thick*2], Thick/3, 0);
        }
        if (MountHolderStyle==2){
            $fn=60;
           roundedBox([Caselength, MountHolderLenght*2, Thick*2],CaseRoundingRadius , 1);
        }
        if (MountHolderStyle==3){
            roundedBox([Caselength, MountHolderLenght*2, Thick*2],0 , 2);
        }
        if((MountHolderStyle>0)&&(MountHolderStyle<4)){
            translate([0,0,-Thick/2-0.02]) cube([Caselength+0.02,MountHolderLenght*2+0.02,Thick+0.04],center=true);
            translate([0,-MountHolderLenght/2-CaseRoundingRadius,Thick/2+0.02]) cube([Caselength+0.02,MountHolderLenght+0.02,Thick+0.08],center=true);
            translate([0,-MountHolderLenght/2,Thick/2+0.02]) cube([Caselength-2*CaseRoundingRadius+0.02,MountHolderLenght+0.02,Thick+0.08],center=true);
            for (i = [1 : max(1, YAdditionalScrew)]) if (YAdditionalScrew > 0) {
                y_i = (i - (YAdditionalScrew+1)/2) * (CaseWidth-2*CaseRoundingRadius) / (YAdditionalScrew+1);
                translate([ Caselength/2-CaseRoundingRadius, y_i-CaseRoundingRadius, MountHolderThickness/2-0.02]) cylinder(h=MountHolderThickness+0.06, d=ScrewHoleDia, center=true);
                translate([-(Caselength/2-CaseRoundingRadius), y_i-CaseRoundingRadius, MountHolderThickness/2-0.02]) cylinder(h=MountHolderThickness+0.06, d=ScrewHoleDia, center=true);
            }

            if (CountOfMountHolderHoles>1){
                translate([Caselength/2-Hole-Thick/3,Hole*1.5,MountHolderThickness/2-0.02]) cylinder(h=MountHolderThickness+0.06,d=Hole,center = true);
                translate([-Caselength/2+Hole+Thick/3,Hole*1.5,MountHolderThickness/2-0.02]) cylinder(h=MountHolderThickness+0.06,d=Hole,center = true);
            }
            if (CountOfMountHolderHoles!=2){
                translate([0,Hole*1.5,MountHolderThickness/2-0.02]) cylinder(h=MountHolderThickness+0.06,d=Hole,center = true);
            }
        }
    }
    if (MountHolderStyle==4){
        HolderRad=Hole/2;
        HolderWidth=4*Hole;
        translate([0,MountHolderLenght,0]) difference(){
            union(){
                translate([0,-MountHolderLenght+HolderRad,0]) roundedBox([HolderWidth, MountHolderLenght*2, Thick*2],HolderRad , 0);
                translate([-HolderWidth/2+HolderRad,0,0]) rotate([0,0,-45]) translate([HolderWidth-HolderRad,-MountHolderLenght+HolderRad,0]) roundedBox([2*HolderWidth, MountHolderLenght*2, Thick*2],HolderRad , 0);
                translate([ HolderWidth/2-HolderRad,0,0]) rotate([0,0,45]) translate([-HolderWidth+HolderRad,-MountHolderLenght+HolderRad,0]) roundedBox([2*HolderWidth, MountHolderLenght*2, Thick*2],HolderRad , 0);
            }
            translate([0,-(3*HolderWidth)/2-MountHolderLenght,-0.02]) cube([10*HolderWidth,3*HolderWidth,Thick*2+0.06],center=true);
            translate([0,-(3*HolderWidth)/2,-Thick-0.02]) cube([4*HolderWidth,4*HolderWidth,Thick*2],center=true);
            translate([0,-MountHolderLenght+Hole*1.8,MountHolderThickness/2-0.02]) cylinder(h=MountHolderThickness+0.06,d=Hole,center = true);
        }
    }
    if (MountHolderStyle==5){
        HolderRad=Hole/2;
        HolderWidth=4*Hole;
        translate([0,MountHolderLenght,0]) difference()
        {
            union(){
                $fn=40;
                translate([0,-MountHolderLenght+HolderRad,0]) roundedBox([HolderWidth, MountHolderLenght*2, Thick*2],HolderRad , 0);
                translate([-HolderWidth/2+HolderRad,0,0]) rotate([0,0,-45]) translate([HolderWidth-HolderRad,-MountHolderLenght+HolderRad,0]) roundedBox([2*HolderWidth, MountHolderLenght*2, Thick*2],HolderRad , 0);
                translate([ HolderWidth/2-HolderRad,0,0]) rotate([0,0,45]) translate([-HolderWidth+HolderRad,-MountHolderLenght+HolderRad,0]) roundedBox([2*HolderWidth, MountHolderLenght*2, Thick*2],HolderRad , 0);
            }
            translate([0,-(3*HolderWidth)/2-MountHolderLenght,-0.02]) cube([10*HolderWidth,3*HolderWidth,Thick*4+0.06],center=true);
            translate([0,-(3*HolderWidth)/2,-Thick-0.02]) cube([4*HolderWidth,4*HolderWidth,Thick*2],center=true);
            hull(){
                translate([-Hole/1.1,-MountHolderLenght+Hole*1.6,MountHolderThickness/2-0.02]) cylinder(h=MountHolderThickness+0.06,d=Hole,center = true);
                translate([+Hole/1.1,-MountHolderLenght+Hole*1.6,MountHolderThickness/2-0.02]) cylinder(h=MountHolderThickness+0.06,d=Hole,center = true);
            }
        }
        rotate([0,0,180]) translate([0,MountHolderLenght+CaseWidth,0]) difference()
        {
            union(){
                $fn=40;
                translate([0,-MountHolderLenght+HolderRad,0]) roundedBox([HolderWidth, MountHolderLenght*2, Thick*2],HolderRad , 0);
                translate([-HolderWidth/2+HolderRad,0,0]) rotate([0,0,-45]) translate([HolderWidth-HolderRad,-MountHolderLenght+HolderRad,0]) roundedBox([2*HolderWidth, MountHolderLenght*2, Thick*2],HolderRad , 0);
                translate([ HolderWidth/2-HolderRad,0,0]) rotate([0,0,45]) translate([-HolderWidth+HolderRad,-MountHolderLenght+HolderRad,0]) roundedBox([2*HolderWidth, MountHolderLenght*2, Thick*2],HolderRad , 0);
            }
            translate([0,-(3*HolderWidth)/2-MountHolderLenght,-0.02]) cube([10*HolderWidth,3*HolderWidth,Thick*2+0.06],center=true);
            translate([0,-(3*HolderWidth)/2,-Thick-0.02]) cube([4*HolderWidth,4*HolderWidth,Thick*2],center=true);
            hull(){
                    translate([0,-MountHolderLenght+Hole*1.6+Hole/1.8,MountHolderThickness/2-0.02]) cylinder(h=MountHolderThickness+0.06,d=Hole,center = true);
                    translate([0,-MountHolderLenght+Hole*1.6-Hole/1.8,MountHolderThickness/2-0.02]) cylinder(h=MountHolderThickness+0.06,d=Hole,center = true);
            }
        }
    }
}

// Echoes recommended screw length range for the current NutStyle + ScrewHeadType combination.
// NutStyle controls the bottom engagement depth; ScrewHeadType controls the top offset and label.
module ShowScrewLengths() {
    nut_bottom_min = NutStyle == 1 ? HolelengthHotMeltNut :
                     NutStyle == 2 ? NutSink + NutHigh :
                                     NutSink + SquareNutHigh;
    top_offset = ScrewHeadType == 2 ? ScrewHeadHeight : 0;
    label      = ScrewHeadType == 1 ? "Countersunk" : "Round head or hex";
    vMin = CutFromTop - top_offset + nut_bottom_min;
    vMax = CutFromTop - top_offset + HoleDeepness;
    echo(str(" --> ", label, " Screw m", MetricScrewSize, " max length : ", vMax, "mm"));
    echo(str(" --> ", label, " Screw m", MetricScrewSize, " min length : ", vMin, "mm"));
}

module ShowSizes () {
    echo ();
    echo (str(" Stable and waterproof OpenSCAD case by pbtec V7."));
    echo ();
    echo (str(" Render quality : ",$fn));
    echo ();
    echo (str(" --> Case outer dimensions: "));
    echo (str(" Length : ",Caselength,"mm "));
    echo (str(" Width : ",CaseWidth,"mm "));
    echo (str(" High : ",CaseHeight,"mm "));
    echo (str(" Top (upper piece) high : ",CutFromTop,"mm "));
    echo (str(" Bottom (lower piece) high : ",CaseHeight-CutFromTop,"mm "));
    echo (str(" Side wall thickness : ",SideWallThickness,"mm "));
    echo (str(" Bottom & top wall thickness : ",BottomTopThickness,"mm "));
    echo (str(" Case rounding radius : ",CaseRoundingRadius,"mm "));
    echo ();
    echo (str(" --> Case inner dimensions : "));
    echo (str(" X : Wall to wall : ",Caselength-2*SideWallThickness,"mm "));
    echo (str(" X : Screw cylinder to screw cylinder : ",Caselength-4*CaseRoundingRadius,"mm "));
    echo (str(" Y : Wall to wall : ",CaseWidth-2*SideWallThickness,"mm "));
    echo (str(" Y : Screw cylinder to screw cylinder : ",CaseWidth-4*CaseRoundingRadius,"mm "));
    echo (str(" Top to bottom  : ",CaseHeight-2*BottomTopThickness,"mm "));
    echo ();
    echo (str(" Screw dimensions : "));
    echo (str(" Metric Screw size: m",MetricScrewSize));
    echo (str(" Screw hole diameter : ",ScrewHoleDia,"mm "));
    echo (str(" Screw head diameter : ",ScrewHeadDia,"mm "));
    echo (str(" X : Additional screws (count) : ",XAdditionalScrew));
    echo (str(" Y : Additional screws (count) : ",YAdditionalScrew));
    echo (str(" --> Check if you have screws within the following size : "));

    ShowScrewLengths();
}

module GrooveStraight (length) {
   color("orange") translate([length/2,0,-(GrooveDepth+AddGrooveDepthForSealing)/2]) cube([length,GrooveWidth,GrooveDepth+AddGrooveDepthForSealing],center=true);
}

module GrooveCurved (Angle,Rad) {
    color("orange") difference(){
        translate([0,0,-(GrooveDepth+AddGrooveDepthForSealing)]) pie(Rad+(GrooveWidth)/2, Angle, GrooveDepth+AddGrooveDepthForSealing, spin=0);
        translate([-0.01,-0.01,-(GrooveDepth+AddGrooveDepthForSealing+0.02)]) pie(Rad-(GrooveWidth)/2, Angle, GrooveDepth+AddGrooveDepthForSealing+0.04, spin=0);
    }
}

module RidgeStraight (length) {
    color("orange") translate([length/2,0,(RidgeHeight)/2]) cube([length,RidgeWidth,RidgeHeight],center=true);
}

module RidgeCurved (Angle,Rad) {
    color("orange") difference(){
        translate([0,0,0])         pie(Rad+(RidgeWidth)/2, Angle, RidgeHeight, spin=0);
        translate([-0.01,-0.01,-0.02]) pie(Rad-(RidgeWidth)/2, Angle, RidgeHeight+0.04, spin=0);
    }
}

module GasketRidgeStraight (length) {
    color("DarkSlateGray") translate([length/2,0,(GasketHeight)/2]) cube([length,RidgeWidth,GasketHeight],center=true);
}

module GasketRidgeCurved (Angle,Rad) {
    color("DarkSlateGray") difference(){
        translate([0,0,0])         pie(Rad+(RidgeWidth)/2, Angle, GasketHeight, spin=0);
        translate([-0.01,-0.01,-0.02]) pie(Rad-(RidgeWidth)/2, Angle, GasketHeight+0.04, spin=0);
    }
}

module Gasket () {
    rotate([  0,  0,  0]) GasketQuarter();
    rotate([  0,  0,180]) GasketQuarter();
    mirror([  0,  1,  0]) GasketQuarter();
    mirror([  1,  0  ,0]) GasketQuarter();
}

module GasketQuarter () {
            if (XAdditionalScrew == 0)
                translate([CaseRoundingRadius+ScrewHoleDia/2-0.01,CaseWidth/2-OuterBorder-GrooveWidth/2-0.01,0])   GasketRidgeStraight(Caselength/2-3*CaseRoundingRadius-ScrewHoleDia+0.03);
            if (YAdditionalScrew == 0)
                translate([Caselength/2-OuterBorder-GrooveWidth/2-0.01,CaseRoundingRadius+ScrewHoleDia/2-0.02,0]) translate([0,0,0]) rotate([0,0,90]) GasketRidgeStraight(CaseWidth/2-3*CaseRoundingRadius-ScrewHoleDia+0.04);
            translate(ScrewCornerPos) rotate([0,0,180]) GasketRidgeCurved(90,ScrewHoleDia/2+OuterBorder+GrooveWidth/2);
            translate([-ScrewHoleDia-SideWallThickness+0.02,-0.01,0]) translate(ScrewCornerPos)GasketRidgeCurved(90,ScrewHoleDia/2+InnerBorder+GrooveWidth/2);
            translate([-0.01,-ScrewHoleDia-SideWallThickness+0.00,0]) translate(ScrewCornerPos)GasketRidgeCurved(90,ScrewHoleDia/2+InnerBorder+GrooveWidth/2);
            AdditionalScrewRidgeGrooveAxis(true, 0, 0, 0.05);
            AdditionalScrewRidgeGrooveAxis(false, 0, 0, 0.05);
}


// Cuts one screw hole shape in the lid at the current position
module TopScrewHoleCut() {
    if (ScrewHeadType == 1)
        ScrewCut(MetricScrewSize, CutFromTop+0.01, 0);
    if (ScrewHeadType == 2) {
        translate([0,0,-0.01]) cylinder(h=CutFromTop+0.02, d=ScrewHoleDia, center=false);
        translate([0,0,-0.01]) cylinder(h=ScrewHeadHeight+0.02, d=ScrewHeadDiameter, center=false);
    }
    if (ScrewHeadType == 3)
        translate([0,0,-0.01]) cylinder(h=CutFromTop+0.02, d=ScrewHoleDia, center=false);
}

// Places lid screw holes at all four corners and optional mid-side positions
module TopScrewHoles() {
    for (sx = [-1, 1], sy = [-1, 1])
        translate([sx*ScrewCornerPos[0], sy*ScrewCornerPos[1], 0]) TopScrewHoleCut();
    for (sy = [-1, 1], i = [1 : max(1, XAdditionalScrew)]) if (XAdditionalScrew > 0) {
        x_i = (i - (XAdditionalScrew+1)/2) * (Caselength - 2*CaseRoundingRadius) / (XAdditionalScrew+1);
        translate([x_i, sy*(CaseWidth/2-CaseRoundingRadius), 0]) TopScrewHoleCut();
    }
    for (sx = [-1, 1], i = [1 : max(1, YAdditionalScrew)]) if (YAdditionalScrew > 0) {
        y_i = (i - (YAdditionalScrew+1)/2) * (CaseWidth - 2*CaseRoundingRadius) / (YAdditionalScrew+1);
        translate([sx*(Caselength/2-CaseRoundingRadius), y_i, 0]) TopScrewHoleCut();
    }
}

// Cuts one nut pocket at the current position; nut_rot rotates square nut slots
module NutHoleCut(nut_rot=0) {
    H = CaseHeight - CutFromTop;
    if (NutStyle == 1)
        translate([0,0,H-HoleDeepness+0.01]) cylinder(h=HoleDeepness, d=HoleDiaThread, center=false);
    if (NutStyle == 2)
        translate([0,0,H+0.01]) NutCut(H, NutHigh, NutDia);
    if (NutStyle == 3)
        translate([0,0,H+0.01]) rotate([0,0,nut_rot]) SquareNutCut(H, SquareNutHigh, SquareNutSize, 1);
    if (NutStyle == 4)
        translate([0,0,H+0.01]) rotate([0,0,nut_rot]) SquareNutCut(H, SquareNutHigh, SquareNutSize, 0);
}

// Places nut pockets at all four corners and optional mid-side positions
module BodyNutHoles() {
    corner_rot = (NutStyle == 4 && !EdgeSquareNutInsertFrom_X) ? 90 : 0;
    for (sx = [-1, 1], sy = [-1, 1])
        translate([sx*ScrewCornerPos[0], sy*ScrewCornerPos[1], 0]) NutHoleCut(corner_rot);
    for (sy = [-1, 1], i = [1 : max(1, XAdditionalScrew)]) if (XAdditionalScrew > 0) {
        x_i = (i - (XAdditionalScrew+1)/2) * (Caselength - 2*CaseRoundingRadius) / (XAdditionalScrew+1);
        translate([x_i, sy*(CaseWidth/2-CaseRoundingRadius), 0]) NutHoleCut(90);
    }
    for (sx = [-1, 1], i = [1 : max(1, YAdditionalScrew)]) if (YAdditionalScrew > 0) {
        y_i = (i - (YAdditionalScrew+1)/2) * (CaseWidth - 2*CaseRoundingRadius) / (YAdditionalScrew+1);
        translate([sx*(Caselength/2-CaseRoundingRadius), y_i, 0]) NutHoleCut(0);
    }
}

// Cuts holes through one side wall.
// wall_xy : [x,y] of the wall centre — the perpendicular axis is fixed, the other is 0.
// along   : [ax,ay] unit vector along the wall (the axis holes are spread on).
// rot     : cylinder rotation — [90,0,90] for X-normal walls, [90,0,0] for Y-normal walls.
// count=1 → one hole at position; count=2 → ±distance/2; count=3 → 0, ±distance.
module SideWallHoleSet(show, count, dia, offset_z, distance, position, wall_xy, along, rot) {
    z = offset_z + BottomTopThickness + (CaseHeight - CutFromTop - BottomTopThickness) / 2;
    offsets = count == 1 ? [0] :
              count == 2 ? [-distance/2, distance/2] :
                           [-distance, 0, distance];
    if (show)
        for (o = offsets)
            translate([wall_xy[0] + along[0]*(position+o),
                       wall_xy[1] + along[1]*(position+o), z])
                rotate(rot) cylinder(h=SideWallThickness+0.04, d=dia, center=true);
}

module BodyQuarterBottom (Caselength,CaseWidth,BodyHeight,CaseRoundingRadius,SideWallThickness) {
    color("SteelBlue")BodyQuarter(Caselength,CaseWidth,BodyHeight,CaseRoundingRadius,SideWallThickness);

    if (XAdditionalScrew == 0)
        translate([CaseRoundingRadius+ScrewHoleDia/2-0.01,CaseWidth/2-OuterBorder-GrooveWidth/2-0.01,BodyHeight+0.01])  translate([0,0,0]) rotate([0,0,0])  RidgeStraight(Caselength/2-3*CaseRoundingRadius-ScrewHoleDia+0.03);
    if (YAdditionalScrew == 0)
        translate([Caselength/2-OuterBorder-GrooveWidth/2-0.01,CaseRoundingRadius+ScrewHoleDia/2-0.02,BodyHeight+0.01]) translate([0,0,0]) rotate([0,0,90]) RidgeStraight(CaseWidth/2-3*CaseRoundingRadius-ScrewHoleDia+0.04);
    translate([0,0,BodyHeight+0.01]) translate(ScrewCornerPos) rotate([0,0,180]) RidgeCurved(90,ScrewHoleDia/2+OuterBorder+GrooveWidth/2);
    translate([-ScrewHoleDia-SideWallThickness+0.02,-0.01,BodyHeight+0.01]) translate(ScrewCornerPos) rotate([0,0,0]) RidgeCurved(90,ScrewHoleDia/2+InnerBorder+GrooveWidth/2);
    translate([-0.01,-ScrewHoleDia-SideWallThickness+0.00,BodyHeight+0.01]) translate(ScrewCornerPos) rotate([0,0,0]) RidgeCurved(90,ScrewHoleDia/2+InnerBorder+GrooveWidth/2);
    AdditionalScrewRidgeGrooveAxis(true, 1, BodyHeight+0.01, 0.05);
    AdditionalScrewRidgeGrooveAxis(false, 1, BodyHeight+0.01, 0.05);
}

module BodyQuarterTop (Caselength,CaseWidth,CutFromTop,CaseRoundingRadius,SideWallThickness) {

    difference()
    {
        union(){
            color("DarkCyan")BodyQuarter(Caselength,CaseWidth,CutFromTop,CaseRoundingRadius,SideWallThickness);
        }
        if (XAdditionalScrew == 0)
            translate([CaseRoundingRadius+ScrewHoleDia/2-0.01,CaseWidth/2-OuterBorder-GrooveWidth/2-0.01,CutFromTop+0.01])  translate([0,0,0]) rotate([0,0,0]) GrooveStraight(Caselength/2-3*CaseRoundingRadius-ScrewHoleDia+0.03);
        if (YAdditionalScrew == 0)
            translate([Caselength/2-OuterBorder-GrooveWidth/2-0.01,CaseRoundingRadius+ScrewHoleDia/2-0.02,CutFromTop+0.01])  translate([0,0,0]) rotate([0,0,90]) GrooveStraight(CaseWidth/2-3*CaseRoundingRadius-ScrewHoleDia+0.04);
        translate([0,0,CutFromTop+0.01]) translate(ScrewCornerPos) rotate([0,0,180]) GrooveCurved(90,ScrewHoleDia/2+OuterBorder+GrooveWidth/2);
        translate([-ScrewHoleDia-SideWallThickness+0.02,-0.01,CutFromTop+0.01]) translate(ScrewCornerPos) rotate([0,0,0]) GrooveCurved(90,ScrewHoleDia/2+InnerBorder+GrooveWidth/2);
        translate([-0.01,-ScrewHoleDia-SideWallThickness+0.0,CutFromTop+0.01]) translate(ScrewCornerPos) rotate([0,0,0]) GrooveCurved(90,ScrewHoleDia/2+InnerBorder+GrooveWidth/2);
        AdditionalScrewRidgeGrooveAxis(true, 2, CutFromTop+0.01, 0.07);
        AdditionalScrewRidgeGrooveAxis(false, 2, CutFromTop+0.01, 0.057);
    }
}

module BodyQuarter (L,W,H,Rad,Rand){
    cube([L/2-Rad,W/2,BottomTopThickness],center=false); // Ground
    cube([L/2,W/2-Rad,BottomTopThickness],center=false); // Ground
    if (CaseRadius < CaseRoundingRadius)
    {
        translate([0,W/2-Rand,0]) cube([L/2-CaseRadius,Rand,H],center=false); // Wall
        translate([L/2-Rand,0,0]) cube([Rand,W/2-CaseRadius,H],center=false); // Wall
        translate([L/2-CaseRadius,W/2-CaseRadius,H/2]) cylinder(h=H,r=CaseRadius,center = true);
    }
    else
    {
        translate([0,W/2-Rand,0]) cube([L/2-Rad,Rand,H],center=false); // Wall
        translate([L/2-Rand,0,0]) cube([Rand,W/2-Rad,H],center=false); // Wall
    }
    translate(ScrewCornerPos) cylinder(h=H,r=Rad,center = false); // Cylinder
    translate([L/2-3*Rad+Rand,W/2-Rad,0]) rotate([0,0,  0]) HolderGap(H,Rad,Rand); // Gap between wall and Cylinder
    translate([L/2-Rad,W/2-Rad-Rand,0])   rotate([0,0,-90]) HolderGap(H,Rad,Rand); // Gap Between wall and Cylinder
    for (i = [1 : max(1, XAdditionalScrew)]) if (XAdditionalScrew > 0) {
        x_i = (i - (XAdditionalScrew+1)/2) * (L - 2*Rad) / (XAdditionalScrew+1);
        if (x_i >= 0) {
            translate([x_i,          W/2-Rad, 0]) cylinder(h=H, r=Rad, center=false);
            translate([x_i+Rand,     W/2-Rad, 0]) rotate([0,0,  0]) HolderGap(H,Rad,Rand);
            translate([x_i+Rand-2*Rad, W/2-Rad, 0]) rotate([0,0,  0]) HolderGap(H,Rad,Rand);
        }
    }
    for (i = [1 : max(1, YAdditionalScrew)]) if (YAdditionalScrew > 0) {
        y_i = (i - (YAdditionalScrew+1)/2) * (W - 2*Rad) / (YAdditionalScrew+1);
        if (y_i >= 0) {
            translate([L/2-Rad, y_i,           0]) cylinder(h=H, r=Rad, center=false);
            translate([L/2-Rad, y_i+2*Rad-Rand, 0]) rotate([0,0,270]) HolderGap(H,Rad,Rand);
            translate([L/2-Rad, y_i-Rand,       0]) rotate([0,0,270]) HolderGap(H,Rad,Rand);
        }
    }
}

module NutCut(TotalHigh,High,Dia){
    AdditionalGap=0.3;
    translate([0,0,-(High+2*AdditionalGap)/2-NutSink]) cylinder($fn=6,h=High+2*AdditionalGap,d=2*sqrt(((Dia/2)*(Dia/2))+((Dia/4)*(Dia/4)))+Dia/26+2*AdditionalGap,center = true);
    translate([0,0,-HoleDeepness/2]) cylinder(h=HoleDeepness,d=ScrewHoleDia,center = true);
}

module SquareNutCut (TotalHigh,High,Size,OnlyNut) {
    AdditionalGap=0.5;
    SquareNutInsertReduction= 0.2;
    if (OnlyNut)
    {
        translate([0,0,-(High+2*AdditionalGap)/2-NutSink])cube([Size+2*AdditionalGap,Size+2*AdditionalGap,High+2*AdditionalGap],center=true);
        translate([0,0,-HoleDeepness/2]) cylinder(h=HoleDeepness,d=ScrewHoleDia,center = true);
    }
    else
    {
        translate([0,0,-(High+2*AdditionalGap)/2-NutSink])cube([Size+2*AdditionalGap,Size+2*AdditionalGap,High+2*AdditionalGap],center=true);
        translate([CaseRoundingRadius/2+0.02,0,-(High+2*AdditionalGap)/2-NutSink+SquareNutInsertReduction/2]) cube([CaseRoundingRadius+0.04,Size+2*AdditionalGap,High+2*AdditionalGap-SquareNutInsertReduction],center=true);
        translate([0,0,-HoleDeepness/2]) cylinder(h=HoleDeepness,d=ScrewHoleDia,center = true);
    }
}

module SideWallHoles () {
    cylinder(h=20,d1=10,d2=15,center = true);
}

module ScrewCut(m,h,v){
// m = 3=M3  4=M4  5=M5 6=M6 usw...
// h = High of the screw inkl. head
// v = if screw head is to be sunk deeper

    ScrewHeadDia=m*2; // Berechnung des Schraubenkopf Durchmessers
    //ScrewCountersink=(m+8)/14-0.7; // Leichte ScrewCountersink damit Schraube nicht vorsteht
    ScrewHoleDia=m+1; // ScrewHoleDiadurchmesser

    translate([0,0,-0.01])  union(){ // Ganze Schraube

            translate([0,0,ScrewCountersink-0.01])cylinder( h = ScrewHeadDia/4,d1=ScrewHeadDia,d2=ScrewHeadDia/2,center=false); // Kegel (Abschraegung)
            translate([0,0,0]) cylinder( h = ScrewCountersink,d=ScrewHeadDia,center=false);  // ScrewCountersink
            translate([0,0,0.01])rotate([180,0,0])cylinder(h=v,d=ScrewHeadDia,center = false); // Versenkung
            translate([0,0,0.01])cylinder( h = h,d=ScrewHoleDia,center=false); //Loch fuer Gewinde
    }
}

module HolderGap (H,Rad,Rand) {
    difference(){
        translate([0,0,0]) cube([Rad*2-2*Rand,Rad-Rand,H],center=false);
        translate([0,0,-0.02]) cylinder(h=H+0.04,r=Rad-Rand,center = false);
        translate([2*(Rad-Rand),0,-0.02]) cylinder(h=H+0.04,r=Rad-Rand,center = false);
    }
}

// Cuts a 45° triangular prism from the bottom of floating additional screw pillars
// Tapers the pillar inward as it goes down, creating a printable overhang
// Top (highest Z): point at innermost position
// Bottom (Z=cut_height): wide, reaching from innermost to wall
// x_pos, y_pos: center position of the screw pillar
// is_x_axis: true for X-axis screws (along width), false for Y-axis screws (along length)
module AdditionalScrewPillarTriangleCut(x_pos, y_pos, is_x_axis) {
    if (OptimizeAdditionalScrewPillars) {
        pillar_height = CaseHeight - CutFromTop;
        cut_height = pillar_height - RemainingPillarHeight;

        // Only cut if there's material to remove
        if (cut_height > BottomTopThickness) {
            // Width of the triangular cut along the wall
            cut_width = 3 * CaseRoundingRadius;
            // Leg length for 45° triangle (both legs equal)
            leg_length = 2.5 * CaseRoundingRadius;

            if (is_x_axis) {
                // X-axis screw: triangle in Y-Z plane, extruded along X
                inner_wall_y = CaseWidth/2 - SideWallThickness;
                y_sign = (y_pos > 0) ? 1 : -1;

                if (y_sign > 0) {
                    // +Y wall: pillar tapers from inner point at top to wall at bottom
                    // Triangle vertices (relative to inner_wall_y, cut_height):
                    // (0, 0) - at wall, bottom
                    // (-leg_length, 0) - inward, bottom
                    // (-leg_length, leg_length) - inward, top (the point)
                    translate([x_pos, inner_wall_y, cut_height])
                    rotate([0, 90, 0])
                    linear_extrude(height = cut_width, center = true)
                    polygon(points = [[0, 0], [0, -leg_length], [-leg_length, -leg_length]]);
                } else {
                    // -Y wall: pillar tapers from inner point at top to wall at bottom
                    translate([x_pos, -inner_wall_y, cut_height])
                    rotate([0, 90, 0])
                    linear_extrude(height = cut_width, center = true)
                    polygon(points = [[0, 0], [0, leg_length], [-leg_length, leg_length]]);
                }
            } else {
                // Y-axis screw: triangle in X-Z plane, extruded along Y
                inner_wall_x = Caselength/2 - SideWallThickness;
                x_sign = (x_pos > 0) ? 1 : -1;

                if (x_sign > 0) {
                    // +X wall: pillar tapers from inner point at top to wall at bottom
                    translate([inner_wall_x, y_pos, cut_height])
                    rotate([-90, 0, 0])
                    linear_extrude(height = cut_width, center = true)
                    polygon(points = [[0, 0], [-leg_length, 0], [-leg_length, -leg_length]]);
                } else {
                    // -X wall: pillar tapers from inner point at top to wall at bottom
                    translate([-inner_wall_x, y_pos, cut_height])
                    rotate([-90, 0, 0])
                    linear_extrude(height = cut_width, center = true)
                    polygon(points = [[0, 0], [leg_length, 0], [leg_length, -leg_length]]);
                }
            }
        }
    }
}

// Cuts a rectangular prism from additional screw pillars to optimize for 3D printing
// x_pos, y_pos: center position of the screw pillar
// is_x_axis: true for X-axis screws (along width), false for Y-axis screws (along length)
module AdditionalScrewPillarCut(x_pos, y_pos, is_x_axis) {
    if (OptimizeAdditionalScrewPillars) {
        pillar_height = CaseHeight - CutFromTop;
        cut_height = pillar_height - RemainingPillarHeight;

        // Only cut if there's material to remove
        if (cut_height > BottomTopThickness) {
            // Width along the wall: enough to remove pillar and HolderGaps
            cut_width = 3 * CaseRoundingRadius;
            // Depth perpendicular to wall: enough to completely remove pillar
            cut_depth = 2.5 * CaseRoundingRadius;

            if (is_x_axis) {
                // X-axis screw: cut extends from inner Y wall inward
                inner_wall_y = CaseWidth/2 - SideWallThickness;
                y_sign = (y_pos > 0) ? 1 : -1;

                if (y_sign > 0) {
                    // +Y wall: cut extends in -Y direction (inward)
                    translate([x_pos - cut_width/2, inner_wall_y - cut_depth, BottomTopThickness])
                        cube([cut_width, cut_depth, cut_height - BottomTopThickness]);
                } else {
                    // -Y wall: cut extends in +Y direction (inward)
                    translate([x_pos - cut_width/2, -inner_wall_y, BottomTopThickness])
                        cube([cut_width, cut_depth, cut_height - BottomTopThickness]);
                }
            } else {
                // Y-axis screw: cut extends from inner X wall inward
                inner_wall_x = Caselength/2 - SideWallThickness;
                x_sign = (x_pos > 0) ? 1 : -1;

                if (x_sign > 0) {
                    // +X wall: cut extends in -X direction (inward)
                    translate([inner_wall_x - cut_depth, y_pos - cut_width/2, BottomTopThickness])
                        cube([cut_depth, cut_width, cut_height - BottomTopThickness]);
                } else {
                    // -X wall: cut extends in +X direction (inward)
                    translate([-inner_wall_x, y_pos - cut_width/2, BottomTopThickness])
                        cube([cut_depth, cut_width, cut_height - BottomTopThickness]);
                }
            }
        }
    }
}

// Cuts a single rectangular prism from corner pillars to optimize for 3D printing
// The rectangle has one edge aligned with each inner wall surface
// x_pos, y_pos: position of the corner pillar center
module CornerPillarCut(x_pos, y_pos) {
    if (OptimizeCornerScrewPillars) {
        pillar_height = CaseHeight - CutFromTop;
        cut_height = pillar_height - RemainingPillarHeight;

        // Only cut if there's material to remove
        if (cut_height > BottomTopThickness) {
            // Depth in each direction: enough to completely remove pillar interior
            cut_depth = 2.5 * CaseRoundingRadius;

            inner_wall_x = Caselength/2 - SideWallThickness;
            inner_wall_y = CaseWidth/2 - SideWallThickness;
            x_sign = (x_pos > 0) ? 1 : -1;
            y_sign = (y_pos > 0) ? 1 : -1;

            // Single rectangular cut with corner at inner wall intersection
            // One edge flush with inner X wall, one edge flush with inner Y wall
            if (x_sign > 0 && y_sign > 0) {
                // +X, +Y corner: cut extends inward in -X and -Y directions
                translate([inner_wall_x - cut_depth, inner_wall_y - cut_depth, BottomTopThickness])
                    cube([cut_depth, cut_depth, cut_height - BottomTopThickness]);
            } else if (x_sign > 0 && y_sign < 0) {
                // +X, -Y corner: cut extends inward in -X and +Y directions
                translate([inner_wall_x - cut_depth, -inner_wall_y, BottomTopThickness])
                    cube([cut_depth, cut_depth, cut_height - BottomTopThickness]);
            } else if (x_sign < 0 && y_sign > 0) {
                // -X, +Y corner: cut extends inward in +X and -Y directions
                translate([-inner_wall_x, inner_wall_y - cut_depth, BottomTopThickness])
                    cube([cut_depth, cut_depth, cut_height - BottomTopThickness]);
            } else {
                // -X, -Y corner: cut extends inward in +X and +Y directions
                translate([-inner_wall_x, -inner_wall_y, BottomTopThickness])
                    cube([cut_depth, cut_depth, cut_height - BottomTopThickness]);
            }
        }
    }
}

module DeviceHolder (Col,CylHeight,CylDia,HoleDia) {
    color(Col)translate([0,0,CylHeight/2+BottomTopThickness]) difference(){
        cylinder(h=CylHeight,d=CylDia,center = true);
        translate([0,0,0]) cylinder(h=CylHeight+0.05,d=HoleDia,center = true);
    }
}

// Places four DeviceHolder posts at ±dx/2+ox, ±dy/2+oy (all four sign combinations).
module PlaceDeviceHolders(show, dx, dy, ox, oy, col, height, dia, hole_dia) {
    if (show)
        for (sx = [-1, 1], sy = [-1, 1])
            translate([sx*dx/2+ox, sy*dy/2+oy, -0.01])
                DeviceHolder(col, height, dia, hole_dia);
}

// Helper module to call the appropriate straight ridge/groove/gasket module
// element_type: 0=gasket, 1=ridge, 2=groove
module RidgeGrooveStraight(element_type, length) {
    if (element_type == 0)
        GasketRidgeStraight(length);
    else if (element_type == 1)
        RidgeStraight(length);
    else
        GrooveStraight(length);
}

// Helper module to call the appropriate curved ridge/groove/gasket module
// element_type: 0=gasket, 1=ridge, 2=groove
module RidgeGrooveCurved(element_type, angle, radius) {
    if (element_type == 0)
        GasketRidgeCurved(angle, radius);
    else if (element_type == 1)
        RidgeCurved(angle, radius);
    else
        GrooveCurved(angle, radius);
}

// Helper module to generate ridge/groove/gasket pattern for additional screws along one axis
// is_x_axis: true for X-axis (screws along width), false for Y-axis (screws along length)
// element_type: 0=gasket, 1=ridge, 2=groove
// z_offset: z-coordinate offset for all elements
// last_straight_offset: final adjustment for the last straight section
module AdditionalScrewRidgeGrooveAxis(is_x_axis, element_type, z_offset, last_straight_offset) {
    screw_count = is_x_axis ? XAdditionalScrew : YAdditionalScrew;
    case_dim = is_x_axis ? Caselength : CaseWidth;
    perp_dim = is_x_axis ? CaseWidth : Caselength;

    if (screw_count > 0) {
        pos_first = (ceil((screw_count+1)/2) - (screw_count+1)/2) * (case_dim-2*CaseRoundingRadius) / (screw_count+1);
        pos_last  = (screw_count - (screw_count+1)/2) * (case_dim-2*CaseRoundingRadius) / (screw_count+1);

        // Straight section from corner to first screw
        fill_len_first = pos_first-(ScrewHoleDia+SideWallThickness)+0.04;
        if (fill_len_first > 0) {
            if (is_x_axis)
                translate([-0.01, perp_dim/2-OuterBorder-GrooveWidth/2-0.01, z_offset])
                    RidgeGrooveStraight(element_type, fill_len_first);
            else
                translate([perp_dim/2-OuterBorder-GrooveWidth/2-0.01, -0.01, z_offset])
                    rotate([0,0,90]) RidgeGrooveStraight(element_type, fill_len_first);
        }

        // Screws and sections between them
        for (i = [1 : max(1, screw_count)]) {
            pos_i    = (i   - (screw_count+1)/2) * (case_dim-2*CaseRoundingRadius) / (screw_count+1);
            pos_prev = (i-1 - (screw_count+1)/2) * (case_dim-2*CaseRoundingRadius) / (screw_count+1);
            if (pos_i >= 0) {
                // Straight section between screws
                if (pos_prev >= 0) {
                    left_start = pos_prev+(ScrewHoleDia+SideWallThickness);
                    fill_len   = pos_i-(ScrewHoleDia+SideWallThickness)-left_start+0.04;
                    if (fill_len > 0) {
                        if (is_x_axis)
                            translate([left_start, perp_dim/2-OuterBorder-GrooveWidth/2-0.01, z_offset])
                                RidgeGrooveStraight(element_type, fill_len);
                        else
                            translate([perp_dim/2-OuterBorder-GrooveWidth/2-0.01, left_start, z_offset])
                                rotate([0,0,90]) RidgeGrooveStraight(element_type, fill_len);
                    }
                }
                // Curves around screw
                if (is_x_axis) {
                    translate([pos_i-(ScrewHoleDia+SideWallThickness)+0.04, perp_dim/2-CaseRoundingRadius-0.01, z_offset])
                        rotate([0,0,0]) RidgeGrooveCurved(element_type, 90, ScrewHoleDia/2+InnerBorder+GrooveWidth/2);
                    translate([pos_i, perp_dim/2-CaseRoundingRadius-0.01, z_offset])
                        rotate([0,0,180]) RidgeGrooveCurved(element_type, 180, ScrewHoleDia/2+InnerBorder+GrooveWidth/2);
                    translate([pos_i+(ScrewHoleDia+SideWallThickness), perp_dim/2-CaseRoundingRadius-0.01, z_offset])
                        rotate([0,0,90]) RidgeGrooveCurved(element_type, 90, ScrewHoleDia/2+InnerBorder+GrooveWidth/2);
                } else {
                    translate([perp_dim/2-CaseRoundingRadius-0.01, pos_i-(ScrewHoleDia+SideWallThickness)-0.01, z_offset])
                        rotate([0,0,0]) RidgeGrooveCurved(element_type, 90, ScrewHoleDia/2+InnerBorder+GrooveWidth/2);
                    translate([perp_dim/2-CaseRoundingRadius-0.01, pos_i, z_offset])
                        rotate([0,0,90]) RidgeGrooveCurved(element_type, 180, ScrewHoleDia/2+InnerBorder+GrooveWidth/2);
                    translate([perp_dim/2-CaseRoundingRadius-0.01, pos_i+(ScrewHoleDia+SideWallThickness)-0.01, z_offset])
                        rotate([0,0,270]) RidgeGrooveCurved(element_type, 90, ScrewHoleDia/2+InnerBorder+GrooveWidth/2);
                }
            }
        }

        // Straight section from last screw to corner
        left_start_last = pos_last+(ScrewHoleDia+SideWallThickness);
        fill_len_last = case_dim/2-2*CaseRoundingRadius-ScrewHoleDia/2-left_start_last+last_straight_offset;
        if (fill_len_last > 0) {
            if (is_x_axis)
                translate([left_start_last, perp_dim/2-OuterBorder-GrooveWidth/2-0.01, z_offset])
                    RidgeGrooveStraight(element_type, fill_len_last);
            else
                translate([perp_dim/2-OuterBorder-GrooveWidth/2-0.01, left_start_last, z_offset])
                    rotate([0,0,90]) RidgeGrooveStraight(element_type, fill_len_last);
        }
    }
    if (screw_count == 0) {
        if (is_x_axis)
            translate([-0.01, perp_dim/2-OuterBorder-GrooveWidth/2-0.01, z_offset])
                RidgeGrooveStraight(element_type, case_dim/2-2*CaseRoundingRadius-ScrewHoleDia/2+last_straight_offset);
        else
            translate([perp_dim/2-OuterBorder-GrooveWidth/2-0.01, -0.01, z_offset])
                rotate([0,0,90]) RidgeGrooveStraight(element_type, case_dim/2-2*CaseRoundingRadius-ScrewHoleDia/2+last_straight_offset);
    }
}

module pie(radius, angle, height, spin=0) {
    // Negative angles shift direction of rotation
    clockwise = (angle < 0) ? true : false;
    // Support angles < 0 and > 360
    normalized_angle = abs((angle % 360 != 0) ? angle % 360 : angle % 360 + 360);
    // Select rotation direction
    rotation = clockwise ? [0, 180 - normalized_angle] : [180, normalized_angle];
    // Render
    if (angle != 0) {
        rotate([0,0,spin]) linear_extrude(height=height)
        difference() {
            circle(radius);
            if (normalized_angle < 180) {
                union() for(a = rotation)
                    rotate(a) translate([-radius, 0, 0]) square(radius * 2);
            }
            else if (normalized_angle != 360) {
                intersection_for(a = rotation)
                    rotate(a) translate([-radius, 0, 0]) square(radius * 2);
            }
        }
    }
}

module roundedBox(size, radius, sidesonly) // Laenge, Breite, Hoehe, Radius, 0/1
{
  rot = [ [0,0,0], [90,0,90], [90,90,0] ];
  if (sidesonly) {
    cube(size - [2*radius,0,0], true);
    cube(size - [0,2*radius,0], true);
    for (x = [radius-size[0]/2, -radius+size[0]/2],
           y = [radius-size[1]/2, -radius+size[1]/2]) {
      translate([x,y,0]) cylinder(r=radius, h=size[2], center=true);
    }
  }
  else {
    cube([size[0], size[1]-radius*2, size[2]-radius*2], center=true);
    cube([size[0]-radius*2, size[1], size[2]-radius*2], center=true);
    cube([size[0]-radius*2, size[1]-radius*2, size[2]], center=true);

    for (axis = [0:2]) {
      for (x = [radius-size[axis]/2, -radius+size[axis]/2],
             y = [radius-size[(axis+1)%3]/2, -radius+size[(axis+1)%3]/2]) {
        rotate(rot[axis])
          translate([x,y,0])
          cylinder(h=size[(axis+2)%3]-2*radius, r=radius, center=true);
      }
    }
    for (x = [radius-size[0]/2, -radius+size[0]/2],
           y = [radius-size[1]/2, -radius+size[1]/2],
           z = [radius-size[2]/2, -radius+size[2]/2]) {
      translate([x,y,z]) sphere(radius);
    }
  }
}

