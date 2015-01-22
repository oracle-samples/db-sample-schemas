rem
rem Header: oe_p_pi.sql 09-jan-01
rem
rem Copyright (c) 2001, 2015, Oracle Corporation.  All rights reserved.  
rem 
rem Permission is hereby granted, free of charge, to any person obtaining
rem a copy of this software and associated documentation files (the
rem "Software"), to deal in the Software without restriction, including
rem without limitation the rights to use, copy, modify, merge, publish,
rem distribute, sublicense, and/or sell copies of the Software, and to
rem permit persons to whom the Software is furnished to do so, subject to
rem the following conditions:
rem 
rem The above copyright notice and this permission notice shall be
rem included in all copies or substantial portions of the Software.
rem 
rem THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
rem EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
rem MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
rem NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
rem LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
rem OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
rem WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
rem
rem Owner  : ahunold
rem
rem NAME
rem   oe_p_pi.sql - populate OE Common Schema
rem
rem DESCRIPTON
rem   Table product_information
rem
rem MODIFIED   (MM/DD/YY)
rem   hyeh      08/29/02 - hyeh_mv_comschema_to_rdbms
rem   ahunold   04/05/01 - NULL prices for 3355,1770,1769
rem   ahunold   01/09/01 - checkin ADE


set define off
INSERT INTO product_information VALUES (1726-
, 'LCD Monitor 11/PM'-
, 'Liquid Cristal Display 11 inch passive monitor. The virtually-flat,-
high-resolution screen delivers outstanding image quality with reduced glare.'
, 11,3
, to_yminterval('+00-03')
, 102067
, 'under development'
, 259
, 208
, 'http://www.www.supp-102067.com/cat/hw/p1726.html');
INSERT INTO product_information VALUES (2359-
, 'LCD Monitor 9/PM'-
, 'Liquid Cristal Display 9 inch passive monitor. Enjoy the productivity that-
a small monitor can bring via more workspace on your desk. Easy setup with-
plug-and-play compatibility.'
, 11,3
, to_yminterval('+00-03')
, 102061
, 'orderable'
, 249
, 206
, 'http://www.www.supp-102061.com/cat/hw/p2359.html');
INSERT INTO product_information VALUES (3060-
, 'Monitor 17/HR'-
, 'CRT Monitor 17 inch (16 viewable) high resolution. Exceptional image-
performance and the benefit of additional screen space. This monitor offers-
sharp, color-rich monitor performance at an incredible value. With a host of-
leading features, including on-screen display controls.'
, 11,4
, to_yminterval('+00-06')
, 102081
, 'orderable'
, 299
, 250
, 'http://www.supp-102081.com/cat/hw/p3060.html');
INSERT INTO product_information VALUES (2243-
, 'Monitor 17/HR/F'-
, 'Monitor 17 inch (16 viewable) high resolution, flat screen. High density-
photon gun with Enhanced Elliptical Correction System for more consistent,-
accurate focus across the screen, even in the corners.'
, 11,4
, to_yminterval('+00-06')
, 102060
, 'orderable'
, 350
, 302
, 'http://www.supp-102060.com/cat/hw/p2243.html');
INSERT INTO product_information VALUES (3057-
, 'Monitor 17/SD'-
, 'CRT Monitor 17 inch (16 viewable) short depth. Delivers outstanding-
image clarity and precision. Gives professional color, technical-
engineering, and visualization/animation users the color fidelity they-
demand, plus a large desktop for enhanced productivity.'
, 11,4
, to_yminterval('+00-06')
, 102055
, 'orderable'
, 369
, 320
, 'http://www.supp-102055.com/cat/hw/p3057.html');
INSERT INTO product_information VALUES (3061-
, 'Monitor 19/SD'-
, 'CRT Monitor 19 inch (18 viewable) short depth. High-contrast black-
screen coating: produces superior contrast and grayscale performance.-
The newly designed, amplified professional speakers with dynamic bass-
response bring all of your multimedia audio experiences to life with-
crisp, true-to-life sound and rich, deep bass tones. Plus, color-coded-
cables, simple plug-and-play setup and digital on-screen controls mean you-
are ready to set your sights on outrageous multimedia and the incredible-
Internet in just minutes.'
, 11,5
, to_yminterval('+00-09')
, 102094
, 'orderable'
, 499
, 437
, 'http://www.supp-102094.com/cat/hw/p3061.html');
INSERT INTO product_information VALUES (2245-
, 'Monitor 19/SD/M'-
, 'Monitor 19 (18 Viewable) short depth, Monochrome. Outstanding image-
performance in a compact design. A simple, on-screen dislay menu helps you-
easily adjust screen dimensions, colors and image attributes. Just plug-
your monitor into your PC and you are ready to go.'
, 11,5
, to_yminterval('+00-09')
, 102053
, 'orderable'
, 512
, 420
, 'http://www.supp-102053.com/cat/hw/p2245.html');
INSERT INTO product_information VALUES (3065-
, 'Monitor 21/D'-
, 'CRT Monitor 21 inch (20 viewable). Digital OptiScan technology: supports-
resolutions up to 1600 x 1200 at 75Hz. Dimensions (HxWxD): 8.3 x 18.5 x 15-
inch. The detachable or attachable monitor-powered Platinum Series speakers-
offer crisp sound and the convenience of a digital audio player jack. Just-
plug in your digital audio player and listen to tunes without powering up-
your PC.'
, 11,5
, to_yminterval('+01-00')
, 102051
, 'orderable'
, 999
, 875
, 'http://www.supp-102051.com/cat/hw/p3065.html');
INSERT INTO product_information VALUES (3331-
, 'Monitor 21/HR'-
, '21 inch monitor (20 inch viewable) high resolution. This monitor is ideal-
for business, desktop publishing, and graphics-intensive applications. Enjoy-
the productivity that a large monitor can bring via more workspace for-
running applications.'
, 11,5
, to_yminterval('+01-00')
, 102083
, 'orderable'
, 879
, 785
, 'http://www.supp-102083.com/cat/hw/p3331.html');
INSERT INTO product_information VALUES (2252-
, 'Monitor 21/HR/M'-
, 'Monitor 21 inch (20 viewable) high resolution, monochrome. Unit size:-
35.6 x 29.6 x 33.3 cm (14.6 kg) Package: 40.53 x 31.24 x 35.39 cm-
(16.5 kg). Horizontal frequency 31.5 - 54 kHz, Vertical frequency 50 - 120-
Hz. Universal power supply 90 - 132 V, 50 - 60 Hz.'
, 11,5
, to_yminterval('+01-06')
, 102079
, 'obsolete'
, 889
, 717
, 'http://www.supp-102079.com/cat/hw/p2252.html');
INSERT INTO product_information VALUES (3064-
, 'Monitor 21/SD'-
, 'Monitor 21 inch (20 viewable) short depth. Features include a 0.25-0.28-
Aperture Grille Pitch, resolution support up to 1920 x 1200 at 76Hz,-
on-screen displays, and a conductive anti-reflective film coating.'
, 11,5
, to_yminterval('+01-06')
, 102096
, 'planned'
, 1023
, 909
, 'http://www.supp-102096.com/cat/hw/p3064.html');
INSERT INTO product_information VALUES (3155-
, 'Monitor Hinge - HD'-
, 'Monitor Hinge, heavy duty, maximum monitor weight 30 kg'
, 11,4
, to_yminterval('+10-00')
, 102092
, 'orderable'
, 49
, 42
, 'http://www.supp-102092.com/cat/hw/p3155.html');
INSERT INTO product_information VALUES (3234-
, 'Monitor Hinge - STD'-
, 'Standard Monitor Hinge, maximum monitor weight 10 kg'
, 11,3
, to_yminterval('+10-00')
, 102072
, 'orderable'
, 39
, 34
, 'http://www.supp-102072.com/cat/hw/p3234.html');
INSERT INTO product_information VALUES (3350-
, 'Plasma Monitor 10/LE/VGA'-
, '10 inch low energy plasma monitor, VGA resolution'
, 11,3
, to_yminterval('+01-00')
, 102068
, 'orderable'
, 740
, 630
, 'http://www.supp-102068.com/cat/hw/p3350.html');
INSERT INTO product_information VALUES (2236-
, 'Plasma Monitor 10/TFT/XGA'-
, '10 inch TFT XGA flatscreen monitor for laptop computers'
, 11,3
, to_yminterval('+01-00')
, 102090
, 'under development'
, 964
, 863
, 'http://www.supp-102090.com/cat/hw/p2236.html');
INSERT INTO product_information VALUES (3054-
, 'Plasma Monitor 10/XGA'-
, '10 inch standard plasma monitor, XGA resolution. This virtually-flat,-
high-resolution screen delivers outstanding image quality with reduced glare.'
, 11,3
, to_yminterval('+01-00')
, 102060
, 'orderable'
, 600
, 519
, 'http://www.supp-102060.com/cat/hw/p3054.html');
INSERT INTO product_information VALUES (1782-
, 'Compact 400/DQ'-
, '400 characters per second high-speed draft printer. Dimensions (HxWxD):-
17.34 x 24.26 x 26.32 inch. Interface: RS-232 serial (9-pin), no expansion-
slots. Paper size: A4, US Letter.'
, 12,4
, to_yminterval('+01-06')
, 102088
, 'obsolete'
, 125
, 108
, 'http://www.supp-102088.com/cat/hw/p1782.html');
INSERT INTO product_information VALUES (2430-
, 'Compact 400/LQ'-
, '400 characters per second high-speed letter-quality printer.-
Dimensions (HxWxD): 12.37 x 27.96 x 23.92 inch. Interface: RS-232 serial-
(25-pin), 3 expansion slots. Paper size: A2, A3, A4.'
, 12,4
, to_yminterval('+02-00')
, 102087
, 'orderable'
, 175
, 143
, 'http://www.supp-102087.com/cat/hw/p2430.html');
INSERT INTO product_information VALUES (1792-
, 'Industrial 600/DQ'-
, 'Wide carriage color capability 600 characters per second high-speed-
draft printer. Dimensions (HxWxD): 22.31 x 25.73 x 20.12 inch. Paper size:-
3x5 inch to 11x17 inch full bleed wide format.'
, 12,4
, to_yminterval('+05-00')
, 102088
, 'orderable'
, 225
, 180
, 'http://www.supp-102088.com/cat/hw/p1792.html');
INSERT INTO product_information VALUES (1791-
, 'Industrial 700/HD'-
, '700 characters per second dot-matrix printer with harder body and dust-
protection for industrial uses. Interface: Centronics parallel, IEEE 1284-
compliant. Paper size: 3x5 inch to 11x17 inch full bleed wide format.-
Memory: 4MB. Dimensions (HxWxD): 9.3 x 16.5 x 13 inch.'
, 12,5
, to_yminterval('+05-00')
, 102086
, 'orderable'
, 275
, 239
, 'http://www.supp-102086.com/cat/hw/p1791.html');
INSERT INTO product_information VALUES (2302-
, 'Inkjet B/6'-
, 'Inkjet Printer, black and white, 6 pages per minute, resolution 600x300-
dpi. Interface: Centronics parallel, IEEE 1284 compliant. Dimensions-
(HxWxD): 7.3 x 17.5 x 14 inch. Paper size: A3, A4, US legal. No-
expansion slots.'
, 12,3
, to_yminterval('+02-00')
, 102096
, 'orderable'
, 150
, 121
, 'http://www.supp-102096.com/cat/hw/p2302.html');
INSERT INTO product_information VALUES (2453-
, 'Inkjet C/4'-
, 'Inkjet Printer, color (with two separate ink cartridges), 6 pages per-
minute black and white, 4 pages per minute color, resolution 600x300 dpi.-
Interface: Biodirectional IEEE 1284 compliant parallel interface and-
RS-232 serial (9-pin) interface 2 open EIO expansion slots. Memory:-
8MB 96KB receiver buffer.'
, 12,3
, to_yminterval('+02-00')
, 102090
, 'orderable'
, 195
, 174
, 'http://www.supp-102090.com/cat/hw/p2453.html');
INSERT INTO product_information VALUES (1797-
, 'Inkjet C/8/HQ'-
, 'Inkjet printer, color, 8 pages per minute, high resolution (photo-
quality). Memory: 16MB. Dimensions (HxWxD): 7.3 x 17.5 x 14 inch. Paper-
size: A4, US Letter, envelopes. Interface: Centronics parallel, IEEE-
1284 compliant.'
, 12,3
, to_yminterval('+02-00')
, 102094
, 'orderable'
, 349
, 288
, 'http://www.supp-102094.com/cat/hw/p1797.html');
INSERT INTO product_information VALUES (2459-
, 'LaserPro 1200/8/BW'-
, 'Professional black and white laserprinter, resolution 1200 dpi, 8 pages-
per second. Dimensions (HxWxD): 22.37 x 19.86 x 21.92 inch. Software:-
Enhanced driver support for SPNIX v4.0; MS-DOS Built-in printer drivers:-
ZoomSmart scaling technology, billboard, handout, mirror, watermark, print-
preview, quick sets, emulate laserprinter margins.'
, 12,5
, to_yminterval('+03-00')
, 102099
, 'under development'
, 699
, 568
, 'http://www.supp-102099.com/cat/hw/p2459.html');
INSERT INTO product_information VALUES (3127-
, 'LaserPro 600/6/BW'-
, 'Standard black and white laserprinter, resolution 600 dpi, 6 pages per-
second. Interface: Centronics parallel, IEEE 1284 compliant. Memory: 8MB-
96KB receiver buffer. MS-DOS ToolBox utilities for SPNIX AutoCAM v.17-
compatible driver.'
, 12,4
, to_yminterval('+03-00')
, 102087
, 'orderable'
, 498
, 444
, 'http://www.supp-102087.com/cat/hw/p3127.html');
INSERT INTO product_information VALUES (2254-
, 'HD 10GB /I'-
, '10GB capacity hard disk drive (internal). These drives are intended for-
use in today''s demanding, data-critical enterprise environments and are-
ideal for use in RAID applications. Universal option kits are configured-
and pre-mounted in the appropriate hot plug tray for immediate installation-
into your corporate server or storage system.'
, 13,2
, to_yminterval('+02-00')
, 102071
, 'obsolete'
, 453
, 371
, 'http://www.supp-102071.com/cat/hw/p2254.html');
INSERT INTO product_information VALUES (3353-
, 'HD 10GB /R'-
, '10GB Removable hard disk drive for 10GB Removable HD drive. Supra7-
disk drives provide the latest technology to improve enterprise-
performance, increasing the maximum data transfer rate up to 160MB/s.'
, 13,1
, to_yminterval('+03-00')
, 102071
, 'obsolete'
, 489
, 413
, 'http://www.supp-102071.com/cat/hw/p3353.html');
INSERT INTO product_information VALUES (3069-
, 'HD 10GB /S'-
, '10GB hard disk drive for Standard Mount. Backward compatible with-
Supra5 systems, users are free to deploy and re-deploy these drives to-
quickly deliver increased storage capacity. Supra drives eliminate the-
risk of firmware incompatibility.'
, 13,1
, to_yminterval('+02-00')
, 102051
, 'obsolete'
, 436
, 350
, 'http://www.supp-102051.com/cat/hw/p3069.html');
INSERT INTO product_information VALUES (2253-
, 'HD 10GB @5400 /SE'-
, '10GB capacity hard disk drive (external) SCSI interface, 5400 RPM.-
Universal option kits are configured and pre-mounted in the appropriate-
hot plug tray for immediate installation into your corporate server or-
storage system. Supra drives eliminate the risk of firmware incompatibility.'
, 13,2
, to_yminterval('+03-00')
, 102069
, 'obsolete'
, 399
, 322
, 'http://www.supp-102069.com/cat/hw/p2253.html');
INSERT INTO product_information VALUES (3354-
, 'HD 12GB /I'-
, '12GB capacity harddisk drive (internal). Supra drives eliminate the risk-
of firmware incompatibility. Backward compatibility: You can mix or-
match Supra2 and Supra3 devices for optimized solutions and future growth.'
, 13,2
, to_yminterval('+02-00')
, 102066
, 'orderable'
, 543
, 478
, 'http://www.supp-102066.com/cat/hw/p3354.html');
INSERT INTO product_information VALUES (3072-
, 'HD 12GB /N'-
, '12GB hard disk drive for Narrow Mount. Supra9 hot pluggable hard disk-
drives provide the ability to install or remove drives on-line. Our hot-
pluggable hard disk drives are required to meet our rigorous standards-
for reliability and performance.'
, 13,1
, to_yminterval('+03-00')
, 102061
, 'orderable'
, 567
, 507
, 'http://www.supp-102061.com/cat/hw/p3072.html');
INSERT INTO product_information VALUES (3334-
, 'HD 12GB /R'-
, '12GB Removable hard disk drive. With compatibility across many enterprise-
platforms, you are free to deploy and re-deploy this drive to quickly-
deliver increased storage capacity. Supra7 Universal disk drives are the-
second generation of high performance hot plug drives sharing compatibility-
across corporate servers and external storage enclosures.'
, 13,2
, to_yminterval('+03-00')
, 102090
, 'orderable'
, 612
, 512
, 'http://www.supp-102090.com/cat/hw/p3334.html');
INSERT INTO product_information VALUES (3071-
, 'HD 12GB /S'-
, '12GB hard disk drive for Standard Mount. Supra9 hot pluggable hard disk-
drives provide the ability to install or remove drives on-line. Our hot-
pluggable hard disk drives are required to meet our rigorous standards-
for reliability and performance.'
, 13,1
, to_yminterval('+03-00')
, 102071
, 'orderable'
, 633
, 553
, 'http://www.supp-102071.com/cat/hw/p3071.html');
INSERT INTO product_information VALUES (2255-
, 'HD 12GB @7200 /SE'-
, '12GB capacity hard disk drive (external) SCSI, 7200 RPM. These drives-
are intended for use in today''s demanding, data-critical enterprise-
environments and can be used in RAID applications. Universal option kits-
are configured and pre-mounted in the appropriate hot plug tray for-
immediate installation into your corporate server or storage system.'
, 13,2
, to_yminterval('+02-00')
, 102057
, 'orderable'
, 775
, 628
, 'http://www.supp-102057.com/cat/hw/p2255.html');
INSERT INTO product_information VALUES (1743-
, 'HD 18.2GB @10000 /E'-
, 'External hard drive disk - 18.2 GB, rated up to 10,000 RPM. These-
drives are intended for use in today''s demanding, data-critical-
enterprise environments and are ideal for use in RAID applications.'
, 13,3
, to_yminterval('+03-00')
, 102078
, 'planned'
, 800
, 661
, 'http://www.supp-102078.com/cat/hw/p1743.html');
INSERT INTO product_information VALUES (2382-
, 'HD 18.2GB@10000 /I'-
, '18.2 GB SCSI hard disk @ 10000 RPM (internal). Supra7 Universal-
disk drives provide an unequaled level of investment protection and-
simplification for customers by enabling drive compatibility across-
many enterprise platforms.'
, 13,3
, to_yminterval('+03-00')
, 102050
, 'under development'
, 850
, 731
, 'http://www.supp-102050.com/cat/hw/p2382.html');
INSERT INTO product_information VALUES (3399-
, 'HD 18GB /SE'-
, '18GB SCSI external hard disk drive. Supra5 Universal hard disk-
drives provide the ability to hot plug between various servers, RAID-
arrays, and external storage shelves.'
, 13,3
, to_yminterval('+02-00')
, 102083
, 'under development'
, 815
, 706
, 'http://www.supp-999999.com/cat/hw/p3333.html');
INSERT INTO product_information VALUES (3073-
, 'HD 6GB /I'-
, '6GB capacity hard disk drive (internal). Supra drives eliminate the-
risk of firmware incompatibility.'
, 13,2
, to_yminterval('+05-00')
, 102072
, 'obsolete'
, 224
, 197
, 'http://www.supp-102083.com/cat/hw/p3073.html');
INSERT INTO product_information VALUES (1768-
, 'HD 8.2GB @5400'-
, 'Hard drive disk - 8.2 GB, rated up to 5,400 RPM. Supra drives-
eliminate the risk of firmware incompatibility. Standard serial-
RS-232 interface.'
, 13,2
, to_yminterval('+02-00')
, 102093
, 'orderable'
, 345
, 306
, 'http://www.supp-102093.com/cat/hw/p1768.html');
INSERT INTO product_information VALUES (2410-
, 'HD 8.4GB @5400'-
, '8.4 GB hard disk @ 5400 RPM. Reduced cost of ownership: Drives can-
be utilized across enterprise platforms. This hot pluggable hard disk-
drive is required to meet your rigorous standards for reliability-
and performance.'
, 13,2
, to_yminterval('+03-00')
, 102061
, 'orderable'
, 357
, 319
, 'http://www.supp-102061.com/cat/hw/p2410.html');
INSERT INTO product_information VALUES (2257-
, 'HD 8GB /I'-
, '8GB capacity hard disk drive (internal). Supra9 hot pluggable-
hard disk drives provide the ability to install or remove drives-
on-line. Backward compatibility: You can mix Supra2 and Supra3-
devices for optimized solutions and future growth.'
, 13,1
, to_yminterval('+03-00')
, 102061
, 'orderable'
, 399
, 338
, 'http://www.supp-102061.com/cat/hw/p2257.html');
INSERT INTO product_information VALUES (3400-
, 'HD 8GB /SE'-
, '8GB capacity SCSI hard disk drive (external). Supra7 disk drives-
provide the latest technology to improve enterprise performance,-
increasing the maximum data transfer rate up to 255MB/s.'
, 13,2
, to_yminterval('+03-00')
, 102063
, 'orderable'
, 389
, 337
, 'http://www.supp-102063.com/cat/hw/p3400.html');
INSERT INTO product_information VALUES (3355-
, 'HD 8GB /SI'-
, '8GB SCSI hard disk drive, internal. With compatibility across many-
enterprise platforms, you are free to deploy and re-deploy this drive-
to quickly deliver increased storage capacity. '
, 13,1
, to_yminterval('+02-00')
, 102050
, 'orderable'
, NULL
, NULL
, 'http://www.supp-102050.com/cat/hw/p3355.html');
INSERT INTO product_information VALUES (1772-
, 'HD 9.1GB @10000'-
, 'Hard disk drive - 9.1 GB, rated up to 10,000 RPM. These drives-
are intended for use in data-critical enterprise environments.-
Ease of doing business: you can easily select the drives you need-
regardless of the application in which they will be deployed.'
, 13,3
, to_yminterval('+05-00')
, 102070
, 'orderable'
, 456
, 393
, 'http://www.supp-102070.com/cat/hw/p1772.html');
INSERT INTO product_information VALUES (2414-
, 'HD 9.1GB @10000 /I'-
, '9.1 GB SCSI hard disk @ 10000 RPM (internal). Supra7 disk-
drives are available in 10,000 RPM spindle speeds and capacities-
of 18GB and 9.1 GB. SCSI and RS-232 interfaces.'
, 13,3
, to_yminterval('+05-00')
, 102098
, 'orderable'
, 454
, 399
, 'http://www.supp-102098.com/cat/hw/p2414.html');
INSERT INTO product_information VALUES (2415-
, 'HD 9.1GB @7200'-
, '9.1 GB hard disk @ 7200 RPM. Universal option kits are-
configured and pre-mounted in the appropriate hot plug tray-
for immediate installation into your corporate server or storage-
system.'
, 13,3
, to_yminterval('+05-00')
, 102063
, 'orderable'
, 359
, 309
, 'http://www.supp-102063.com/cat/hw/p2415.html');
INSERT INTO product_information VALUES (2395-
, '32MB Cache /M'-
, '32MB Mirrored cache memory (100-MHz Registered SDRAM)'
, 14,1
, to_yminterval('+00-06')
, 102093
, 'orderable'
, 123
, 109
, 'http://www.supp-102093.com/cat/hw/p2395.html');
INSERT INTO product_information VALUES (1755-
, '32MB Cache /NM'-
, '32MB Non-Mirrored cache memory'
, 14,1
, to_yminterval('+00-06')
, 102076
, 'orderable'
, 121
, 99
, 'http://www.supp-102076.com/cat/hw/p1755.html');
INSERT INTO product_information VALUES (2406-
, '64MB Cache /M'-
, '64MB Mirrored cache memory'
, 14,1
, to_yminterval('+00-06')
, 102059
, 'orderable'
, 223
, 178
, 'http://www.supp-102059.com/cat/hw/p2406.html');
INSERT INTO product_information VALUES (2404-
, '64MB Cache /NM'-
, '64 MB Non-mirrored cache memory. FPM memory chips are-
implemented on 5 volt SIMMs, but are also available on-
3.3 volt DIMMs.'
, 14,1
, to_yminterval('+00-06')
, 102087
, 'orderable'
, 221
, 180
, 'http://www.supp-102087.com/cat/hw/p2404.html');
INSERT INTO product_information VALUES (1770-
, '8MB Cache /NM'-
, '8MB Non-Mirrored Cache Memory (100-MHz Registered SDRAM)'
, 14,1
, to_yminterval('+00-06')
, 102050
, 'orderable'
, NULL
, 73
, 'http://www.supp-102050.com/cat/hw/p1770.html');
INSERT INTO product_information VALUES (2412-
, '8MB EDO Memory'-
, '8 MB 8x32 EDO SIM memory. Extended Data Out memory differs from FPM in a-
small, but significant design change. Unlike FPM, the data output drivers-
for EDO remain on when the memory controller removes the column address to-
begin the next cycle. Therefore, a new data cycle can begin before the-
previous cycle has completed. EDO is available on SIMMs and DIMMs, in 3.3-
and 5 volt varieties.'
, 14,1
, to_yminterval('+00-06')
, 102058
, 'obsolete'
, 98
, 83
, 'http://www.supp-102058.com/cat/hw/p2412.html');
INSERT INTO product_information VALUES (2378-
, 'DIMM - 128 MB'-
, '128 MB DIMM memory. The main reason for the change from SIMMs to DIMMs is-
to support the higher bus widths of 64-bit processors. DIMMs are 64- or-
72-bits wide; SIMMs are only 32- or 36-bits wide (with parity).'
, 14,1
, to_yminterval('+00-06')
, 102050
, 'orderable'
, 305
, 247
, 'http://www.supp-102050.com/cat/hw/p2378.html');
INSERT INTO product_information VALUES (3087-
, 'DIMM - 16 MB'-
, 'Citrus OLX DIMM - 16 MB capacity.'
, 14,1
, to_yminterval('+00-06')
, 102081
, 'obsolete'
, 124
, 99
, 'http://www.supp-102081.com/cat/hw/p3087.html');
INSERT INTO product_information VALUES (2384-
, 'DIMM - 1GB'-
, 'Memory DIMM: RAM - 1 GB capacity.'
, 14,1
, to_yminterval('+00-06')
, 102074
, 'under development'
, 599
, 479
, 'http://www.supp-102074.com/cat/hw/p2384.html');
INSERT INTO product_information VALUES (1749-
, 'DIMM - 256MB'-
, 'Memory DIMM: RAM 256 MB. (100-MHz Registered SDRAM)'
, 14,1
, to_yminterval('+00-06')
, 102053
, 'orderable'
, 337
, 300
, 'http://www.supp-102053.com/cat/hw/p1749.html');
INSERT INTO product_information VALUES (1750-
, 'DIMM - 2GB'-
, 'Memory DIMM: RAM, 2 GB capacity.'
, 14,1
, to_yminterval('+00-06')
, 102052
, 'orderable'
, 699
, 560
, 'http://www.supp-102052.com/cat/hw/p1750.html');
INSERT INTO product_information VALUES (2394-
, 'DIMM - 32MB'-
, '32 MB DIMM Memory upgrade'
, 14,1
, to_yminterval('+00-06')
, 102054
, 'orderable'
, 128
, 106
, 'http://www.supp-102054.com/cat/hw/p2394.html');
INSERT INTO product_information VALUES (2400-
, 'DIMM - 512 MB'-
, '512 MB DIMM memory. Improved memory upgrade granularity: Fewer DIMMs are-
required to upgrade a system than it would require if using SIMMs in the same-
system. Increased maximum memory ceilings: Given the same number of memory-
slots, the maximum memory of a system using DIMMs is more than one using-
SIMMs. DIMMs have separate contacts on each side of the board, which provide-
two times the data rate as one SIMM.'
, 14,1
, to_yminterval('+01-00')
, 102098
, 'under development'
, 448
, 380
, 'http://www.supp-102098.com/cat/hw/p2400.html');
INSERT INTO product_information VALUES (1763-
, 'DIMM - 64MB'-
, 'Memory DIMM: RAM, 64MB (100-MHz Unregistered ECC SDRAM)'
, 14,1
, to_yminterval('+01-00')
, 102069
, 'orderable'
, 247
, 202
, 'http://www.supp-102069.com/cat/hw/p1763.html');
INSERT INTO product_information VALUES (2396-
, 'EDO - 32MB'-
, 'Memory EDO SIM: RAM, 32 MB (100-MHz Unregistered ECC SDRAM). Like FPM,-
EDO is available on SIMMs and DIMMs, in 3.3 and 5 volt varieties If EDO-
memory is installed in a computer that was not designed to support it,-
the memory may not work.'
, 14,1
, to_yminterval('+00-06')
, 102051
, 'orderable'
, 179
, 149
, 'http://www.supp-102051.com/cat/hw/p2396.html');
INSERT INTO product_information VALUES (2272-
, 'RAM - 16 MB'-
, 'Memory SIMM: RAM - 16 MB capacity.'
, 14,1
, to_yminterval('+01-00')
, 102074
, 'obsolete'
, 135
, 110
, 'http://www.supp-102074.com/cat/hw/p2272.html');
INSERT INTO product_information VALUES (2274-
, 'RAM - 32 MB'-
, 'Memory SIMM: RAM - 32 MB capacity.'
, 14,1
, to_yminterval('+01-00')
, 102064
, 'orderable'
, 161
, 135
, 'http://www.supp-102064.com/cat/hw/p2274.html');
INSERT INTO product_information VALUES (3090-
, 'RAM - 48 MB'-
, 'Random Access Memory, SIMM - 48 MB capacity.'
, 14,1
, to_yminterval('+01-00')
, 102084
, 'orderable'
, 193
, 170
, 'http://www.supp-102084.com/cat/hw/p3090.html');
INSERT INTO product_information VALUES (1739-
, 'SDRAM - 128 MB'-
, 'SDRAM memory, 128 MB capacity. SDRAM can access data at speeds up to 100-
MHz, which is up to four times as fast as standard DRAMs. The advantages of-
SDRAM can be fully realized, however, only by computers designed to support-
SDRAM. SDRAM is available on 5 and 3.3 volt DIMMs.'
, 14,1
, to_yminterval('+00-09')
, 102077
, 'orderable'
, 299
, 248
, 'http://www.supp-102077.com/cat/hw/p1739.html');
INSERT INTO product_information VALUES (3359-
, 'SDRAM - 16 MB'-
, 'SDRAM memory upgrade module, 16 MB. Synchronous Dynamic Random Access-
Memory was introduced after EDO. Its architecture and operation are based on-
those of the standard DRAM, but SDRAM provides a revolutionary change to main-
memory that further reduces data retrieval times. SDRAM is synchronized to-
the system clock that controls the CPU. This means that the system clock-
controlling the functions of the microprocessor also controls the SDRAM-
functions. This enables the memory controller to know on which clock cycle-
a data request will be ready, and therefore eliminates timing delays.'
, 14,1
, to_yminterval('+00-09')
, 102059
, 'orderable'
, 111
, 99
, 'http://www.supp-102059.com/cat/hw/p3359.html');
INSERT INTO product_information VALUES (3088-
, 'SDRAM - 32 MB'-
, 'SDRAM module with ECC - 32 MB capacity. SDRAM has multiple memory banks-
that can work simultaneously. Switching between banks allows for a-
continuous data flow.'
, 14,1
, to_yminterval('+00-09')
, 102057
, 'orderable'
, 258
, 220
, 'http://www.supp-102057.com/cat/hw/p3088.html');
INSERT INTO product_information VALUES (2276-
, 'SDRAM - 48 MB'-
, 'Memory SIMM: RAM - 48 MB. SDRAM can operate in burst mode. In burst-
mode, when a single data address is accessed, an entire block of data is-
retrieved rather than just the one piece. The assumption is that the next-
piece of data that will be requested will be sequential to the previous.-
Since this is usually the case, data is held readily available.'
, 14,1
, to_yminterval('+00-09')
, 102058
, 'orderable'
, 269
, 215
, 'http://www.supp-102058.com/cat/hw/p2276.html');
INSERT INTO product_information VALUES (3086-
, 'VRAM - 16 MB'-
, 'Citrus Video RAM module - 16 MB capacity. VRAM is used by the video system-
in a computer to store video information and is reserved exclusively for-
video operations. It was developed to provide continuous streams of serial-
data for refreshing video screens.'
, 14,1
, to_yminterval('+00-06')
, 102056
, 'orderable'
, 211
, 186
, 'http://www.supp-102056.com/cat/hw/p3086.html');
INSERT INTO product_information VALUES (3091-
, 'VRAM - 64 MB'-
, 'Citrus Video RAM memory module - 64 MB capacity. Physically, VRAM looks-
just like DRAM with added hardware called a shift register. The special-
feature of VRAM is that it can transfer one entire row of data (up to 256-
bits) into this shift register in a single clock cycle. This ability-
significantly reduces retrieval time, since the number of fetches is reduced-
from a possible 256 to a single fetch. The main benefit of having a shift-
register available for data dumps is that it frees the CPU to refresh the-
screen rather than retrieve data, thereby doubling the data bandwidth. For-
this reason, VRAM is often referred to as being dual-ported. However, the-
shift register will only be used when the VRAM chip is given special-
instructions to do so. The command to use the shift register is built into-
the graphics controller.'
, 14,1
, to_yminterval('+00-06')
, 102098
, 'orderable'
, 279
, 243
, 'http://www.supp-102098.com/cat/hw/p3091.html');
INSERT INTO product_information VALUES (1787-
, 'CPU D300'-
, 'Dual CPU @ 300Mhz. For light personal processing only, or file servers-
with less than 5 concurrent users. This product will probably become-
obsolete soon.'
, 15,1
, to_yminterval('+03-00')
, 102097
, 'orderable'
, 101
, 90
, 'http://www.supp-102097.com/cat/hw/p1787.html');
INSERT INTO product_information VALUES (2439-
, 'CPU D400'-
, 'Dual CPU @ 400Mhz. Good price/performance ratio; for mid-size LAN-
file servers (up to 100 concurrent users).'
, 15,1
, to_yminterval('+03-00')
, 102092
, 'orderable'
, 123
, 105
, 'http://www.supp-102092.com/cat/hw/p2439.html');
INSERT INTO product_information VALUES (1788-
, 'CPU D600'-
, 'Dual CPU @ 600Mhz. State of the art, high clock speed; for heavy-
load WAN servers (up to 200 concurrent users).'
, 15,1
, to_yminterval('+05-00')
, 102067
, 'orderable'
, 178
, 149
, 'http://www.supp-102067.com/cat/hw/p1788.html');
INSERT INTO product_information VALUES (2375-
, 'GP 1024x768'-
, 'Graphics Processor, resolution 1024 X 768 pixels. Outstanding-
price/performance for 2D and 3D applications under SPNIX v3.3 and-
v4.0. Double your viewing power by running two monitors from this-
single card. Two 17 inch monitors have more screen area than one-
21 inch monitor. Excellent option for users that multi-task-
frequently or access data from multiple sources often.'
, 15,1
, to_yminterval('+00-09')
, 102063
, 'orderable'
, 78
, 69
, 'http://www.supp-102063.com/cat/hw/p2375.html');
INSERT INTO product_information VALUES (2411-
, 'GP 1280x1024'-
, 'Graphics Processor, resolution 1280 X 1024 pixels. High end 3D performance-
at a mid range price: 15 million Gouraud shaded triangles per second,-
Optimized 3D drivers for MCAD and DCC applications, with user-customizable-
settings. 64MB DDR SDRAM unified frame buffer supporting true color at all-
supported standard resolutions.'
, 15,1
, to_yminterval('+01-00')
, 102061
, 'orderable'
, 98
, 78
, 'http://www.supp-102061.com/cat/hw/p2411.html');
INSERT INTO product_information VALUES (1769-
, 'GP 800x600'-
, 'Graphics processor, resolution 800 x 600 pixels. Remarkable value for-
users requiring great 2D capabilities or general 3D support for advanced-
applications. Drives incredible performance in highly complex models and-
frees the customer to focus on the design, instead of the rendering process.'
, 15,1
, to_yminterval('+00-06')
, 102050
, 'orderable'
, 48
, NULL
, 'http://www.supp-102050.com/cat/hw/p1769.html');
INSERT INTO product_information VALUES (2049-
, 'MB - S300'-
, 'PC type motherboard, 300 Series.'
, 15,2
, to_yminterval('+01-00')
, 102082
, 'obsolete'
, 55
, 47
, 'http://www.supp-102082.com/cat/hw/p2049.html');
INSERT INTO product_information VALUES (2751-
, 'MB - S450'-
, 'PC type motherboard, 450 Series.'
, 15,2
, to_yminterval('+01-00')
, 102072
, 'orderable'
, 66
, 54
, 'http://www.supp-102072.com/cat/hw/p2751.html');
INSERT INTO product_information VALUES (3112-
, 'MB - S500'-
, 'PC type motherboard, 500 Series.'
, 15,2
, to_yminterval('+01-06')
, 102086
, 'orderable'
, 77
, 66
, 'http://www.supp-102086.com/cat/hw/p3112.html');
INSERT INTO product_information VALUES (2752-
, 'MB - S550'-
, 'PC type motherboard for the 550 Series.'
, 15,2
, to_yminterval('+01-06')
, 102086
, 'orderable'
, 88
, 76
, 'http://www.supp-102086.com/cat/hw/p2752.html');
INSERT INTO product_information VALUES (2293-
, 'MB - S600'-
, 'Motherboard, 600 Series.'
, 15,2
, to_yminterval('+02-00')
, 102086
, 'orderable'
, 99
, 87
, 'http://www.supp-102086.com/cat/hw/p2293.html');
INSERT INTO product_information VALUES (3114-
, 'MB - S900/650+'-
, 'PC motherboard, 900 Series; standard motherboard-
for all models 650 and up.'
, 15,3
, to_yminterval('+00-00')
, 102086
, 'under development'
, 101
, 88
, 'http://www.supp-102086.com/cat/hw/p3114.html');
INSERT INTO product_information VALUES (3129-
, 'Sound Card STD'-
, 'Sound Card - standard version, with MIDI interface,-
line in/out, low impedance microphone input.'
, 15,1
, to_yminterval('+00-06')
, 102090
, 'orderable'
, 46
, 39
, 'http://www.supp-102090.com/cat/hw/p3129.html');
INSERT INTO product_information VALUES (3133-
, 'Video Card /32'-
, 'Video Card, with 32MB cache memory.'
, 15,2
, to_yminterval('+00-06')
, 102076
, 'orderable'
, 48
, 41
, 'http://www.supp-102076.com/cat/hw/p3133.html');
INSERT INTO product_information VALUES (2308-
, 'Video Card /E32'-
, '3-D ELSA Video Card, with 32 MB memory.'
, 15,2
, to_yminterval('+00-06')
, 102087
, 'orderable'
, 58
, 48
, 'http://www.supp-102087.com/cat/hw/p2308.html');
INSERT INTO product_information VALUES (2496-
, 'WSP DA-130'-
, 'Wide storage processor DA-130 for storage subunits.'
, 15,2
, to_yminterval('+00-00')
, 102067
, 'planned'
, 299
, 244
, 'http://www.supp-102067.com/cat/hw/p2496.html');
INSERT INTO product_information VALUES (2497-
, 'WSP DA-290'-
, 'Wide storage processor (model DA-290).'
, 15,3
, to_yminterval('+00-00')
, 102053
, 'planned'
, 399
, 355
, 'http://www.supp-102053.com/cat/hw/p2497.html');
INSERT INTO product_information VALUES (3106-
, 'KB 101/EN'-
, 'Standard PC/AT Enhanced Keyboard (101/102-Key).-
Input locale: English (US).'
, 16,1
, to_yminterval('+01-00')
, 102066
, 'orderable'
, 48
, 41
, 'http://www.supp-102066.com/cat/hw/p3106.html');
INSERT INTO product_information VALUES (2289-
, 'KB 101/ES'-
, 'Standard PC/AT Enhanced Keyboard (101/102-Key).-
Input locale: Spanish.'
, 16,1
, to_yminterval('+01-00')
, 102055
, 'orderable'
, 48
, 38
, 'http://www.supp-102055.com/cat/hw/p2289.html');
INSERT INTO product_information VALUES (3110-
, 'KB 101/FR'-
, 'Standard PC/AT Enhanced Keyboard (101/102-Key).-
Input locale: French.'
, 16,1
, to_yminterval('+01-00')
, 102055
, 'orderable'
, 48
, 39
, 'http://www.supp-102055.com/cat/hw/p3110.html');
INSERT INTO product_information VALUES (3108-
, 'KB E/EN'-
, 'Ergonomic Keyboard with two separate key areas,-
detachable numeric pad. Key layout: English (US).'
, 16,2
, to_yminterval('+02-00')
, 102055
, 'orderable'
, 78
, 63
, 'http://www.supp-102055.com/cat/hw/p3108.html');
INSERT INTO product_information VALUES (2058-
, 'Mouse +WP'-
, 'Combination of a mouse and a wrist pad for more-
comfortable typing and mouse operation.'
, 16,1
, to_yminterval('+01-00')
, 102055
, 'orderable'
, 23
, 19
, 'http://www.supp-102055.com/cat/hw/p2058.html');
INSERT INTO product_information VALUES (2761-
, 'Mouse +WP/CL'-
, 'Set consisting of a mouse and wrist pad,-
with corporate logo'
, 16,1
, to_yminterval('+01-06')
, 102099
, 'planned'
, 27
, 23
, 'http://www.supp-102099.com/cat/hw/p2761.html');
INSERT INTO product_information VALUES (3117-
, 'Mouse C/E'-
, 'Ergonomic, cordless mouse. With track-ball-
for maximum comfort and ease of use.'
, 16,1
, to_yminterval('+01-00')
, 102099
, 'orderable'
, 41
, 35
, 'http://www.supp-102099.com/cat/hw/p3117.html');
INSERT INTO product_information VALUES (2056-
, 'Mouse Pad /CL'-
, 'Standard mouse pad, with corporate logo'
, 16,1
, to_yminterval('+01-00')
, 102099
, 'planned'
, 8
, 6
, 'http://www.supp-102099.com/cat/hw/p2056.html');
INSERT INTO product_information VALUES (2211-
, 'Wrist Pad'-
, 'A foam strip to support your wrists when using a keyboard'
, 16,1
, to_yminterval('+01-00')
, 102072
, 'orderable'
, 4
, 3
, 'http://www.supp-102072.com/cat/hw/p2211.html');
INSERT INTO product_information VALUES (2944-
, 'Wrist Pad /CL'-
, 'Wrist Pad with corporate logo'
, 16,1
, to_yminterval('+01-00')
, 102063
, 'under development'
, 3
, 2
, 'http://www.supp-102063.com/cat/hw/p2944.html');
INSERT INTO product_information VALUES (1742-
, 'CD-ROM 500/16x'-
, 'CD drive, read only, speed 16x, maximum capacity 500 MB.'
, 17,1
, to_yminterval('+00-06')
, 102052
, 'orderable'
, 101
, 81
, 'http://www.supp-102052.com/cat/hw/p1742.html');
INSERT INTO product_information VALUES (2402-
, 'CD-ROM 600/E/24x'-
, '600 MB external 24x speed CD-ROM drive (read only).'
, 17,2
, to_yminterval('+00-09')
, 102052
, 'orderable'
, 127
, 113
, 'http://www.supp-102052.com/cat/hw/p2402.html');
INSERT INTO product_information VALUES (2403-
, 'CD-ROM 600/I/24x'-
, '600 MB internal read only CD-ROM drive,-
reading speed 24x'
, 17,2
, to_yminterval('+01-00')
, 102052
, 'orderable'
, 117
, 103
, 'http://www.supp-102052.com/cat/hw/p2403.html');
INSERT INTO product_information VALUES (1761-
, 'CD-ROM 600/I/32x'-
, '600 MB Internal CD-ROM Drive, speed 32x (read only).'
, 17,2
, to_yminterval('+01-00')
, 102052
, 'under development'
, 134
, 119
, 'http://www.supp-102052.com/cat/hw/p1761.html');
INSERT INTO product_information VALUES (2381-
, 'CD-ROM 8x'-
, 'CD Writer, read only, speed 8x'
, 17,1
, to_yminterval('+00-03')
, 102052
, 'obsolete'
, 99
, 82
, 'http://www.supp-102052.com/cat/hw/p2381.html');
INSERT INTO product_information VALUES (2424-
, 'CDW 12/24'-
, 'CD Writer, speed 12x write, 24x read. Warning: will become obsolete very-
soon; this speed is not high enough anymore, and better alternatives are-
available for a reasonable price.'
, 17,2
, to_yminterval('+00-06')
, 102075
, 'orderable'
, 221
, 198
, 'http://www.supp-102075.com/cat/hw/p2424.html');
INSERT INTO product_information VALUES (1781-
, 'CDW 20/48/E'-
, 'CD Writer, read 48x, write 20x'
, 17,2
, to_yminterval('+00-09')
, 102060
, 'orderable'
, 233
, 206
, 'http://www.supp-102060.com/cat/hw/p1781.html');
INSERT INTO product_information VALUES (2264-
, 'CDW 20/48/I'-
, 'CD-ROM drive: read 20x, write 48x (internal)'
, 17,2
, to_yminterval('+00-09')
, 102060
, 'orderable'
, 223
, 181
, 'http://www.supp-102060.com/cat/hw/p2264.html');
INSERT INTO product_information VALUES (2260-
, 'DFD 1.44/3.5'-
, 'Dual Floppy Drive - 1.44 MB - 3.5'
, 17,2
, to_yminterval('+00-06')
, 102062
, 'orderable'
, 67
, 54
, 'http://www.supp-102062.com/cat/hw/p2260.html');
INSERT INTO product_information VALUES (2266-
, 'DVD 12x'-
, 'DVD-ROM drive: speed 12x'
, 17,3
, to_yminterval('+01-00')
, 102099
, 'orderable'
, 333
, 270
, 'http://www.supp-102099.com/cat/hw/p2266.html');
INSERT INTO product_information VALUES (3077-
, 'DVD 8x'-
, 'DVD - ROM drive, 8x speed. Will probably become-
obsolete pretty soon...'
, 17,3
, to_yminterval('+01-00')
, 102099
, 'orderable'
, 274
, 237
, 'http://www.supp-102099.com/cat/hw/p3077.html');
INSERT INTO product_information VALUES (2259-
, 'FD 1.44/3.5'-
, 'Floppy Drive - 1.44 MB High Density-
capacity - 3.5 inch chassis'
, 17,1
, to_yminterval('+00-09')
, 102086
, 'orderable'
, 39
, 32
, 'http://www.supp-102086.com/cat/hw/p2259.html');
INSERT INTO product_information VALUES (2261-
, 'FD 1.44/3.5/E'-
, 'Floppy disk drive - 1.44 MB (high density)-
capacity - 3.5 inch (external)'
, 17,2
, to_yminterval('+00-09')
, 102086
, 'orderable'
, 42
, 37
, 'http://www.supp-102086.com/cat/hw/p2261.html');
INSERT INTO product_information VALUES (3082-
, 'Modem - 56/90/E'-
, 'Modem - 56kb per second, v.90 PCI Global compliant.-
External; for power supply 110V.'
, 17,1
, to_yminterval('+01-00')
, 102068
, 'orderable'
, 81
, 72
, 'http://www.supp-102068.com/cat/hw/p3082.html');
INSERT INTO product_information VALUES (2270-
, 'Modem - 56/90/I'-
, 'Modem - 56kb per second, v.90 PCI Global compliant.-
Internal, for standard chassis (3.5 inch).'
, 17,1
, to_yminterval('+01-00')
, 102068
, 'orderable'
, 66
, 56
, 'http://www.supp-102068.com/cat/hw/p2270.html');
INSERT INTO product_information VALUES (2268-
, 'Modem - 56/H/E'-
, 'Standard Hayes compatible modem - 56kb per second, external.-
Power supply: 220V.'
, 17,1
, to_yminterval('+01-00')
, 102068
, 'obsolete'
, 77
, 67
, 'http://www.supp-102068.com/cat/hw/p2268.html');
INSERT INTO product_information VALUES (3083-
, 'Modem - 56/H/I'-
, 'Standard Hayes modem - 56kb per second, internal, for-
 standard 3.5 inch chassis.'
, 17,1
, to_yminterval('+01-00')
, 102068
, 'orderable'
, 67
, 56
, 'http://www.supp-102068.com/cat/hw/p3083.html');
INSERT INTO product_information VALUES (2374-
, 'Modem - C/100'-
, 'DOCSIS/EURODOCSIS 1.0/1.1-compliant external cable modem'
, 17,2
, to_yminterval('+01-06')
, 102064
, 'orderable'
, 65
, 54
, 'http://www.supp-102064.com/cat/hw/p2374.html');
INSERT INTO product_information VALUES (1740-
, 'TD 12GB/DAT'-
, 'Tape drive - 12 gigabyte capacity, DAT format.'
, 17,2
, to_yminterval('+01-06')
, 102075
, 'orderable'
, 134
, 111
, 'http://www.supp-102075.com/cat/hw/p1740.html');
INSERT INTO product_information VALUES (2409-
, 'TD 7GB/8'-
, 'Tape drive, 7GB capacity, 8mm cartridge tape.'
, 17,2
, to_yminterval('+01-06')
, 102054
, 'orderable'
, 210
, 177
, 'http://www.supp-102054.com/cat/hw/p2409.html');
INSERT INTO product_information VALUES (2262-
, 'ZIP 100'-
, 'ZIP Drive, 100 MB capacity (external) plus cable for-
parallel port connection'
, 17,2
, to_yminterval('+01-06')
, 102054
, 'orderable'
, 98
, 81
, 'http://www.supp-102054.com/cat/hw/p2262.html');
INSERT INTO product_information VALUES (2522-
, 'Battery - EL'-
, 'Extended life battery, for laptop computers'
, 19,2
, to_yminterval('+00-03')
, 102078
, 'orderable'
, 44
, 39
, 'http://www.supp-102078.com/cat/hw/p2522.html');
INSERT INTO product_information VALUES (2278-
, 'Battery - NiHM'-
, 'Rechargeable NiHM battery for laptop computers'
, 19,1
, to_yminterval('+00-03')
, 102078
, 'orderable'
, 55
, 48
, 'http://www.supp-102078.com/cat/hw/p2278.html');
INSERT INTO product_information VALUES (2418-
, 'Battery Backup (DA-130)'-
, 'Single-battery charger with LED indicators'
, 19,1
, to_yminterval('+00-03')
, 102074
, 'orderable'
, 61
, 52
, 'http://www.supp-102074.com/cat/hw/p2418.html');
INSERT INTO product_information VALUES (2419-
, 'Battery Backup (DA-290)'-
, 'Two-battery charger with LED indicators'
, 19,1
, to_yminterval('+00-03')
, 102074
, 'orderable'
, 72
, 60
, 'http://www.supp-102074.com/cat/hw/p2419.html');
INSERT INTO product_information VALUES (3097-
, 'Cable Connector - 32R'-
, 'Cable Connector - 32 pin ribbon'
, 19,1
, to_yminterval('+00-00')
, 102055
, 'orderable'
, 3
, 2
, 'http://www.supp-102055.com/cat/hw/p3097.html');
INSERT INTO product_information VALUES (3099-
, 'Cable Harness'-
, 'Cable harness to organize and bundle computer wiring'
, 19,1
, to_yminterval('+00-00')
, 102055
, 'orderable'
, 4
, 3
, 'http://www.supp-102055.com/cat/hw/p3099.html');
INSERT INTO product_information VALUES (2380-
, 'Cable PR/15/P'-
, '15 foot parallel printer cable'
, 19,2
, to_yminterval('+00-01')
, 102055
, 'orderable'
, 6
, 5
, 'http://www.supp-102055.com/cat/hw/p2380.html');
INSERT INTO product_information VALUES (2408-
, 'Cable PR/P/6'-
, 'Standard Centronics 6ft printer cable, parallel port'
, 19,1
, to_yminterval('+00-01')
, 102055
, 'orderable'
, 4
, 3
, 'http://www.supp-102055.com/cat/hw/p2408.html');
INSERT INTO product_information VALUES (2457-
, 'Cable PR/S/6'-
, 'Standard RS232 serial printer cable, 6 feet'
, 19,1
, to_yminterval('+00-01')
, 102055
, 'orderable'
, 5
, 4
, 'http://www.supp-102055.com/cat/hw/p2457.html');
INSERT INTO product_information VALUES (2373-
, 'Cable RS232 10/AF'-
, '10 ft RS232 cable with F/F and 9F/25F adapters'
, 19,2
, to_yminterval('+01-00')
, 102055
, 'orderable'
, 6
, 4
, 'http://www.supp-102055.com/cat/hw/p2373.html');
INSERT INTO product_information VALUES (1734-
, 'Cable RS232 10/AM'-
, '10 ft RS232 cable with M/M and 9M/25M adapters'
, 19,2
, to_yminterval('+01-00')
, 102055
, 'orderable'
, 6
, 5
, 'http://www.supp-102055.com/cat/hw/p1734.html');
INSERT INTO product_information VALUES (1737-
, 'Cable SCSI 10/FW/ADS'-
, '10ft SCSI2 F/W Adapt to DSxx0 Cable'
, 19,2
, to_yminterval('+00-02')
, 102095
, 'orderable'
, 8
, 6
, 'http://www.supp-102095.com/cat/hw/p1737.html');
INSERT INTO product_information VALUES (1745-
, 'Cable SCSI 20/WD->D'-
, '20ft SCSI2 Wide Disk Store to Disk Store Cable'
, 19,2
, to_yminterval('+00-02')
, 102095
, 'orderable'
, 9
, 7
, 'http://www.supp-102095.com/cat/hw/p1745.html');
INSERT INTO product_information VALUES (2982-
, 'Drive Mount - A'-
, 'Drive Mount assembly kit'
, 19,2
, to_yminterval('+00-01')
, 102057
, 'orderable'
, 44
, 35
, 'http://www.supp-102057.com/cat/hw/p2982.html');
INSERT INTO product_information VALUES (3277-
, 'Drive Mount - A/T'-
, 'Drive Mount assembly kit for tower PC'
, 19,2
, to_yminterval('+01-00')
, 102057
, 'orderable'
, 36
, 29
, 'http://www.supp-102057.com/cat/hw/p3277.html');
INSERT INTO product_information VALUES (2976-
, 'Drive Mount - D'-
, 'Drive Mount for desktop PC'
, 19,2
, to_yminterval('+01-00')
, 102057
, 'orderable'
, 52
, 44
, 'http://www.supp-102057.com/cat/hw/p2976.html');
INSERT INTO product_information VALUES (3204-
, 'Envoy DS'-
, 'Envoy Docking Station'
, 19,3
, to_yminterval('+02-00')
, 102060
, 'orderable'
, 126
, 107
, 'http://www.supp-102060.com/cat/hw/p3204.html');
INSERT INTO product_information VALUES (2638-
, 'Envoy DS/E'-
, 'Enhanced Envoy Docking Station'
, 19,3
, to_yminterval('+02-00')
, 102060
, 'orderable'
, 137
, 111
, 'http://www.supp-102060.com/cat/hw/p2638.html');
INSERT INTO product_information VALUES (3020-
, 'Envoy IC'-
, 'Envoy Internet Computer, Plug&Play'
, 19,4
, to_yminterval('+01-00')
, 102060
, 'orderable'
, 449
, 366
, 'http://www.supp-102060.com/cat/hw/p3020.html');
INSERT INTO product_information VALUES (1948-
, 'Envoy IC/58'-
, 'Internet computer with built-in 58K modem'
, 19,4
, to_yminterval('+01-06')
, 102060
, 'orderable'
, 498
, 428
, 'http://www.supp-102060.com/cat/hw/p1948.html');
INSERT INTO product_information VALUES (3003-
, 'Laptop 128/12/56/v90/110'-
, 'Envoy Laptop, 128MB memory, 12GB hard disk, v90 modem,-
110V power supply.'
, 19,4
, to_yminterval('+01-06')
, 102060
, 'orderable'
, 3219
, 2606
, 'http://www.supp-102060.com/cat/hw/p3003.html');
INSERT INTO product_information VALUES (2999-
, 'Laptop 16/8/110'-
, 'Envoy Laptop, 16MB memory, 8GB hard disk,-
110V power supply (US only).'
, 19,3
, to_yminterval('+01-06')
, 102060
, 'obsolete'
, 999
, 800
, 'http://www.supp-102060.com/cat/hw/p2999.html');
INSERT INTO product_information VALUES (3000-
, 'Laptop 32/10/56'-
, 'Envoy Laptop, 32MB memory, 10GB hard disk, 56K Modem,-
universal power supply (switchable).'
, 19,4
, to_yminterval('+01-06')
, 102060
, 'orderable'
, 1749
, 1542
, 'http://www.supp-102060.com/cat/hw/p3000.html');
INSERT INTO product_information VALUES (3001-
, 'Laptop 48/10/56/110'-
, 'Envoy Laptop, 48MB memory, 10GB hard disk, 56K modem,-
110V power supply.'
, 19,4
, to_yminterval('+01-06')
, 102060
, 'obsolete'
, 2556
, 2073
, 'http://www.supp-102060.com/cat/hw/p3001.html');
INSERT INTO product_information VALUES (3004-
, 'Laptop 64/10/56/220'-
, 'Envoy Laptop, 64MB memory, 10GB hard disk, 56K modem,-
220V power supply.'
, 19,4
, to_yminterval('+01-06')
, 102060
, 'orderable'
, 2768
, 2275
, 'http://www.supp-102060.com/cat/hw/p3004.html');
INSERT INTO product_information VALUES (3391-
, 'PS 110/220'-
, 'Power Supply - switchable, 110V/220V'
, 19,2
, to_yminterval('+01-06')
, 102062
, 'orderable'
, 85
, 75
, 'http://www.supp-102062.com/cat/hw/p3391.html');
INSERT INTO product_information VALUES (3124-
, 'PS 110V /T'-
, 'Power supply for tower PC, 110V'
, 19,2
, to_yminterval('+01-00')
, 102062
, 'orderable'
, 84
, 70
, 'http://www.supp-102062.com/cat/hw/p3124.html');
INSERT INTO product_information VALUES (1738-
, 'PS 110V /US'-
, '110 V Power Supply - US compatible'
, 19,2
, to_yminterval('+01-00')
, 102062
, 'orderable'
, 86
, 70
, 'http://www.supp-102062.com/cat/hw/p1738.html');
INSERT INTO product_information VALUES (2377-
, 'PS 110V HS/US'-
, '110 V hot swappable power supply - US compatible'
, 19,2
, to_yminterval('+01-00')
, 102062
, 'orderable'
, 97
, 82
, 'http://www.supp-102062.com/cat/hw/p2377.html');
INSERT INTO product_information VALUES (2299-
, 'PS 12V /P'-
, 'Power Supply - 12v portable'
, 19,2
, to_yminterval('+01-00')
, 102062
, 'orderable'
, 76
, 64
, 'http://www.supp-102062.com/cat/hw/p2299.html');
INSERT INTO product_information VALUES (3123-
, 'PS 220V /D'-
, 'Standard power supply, 220V, for desktop computers.'
, 19,2
, to_yminterval('+01-00')
, 102062
, 'orderable'
, 81
, 65
, 'http://www.supp-102062.com/cat/hw/p3123.html');
INSERT INTO product_information VALUES (1748-
, 'PS 220V /EUR'-
, '220 Volt Power supply type - Europe'
, 19,2
, to_yminterval('+01-00')
, 102053
, 'orderable'
, 83
, 70
, 'http://www.supp-102053.com/cat/hw/p1748.html');
INSERT INTO product_information VALUES (2387-
, 'PS 220V /FR'-
, '220V Power supply type - France'
, 19,2
, to_yminterval('+01-00')
, 102053
, 'orderable'
, 83
, 66
, 'http://www.supp-102053.com/cat/hw/p2387.html');
INSERT INTO product_information VALUES (2370-
, 'PS 220V /HS/FR'-
, '220V hot swappable power supply, for France.'
, 19,2
, to_yminterval('+00-09')
, 102053
, 'orderable'
, 91
, 75
, 'http://www.supp-102053.com/cat/hw/p2370.html');
INSERT INTO product_information VALUES (2311-
, 'PS 220V /L'-
, 'Power supply for laptop computers, 220V'
, 19,2
, to_yminterval('+00-09')
, 102053
, 'orderable'
, 95
, 79
, 'http://www.supp-102053.com/cat/hw/p2311.html');
INSERT INTO product_information VALUES (1733-
, 'PS 220V /UK'-
, '220V Power supply type - United Kingdom'
, 19,2
, to_yminterval('+00-09')
, 102080
, 'orderable'
, 89
, 76
, 'http://www.supp-102080.com/cat/hw/p1733.html');
INSERT INTO product_information VALUES (2878-
, 'Router - ASR/2W'-
, 'Special ALS Router - Approved Supplier required item with 2-way match'
, 19,3
, to_yminterval('+00-09')
, 102063
, 'orderable'
, 345
, 305
, 'http://www.supp-102063.com/cat/hw/p2878.html');
INSERT INTO product_information VALUES (2879-
, 'Router - ASR/3W'-
, 'Special ALS Router - Approved Supplier required item with 3-way match'
, 19,3
, to_yminterval('+00-09')
, 102063
, 'orderable'
, 456
, 384
, 'http://www.supp-102063.com/cat/hw/p2879.html');
INSERT INTO product_information VALUES (2152-
, 'Router - DTMF4'-
, 'DTMF 4 port router'
, 19,3
, to_yminterval('+00-09')
, 102063
, 'obsolete'
, 231
, 191
, 'http://www.supp-102063.com/cat/hw/p2152.html');
INSERT INTO product_information VALUES (3301-
, 'Screws <B.28.P>'-
, 'Screws: Brass, size 28mm, Phillips head. Plastic box, contents 500.'
, 19,2
, to_yminterval('+00-00')
, 102071
, 'orderable'
, 15
, 12
, 'http://www.supp-102071.com/cat/hw/p3301.html');
INSERT INTO product_information VALUES (3143-
, 'Screws <B.28.S>'-
, 'Screws: Brass, size 28mm, straight. Plastic box, contents 500.'
, 19,2
, to_yminterval('+00-00')
, 102071
, 'orderable'
, 16
, 13
, 'http://www.supp-102071.com/cat/hw/p3143.html');
INSERT INTO product_information VALUES (2323-
, 'Screws <B.32.P>'-
, 'Screws: Brass, size 32mm, Phillips head. Plastic box, contents 400.'
, 19,3
, to_yminterval('+00-00')
, 102071
, 'orderable'
, 18
, 14
, 'http://www.supp-102071.com/cat/hw/p2323.html');
INSERT INTO product_information VALUES (3134-
, 'Screws <B.32.S>'-
, 'Screws: Brass, size 32mm, straight. Plastic box, contents 400.'
, 19,3
, to_yminterval('+00-00')
, 102071
, 'orderable'
, 18
, 15
, 'http://www.supp-102071.com/cat/hw/p3134.html');
INSERT INTO product_information VALUES (3139-
, 'Screws <S.16.S>'-
, 'Screws: Steel, size 16 mm, straight. Carton box, contents 750.'
, 19,2
, to_yminterval('+00-00')
, 102071
, 'orderable'
, 21
, 17
, 'http://www.supp-102071.com/cat/hw/p3139.html');
INSERT INTO product_information VALUES (3300-
, 'Screws <S.32.P>'-
, 'Screws: Steel, size 32mm, Phillips head. Plastic box, contents 400.'
, 19,3
, to_yminterval('+00-00')
, 102071
, 'orderable'
, 23
, 19
, 'http://www.supp-102071.com/cat/hw/p3300.html');
INSERT INTO product_information VALUES (2316-
, 'Screws <S.32.S>'-
, 'Screws: Steel, size 32mm, straight. Plastic box, contents 500.'
, 19,3
, to_yminterval('+00-00')
, 102074
, 'orderable'
, 22
, 19
, 'http://www.supp-102074.com/cat/hw/p2316.html');
INSERT INTO product_information VALUES (3140-
, 'Screws <Z.16.S>'-
, 'Screws: Zinc, length 16mm, straight. Carton box, contents 750.'
, 19,2
, to_yminterval('+00-00')
, 102074
, 'orderable'
, 24
, 19
, 'http://www.supp-102074.com/cat/hw/p3140.html');
INSERT INTO product_information VALUES (2319-
, 'Screws <Z.24.S>'-
, 'Screws: Zinc, size 24mm, straight. Carton box, contents 500.'
, 19,2
, to_yminterval('+00-00')
, 102074
, 'orderable'
, 25
, 21
, 'http://www.supp-102074.com/cat/hw/p2319.html');
INSERT INTO product_information VALUES (2322-
, 'Screws <Z.28.P>'-
, 'Screws: Zinc, size 28 mm, Phillips head. Carton box, contents 850.'
, 19,2
, to_yminterval('+00-00')
, 102076
, 'orderable'
, 23
, 18
, 'http://www.supp-102076.com/cat/hw/p2322.html');
INSERT INTO product_information VALUES (3178-
, 'Spreadsheet - SSP/V 2.0'-
, 'SmartSpread Spreadsheet, Professional Edition Version 2.0, for Vision-
Release 11.1 and 11.2. Shrink wrap includes CD-ROM containing advanced-
software and online documentation, plus printed manual, tutorial, and-
license registration.'
, 21,2
, to_yminterval('+00-01')
, 103080
, 'orderable'
, 45
, 37
, 'http://www.supp-103080.com/cat/sw/p3178.html');
INSERT INTO product_information VALUES (3179-
, 'Spreadsheet - SSS/S 2.1'-
, 'SmartSpread Spreadsheet, Standard Edition Version 2.1, for SPNIX Release-
4.0. Shrink wrap includes CD-ROM containing software and online-
documentation, plus printed manual and license registration.'
, 21,2
, to_yminterval('+00-01')
, 103080
, 'orderable'
, 50
, 44
, 'http://www.supp-103080.com/cat/sw/p3179.html');
INSERT INTO product_information VALUES (3182-
, 'Word Processing - SWP/V 4.5'-
, 'SmartWord Word Processor, Professional Edition Version 4.5, for Vision-
Release 11.x. Shrink wrap includes CD-ROM, containing advanced software,-
printed manual, and license registration.'
, 22,2
, to_yminterval('+00-03')
, 103093
, 'orderable'
, 65
, 54
, 'http://www.supp-103093.com/cat/sw/p3182.html');
INSERT INTO product_information VALUES (3183-
, 'Word Processing - SWS/V 4.5'-
, 'SmartWord Word Processor, Standard Edition Version 4.5, for Vision-
Release 11.x. Shrink wrap includes CD-ROM and license registration.'
, 22,2
, to_yminterval('+00-01')
, 103093
, 'orderable'
, 50
, 40
, 'http://www.supp-103093.com/cat/sw/p3183.html');
INSERT INTO product_information VALUES (3197-
, 'Spreadsheet - SSS/V 2.1'-
, 'SmartSpread Spreadsheet, Standard Edition Version 2.1, for Vision-
Release 11.1 and 11.2. Shrink wrap includes CD-ROM containing software-
and online documentation, plus printed manual, tutorial, and license-
registration.'
, 21,2
, to_yminterval('+00-01')
, 103080
, 'orderable'
, 45
, 36
, 'http://www.supp-103080.com/cat/sw/p3197.html');
INSERT INTO product_information VALUES (3255-
, 'Spreadsheet - SSS/CD 2.2B'-
, 'SmartSpread Spreadsheet, Standard Edition, Beta Version 2.2, for-
SPNIX Release 4.1. CD-ROM only.'
, 21,1
, to_yminterval('+00-01')
, 103080
, 'orderable'
, 35
, 30
, 'http://www.supp-103080.com/cat/sw/p3255.html');
INSERT INTO product_information VALUES (3256-
, 'Spreadsheet - SSS/V 2.0'-
, 'SmartSpread Spreadsheet, Standard Edition Version 2.0, for Vision-
Release 11.0. Shrink wrap includes CD-ROM containing software and-
online documentation, plus printed manual, tutorial, and license-
registration.'
, 21,2
, to_yminterval('+00-01')
, 103080
, 'orderable'
, 40
, 34
, 'http://www.supp-103080.com/cat/sw/p3256.html');
INSERT INTO product_information VALUES (3260-
, 'Word Processing - SWP/S 4.4'-
, 'SmartSpread Spreadsheet, Standard Edition Version 2.2, for SPNIX-
Release 4.x. Shrink wrap includes CD-ROM, containing software, plus-
printed manual and license registration.'
, 22,2
, to_yminterval('+00-01')
, 103093
, 'orderable'
, 50
, 41
, 'http://www.supp-103093.com/cat/sw/p3260.html');
INSERT INTO product_information VALUES (3262-
, 'Spreadsheet - SSS/S 2.2'-
, 'SmartSpread Spreadsheet, Standard Edition Version 2.2, for SPNIX-
Release 4.1. Shrink wrap includes CD-ROM containing software and-
online documentation, plus printed manual and license registration.'
, 21,2
, to_yminterval('+00-01')
, 103080
, 'under development'
, 50
, 41
, 'http://www.supp-103080.com/cat/sw/p3262.html');
INSERT INTO product_information VALUES (3361-
, 'Spreadsheet - SSP/S 1.5'-
, 'SmartSpread Spreadsheet, Standard Edition Version 1.5, for SPNIX-
Release 3.3. Shrink wrap includes CD-ROM containing advanced software and-
online documentation, plus printed manual, tutorial, and license registration.'
, 21,2
, to_yminterval('+00-01')
, 103080
, 'orderable'
, 40
, 34
, 'http://www.supp-103080.com/cat/sw/p3361.html');
INSERT INTO product_information VALUES (1799-
, 'SPNIX3.3 - SL'-
, 'Operating System Software: SPNIX V3.3 - Base Server License. Includes-
10 general licenses for system administration, developers, or users. No-
network user licensing. '
, 24,1
, to_yminterval('+01-00')
, 103092
, 'orderable'
, 1000
, 874
, 'http://www.supp-103092.com/cat/sw/p1799.html');
INSERT INTO product_information VALUES (1801-
, 'SPNIX3.3 - AL'-
, 'Operating System Software: SPNIX V3.3 - Additional system-
administrator license, including network access.'
, 24,1
, to_yminterval('+01-00')
, 103092
, 'orderable'
, 100
, 88
, 'http://www.supp-103092.com/cat/sw/p1801.html');
INSERT INTO product_information VALUES (1803-
, 'SPNIX3.3 - DL'-
, 'Operating System Software: SPNIX V3.3 - Additional developer license.'
, 24,1
, to_yminterval('+01-00')
, 103092
, 'orderable'
, 60
, 51
, 'http://www.supp-103092.com/cat/sw/p1803.html');
INSERT INTO product_information VALUES (1804-
, 'SPNIX3.3 - UL/N'-
, 'Operating System Software: SPNIX V3.3 - Additional user license with-
network access.'
, 24,1
, to_yminterval('+01-00')
, 103092
, 'orderable'
, 65
, 56
, 'http://www.supp-103092.com/cat/sw/p1804.html');
INSERT INTO product_information VALUES (1805-
, 'SPNIX3.3 - UL/A'-
, 'Operating System Software: SPNIX V3.3 - Additional user license class A.'
, 24,1
, to_yminterval('+01-00')
, 103092
, 'orderable'
, 50
, 42
, 'http://www.supp-103092.com/cat/sw/p1805.html');
INSERT INTO product_information VALUES (1806-
, 'SPNIX3.3 - UL/C'-
, 'Operating System Software: SPNIX V3.3 - Additional user license class C.'
, 24,1
, to_yminterval('+01-00')
, 103092
, 'orderable'
, 50
, 42
, 'http://www.supp-103092.com/cat/sw/p1806.html');
INSERT INTO product_information VALUES (1808-
, 'SPNIX3.3 - UL/D'-
, 'Operating System Software: SPNIX V3.3 - Additional user license class D.'
, 24,1
, to_yminterval('+01-00')
, 103092
, 'orderable'
, 55
, 46
, 'http://www.supp-103092.com/cat/sw/p1808.html');
INSERT INTO product_information VALUES (1820-
, 'SPNIX3.3 - NL'-
, 'Operating System Software: SPNIX V3.3 - Additional network access license.'
, 24,1
, to_yminterval('+01-00')
, 103092
, 'orderable'
, 55
, 45
, 'http://www.supp-103092.com/cat/sw/p1820.html');
INSERT INTO product_information VALUES (1822-
, 'SPNIX4.0 - SL'-
, 'Operating System Software: SPNIX V4.0 - Base Server License. Includes-
10 general licenses for system administration, developers, or users. No-
network user licensing. '
, 24,1
, to_yminterval('+01-00')
, 103092
, 'orderable'
, 1500
, 1303
, 'http://www.supp-103092.com/cat/sw/p1822.html');
INSERT INTO product_information VALUES (2422-
, 'SPNIX4.0 - SAL'-
, 'Operating System Software: SPNIX V4.0 - Additional system-
administrator license, including network access.'
, 24,1
, to_yminterval('+01-00')
, 103092
, 'orderable'
, 150
, 130
, 'http://www.supp-103092.com/cat/sw/p2422.html');
INSERT INTO product_information VALUES (2452-
, 'SPNIX4.0 - DL'-
, 'Operating System Software: SPNIX V4.0 - Additional developer license.'
, 24,1
, to_yminterval('+01-00')
, 103092
, 'orderable'
, 100
, 88
, 'http://www.supp-103092.com/cat/sw/p2452.html');
INSERT INTO product_information VALUES (2462-
, 'SPNIX4.0 - UL/N'-
, 'Operating System Software: SPNIX V4.0 - Additional user license with-
network access.'
, 24,1
, to_yminterval('+01-00')
, 103092
, 'orderable'
, 80
, 71
, 'http://www.supp-103092.com/cat/sw/p2462.html');
INSERT INTO product_information VALUES (2464-
, 'SPNIX4.0 - UL/A'-
, 'Operating System Software: SPNIX V4.0 - Additional user license class A.'
, 24,1
, to_yminterval('+01-00')
, 103092
, 'orderable'
, 70
, 62
, 'http://www.supp-103092.com/cat/sw/p2464.html');
INSERT INTO product_information VALUES (2467-
, 'SPNIX4.0 - UL/D'-
, 'Operating System Software: SPNIX V4.0 - Additional user license class D.'
, 24,1
, to_yminterval('+01-00')
, 103092
, 'orderable'
, 80
, 64
, 'http://www.supp-103092.com/cat/sw/p2467.html');
INSERT INTO product_information VALUES (2468-
, 'SPNIX4.0 - UL/C'-
, 'Operating System Software: SPNIX V4.0 - Additional user license class C.'
, 24,1
, to_yminterval('+01-00')
, 103092
, 'orderable'
, 75
, 67
, 'http://www.supp-103092.com/cat/sw/p2468.html');
INSERT INTO product_information VALUES (2470-
, 'SPNIX4.0 - NL'-
, 'Operating System Software: SPNIX V4.0 - Additional network access license.'
, 24,1
, to_yminterval('+01-00')
, 103092
, 'orderable'
, 80
, 70
, 'http://www.supp-103092.com/cat/sw/p2470.html');
INSERT INTO product_information VALUES (2471-
, 'SPNIX3.3 SU'-
, 'Operating System Software: SPNIX V3.3 - Base Server License Upgrade-
to V4.0.'
, 24,1
, to_yminterval('+01-00')
, 103092
, 'orderable'
, 500
, 439
, 'http://www.supp-103092.com/cat/sw/p2471.html');
INSERT INTO product_information VALUES (2492-
, 'SPNIX3.3 AU'-
, 'Operating System Software: SPNIX V3.3 - V4.0 upgrade; class A user.'
, 24,1
, to_yminterval('+01-00')
, 103092
, 'orderable'
, 45
, 38
, 'http://www.supp-103092.com/cat/sw/p2492.html');
INSERT INTO product_information VALUES (2493-
, 'SPNIX3.3 C/DU'-
, 'Operating System Software: SPNIX V3.3 - V4.0 upgrade; class C or D user.'
, 24,1
, to_yminterval('+01-00')
, 103092
, 'orderable'
, 25
, 22
, 'http://www.supp-103092.com/cat/sw/p2493.html');
INSERT INTO product_information VALUES (2494-
, 'SPNIX3.3 NU'-
, 'Operating System Software: SPNIX V3.3 - V4.0 upgrade;-
network access license.'
, 24,1
, to_yminterval('+01-00')
, 103092
, 'orderable'
, 25
, 20
, 'http://www.supp-103092.com/cat/sw/p2494.html');
INSERT INTO product_information VALUES (2995-
, 'SPNIX3.3 SAU'-
, 'Operating System Software: SPNIX V3.3 - V4.0 upgrade; system-
administrator license.'
, 24,1
, to_yminterval('+01-00')
, 103092
, 'orderable'
, 70
, 62
, 'http://www.supp-103092.com/cat/sw/p2995.html');
INSERT INTO product_information VALUES (3290-
, 'SPNIX3.3 DU'-
, 'Operating System Software: SPNIX V3.3 - V4.0 upgrade;-
developer license.'
, 24,1
, to_yminterval('+01-00')
, 103092
, 'orderable'
, 65
, 55
, 'http://www.supp-103092.com/cat/sw/p3290.html');
INSERT INTO product_information VALUES (1778-
, 'C for SPNIX3.3 - 1 Seat'-
, 'C programming software for SPNIX V3.3 - single user'
, 25,1
, to_yminterval('+00-06')
, 103092
, 'orderable'
, 62
, 52
, 'http://www.supp-103092.com/cat/sw/p1778.html');
INSERT INTO product_information VALUES (1779-
, 'C for SPNIX3.3 - Doc'-
, 'C programming language documentation
, SPNIX V3.3'
, 25,2
, to_yminterval('+10-00')
, 103092
, 'orderable'
, 128
, 112
, 'http://www.supp-103092.com/cat/sw/p1779.html');
INSERT INTO product_information VALUES (1780-
, 'C for SPNIX3.3 - Sys'-
, 'C programming software for SPNIX V3.3 - system compiler,-
libraries, linker'
, 25,1
, to_yminterval('+00-06')
, 103092
, 'orderable'
, 450
, 385
, 'http://www.supp-103092.com/cat/sw/p1780.html');
INSERT INTO product_information VALUES (2371-
, 'C for SPNIX4.0 - Doc'-
, 'C programming language documentation, SPNIX V4.0'
, 25,2
, to_yminterval('+10-00')
, 103092
, 'orderable'
, 146
, 119
, 'http://www.supp-103092.com/cat/sw/p2371.html');
INSERT INTO product_information VALUES (2423-
, 'C for SPNIX4.0 - 1 Seat'-
, 'C programming software for SPNIX V4.0 - single user'
, 25,1
, to_yminterval('+00-06')
, 103092
, 'orderable'
, 84
, 73
, 'http://www.supp-103092.com/cat/sw/p2423.html');
INSERT INTO product_information VALUES (3501-
, 'C for SPNIX4.0 - Sys'-
, 'C programming software for SPNIX V4.0 - system compiler,-
libraries, linker'
, 25,1
, to_yminterval('+00-06')
, 103092
, 'orderable'
, 555
, 448
, 'http://www.supp-103092.com/cat/sw/p3501.html');
INSERT INTO product_information VALUES (3502-
, 'C for SPNIX3.3 -Sys/U'-
, 'C programming software for SPNIX V3.3 - 4.0 Upgrade;-
system compiler, libraries, linker'
, 25,1
, to_yminterval('+00-06')
, 103092
, 'orderable'
, 105
, 88
, 'http://www.supp-103092.com/cat/sw/p3502.html');
INSERT INTO product_information VALUES (3503-
, 'C for SPNIX3.3 - Seat/U'-
, 'C programming software for SPNIX V3.3 - 4.0 Upgrade - single user'
, 25,1
, to_yminterval('+00-06')
, 103092
, 'orderable'
, 22
, 18
, 'http://www.supp-103092.com/cat/sw/p3503.html');
INSERT INTO product_information VALUES (1774-
, 'Base ISO CP - BL'-
, 'Base ISO Communication Package - Base License'
, 29,1
, to_yminterval('+00-00')
, 103088
, 'orderable'
, 110
, 93
, 'http://www.supp-103088.com/cat/sw/p1774.html');
INSERT INTO product_information VALUES (1775-
, 'Client ISO CP - S'-
, 'ISO Communication Package add-on license for additional SPNIX V3.3 client.'
, 29,1
, to_yminterval('+00-00')
, 103087
, 'orderable'
, 27
, 22
, 'http://www.supp-103087.com/cat/sw/p1775.html');
INSERT INTO product_information VALUES (1794-
, 'OSI 8-16/IL'-
, 'OSI Layer 8 to 16 - Incremental License'
, 29,1
, to_yminterval('+00-00')
, 103096
, 'orderable'
, 128
, 112
, 'http://www.supp-103096.com/cat/sw/p1794.html');
INSERT INTO product_information VALUES (1825-
, 'X25 - 1 Line License'-
, 'X25 network access control system, single user'
, 29,1
, to_yminterval('+00-06')
, 103093
, 'orderable'
, 25
, 21
, 'http://www.supp-103093.com/cat/sw/p1825.html');
INSERT INTO product_information VALUES (2004-
, 'IC Browser - S'-
, 'IC Web Browser for SPNIX. Browser with network mail capability.'
, 29,1
, to_yminterval('+00-01')
, 103086
, 'orderable'
, 90
, 80
, 'http://www.supp-103086.com/cat/sw/p2004.html');
INSERT INTO product_information VALUES (2005-
, 'IC Browser Doc - S'-
, 'Documentation set for IC Web Browser for SPNIX. Includes Installation-
Manual, Mail Server Administration Guide, and User Quick Reference.'
, 29,2
, to_yminterval('+00-00')
, 103086
, 'orderable'
, 115
, 100
, 'http://www.supp-103086.com/cat/sw/p2005.html');
INSERT INTO product_information VALUES (2416-
, 'Client ISO CP - S'-
, 'ISO Communication Package add-on license for additional SPNIX V4.0 client.'
, 29,1
, to_yminterval('+00-00')
, 103088
, 'orderable'
, 41
, 36
, 'http://www.supp-103088.com/cat/sw/p2416.html');
INSERT INTO product_information VALUES (2417-
, 'Client ISO CP - V'-
, 'ISO Communication Package add-on license for additional Vision client.'
, 29,1
, to_yminterval('+00-00')
, 103088
, 'orderable'
, 33
, 27
, 'http://www.supp-103088.com/cat/sw/p2417.html');
INSERT INTO product_information VALUES (2449-
, 'OSI 1-4/IL'-
, 'OSI Layer 1 to 4 - Incremental License'
, 29,1
, to_yminterval('+00-00')
, 103088
, 'orderable'
, 83
, 72
, 'http://www.supp-103088.com/cat/sw/p2449.html');
INSERT INTO product_information VALUES (3101-
, 'IC Browser - V'-
, 'IC Web Browser for Vision with manual. Browser with network mail capability.'
, 29,2
, to_yminterval('+00-01')
, 103086
, 'orderable'
, 75
, 67
, 'http://www.supp-103086.com/cat/sw/p3101.html');
INSERT INTO product_information VALUES (3170-
, 'Smart Suite - V/SP'-
, 'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for Vision.-
Spanish language software and user manuals.'
, 29,2
, to_yminterval('+00-06')
, 103089
, 'orderable'
, 161
, 132
, 'http://www.supp-103089.com/cat/sw/p3170.html');
INSERT INTO product_information VALUES (3171-
, 'Smart Suite - S3.3/EN'-
, 'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for SPNIX-
Version 3.3. English language software and user manuals.'
, 29,2
, to_yminterval('+00-06')
, 103089
, 'orderable'
, 148
, 120
, 'http://www.supp-103089.com/cat/sw/p3171.html');
INSERT INTO product_information VALUES (3172-
, 'Graphics - DIK+'-
, 'Software Kit Graphics: Draw-It Kwik-Plus. Includes extensive clip art-
files and advanced drawing tools for 3-D object manipulation, variable-
shading, and extended character fonts.'
, 29,1
, to_yminterval('+00-01')
, 103094
, 'orderable'
, 42
, 34
, 'http://www.supp-103094.com/cat/sw/p3172.html');
INSERT INTO product_information VALUES (3173-
, 'Graphics - SA'-
, 'Software Kit Graphics: SmartArt. Professional graphics package for-
SPNIX with multiple line styles, textures, built-in shapes and common symbols.'
, 29,1
, to_yminterval('+00-01')
, 103094
, 'orderable'
, 86
, 72
, 'http://www.supp-103094.com/cat/sw/p3173.html');
INSERT INTO product_information VALUES (3175-
, 'Project Management - S4.0'-
, 'Project Management Software, for SPNIX V4.0. Software includes command-
line and graphical interface with text, graphic, spreadsheet, and-
customizable report formats.'
, 29,1
, to_yminterval('+00-01')
, 103089
, 'orderable'
, 37
, 32
, 'http://www.supp-103089.com/cat/sw/p3175.html');
INSERT INTO product_information VALUES (3176-
, 'Smart Suite - V/EN'-
, 'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for-
Vision. English language software and user manuals.'
, 29,2
, to_yminterval('+00-06')
, 103089
, 'orderable'
, 120
, 103
, 'http://www.supp-103089.com/cat/sw/p3176.html');
INSERT INTO product_information VALUES (3177-
, 'Smart Suite - V/FR'-
, 'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for-
Vision. French language software and user manuals.'
, 29,2
, to_yminterval('+00-06')
, 103089
, 'orderable'
, 120
, 102
, 'http://www.supp-103089.com/cat/sw/p3177.html');
INSERT INTO product_information VALUES (3245-
, 'Smart Suite - S4.0/FR'-
, 'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for-
SPNIX V4.0. French language software and user manuals.'
, 29,2
, to_yminterval('+00-06')
, 103089
, 'orderable'
, 222
, 195
, 'http://www.supp-103089.com/cat/sw/p3245.html');
INSERT INTO product_information VALUES (3246-
, 'Smart Suite - S4.0/SP'-
, 'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for-
SPNIX V4.0. Spanish language software and user manuals.'
, 29,2
, to_yminterval('+00-06')
, 103089
, 'orderable'
, 222
, 193
, 'http://www.supp-103089.com/cat/sw/p3246.html');
INSERT INTO product_information VALUES (3247-
, 'Smart Suite - V/DE'-
, 'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for-
Vision. German language software and user manuals.'
, 29,2
, to_yminterval('+00-06')
, 103089
, 'orderable'
, 120
, 96
, 'http://www.supp-103089.com/cat/sw/p3247.html');
INSERT INTO product_information VALUES (3248-
, 'Smart Suite - S4.0/DE'-
, 'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for-
SPNIX V4.0. German language software and user manuals.'
, 29,2
, to_yminterval('+00-06')
, 103089
, 'orderable'
, 222
, 193
, 'http://www.supp-103089.com/cat/sw/p3248.html');
INSERT INTO product_information VALUES (3250-
, 'Graphics - DIK'-
, 'Software Kit Graphics: Draw-It Kwik. Simple graphics package for-
Vision systems, with options to save in GIF, JPG, and BMP formats.'
, 29,1
, to_yminterval('+00-01')
, 103083
, 'orderable'
, 28
, 24
, 'http://www.supp-103083.com/cat/sw/p3250.html');
INSERT INTO product_information VALUES (3251-
, 'Project Management - V'-
, 'Project Management Software, for Vision. Software includes command-
line and graphical interface with text, graphic, spreadsheet, and-
customizable report formats.'
, 29,1
, to_yminterval('+00-01')
, 103093
, 'orderable'
, 31
, 26
, 'http://www.supp-103093.com/cat/sw/p3251.html');
INSERT INTO product_information VALUES (3252-
, 'Project Management - S3.3'-
, 'Project Management Software, for SPNIX V3.3. Software includes command-
line and graphical interface with text, graphic, spreadsheet, and-
customizable report formats.'
, 29,1
, to_yminterval('+00-01')
, 103093
, 'orderable'
, 26
, 23
, 'http://www.supp-103093.com/cat/sw/p3252.html');
INSERT INTO product_information VALUES (3253-
, 'Smart Suite - S4.0/EN'-
, 'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for-
SPNIX V4.0. English language software and user manuals.'
, 29,2
, to_yminterval('+00-06')
, 103089
, 'orderable'
, 222
, 188
, 'http://www.supp-103089.com/cat/sw/p3253.html');
INSERT INTO product_information VALUES (3257-
, 'Web Browser - SB/S 2.1'-
, 'Software Kit Web Browser: SmartBrowse V2.1 for SPNIX V3.3. Includes-
context sensitive help files and online documentation.'
, 29,1
, to_yminterval('+00-01')
, 103082
, 'orderable'
, 66
, 58
, 'http://www.supp-103082.com/cat/sw/p3257.html');
INSERT INTO product_information VALUES (3258-
, 'Web Browser - SB/V 1.0'-
, 'Software Kit Web Browser: SmartBrowse V2.1 for Vision. Includes-
context sensitive help files and online documentation.'
, 29,1
, to_yminterval('+00-01')
, 103082
, 'orderable'
, 80
, 70
, 'http://www.supp-103082.com/cat/sw/p3258.html');
INSERT INTO product_information VALUES (3362-
, 'Web Browser - SB/S 4.0'-
, 'Software Kit Web Browser: SmartBrowse V4.0 for SPNIX V4.0. Includes-
context sensitive help files and online documentation.'
, 29,1
, to_yminterval('+00-01')
, 103082
, 'orderable'
, 99
, 81
, 'http://www.supp-103082.com/cat/sw/p3362.html');
INSERT INTO product_information VALUES (2231-
, 'Desk - S/V'-
, 'Standard-sized desk; capitalizable, taxable item. Final finish is from-
veneer in stock at time of order, including oak, ash, cherry, and mahogany.'
, 31,5
, to_yminterval('+15-00')
, 103082
, 'orderable'
, 2510
, 2114
, 'http://www.supp-103082.com/cat/off/p2231.html');
INSERT INTO product_information VALUES (2335-
, 'Mobile phone'-
, 'Dual band mobile phone with low battery consumption. Lightweight,-
foldable, with socket for single earphone and spare battery compartment.'
, 31,1
, to_yminterval('+01-06')
, 103088
, 'orderable'
, 100
, 83
, 'http://www.supp-103088.com/cat/off/p2335.html');
INSERT INTO product_information VALUES (2350-
, 'Desk - W/48'-
, 'Desk - 48 inch white laminate without return; capitalizable, taxable item.'
, 31,5
, to_yminterval('+20-00')
, 103082
, 'orderable'
, 2500
, 2129
, 'http://www.supp-103082.com/cat/off/p2350.html');
INSERT INTO product_information VALUES (2351-
, 'Desk - W/48/R'-
, 'Desk - 60 inch white laminate with 48 inch return; capitalizable,-
taxable item.'
, 31,5
, to_yminterval('+20-0')
, 103082
, 'orderable'
, 2900
, 2386
, 'http://www.supp-103082.com/cat/off/p2351.html');
INSERT INTO product_information VALUES (2779-
, 'Desk - OS/O/F'-
, 'Executive-style oversized oak desk with file drawers. Final finish is-
customizable when ordered, light or dark oak stain,-
or natural hand rubbed clear.'
, 31,5
, to_yminterval('+25-00')
, 103082
, 'orderable'
, 3980
, 3347
, 'http://www.supp-103082.com/cat/off/p2779.html');
INSERT INTO product_information VALUES (3337-
, 'Mobile Web Phone'-
, 'Mobile phone including monthly fee for Web access. Slimline shape-
with leather-look carrying case and belt clip.'
, 31,2
, to_yminterval('+01-06')
, 103088
, 'orderable'
, 800
, 666
, 'http://www.supp-103088.com/cat/off/p3337.html');
INSERT INTO product_information VALUES (2091-
, 'Paper Tablet LW 8 1/2 x 11'-
, 'Paper tablet, lined, white, size 8 1/2 x 11 inch'
, 32,1
, to_yminterval('+00-00')
, 103095
, 'orderable'
, 1
, 0
, 'http://www.supp-103095.com/cat/off/p2091.html');
INSERT INTO product_information VALUES (2093-
, 'Pens - 10/FP'-
, 'Permanent ink pen dries quickly and is smear resistant. Provides smooth,-
skip-free writing. Fine point. Single color boxes (black, blue, red) or-
assorted box (6 black, 3 blue, and 1 red).'
, 32,1
, to_yminterval('+00-00')
, 103090
, 'orderable'
, 8
, 7
, 'http://www.supp-103090.com/cat/off/p2093.html');
INSERT INTO product_information VALUES (2144-
, 'Card Organizer Cover'-
, 'Replacement cover for desk top style business card holder. Smoke-
grey (original color) or clear plastic.'
, 32,1
, to_yminterval('+00-01')
, 103094
, 'orderable'
, 18
, 14
, 'http://www.supp-103094.com/cat/off/p2144.html');
INSERT INTO product_information VALUES (2336-
, 'Business Cards Box - 250'-
, 'Business cards box, capacity 250. Use form BC110-2, Rev. 3/2000-
(hardcopy or online) when ordering and complete all fields marked-
with an asterisk.'
, 32,1
, to_yminterval('+00-00')
, 103091
, 'orderable'
, 55
, 49
, 'http://www.supp-103091.com/cat/off/p2336.html');
INSERT INTO product_information VALUES (2337-
, 'Business Cards - 1000/2L'-
, 'Business cards box, capacity 1000, 2-sided with different language on-
each side. Use form BC111-2, Rev. 12/1999 (hardcopy or online) when-
ordering - complete all fields marked with an asterisk and check box for-
second language (English is always on side 1).'
, 32,1
, to_yminterval('+00-00')
, 103091
, 'orderable'
, 300
, 246
, 'http://www.supp-103091.com/cat/off/p2337.html');
INSERT INTO product_information VALUES (2339-
, 'Paper - Std Printer'-
, '20 lb. 8.5x11 inch white laser printer paper (recycled),-
ten 500-sheet reams'
, 32,3
, to_yminterval('+00-00')
, 103095
, 'orderable'
, 25
, 21
, 'http://www.supp-103095.com/cat/off/p2339.html');
INSERT INTO product_information VALUES (2536-
, 'Business Cards - 250/2L'-
, 'Business cards box, capacity 250, 2-sided with different language on-
each side. Use form BC111-2, Rev. 12/1999 (hardcopy or online) when-
ordering - complete all fields marked with an asterisk and check box for-
second language (English is always on side 1).'
, 32,1
, to_yminterval('+00-00')
, 103091
, 'orderable'
, 80
, 68
, 'http://www.supp-103091.com/cat/off/p2536.html');
INSERT INTO product_information VALUES (2537-
, 'Business Cards Box - 1000'-
, 'Business cards box, capacity 1000. Use form BC110-3, Rev. 3/2000-
(hardcopy or online) when ordering and complete all fields marked with-
an asterisk.'
, 32,1
, to_yminterval('+00-00')
, 103091
, 'orderable'
, 200
, 176
, 'http://www.supp-103091.com/cat/off/p2537.html');
INSERT INTO product_information VALUES (2783-
, 'Clips - Paper'-
, 'World brand paper clips set the standard for quality.10 boxes with 100-
clips each. #1 regular or jumbo, smooth or non-skid.'
, 32,2
, to_yminterval('+00-00')
, 103080
, 'orderable'
, 10
, 8
, 'http://www.supp-103080.com/cat/off/p2783.html');
INSERT INTO product_information VALUES (2808-
, 'Paper Tablet LY 8 1/2 x 11'-
, 'Paper Tablet, Lined, Yellow, size 8 1/2 x 11 inch'
, 32,1
, to_yminterval('+00-00')
, 103098
, 'orderable'
, 1
, 0
, 'http://www.supp-103098.com/cat/off/p2808.html');
INSERT INTO product_information VALUES (2810-
, 'Inkvisible Pens'-
, 'Rollerball pen is equipped with a smooth precision tip. See-through-
rubber grip allows for a visible ink supply and comfortable writing.-
4-pack with 1 each, black, blue, red, green.'
, 32,1
, to_yminterval('+00-00')
, 103095
, 'orderable'
, 6
, 4
, 'http://www.supp-103095.com/cat/off/p2810.html');
INSERT INTO product_information VALUES (2870-
, 'Pencil - Mech'-
, 'Ergonomically designed mechanical pencil for improved writing comfort.-
Refillable erasers and leads. Available in three lead sizes: .5mm (fine);-
.7mm (medium); and .9mm (thick).'
, 32,1
, to_yminterval('+02-00')
, 103097
, 'orderable'
, 5
, 4
, 'http://www.supp-103097.com/cat/off/p2870.html');
INSERT INTO product_information VALUES (3051-
, 'Pens - 10/MP'-
, 'Permanent ink pen dries quickly and is smear resistant. Provides smooth,-
skip-free writing. Medium point. Single color boxes (black, blue, red) or-
assorted box (6 black, 3 blue, and 1 red).'
, 32,1
, to_yminterval('+00-00')
, 103097
, 'orderable'
, 12
, 10
, 'http://www.supp-103097.com/cat/off/p3051.html');
INSERT INTO product_information VALUES (3150-
, 'Card Holder - 25'-
, 'Card Holder; heavy plastic business card holder with embossed corporate-
logo. Holds about 25 of your business cards, depending on card thickness.'
, 32,1
, to_yminterval('+00-06')
, 103089
, 'orderable'
, 18
, 15
, 'http://www.supp-103089.com/cat/off/p3150.html');
INSERT INTO product_information VALUES (3208-
, 'Pencils - Wood'-
, 'Box of 2 dozen wooden pencils. Specify lead type when ordering: 2H-
(double hard), H (hard), HB (hard black), B (soft black).'
, 32,1
, to_yminterval('+00-00')
, 103097
, 'orderable'
, 2
, 1
, 'http://www.supp-103097.com/cat/off/p3208.html');
INSERT INTO product_information VALUES (3209-
, 'Sharpener - Pencil'-
, 'Electric Pencil Sharpener Rugged steel cutters for long life.-
PencilSaver helps prevent over-sharpening. Non-skid rubber feet.-
Built-in pencil holder.'
, 32,2
, to_yminterval('+02-00')
, 103096
, 'orderable'
, 13
, 11
, 'http://www.supp-103096.com/cat/off/p3209.html');
INSERT INTO product_information VALUES (3224-
, 'Card Organizer - 250'-
, 'Portable holder for organizing business cards, capacity 250. Booklet-
style with slip in, transparent pockets for business cards. Optional-
alphabet tabs. Specify cover color when ordering (dark brown, beige,-
burgundy, black, and light grey).'
, 32,1
, to_yminterval('+05-00')
, 103095
, 'orderable'
, 32
, 28
, 'http://www.supp-103095.com/cat/off/p3224.html');
INSERT INTO product_information VALUES (3225-
, 'Card Organizer - 1000'-
, 'Holder for organizing business cards with alphabet dividers; capacity-
1000. Desk top style with smoke grey cover and black base. Lid is-
removable for storing inside drawer.'
, 32,1
, to_yminterval('+00-02')
, 103095
, 'orderable'
, 47
, 39
, 'http://www.supp-103095.com/cat/off/p3225.html');
INSERT INTO product_information VALUES (3511-
, 'Paper - HQ Printer'-
, 'Quality paper for inkjet and laser printers tested to resist printer-
jams. Acid free for archival purposes. 22lb. weight with brightness of 92.-
Size: 8 1/2 x 11. Single 500-sheet ream.'
, 32,2
, to_yminterval('+00-00')
, 103080
, 'orderable'
, 9
, 7
, 'http://www.supp-103080.com/cat/off/p3511.html');
INSERT INTO product_information VALUES (3515-
, 'Lead Replacement'-
, 'Refill leads for mechanical pencils. Each pack contains 25 leads and-
a replacement eraser. Available in three lead sizes: .5mm (fine); .7mm-
(medium); and .9mm (thick).'
, 32,1
, to_yminterval('+00-00')
, 103095
, 'orderable'
, 2
, 1
, 'http://www.supp-103095.com/cat/off/p3515.html');
INSERT INTO product_information VALUES (2986-
, 'Manual - Vision OS/2x +'-
, 'Manuals for Vision Operating System V 2.x and Vision Office Suite'
, 33,3
, to_yminterval('+00-00')
, 103095
, 'orderable'
, 125
, 111
, 'http://www.supp-103095.com/cat/off/p2986.html');
INSERT INTO product_information VALUES (3163-
, 'Manual - Vision Net6.3/US'-
, 'Vision Networking V6.3 Reference Manual. US version with advanced-
encryption.'
, 33,2
, to_yminterval('+00-00')
, 103083
, 'orderable'
, 35
, 29
, 'http://www.supp-103083.com/cat/off/p3163.html');
INSERT INTO product_information VALUES (3165-
, 'Manual - Vision Tools2.0'-
, 'Vision Business Tools Suite V2.0 Reference Manual. Includes installation,-
configuration, and user guide.'
, 33,2
, to_yminterval('+00-00')
, 103083
, 'orderable'
, 40
, 34
, 'http://www.supp-103083.com/cat/off/p3165.html');
INSERT INTO product_information VALUES (3167-
, 'Manual - Vision OS/2.x'-
, 'Vision Operating System V2.0/2.1/2/3 Reference Manual. Complete-
installation, configuration, management, and tuning information for Vision-
system administration. Note that this manual replaces the individual-
Version 2.0 and 2.1 manuals.'
, 33,2
, to_yminterval('+00-00')
, 103083
, 'orderable'
, 55
, 47
, 'http://www.supp-103083.com/cat/off/p3167.html');
INSERT INTO product_information VALUES (3216-
, 'Manual - Vision Net6.3'-
, 'Vision Networking V6.3 Reference Manual. Non-US version with basic-
encryption.'
, 33,2
, to_yminterval('+00-00')
, 103083
, 'orderable'
, 30
, 26
, 'http://www.supp-103083.com/cat/off/p3216.html');
INSERT INTO product_information VALUES (3220-
, 'Manual - Vision OS/1.2'-
, 'Vision Operating System V1.2 Reference Manual. Complete installation,-
configuration, management, and tuning information for Vision system-
administration.'
, 33,2
, to_yminterval('+00-00')
, 103083
, 'orderable'
, 45
, 36
, 'http://www.supp-103083.com/cat/off/p3220.html');
INSERT INTO product_information VALUES (1729-
, 'Chemicals - RCP'-
, 'Cleaning Chemicals - 3500 roller clean pads'
, 39,2
, to_yminterval('+05-00')
, 103094
, 'orderable'
, 80
, 66
, 'http://www.supp-103094.com/cat/off/p1729.html');
INSERT INTO product_information VALUES (1910-
, 'FG Stock - H'-
, 'Fiberglass Stock - heavy duty, 1 thick'
, 39,3
, to_yminterval('+00-00')
, 103083
, 'orderable'
, 14
, 11
, 'http://www.supp-103083.com/cat/off/p1910.html');
INSERT INTO product_information VALUES (1912-
, 'SS Stock - 3mm'-
, 'Stainless steel stock - 3mm. Can be predrilled for standard power-
supplies, motherboard holders, and hard drives. Please use appropriate-
template to identify model number, placement, and size of finished sheet-
when placing order for drilled sheet.'
, 39,2
, to_yminterval('+00-00')
, 103083
, 'orderable'
, 15
, 12
, 'http://www.supp-103083.com/cat/off/p1912.html');
INSERT INTO product_information VALUES (1940-
, 'ESD Bracelet/Clip'-
, 'Electro static discharge bracelet with alligator clip for easy-
connection to computer chassis or other ground.'
, 39,1
, to_yminterval('+01-06')
, 103095
, 'orderable'
, 18
, 14
, 'http://www.supp-103095.com/cat/off/p1940.html');
INSERT INTO product_information VALUES (2030-
, 'Latex Gloves'-
, 'Latex Gloves for assemblers, chemical handlers, fitters. Heavy duty,-
safety orange, with textured grip on fingers and thumb. Waterproof and-
shock-proof up to 220 volts/2 amps, 110 volts/5 amps. Acid proof for up-
to 5 minutes.'
, 39,1
, to_yminterval('+10-00')
, 103097
, 'orderable'
, 12
, 10
, 'http://www.supp-103097.com/cat/off/p2030.html');
INSERT INTO product_information VALUES (2326-
, 'Plastic Stock - Y'-
, 'Plastic Stock - Yellow, standard quality.'
, 39,1
, to_yminterval('+00-00')
, 103093
, 'orderable'
, 2
, 1
, 'http://www.supp-103093.com/cat/off/p2326.html');
INSERT INTO product_information VALUES (2330-
, 'Plastic Stock - R'-
, 'Plastic Stock - Red, standard quality.'
, 39,1
, to_yminterval('+00-00')
, 103093
, 'orderable'
, 2
, 1
, 'http://www.supp-103093.com/cat/off/p2330.html');
INSERT INTO product_information VALUES (2334-
, 'Resin'-
, 'General purpose synthetic resin.'
, 39,2
, to_yminterval('+00-00')
, 103087
, 'orderable'
, 4
, 3
, 'http://www.supp-103087.com/cat/off/p2334.html');
INSERT INTO product_information VALUES (2340-
, 'Chemicals - SW'-
, 'Cleaning Chemicals - 3500 staticide wipes'
, 39,2
, to_yminterval('+05-00')
, 103094
, 'orderable'
, 72
, 59
, 'http://www.supp-103094.com/cat/off/p2340.html');
INSERT INTO product_information VALUES (2365-
, 'Chemicals - TCS'-
, 'Cleaning Chemical - 2500 transport cleaning sheets'
, 39,3
, to_yminterval('+05-00')
, 103094
, 'orderable'
, 78
, 69
, 'http://www.supp-103094.com/cat/off/p2365.html');
INSERT INTO product_information VALUES (2594-
, 'FG Stock - L'-
, 'Fiberglass Stock - light weight for internal heat shielding, 1/4 thick'
, 39,2
, to_yminterval('+00-00')
, 103098
, 'orderable'
, 9
, 7
, 'http://www.supp-103098.com/cat/off/p2594.html');
INSERT INTO product_information VALUES (2596-
, 'SS Stock - 1mm'-
, 'Stainless steel stock - 3mm. Can be predrilled for standard model-
motherboard and battery holders. Please use appropriate template to-
identify model number, placement, and size of finished sheet when placing-
order for drilled sheet.'
, 39,2
, to_yminterval('+00-00')
, 103098
, 'orderable'
, 12
, 10
, 'http://www.supp-103098.com/cat/off/p2596.html');
INSERT INTO product_information VALUES (2631-
, 'ESD Bracelet/QR'-
, 'Electro Static Discharge Bracelet: 2 piece lead with quick release-
connector. One piece stays permanently attached to computer chassis with-
screw, the other is attached to the bracelet. Additional permanent-
ends available.'
, 39,1
, to_yminterval('+01-06')
, 103085
, 'orderable'
, 15
, 12
, 'http://www.supp-103085.com/cat/off/p2631.html');
INSERT INTO product_information VALUES (2721-
, 'PC Bag - L/S'-
, 'Black Leather Computer Case - single laptop capacity with pockets for-
manuals, additional hardware, and work papers. Adjustable protective straps-
and removable pocket for power supply and cables.'
, 39,2
, to_yminterval('+01-00')
, 103095
, 'orderable'
, 87
, 70
, 'http://www.supp-103095.com/cat/off/p2721.html');
INSERT INTO product_information VALUES (2722-
, 'PC Bag - L/D'-
, 'Black Leather Computer Case - double laptop capacity with pockets for-
additional hardware or manuals and work papers. Adjustable protective straps-
and removable pockets for power supplies and cables. Double wide shoulder-
strap for comfort.'
, 39,2
, to_yminterval('+01-00')
, 103095
, 'orderable'
, 112
, 99
, 'http://www.supp-103095.com/cat/off/p2722.html');
INSERT INTO product_information VALUES (2725-
, 'Machine Oil'-
, 'Machine Oil for Lubrication of CD-ROM drive doors and slides.-
Self-cleaning adjustable nozzle for fine to medium flow.'
, 39,1
, to_yminterval('+00-00')
, 103098
, 'orderable'
, 4
, 3
, 'http://www.supp-103098.com/cat/off/p2725.html');
INSERT INTO product_information VALUES (2782-
, 'PC Bag - C/S'-
, 'Canvas Computer Case - single laptop capacity with pockets for manuals,-
additional hardware, and work papers. Adjustable protective straps and-
removable pocket for power supply and cables. Outside pocket with snap-
closure for easy access while travelling.'
, 39,2
, to_yminterval('+00-06')
, 103095
, 'orderable'
, 62
, 50
, 'http://www.supp-103095.com/cat/off/p2782.html');
INSERT INTO product_information VALUES (3187-
, 'Plastic Stock - B/HD'-
, 'Plastic Stock - Blue, high density.'
, 39,1
, to_yminterval('+00-00')
, 103095
, 'orderable'
, 3
, 2
, 'http://www.supp-103095.com/cat/off/p3187.html');
INSERT INTO product_information VALUES (3189-
, 'Plastic Stock - G'-
, 'Plastic Stock - Green, standard density.'
, 39,1
, to_yminterval('+00-00')
, 103095
, 'orderable'
, 2
, 1
, 'http://www.supp-103095.com/cat/off/p3189.html');
INSERT INTO product_information VALUES (3191-
, 'Plastic Stock - O'-
, 'Plastic Stock - Orange, standard density.'
, 39,1
, to_yminterval('+00-00')
, 103095
, 'orderable'
, 2
, 1
, 'http://www.supp-103095.com/cat/off/p3191.html');
INSERT INTO product_information VALUES (3193-
, 'Plastic Stock - W/HD'-
, 'Plastic Stock - White, high density.'
, 39,1
, to_yminterval('+00-00')
, 103095
, 'orderable'
, 3
, 2
, 'http://www.supp-103095.com/cat/off/p3193.html');
commit;
set define on
