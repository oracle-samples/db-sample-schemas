rem
rem Header: oe_p_us.sql 07-feb-01
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
rem   oe_p_us.sql - populate OE Common Schema
rem
rem DESCRIPTON
rem   Table product_descriptions
rem
rem MODIFIED   (MM/DD/YY)
rem   hyeh      08/29/02 - hyeh_mv_comschema_to_rdbms
rem   ahunold   02/08/01 - Merged ahunold_globalization
rem   ttanaka   02/07/01 - creation, contents are based on oe_p_pi.sql
rem
rem
rem TRANSLATION INSTRUCTIONS
rem
rem 1. Copy this file to oe_p_xxx.sql file, where xxx is Oracle's language
rem    abbreviation (one, two, or three letters).  Use lowercase letters
rem    for file names.
rem
rem 2. Now you have oe_p_xxx.sql file for each language.
rem
rem 3. In each oe_p_xxx.sql file, change all occurrences of the line
rem             , 'US'-
rem    to the line
rem             , 'XXX'-
rem    where XXX is Oracle's language abbreviation.  It must be uppercase.
rem    If you are using 'vi' editor, the command
rem             :1,$s/^, 'US'-$/, 'XXX'-/
rem    can be used, where XXX (uppercase) is Oracle's language abbreviation.
rem
rem 4. Translate character strings in the UNISTR() functions.
rem    These character strings are quoted by the single-quote.
rem    There are two UNISTR() functions in each INSERT command, and there
rem    are currently 288 INSERT commands in this file.  Therefore you need
rem    to translate 576 character strings in this file for each language.
rem    Please note that '-' (hyphen, or minus) at the end of line indicates
rem    that the SQL command continues to the next line.
rem
rem 5. Once the character strings in the UNISTR() functions are translated,
rem    make sure that the character strings are quoted by the single-quote.
rem    Also, please make sure that you haven't modified any other parts of
rem    SQL commands (except the modification in the step #3 above).
rem
rem 6. Convert the file into ASCII file with Unicode escape sequence.
rem    You can copy oe_p_xxx.sql file to xxx.sql file, and then
rem             native2ascii -encoding FILE_ENCODING xxx.sql > oe_p_xxx.sql
rem    where FILE_ENCODING is Java's encoding name for the character
rem    encoding which you used for the translated character strings.
rem
rem 7. Change all '\u' to '\'.
rem    If you are using 'vi' editor, the command
rem             :1,$s/\\u/\\/g
rem    can be used.
rem    This step is necessary because of UNISTR() function's syntax.
rem
rem 8. For the portability to various platforms (operating systems),
rem    all lines need to be less than 80 bytes.  You can separate the lines
rem    between \1234 and \5678 (for example), but don't separate lines in
rem    the middle of \9abc (for example).  You need to use '-' (hyphen, or
rem    minus) at the end of line when the SQL command is continuing.
rem
rem 9. Now the translated oe_p_xxx.sql files are ready for the testing.
rem    If they work fine, you are now ready to deliver the translated
rem    oe_p_xxx.sql files.
rem
rem
rem    Oracle's                 Oracle's
rem    language name            language abbreviation
rem    ======================   =====================
rem    American                 us
rem    Arabic                   ar
rem    Brazilian Portuguese     ptb
rem    Canadian French          frc
rem    Czech                    cs
rem    Danish                   dk
rem    Dutch                    nl
rem    Finnish                  sf
rem    French                   f
rem    German                   d
rem    Greek                    el
rem    Hebrew                   iw
rem    Hungarian                hu
rem    Italian                  i
rem    Japanese                 ja
rem    Korean                   ko
rem    Latin American Spanish   esa
rem    Norwegian                n
rem    Polish                   pl
rem    Portuguese               pt
rem    Romanian                 ro
rem    Russian                  ru
rem    Simplified Chinese       zhs
rem    Slovak                   sk
rem    Spanish                  e
rem    Swedish                  s
rem    Thai                     th
rem    Traditional Chinese      zht
rem    Turkish                  tr
rem
rem


set define off
INSERT INTO product_descriptions VALUES (1726-
, 'US'-
, UNISTR(-
'LCD Monitor 11/PM'-
), UNISTR(-
'Liquid Cristal Display 11 inch passive monitor. The virtually-flat,-
high-resolution screen delivers outstanding image quality with reduced glare.'-
));
INSERT INTO product_descriptions VALUES (2359-
, 'US'-
, UNISTR(-
'LCD Monitor 9/PM'-
), UNISTR(-
'Liquid Cristal Display 9 inch passive monitor. Enjoy the productivity that-
a small monitor can bring via more workspace on your desk. Easy setup with-
plug-and-play compatibility.'-
));
INSERT INTO product_descriptions VALUES (3060-
, 'US'-
, UNISTR(-
'Monitor 17/HR'-
), UNISTR(-
'CRT Monitor 17 inch (16 viewable) high resolution. Exceptional image-
performance and the benefit of additional screen space. This monitor offers-
sharp, color-rich monitor performance at an incredible value. With a host of-
leading features, including on-screen display controls.'-
));
INSERT INTO product_descriptions VALUES (2243-
, 'US'-
, UNISTR(-
'Monitor 17/HR/F'-
), UNISTR(-
'Monitor 17 inch (16 viewable) high resolution, flat screen. High density-
photon gun with Enhanced Elliptical Correction System for more consistent,-
accurate focus across the screen, even in the corners.'-
));
INSERT INTO product_descriptions VALUES (3057-
, 'US'-
, UNISTR(-
'Monitor 17/SD'-
), UNISTR(-
'CRT Monitor 17 inch (16 viewable) short depth. Delivers outstanding-
image clarity and precision. Gives professional color, technical-
engineering, and visualization/animation users the color fidelity they-
demand, plus a large desktop for enhanced productivity.'-
));
INSERT INTO product_descriptions VALUES (3061-
, 'US'-
, UNISTR(-
'Monitor 19/SD'-
), UNISTR(-
'CRT Monitor 19 inch (18 viewable) short depth. High-contrast black-
screen coating: produces superior contrast and grayscale performance.-
The newly designed, amplified professional speakers with dynamic bass-
response bring all of your multimedia audio experiences to life with-
crisp, true-to-life sound and rich, deep bass tones. Plus, color-coded-
cables, simple plug-and-play setup and digital on-screen controls mean you-
are ready to set your sights on outrageous multimedia and the incredible-
Internet in just minutes.'-
));
INSERT INTO product_descriptions VALUES (2245-
, 'US'-
, UNISTR(-
'Monitor 19/SD/M'-
), UNISTR(-
'Monitor 19 (18 Viewable) short depth, Monochrome. Outstanding image-
performance in a compact design. A simple, on-screen dislay menu helps you-
easily adjust screen dimensions, colors and image attributes. Just plug-
your monitor into your PC and you are ready to go.'-
));
INSERT INTO product_descriptions VALUES (3065-
, 'US'-
, UNISTR(-
'Monitor 21/D'-
), UNISTR(-
'CRT Monitor 21 inch (20 viewable). Digital OptiScan technology: supports-
resolutions up to 1600 x 1200 at 75Hz. Dimensions (HxWxD): 8.3 x 18.5 x 15-
inch. The detachable or attachable monitor-powered Platinum Series speakers-
offer crisp sound and the convenience of a digital audio player jack. Just-
plug in your digital audio player and listen to tunes without powering up-
your PC.'-
));
INSERT INTO product_descriptions VALUES (3331-
, 'US'-
, UNISTR(-
'Monitor 21/HR'-
), UNISTR(-
'21 inch monitor (20 inch viewable) high resolution. This monitor is ideal-
for business, desktop publishing, and graphics-intensive applications. Enjoy-
the productivity that a large monitor can bring via more workspace for-
running applications.'-
));
INSERT INTO product_descriptions VALUES (2252-
, 'US'-
, UNISTR(-
'Monitor 21/HR/M'-
), UNISTR(-
'Monitor 21 inch (20 viewable) high resolution, monochrome. Unit size:-
35.6 x 29.6 x 33.3 cm (14.6 kg) Package: 40.53 x 31.24 x 35.39 cm-
(16.5 kg). Horizontal frequency 31.5 - 54 kHz, Vertical frequency 50 - 120-
Hz. Universal power supply 90 - 132 V, 50 - 60 Hz.'-
));
INSERT INTO product_descriptions VALUES (3064-
, 'US'-
, UNISTR(-
'Monitor 21/SD'-
), UNISTR(-
'Monitor 21 inch (20 viewable) short depth. Features include a 0.25-0.28-
Aperture Grille Pitch, resolution support up to 1920 x 1200 at 76Hz,-
on-screen displays, and a conductive anti-reflective film coating.'-
));
INSERT INTO product_descriptions VALUES (3155-
, 'US'-
, UNISTR(-
'Monitor Hinge - HD'-
), UNISTR(-
'Monitor Hinge, heavy duty, maximum monitor weight 30 kg'-
));
INSERT INTO product_descriptions VALUES (3234-
, 'US'-
, UNISTR(-
'Monitor Hinge - STD'-
), UNISTR(-
'Standard Monitor Hinge, maximum monitor weight 10 kg'-
));
INSERT INTO product_descriptions VALUES (3350-
, 'US'-
, UNISTR(-
'Plasma Monitor 10/LE/VGA'-
), UNISTR(-
'10 inch low energy plasma monitor, VGA resolution'-
));
INSERT INTO product_descriptions VALUES (2236-
, 'US'-
, UNISTR(-
'Plasma Monitor 10/TFT/XGA'-
), UNISTR(-
'10 inch TFT XGA flatscreen monitor for laptop computers'-
));
INSERT INTO product_descriptions VALUES (3054-
, 'US'-
, UNISTR(-
'Plasma Monitor 10/XGA'-
), UNISTR(-
'10 inch standard plasma monitor, XGA resolution. This virtually-flat,-
high-resolution screen delivers outstanding image quality with reduced glare.'-
));
INSERT INTO product_descriptions VALUES (1782-
, 'US'-
, UNISTR(-
'Compact 400/DQ'-
), UNISTR(-
'400 characters per second high-speed draft printer. Dimensions (HxWxD):-
17.34 x 24.26 x 26.32 inch. Interface: RS-232 serial (9-pin), no expansion-
slots. Paper size: A4, US Letter.'-
));
INSERT INTO product_descriptions VALUES (2430-
, 'US'-
, UNISTR(-
'Compact 400/LQ'-
), UNISTR(-
'400 characters per second high-speed letter-quality printer.-
Dimensions (HxWxD): 12.37 x 27.96 x 23.92 inch. Interface: RS-232 serial-
(25-pin), 3 expansion slots. Paper size: A2, A3, A4.'-
));
INSERT INTO product_descriptions VALUES (1792-
, 'US'-
, UNISTR(-
'Industrial 600/DQ'-
), UNISTR(-
'Wide carriage color capability 600 characters per second high-speed-
draft printer. Dimensions (HxWxD): 22.31 x 25.73 x 20.12 inch. Paper size:-
3x5 inch to 11x17 inch full bleed wide format.'-
));
INSERT INTO product_descriptions VALUES (1791-
, 'US'-
, UNISTR(-
'Industrial 700/HD'-
), UNISTR(-
'700 characters per second dot-matrix printer with harder body and dust-
protection for industrial uses. Interface: Centronics parallel, IEEE 1284-
compliant. Paper size: 3x5 inch to 11x17 inch full bleed wide format.-
Memory: 4MB. Dimensions (HxWxD): 9.3 x 16.5 x 13 inch.'-
));
INSERT INTO product_descriptions VALUES (2302-
, 'US'-
, UNISTR(-
'Inkjet B/6'-
), UNISTR(-
'Inkjet Printer, black and white, 6 pages per minute, resolution 600x300-
dpi. Interface: Centronics parallel, IEEE 1284 compliant. Dimensions-
(HxWxD): 7.3 x 17.5 x 14 inch. Paper size: A3, A4, US legal. No-
expansion slots.'-
));
INSERT INTO product_descriptions VALUES (2453-
, 'US'-
, UNISTR(-
'Inkjet C/4'-
), UNISTR(-
'Inkjet Printer, color (with two separate ink cartridges), 6 pages per-
minute black and white, 4 pages per minute color, resolution 600x300 dpi.-
Interface: Biodirectional IEEE 1284 compliant parallel interface and-
RS-232 serial (9-pin) interface 2 open EIO expansion slots. Memory:-
8MB 96KB receiver buffer.'-
));
INSERT INTO product_descriptions VALUES (1797-
, 'US'-
, UNISTR(-
'Inkjet C/8/HQ'-
), UNISTR(-
'Inkjet printer, color, 8 pages per minute, high resolution (photo-
quality). Memory: 16MB. Dimensions (HxWxD): 7.3 x 17.5 x 14 inch. Paper-
size: A4, US Letter, envelopes. Interface: Centronics parallel, IEEE-
1284 compliant.'-
));
INSERT INTO product_descriptions VALUES (2459-
, 'US'-
, UNISTR(-
'LaserPro 1200/8/BW'-
), UNISTR(-
'Professional black and white laserprinter, resolution 1200 dpi, 8 pages-
per second. Dimensions (HxWxD): 22.37 x 19.86 x 21.92 inch. Software:-
Enhanced driver support for SPNIX v4.0; MS-DOS Built-in printer drivers:-
ZoomSmart scaling technology, billboard, handout, mirror, watermark, print-
preview, quick sets, emulate laserprinter margins.'-
));
INSERT INTO product_descriptions VALUES (3127-
, 'US'-
, UNISTR(-
'LaserPro 600/6/BW'-
), UNISTR(-
'Standard black and white laserprinter, resolution 600 dpi, 6 pages per-
second. Interface: Centronics parallel, IEEE 1284 compliant. Memory: 8MB-
96KB receiver buffer. MS-DOS ToolBox utilities for SPNIX AutoCAM v.17-
compatible driver.'-
));
INSERT INTO product_descriptions VALUES (2254-
, 'US'-
, UNISTR(-
'HD 10GB /I'-
), UNISTR(-
'10GB capacity hard disk drive (internal). These drives are intended for-
use in today''s demanding, data-critical enterprise environments and are-
ideal for use in RAID applications. Universal option kits are configured-
and pre-mounted in the appropriate hot plug tray for immediate installation-
into your corporate server or storage system.'-
));
INSERT INTO product_descriptions VALUES (3353-
, 'US'-
, UNISTR(-
'HD 10GB /R'-
), UNISTR(-
'10GB Removable hard disk drive for 10GB Removable HD drive. Supra7-
disk drives provide the latest technology to improve enterprise-
performance, increasing the maximum data transfer rate up to 160MB/s.'-
));
INSERT INTO product_descriptions VALUES (3069-
, 'US'-
, UNISTR(-
'HD 10GB /S'-
), UNISTR(-
'10GB hard disk drive for Standard Mount. Backward compatible with-
Supra5 systems, users are free to deploy and re-deploy these drives to-
quickly deliver increased storage capacity. Supra drives eliminate the-
risk of firmware incompatibility.'-
));
INSERT INTO product_descriptions VALUES (2253-
, 'US'-
, UNISTR(-
'HD 10GB @5400 /SE'-
), UNISTR(-
'10GB capacity hard disk drive (external) SCSI interface, 5400 RPM.-
Universal option kits are configured and pre-mounted in the appropriate-
hot plug tray for immediate installation into your corporate server or-
storage system. Supra drives eliminate the risk of firmware incompatibility.'-
));
INSERT INTO product_descriptions VALUES (3354-
, 'US'-
, UNISTR(-
'HD 12GB /I'-
), UNISTR(-
'12GB capacity harddisk drive (internal). Supra drives eliminate the risk-
of firmware incompatibility. Backward compatibility: You can mix or-
match Supra2 and Supra3 devices for optimized solutions and future growth.'-
));
INSERT INTO product_descriptions VALUES (3072-
, 'US'-
, UNISTR(-
'HD 12GB /N'-
), UNISTR(-
'12GB hard disk drive for Narrow Mount. Supra9 hot pluggable hard disk-
drives provide the ability to install or remove drives on-line. Our hot-
pluggable hard disk drives are required to meet our rigorous standards-
for reliability and performance.'-
));
INSERT INTO product_descriptions VALUES (3334-
, 'US'-
, UNISTR(-
'HD 12GB /R'-
), UNISTR(-
'12GB Removable hard disk drive. With compatibility across many enterprise-
platforms, you are free to deploy and re-deploy this drive to quickly-
deliver increased storage capacity. Supra7 Universal disk drives are the-
second generation of high performance hot plug drives sharing compatibility-
across corporate servers and external storage enclosures.'-
));
INSERT INTO product_descriptions VALUES (3071-
, 'US'-
, UNISTR(-
'HD 12GB /S'-
), UNISTR(-
'12GB hard disk drive for Standard Mount. Supra9 hot pluggable hard disk-
drives provide the ability to install or remove drives on-line. Our hot-
pluggable hard disk drives are required to meet our rigorous standards-
for reliability and performance.'-
));
INSERT INTO product_descriptions VALUES (2255-
, 'US'-
, UNISTR(-
'HD 12GB @7200 /SE'-
), UNISTR(-
'12GB capacity hard disk drive (external) SCSI, 7200 RPM. These drives-
are intended for use in today''s demanding, data-critical enterprise-
environments and can be used in RAID applications. Universal option kits-
are configured and pre-mounted in the appropriate hot plug tray for-
immediate installation into your corporate server or storage system.'-
));
INSERT INTO product_descriptions VALUES (1743-
, 'US'-
, UNISTR(-
'HD 18.2GB @10000 /E'-
), UNISTR(-
'External hard drive disk - 18.2 GB, rated up to 10,000 RPM. These-
drives are intended for use in today''s demanding, data-critical-
enterprise environments and are ideal for use in RAID applications.'-
));
INSERT INTO product_descriptions VALUES (2382-
, 'US'-
, UNISTR(-
'HD 18.2GB@10000 /I'-
), UNISTR(-
'18.2 GB SCSI hard disk @ 10000 RPM (internal). Supra7 Universal-
disk drives provide an unequaled level of investment protection and-
simplification for customers by enabling drive compatibility across-
many enterprise platforms.'-
));
INSERT INTO product_descriptions VALUES (3399-
, 'US'-
, UNISTR(-
'HD 18GB /SE'-
), UNISTR(-
'18GB SCSI external hard disk drive. Supra5 Universal hard disk-
drives provide the ability to hot plug between various servers, RAID-
arrays, and external storage shelves.'-
));
INSERT INTO product_descriptions VALUES (3073-
, 'US'-
, UNISTR(-
'HD 6GB /I'-
), UNISTR(-
'6GB capacity hard disk drive (internal). Supra drives eliminate the-
risk of firmware incompatibility.'-
));
INSERT INTO product_descriptions VALUES (1768-
, 'US'-
, UNISTR(-
'HD 8.2GB @5400'-
), UNISTR(-
'Hard drive disk - 8.2 GB, rated up to 5,400 RPM. Supra drives-
eliminate the risk of firmware incompatibility. Standard serial-
RS-232 interface.'-
));
INSERT INTO product_descriptions VALUES (2410-
, 'US'-
, UNISTR(-
'HD 8.4GB @5400'-
), UNISTR(-
'8.4 GB hard disk @ 5400 RPM. Reduced cost of ownership: Drives can-
be utilized across enterprise platforms. This hot pluggable hard disk-
drive is required to meet your rigorous standards for reliability-
and performance.'-
));
INSERT INTO product_descriptions VALUES (2257-
, 'US'-
, UNISTR(-
'HD 8GB /I'-
), UNISTR(-
'8GB capacity hard disk drive (internal). Supra9 hot pluggable-
hard disk drives provide the ability to install or remove drives-
on-line. Backward compatibility: You can mix Supra2 and Supra3-
devices for optimized solutions and future growth.'-
));
INSERT INTO product_descriptions VALUES (3400-
, 'US'-
, UNISTR(-
'HD 8GB /SE'-
), UNISTR(-
'8GB capacity SCSI hard disk drive (external). Supra7 disk drives-
provide the latest technology to improve enterprise performance,-
increasing the maximum data transfer rate up to 255MB/s.'-
));
INSERT INTO product_descriptions VALUES (3355-
, 'US'-
, UNISTR(-
'HD 8GB /SI'-
), UNISTR(-
'8GB SCSI hard disk drive, internal. With compatibility across many-
enterprise platforms, you are free to deploy and re-deploy this drive-
to quickly deliver increased storage capacity. '-
));
INSERT INTO product_descriptions VALUES (1772-
, 'US'-
, UNISTR(-
'HD 9.1GB @10000'-
), UNISTR(-
'Hard disk drive - 9.1 GB, rated up to 10,000 RPM. These drives-
are intended for use in data-critical enterprise environments.-
Ease of doing business: you can easily select the drives you need-
regardless of the application in which they will be deployed.'-
));
INSERT INTO product_descriptions VALUES (2414-
, 'US'-
, UNISTR(-
'HD 9.1GB @10000 /I'-
), UNISTR(-
'9.1 GB SCSI hard disk @ 10000 RPM (internal). Supra7 disk-
drives are available in 10,000 RPM spindle speeds and capacities-
of 18GB and 9.1 GB. SCSI and RS-232 interfaces.'-
));
INSERT INTO product_descriptions VALUES (2415-
, 'US'-
, UNISTR(-
'HD 9.1GB @7200'-
), UNISTR(-
'9.1 GB hard disk @ 7200 RPM. Universal option kits are-
configured and pre-mounted in the appropriate hot plug tray-
for immediate installation into your corporate server or storage-
system.'-
));
INSERT INTO product_descriptions VALUES (2395-
, 'US'-
, UNISTR(-
'32MB Cache /M'-
), UNISTR(-
'32MB Mirrored cache memory (100-MHz Registered SDRAM)'-
));
INSERT INTO product_descriptions VALUES (1755-
, 'US'-
, UNISTR(-
'32MB Cache /NM'-
), UNISTR(-
'32MB Non-Mirrored cache memory'-
));
INSERT INTO product_descriptions VALUES (2406-
, 'US'-
, UNISTR(-
'64MB Cache /M'-
), UNISTR(-
'64MB Mirrored cache memory'-
));
INSERT INTO product_descriptions VALUES (2404-
, 'US'-
, UNISTR(-
'64MB Cache /NM'-
), UNISTR(-
'64 MB Non-mirrored cache memory. FPM memory chips are-
implemented on 5 volt SIMMs, but are also available on-
3.3 volt DIMMs.'-
));
INSERT INTO product_descriptions VALUES (1770-
, 'US'-
, UNISTR(-
'8MB Cache /NM'-
), UNISTR(-
'8MB Non-Mirrored Cache Memory (100-MHz Registered SDRAM)'-
));
INSERT INTO product_descriptions VALUES (2412-
, 'US'-
, UNISTR(-
'8MB EDO Memory'-
), UNISTR(-
'8 MB 8x32 EDO SIM memory. Extended Data Out memory differs from FPM in a-
small, but significant design change. Unlike FPM, the data output drivers-
for EDO remain on when the memory controller removes the column address to-
begin the next cycle. Therefore, a new data cycle can begin before the-
previous cycle has completed. EDO is available on SIMMs and DIMMs, in 3.3-
and 5 volt varieties.'-
));
INSERT INTO product_descriptions VALUES (2378-
, 'US'-
, UNISTR(-
'DIMM - 128 MB'-
), UNISTR(-
'128 MB DIMM memory. The main reason for the change from SIMMs to DIMMs is-
to support the higher bus widths of 64-bit processors. DIMMs are 64- or-
72-bits wide; SIMMs are only 32- or 36-bits wide (with parity).'-
));
INSERT INTO product_descriptions VALUES (3087-
, 'US'-
, UNISTR(-
'DIMM - 16 MB'-
), UNISTR(-
'Citrus OLX DIMM - 16 MB capacity.'-
));
INSERT INTO product_descriptions VALUES (2384-
, 'US'-
, UNISTR(-
'DIMM - 1GB'-
), UNISTR(-
'Memory DIMM: RAM - 1 GB capacity.'-
));
INSERT INTO product_descriptions VALUES (1749-
, 'US'-
, UNISTR(-
'DIMM - 256MB'-
), UNISTR(-
'Memory DIMM: RAM 256 MB. (100-MHz Registered SDRAM)'-
));
INSERT INTO product_descriptions VALUES (1750-
, 'US'-
, UNISTR(-
'DIMM - 2GB'-
), UNISTR(-
'Memory DIMM: RAM, 2 GB capacity.'-
));
INSERT INTO product_descriptions VALUES (2394-
, 'US'-
, UNISTR(-
'DIMM - 32MB'-
), UNISTR(-
'32 MB DIMM Memory upgrade'-
));
INSERT INTO product_descriptions VALUES (2400-
, 'US'-
, UNISTR(-
'DIMM - 512 MB'-
), UNISTR(-
'512 MB DIMM memory. Improved memory upgrade granularity: Fewer DIMMs are-
required to upgrade a system than it would require if using SIMMs in the same-
system. Increased maximum memory ceilings: Given the same number of memory-
slots, the maximum memory of a system using DIMMs is more than one using-
SIMMs. DIMMs have separate contacts on each side of the board, which provide-
two times the data rate as one SIMM.'-
));
INSERT INTO product_descriptions VALUES (1763-
, 'US'-
, UNISTR(-
'DIMM - 64MB'-
), UNISTR(-
'Memory DIMM: RAM, 64MB (100-MHz Unregistered ECC SDRAM)'-
));
INSERT INTO product_descriptions VALUES (2396-
, 'US'-
, UNISTR(-
'EDO - 32MB'-
), UNISTR(-
'Memory EDO SIM: RAM, 32 MB (100-MHz Unregistered ECC SDRAM). Like FPM,-
EDO is available on SIMMs and DIMMs, in 3.3 and 5 volt varieties If EDO-
memory is installed in a computer that was not designed to support it,-
the memory may not work.'-
));
INSERT INTO product_descriptions VALUES (2272-
, 'US'-
, UNISTR(-
'RAM - 16 MB'-
), UNISTR(-
'Memory SIMM: RAM - 16 MB capacity.'-
));
INSERT INTO product_descriptions VALUES (2274-
, 'US'-
, UNISTR(-
'RAM - 32 MB'-
), UNISTR(-
'Memory SIMM: RAM - 32 MB capacity.'-
));
INSERT INTO product_descriptions VALUES (3090-
, 'US'-
, UNISTR(-
'RAM - 48 MB'-
), UNISTR(-
'Random Access Memory, SIMM - 48 MB capacity.'-
));
INSERT INTO product_descriptions VALUES (1739-
, 'US'-
, UNISTR(-
'SDRAM - 128 MB'-
), UNISTR(-
'SDRAM memory, 128 MB capacity. SDRAM can access data at speeds up to 100-
MHz, which is up to four times as fast as standard DRAMs. The advantages of-
SDRAM can be fully realized, however, only by computers designed to support-
SDRAM. SDRAM is available on 5 and 3.3 volt DIMMs.'-
));
INSERT INTO product_descriptions VALUES (3359-
, 'US'-
, UNISTR(-
'SDRAM - 16 MB'-
), UNISTR(-
'SDRAM memory upgrade module, 16 MB. Synchronous Dynamic Random Access-
Memory was introduced after EDO. Its architecture and operation are based on-
those of the standard DRAM, but SDRAM provides a revolutionary change to main-
memory that further reduces data retrieval times. SDRAM is synchronized to-
the system clock that controls the CPU. This means that the system clock-
controlling the functions of the microprocessor also controls the SDRAM-
functions. This enables the memory controller to know on which clock cycle-
a data request will be ready, and therefore eliminates timing delays.'-
));
INSERT INTO product_descriptions VALUES (3088-
, 'US'-
, UNISTR(-
'SDRAM - 32 MB'-
), UNISTR(-
'SDRAM module with ECC - 32 MB capacity. SDRAM has multiple memory banks-
that can work simultaneously. Switching between banks allows for a-
continuous data flow.'-
));
INSERT INTO product_descriptions VALUES (2276-
, 'US'-
, UNISTR(-
'SDRAM - 48 MB'-
), UNISTR(-
'Memory SIMM: RAM - 48 MB. SDRAM can operate in burst mode. In burst-
mode, when a single data address is accessed, an entire block of data is-
retrieved rather than just the one piece. The assumption is that the next-
piece of data that will be requested will be sequential to the previous.-
Since this is usually the case, data is held readily available.'-
));
INSERT INTO product_descriptions VALUES (3086-
, 'US'-
, UNISTR(-
'VRAM - 16 MB'-
), UNISTR(-
'Citrus Video RAM module - 16 MB capacity. VRAM is used by the video system-
in a computer to store video information and is reserved exclusively for-
video operations. It was developed to provide continuous streams of serial-
data for refreshing video screens.'-
));
INSERT INTO product_descriptions VALUES (3091-
, 'US'-
, UNISTR(-
'VRAM - 64 MB'-
), UNISTR(-
'Citrus Video RAM memory module - 64 MB capacity. Physically, VRAM looks-
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
the graphics controller.'-
));
INSERT INTO product_descriptions VALUES (1787-
, 'US'-
, UNISTR(-
'CPU D300'-
), UNISTR(-
'Dual CPU @ 300Mhz. For light personal processing only, or file servers-
with less than 5 concurrent users. This product will probably become-
obsolete soon.'-
));
INSERT INTO product_descriptions VALUES (2439-
, 'US'-
, UNISTR(-
'CPU D400'-
), UNISTR(-
'Dual CPU @ 400Mhz. Good price/performance ratio; for mid-size LAN-
file servers (up to 100 concurrent users).'-
));
INSERT INTO product_descriptions VALUES (1788-
, 'US'-
, UNISTR(-
'CPU D600'-
), UNISTR(-
'Dual CPU @ 600Mhz. State of the art, high clock speed; for heavy-
load WAN servers (up to 200 concurrent users).'-
));
INSERT INTO product_descriptions VALUES (2375-
, 'US'-
, UNISTR(-
'GP 1024x768'-
), UNISTR(-
'Graphics Processor, resolution 1024 X 768 pixels. Outstanding-
price/performance for 2D and 3D applications under SPNIX v3.3 and-
v4.0. Double your viewing power by running two monitors from this-
single card. Two 17 inch monitors have more screen area than one-
21 inch monitor. Excellent option for users that multi-task-
frequently or access data from multiple sources often.'-
));
INSERT INTO product_descriptions VALUES (2411-
, 'US'-
, UNISTR(-
'GP 1280x1024'-
), UNISTR(-
'Graphics Processor, resolution 1280 X 1024 pixels. High end 3D performance-
at a mid range price: 15 million Gouraud shaded triangles per second,-
Optimized 3D drivers for MCAD and DCC applications, with user-customizable-
settings. 64MB DDR SDRAM unified frame buffer supporting true color at all-
supported standard resolutions.'-
));
INSERT INTO product_descriptions VALUES (1769-
, 'US'-
, UNISTR(-
'GP 800x600'-
), UNISTR(-
'Graphics processor, resolution 800 x 600 pixels. Remarkable value for-
users requiring great 2D capabilities or general 3D support for advanced-
applications. Drives incredible performance in highly complex models and-
frees the customer to focus on the design, instead of the rendering process.'-
));
INSERT INTO product_descriptions VALUES (2049-
, 'US'-
, UNISTR(-
'MB - S300'-
), UNISTR(-
'PC type motherboard, 300 Series.'-
));
INSERT INTO product_descriptions VALUES (2751-
, 'US'-
, UNISTR(-
'MB - S450'-
), UNISTR(-
'PC type motherboard, 450 Series.'-
));
INSERT INTO product_descriptions VALUES (3112-
, 'US'-
, UNISTR(-
'MB - S500'-
), UNISTR(-
'PC type motherboard, 500 Series.'-
));
INSERT INTO product_descriptions VALUES (2752-
, 'US'-
, UNISTR(-
'MB - S550'-
), UNISTR(-
'PC type motherboard for the 550 Series.'-
));
INSERT INTO product_descriptions VALUES (2293-
, 'US'-
, UNISTR(-
'MB - S600'-
), UNISTR(-
'Motherboard, 600 Series.'-
));
INSERT INTO product_descriptions VALUES (3114-
, 'US'-
, UNISTR(-
'MB - S900/650+'-
), UNISTR(-
'PC motherboard, 900 Series; standard motherboard-
for all models 650 and up.'-
));
INSERT INTO product_descriptions VALUES (3129-
, 'US'-
, UNISTR(-
'Sound Card STD'-
), UNISTR(-
'Sound Card - standard version, with MIDI interface,-
line in/out, low impedance microphone input.'-
));
INSERT INTO product_descriptions VALUES (3133-
, 'US'-
, UNISTR(-
'Video Card /32'-
), UNISTR(-
'Video Card, with 32MB cache memory.'-
));
INSERT INTO product_descriptions VALUES (2308-
, 'US'-
, UNISTR(-
'Video Card /E32'-
), UNISTR(-
'3-D ELSA Video Card, with 32 MB memory.'-
));
INSERT INTO product_descriptions VALUES (2496-
, 'US'-
, UNISTR(-
'WSP DA-130'-
), UNISTR(-
'Wide storage processor DA-130 for storage subunits.'-
));
INSERT INTO product_descriptions VALUES (2497-
, 'US'-
, UNISTR(-
'WSP DA-290'-
), UNISTR(-
'Wide storage processor (model DA-290).'-
));
INSERT INTO product_descriptions VALUES (3106-
, 'US'-
, UNISTR(-
'KB 101/EN'-
), UNISTR(-
'Standard PC/AT Enhanced Keyboard (101/102-Key).-
Input locale: English (US).'-
));
INSERT INTO product_descriptions VALUES (2289-
, 'US'-
, UNISTR(-
'KB 101/ES'-
), UNISTR(-
'Standard PC/AT Enhanced Keyboard (101/102-Key).-
Input locale: Spanish.'-
));
INSERT INTO product_descriptions VALUES (3110-
, 'US'-
, UNISTR(-
'KB 101/FR'-
), UNISTR(-
'Standard PC/AT Enhanced Keyboard (101/102-Key).-
Input locale: French.'-
));
INSERT INTO product_descriptions VALUES (3108-
, 'US'-
, UNISTR(-
'KB E/EN'-
), UNISTR(-
'Ergonomic Keyboard with two separate key areas,-
detachable numeric pad. Key layout: English (US).'-
));
INSERT INTO product_descriptions VALUES (2058-
, 'US'-
, UNISTR(-
'Mouse +WP'-
), UNISTR(-
'Combination of a mouse and a wrist pad for more-
comfortable typing and mouse operation.'-
));
INSERT INTO product_descriptions VALUES (2761-
, 'US'-
, UNISTR(-
'Mouse +WP/CL'-
), UNISTR(-
'Set consisting of a mouse and wrist pad,-
with corporate logo'-
));
INSERT INTO product_descriptions VALUES (3117-
, 'US'-
, UNISTR(-
'Mouse C/E'-
), UNISTR(-
'Ergonomic, cordless mouse. With track-ball-
for maximum comfort and ease of use.'-
));
INSERT INTO product_descriptions VALUES (2056-
, 'US'-
, UNISTR(-
'Mouse Pad /CL'-
), UNISTR(-
'Standard mouse pad, with corporate logo'-
));
INSERT INTO product_descriptions VALUES (2211-
, 'US'-
, UNISTR(-
'Wrist Pad'-
), UNISTR(-
'A foam strip to support your wrists when using a keyboard'-
));
INSERT INTO product_descriptions VALUES (2944-
, 'US'-
, UNISTR(-
'Wrist Pad /CL'-
), UNISTR(-
'Wrist Pad with corporate logo'-
));
INSERT INTO product_descriptions VALUES (1742-
, 'US'-
, UNISTR(-
'CD-ROM 500/16x'-
), UNISTR(-
'CD drive, read only, speed 16x, maximum capacity 500 MB.'-
));
INSERT INTO product_descriptions VALUES (2402-
, 'US'-
, UNISTR(-
'CD-ROM 600/E/24x'-
), UNISTR(-
'600 MB external 24x speed CD-ROM drive (read only).'-
));
INSERT INTO product_descriptions VALUES (2403-
, 'US'-
, UNISTR(-
'CD-ROM 600/I/24x'-
), UNISTR(-
'600 MB internal read only CD-ROM drive,-
reading speed 24x'-
));
INSERT INTO product_descriptions VALUES (1761-
, 'US'-
, UNISTR(-
'CD-ROM 600/I/32x'-
), UNISTR(-
'600 MB Internal CD-ROM Drive, speed 32x (read only).'-
));
INSERT INTO product_descriptions VALUES (2381-
, 'US'-
, UNISTR(-
'CD-ROM 8x'-
), UNISTR(-
'CD Writer, read only, speed 8x'-
));
INSERT INTO product_descriptions VALUES (2424-
, 'US'-
, UNISTR(-
'CDW 12/24'-
), UNISTR(-
'CD Writer, speed 12x write, 24x read. Warning: will become obsolete very-
soon; this speed is not high enough anymore, and better alternatives are-
available for a reasonable price.'-
));
INSERT INTO product_descriptions VALUES (1781-
, 'US'-
, UNISTR(-
'CDW 20/48/E'-
), UNISTR(-
'CD Writer, read 48x, write 20x'-
));
INSERT INTO product_descriptions VALUES (2264-
, 'US'-
, UNISTR(-
'CDW 20/48/I'-
), UNISTR(-
'CD-ROM drive: read 20x, write 48x (internal)'-
));
INSERT INTO product_descriptions VALUES (2260-
, 'US'-
, UNISTR(-
'DFD 1.44/3.5'-
), UNISTR(-
'Dual Floppy Drive - 1.44 MB - 3.5'-
));
INSERT INTO product_descriptions VALUES (2266-
, 'US'-
, UNISTR(-
'DVD 12x'-
), UNISTR(-
'DVD-ROM drive: speed 12x'-
));
INSERT INTO product_descriptions VALUES (3077-
, 'US'-
, UNISTR(-
'DVD 8x'-
), UNISTR(-
'DVD - ROM drive, 8x speed. Will probably become-
obsolete pretty soon...'-
));
INSERT INTO product_descriptions VALUES (2259-
, 'US'-
, UNISTR(-
'FD 1.44/3.5'-
), UNISTR(-
'Floppy Drive - 1.44 MB High Density-
capacity - 3.5 inch chassis'-
));
INSERT INTO product_descriptions VALUES (2261-
, 'US'-
, UNISTR(-
'FD 1.44/3.5/E'-
), UNISTR(-
'Floppy disk drive - 1.44 MB (high density)-
capacity - 3.5 inch (external)'-
));
INSERT INTO product_descriptions VALUES (3082-
, 'US'-
, UNISTR(-
'Modem - 56/90/E'-
), UNISTR(-
'Modem - 56kb per second, v.90 PCI Global compliant.-
External; for power supply 110V.'-
));
INSERT INTO product_descriptions VALUES (2270-
, 'US'-
, UNISTR(-
'Modem - 56/90/I'-
), UNISTR(-
'Modem - 56kb per second, v.90 PCI Global compliant.-
Internal, for standard chassis (3.5 inch).'-
));
INSERT INTO product_descriptions VALUES (2268-
, 'US'-
, UNISTR(-
'Modem - 56/H/E'-
), UNISTR(-
'Standard Hayes compatible modem - 56kb per second, external.-
Power supply: 220V.'-
));
INSERT INTO product_descriptions VALUES (3083-
, 'US'-
, UNISTR(-
'Modem - 56/H/I'-
), UNISTR(-
'Standard Hayes modem - 56kb per second, internal, for-
 standard 3.5 inch chassis.'-
));
INSERT INTO product_descriptions VALUES (2374-
, 'US'-
, UNISTR(-
'Modem - C/100'-
), UNISTR(-
'DOCSIS/EURODOCSIS 1.0/1.1-compliant external cable modem'-
));
INSERT INTO product_descriptions VALUES (1740-
, 'US'-
, UNISTR(-
'TD 12GB/DAT'-
), UNISTR(-
'Tape drive - 12 gigabyte capacity, DAT format.'-
));
INSERT INTO product_descriptions VALUES (2409-
, 'US'-
, UNISTR(-
'TD 7GB/8'-
), UNISTR(-
'Tape drive, 7GB capacity, 8mm cartridge tape.'-
));
INSERT INTO product_descriptions VALUES (2262-
, 'US'-
, UNISTR(-
'ZIP 100'-
), UNISTR(-
'ZIP Drive, 100 MB capacity (external) plus cable for-
parallel port connection'-
));
INSERT INTO product_descriptions VALUES (2522-
, 'US'-
, UNISTR(-
'Battery - EL'-
), UNISTR(-
'Extended life battery, for laptop computers'-
));
INSERT INTO product_descriptions VALUES (2278-
, 'US'-
, UNISTR(-
'Battery - NiHM'-
), UNISTR(-
'Rechargeable NiHM battery for laptop computers'-
));
INSERT INTO product_descriptions VALUES (2418-
, 'US'-
, UNISTR(-
'Battery Backup (DA-130)'-
), UNISTR(-
'Single-battery charger with LED indicators'-
));
INSERT INTO product_descriptions VALUES (2419-
, 'US'-
, UNISTR(-
'Battery Backup (DA-290)'-
), UNISTR(-
'Two-battery charger with LED indicators'-
));
INSERT INTO product_descriptions VALUES (3097-
, 'US'-
, UNISTR(-
'Cable Connector - 32R'-
), UNISTR(-
'Cable Connector - 32 pin ribbon'-
));
INSERT INTO product_descriptions VALUES (3099-
, 'US'-
, UNISTR(-
'Cable Harness'-
), UNISTR(-
'Cable harness to organize and bundle computer wiring'-
));
INSERT INTO product_descriptions VALUES (2380-
, 'US'-
, UNISTR(-
'Cable PR/15/P'-
), UNISTR(-
'15 foot parallel printer cable'-
));
INSERT INTO product_descriptions VALUES (2408-
, 'US'-
, UNISTR(-
'Cable PR/P/6'-
), UNISTR(-
'Standard Centronics 6ft printer cable, parallel port'-
));
INSERT INTO product_descriptions VALUES (2457-
, 'US'-
, UNISTR(-
'Cable PR/S/6'-
), UNISTR(-
'Standard RS232 serial printer cable, 6 feet'-
));
INSERT INTO product_descriptions VALUES (2373-
, 'US'-
, UNISTR(-
'Cable RS232 10/AF'-
), UNISTR(-
'10 ft RS232 cable with F/F and 9F/25F adapters'-
));
INSERT INTO product_descriptions VALUES (1734-
, 'US'-
, UNISTR(-
'Cable RS232 10/AM'-
), UNISTR(-
'10 ft RS232 cable with M/M and 9M/25M adapters'-
));
INSERT INTO product_descriptions VALUES (1737-
, 'US'-
, UNISTR(-
'Cable SCSI 10/FW/ADS'-
), UNISTR(-
'10ft SCSI2 F/W Adapt to DSxx0 Cable'-
));
INSERT INTO product_descriptions VALUES (1745-
, 'US'-
, UNISTR(-
'Cable SCSI 20/WD->D'-
), UNISTR(-
'20ft SCSI2 Wide Disk Store to Disk Store Cable'-
));
INSERT INTO product_descriptions VALUES (2982-
, 'US'-
, UNISTR(-
'Drive Mount - A'-
), UNISTR(-
'Drive Mount assembly kit'-
));
INSERT INTO product_descriptions VALUES (3277-
, 'US'-
, UNISTR(-
'Drive Mount - A/T'-
), UNISTR(-
'Drive Mount assembly kit for tower PC'-
));
INSERT INTO product_descriptions VALUES (2976-
, 'US'-
, UNISTR(-
'Drive Mount - D'-
), UNISTR(-
'Drive Mount for desktop PC'-
));
INSERT INTO product_descriptions VALUES (3204-
, 'US'-
, UNISTR(-
'Envoy DS'-
), UNISTR(-
'Envoy Docking Station'-
));
INSERT INTO product_descriptions VALUES (2638-
, 'US'-
, UNISTR(-
'Envoy DS/E'-
), UNISTR(-
'Enhanced Envoy Docking Station'-
));
INSERT INTO product_descriptions VALUES (3020-
, 'US'-
, UNISTR(-
'Envoy IC'-
), UNISTR(-
'Envoy Internet Computer, Plug&Play'-
));
INSERT INTO product_descriptions VALUES (1948-
, 'US'-
, UNISTR(-
'Envoy IC/58'-
), UNISTR(-
'Internet computer with built-in 58K modem'-
));
INSERT INTO product_descriptions VALUES (3003-
, 'US'-
, UNISTR(-
'Laptop 128/12/56/v90/110'-
), UNISTR(-
'Envoy Laptop, 128MB memory, 12GB hard disk, v90 modem,-
110V power supply.'-
));
INSERT INTO product_descriptions VALUES (2999-
, 'US'-
, UNISTR(-
'Laptop 16/8/110'-
), UNISTR(-
'Envoy Laptop, 16MB memory, 8GB hard disk,-
110V power supply (US only).'-
));
INSERT INTO product_descriptions VALUES (3000-
, 'US'-
, UNISTR(-
'Laptop 32/10/56'-
), UNISTR(-
'Envoy Laptop, 32MB memory, 10GB hard disk, 56K Modem,-
universal power supply (switchable).'-
));
INSERT INTO product_descriptions VALUES (3001-
, 'US'-
, UNISTR(-
'Laptop 48/10/56/110'-
), UNISTR(-
'Envoy Laptop, 48MB memory, 10GB hard disk, 56K modem,-
110V power supply.'-
));
INSERT INTO product_descriptions VALUES (3004-
, 'US'-
, UNISTR(-
'Laptop 64/10/56/220'-
), UNISTR(-
'Envoy Laptop, 64MB memory, 10GB hard disk, 56K modem,-
220V power supply.'-
));
INSERT INTO product_descriptions VALUES (3391-
, 'US'-
, UNISTR(-
'PS 110/220'-
), UNISTR(-
'Power Supply - switchable, 110V/220V'-
));
INSERT INTO product_descriptions VALUES (3124-
, 'US'-
, UNISTR(-
'PS 110V /T'-
), UNISTR(-
'Power supply for tower PC, 110V'-
));
INSERT INTO product_descriptions VALUES (1738-
, 'US'-
, UNISTR(-
'PS 110V /US'-
), UNISTR(-
'110 V Power Supply - US compatible'-
));
INSERT INTO product_descriptions VALUES (2377-
, 'US'-
, UNISTR(-
'PS 110V HS/US'-
), UNISTR(-
'110 V hot swappable power supply - US compatible'-
));
INSERT INTO product_descriptions VALUES (2299-
, 'US'-
, UNISTR(-
'PS 12V /P'-
), UNISTR(-
'Power Supply - 12v portable'-
));
INSERT INTO product_descriptions VALUES (3123-
, 'US'-
, UNISTR(-
'PS 220V /D'-
), UNISTR(-
'Standard power supply, 220V, for desktop computers.'-
));
INSERT INTO product_descriptions VALUES (1748-
, 'US'-
, UNISTR(-
'PS 220V /EUR'-
), UNISTR(-
'220 Volt Power supply type - Europe'-
));
INSERT INTO product_descriptions VALUES (2387-
, 'US'-
, UNISTR(-
'PS 220V /FR'-
), UNISTR(-
'220V Power supply type - France'-
));
INSERT INTO product_descriptions VALUES (2370-
, 'US'-
, UNISTR(-
'PS 220V /HS/FR'-
), UNISTR(-
'220V hot swappable power supply, for France.'-
));
INSERT INTO product_descriptions VALUES (2311-
, 'US'-
, UNISTR(-
'PS 220V /L'-
), UNISTR(-
'Power supply for laptop computers, 220V'-
));
INSERT INTO product_descriptions VALUES (1733-
, 'US'-
, UNISTR(-
'PS 220V /UK'-
), UNISTR(-
'220V Power supply type - United Kingdom'-
));
INSERT INTO product_descriptions VALUES (2878-
, 'US'-
, UNISTR(-
'Router - ASR/2W'-
), UNISTR(-
'Special ALS Router - Approved Supplier required item with 2-way match'-
));
INSERT INTO product_descriptions VALUES (2879-
, 'US'-
, UNISTR(-
'Router - ASR/3W'-
), UNISTR(-
'Special ALS Router - Approved Supplier required item with 3-way match'-
));
INSERT INTO product_descriptions VALUES (2152-
, 'US'-
, UNISTR(-
'Router - DTMF4'-
), UNISTR(-
'DTMF 4 port router'-
));
INSERT INTO product_descriptions VALUES (3301-
, 'US'-
, UNISTR(-
'Screws <B.28.P>'-
), UNISTR(-
'Screws: Brass, size 28mm, Phillips head. Plastic box, contents 500.'-
));
INSERT INTO product_descriptions VALUES (3143-
, 'US'-
, UNISTR(-
'Screws <B.28.S>'-
), UNISTR(-
'Screws: Brass, size 28mm, straight. Plastic box, contents 500.'-
));
INSERT INTO product_descriptions VALUES (2323-
, 'US'-
, UNISTR(-
'Screws <B.32.P>'-
), UNISTR(-
'Screws: Brass, size 32mm, Phillips head. Plastic box, contents 400.'-
));
INSERT INTO product_descriptions VALUES (3134-
, 'US'-
, UNISTR(-
'Screws <B.32.S>'-
), UNISTR(-
'Screws: Brass, size 32mm, straight. Plastic box, contents 400.'-
));
INSERT INTO product_descriptions VALUES (3139-
, 'US'-
, UNISTR(-
'Screws <S.16.S>'-
), UNISTR(-
'Screws: Steel, size 16 mm, straight. Carton box, contents 750.'-
));
INSERT INTO product_descriptions VALUES (3300-
, 'US'-
, UNISTR(-
'Screws <S.32.P>'-
), UNISTR(-
'Screws: Steel, size 32mm, Phillips head. Plastic box, contents 400.'-
));
INSERT INTO product_descriptions VALUES (2316-
, 'US'-
, UNISTR(-
'Screws <S.32.S>'-
), UNISTR(-
'Screws: Steel, size 32mm, straight. Plastic box, contents 500.'-
));
INSERT INTO product_descriptions VALUES (3140-
, 'US'-
, UNISTR(-
'Screws <Z.16.S>'-
), UNISTR(-
'Screws: Zinc, length 16mm, straight. Carton box, contents 750.'-
));
INSERT INTO product_descriptions VALUES (2319-
, 'US'-
, UNISTR(-
'Screws <Z.24.S>'-
), UNISTR(-
'Screws: Zinc, size 24mm, straight. Carton box, contents 500.'-
));
INSERT INTO product_descriptions VALUES (2322-
, 'US'-
, UNISTR(-
'Screws <Z.28.P>'-
), UNISTR(-
'Screws: Zinc, size 28 mm, Phillips head. Carton box, contents 850.'-
));
INSERT INTO product_descriptions VALUES (3178-
, 'US'-
, UNISTR(-
'Spreadsheet - SSP/V 2.0'-
), UNISTR(-
'SmartSpread Spreadsheet, Professional Edition Version 2.0, for Vision-
Release 11.1 and 11.2. Shrink wrap includes CD-ROM containing advanced-
software and online documentation, plus printed manual, tutorial, and-
license registration.'-
));
INSERT INTO product_descriptions VALUES (3179-
, 'US'-
, UNISTR(-
'Spreadsheet - SSS/S 2.1'-
), UNISTR(-
'SmartSpread Spreadsheet, Standard Edition Version 2.1, for SPNIX Release-
4.0. Shrink wrap includes CD-ROM containing software and online-
documentation, plus printed manual and license registration.'-
));
INSERT INTO product_descriptions VALUES (3182-
, 'US'-
, UNISTR(-
'Word Processing - SWP/V 4.5'-
), UNISTR(-
'SmartWord Word Processor, Professional Edition Version 4.5, for Vision-
Release 11.x. Shrink wrap includes CD-ROM, containing advanced software,-
printed manual, and license registration.'-
));
INSERT INTO product_descriptions VALUES (3183-
, 'US'-
, UNISTR(-
'Word Processing - SWS/V 4.5'-
), UNISTR(-
'SmartWord Word Processor, Standard Edition Version 4.5, for Vision-
Release 11.x. Shrink wrap includes CD-ROM and license registration.'-
));
INSERT INTO product_descriptions VALUES (3197-
, 'US'-
, UNISTR(-
'Spreadsheet - SSS/V 2.1'-
), UNISTR(-
'SmartSpread Spreadsheet, Standard Edition Version 2.1, for Vision-
Release 11.1 and 11.2. Shrink wrap includes CD-ROM containing software-
and online documentation, plus printed manual, tutorial, and license-
registration.'-
));
INSERT INTO product_descriptions VALUES (3255-
, 'US'-
, UNISTR(-
'Spreadsheet - SSS/CD 2.2B'-
), UNISTR(-
'SmartSpread Spreadsheet, Standard Edition, Beta Version 2.2, for-
SPNIX Release 4.1. CD-ROM only.'-
));
INSERT INTO product_descriptions VALUES (3256-
, 'US'-
, UNISTR(-
'Spreadsheet - SSS/V 2.0'-
), UNISTR(-
'SmartSpread Spreadsheet, Standard Edition Version 2.0, for Vision-
Release 11.0. Shrink wrap includes CD-ROM containing software and-
online documentation, plus printed manual, tutorial, and license-
registration.'-
));
INSERT INTO product_descriptions VALUES (3260-
, 'US'-
, UNISTR(-
'Word Processing - SWP/S 4.4'-
), UNISTR(-
'SmartSpread Spreadsheet, Standard Edition Version 2.2, for SPNIX-
Release 4.x. Shrink wrap includes CD-ROM, containing software, plus-
printed manual and license registration.'-
));
INSERT INTO product_descriptions VALUES (3262-
, 'US'-
, UNISTR(-
'Spreadsheet - SSS/S 2.2'-
), UNISTR(-
'SmartSpread Spreadsheet, Standard Edition Version 2.2, for SPNIX-
Release 4.1. Shrink wrap includes CD-ROM containing software and-
online documentation, plus printed manual and license registration.'-
));
INSERT INTO product_descriptions VALUES (3361-
, 'US'-
, UNISTR(-
'Spreadsheet - SSP/S 1.5'-
), UNISTR(-
'SmartSpread Spreadsheet, Standard Edition Version 1.5, for SPNIX-
Release 3.3. Shrink wrap includes CD-ROM containing advanced software and-
online documentation, plus printed manual, tutorial, and license registration.'-
));
INSERT INTO product_descriptions VALUES (1799-
, 'US'-
, UNISTR(-
'SPNIX3.3 - SL'-
), UNISTR(-
'Operating System Software: SPNIX V3.3 - Base Server License. Includes-
10 general licenses for system administration, developers, or users. No-
network user licensing. '-
));
INSERT INTO product_descriptions VALUES (1801-
, 'US'-
, UNISTR(-
'SPNIX3.3 - AL'-
), UNISTR(-
'Operating System Software: SPNIX V3.3 - Additional system-
administrator license, including network access.'-
));
INSERT INTO product_descriptions VALUES (1803-
, 'US'-
, UNISTR(-
'SPNIX3.3 - DL'-
), UNISTR(-
'Operating System Software: SPNIX V3.3 - Additional developer license.'-
));
INSERT INTO product_descriptions VALUES (1804-
, 'US'-
, UNISTR(-
'SPNIX3.3 - UL/N'-
), UNISTR(-
'Operating System Software: SPNIX V3.3 - Additional user license with-
network access.'-
));
INSERT INTO product_descriptions VALUES (1805-
, 'US'-
, UNISTR(-
'SPNIX3.3 - UL/A'-
), UNISTR(-
'Operating System Software: SPNIX V3.3 - Additional user license class A.'-
));
INSERT INTO product_descriptions VALUES (1806-
, 'US'-
, UNISTR(-
'SPNIX3.3 - UL/C'-
), UNISTR(-
'Operating System Software: SPNIX V3.3 - Additional user license class C.'-
));
INSERT INTO product_descriptions VALUES (1808-
, 'US'-
, UNISTR(-
'SPNIX3.3 - UL/D'-
), UNISTR(-
'Operating System Software: SPNIX V3.3 - Additional user license class D.'-
));
INSERT INTO product_descriptions VALUES (1820-
, 'US'-
, UNISTR(-
'SPNIX3.3 - NL'-
), UNISTR(-
'Operating System Software: SPNIX V3.3 - Additional network access license.'-
));
INSERT INTO product_descriptions VALUES (1822-
, 'US'-
, UNISTR(-
'SPNIX4.0 - SL'-
), UNISTR(-
'Operating System Software: SPNIX V4.0 - Base Server License. Includes-
10 general licenses for system administration, developers, or users. No-
network user licensing. '-
));
INSERT INTO product_descriptions VALUES (2422-
, 'US'-
, UNISTR(-
'SPNIX4.0 - SAL'-
), UNISTR(-
'Operating System Software: SPNIX V4.0 - Additional system-
administrator license, including network access.'-
));
INSERT INTO product_descriptions VALUES (2452-
, 'US'-
, UNISTR(-
'SPNIX4.0 - DL'-
), UNISTR(-
'Operating System Software: SPNIX V4.0 - Additional developer license.'-
));
INSERT INTO product_descriptions VALUES (2462-
, 'US'-
, UNISTR(-
'SPNIX4.0 - UL/N'-
), UNISTR(-
'Operating System Software: SPNIX V4.0 - Additional user license with-
network access.'-
));
INSERT INTO product_descriptions VALUES (2464-
, 'US'-
, UNISTR(-
'SPNIX4.0 - UL/A'-
), UNISTR(-
'Operating System Software: SPNIX V4.0 - Additional user license class A.'-
));
INSERT INTO product_descriptions VALUES (2467-
, 'US'-
, UNISTR(-
'SPNIX4.0 - UL/D'-
), UNISTR(-
'Operating System Software: SPNIX V4.0 - Additional user license class D.'-
));
INSERT INTO product_descriptions VALUES (2468-
, 'US'-
, UNISTR(-
'SPNIX4.0 - UL/C'-
), UNISTR(-
'Operating System Software: SPNIX V4.0 - Additional user license class C.'-
));
INSERT INTO product_descriptions VALUES (2470-
, 'US'-
, UNISTR(-
'SPNIX4.0 - NL'-
), UNISTR(-
'Operating System Software: SPNIX V4.0 - Additional network access license.'-
));
INSERT INTO product_descriptions VALUES (2471-
, 'US'-
, UNISTR(-
'SPNIX3.3 SU'-
), UNISTR(-
'Operating System Software: SPNIX V3.3 - Base Server License Upgrade-
to V4.0.'-
));
INSERT INTO product_descriptions VALUES (2492-
, 'US'-
, UNISTR(-
'SPNIX3.3 AU'-
), UNISTR(-
'Operating System Software: SPNIX V3.3 - V4.0 upgrade; class A user.'-
));
INSERT INTO product_descriptions VALUES (2493-
, 'US'-
, UNISTR(-
'SPNIX3.3 C/DU'-
), UNISTR(-
'Operating System Software: SPNIX V3.3 - V4.0 upgrade; class C or D user.'-
));
INSERT INTO product_descriptions VALUES (2494-
, 'US'-
, UNISTR(-
'SPNIX3.3 NU'-
), UNISTR(-
'Operating System Software: SPNIX V3.3 - V4.0 upgrade;-
network access license.'-
));
INSERT INTO product_descriptions VALUES (2995-
, 'US'-
, UNISTR(-
'SPNIX3.3 SAU'-
), UNISTR(-
'Operating System Software: SPNIX V3.3 - V4.0 upgrade; system-
administrator license.'-
));
INSERT INTO product_descriptions VALUES (3290-
, 'US'-
, UNISTR(-
'SPNIX3.3 DU'-
), UNISTR(-
'Operating System Software: SPNIX V3.3 - V4.0 upgrade;-
developer license.'-
));
INSERT INTO product_descriptions VALUES (1778-
, 'US'-
, UNISTR(-
'C for SPNIX3.3 - 1 Seat'-
), UNISTR(-
'C programming software for SPNIX V3.3 - single user'-
));
INSERT INTO product_descriptions VALUES (1779-
, 'US'-
, UNISTR(-
'C for SPNIX3.3 - Doc'-
), UNISTR(-
'C programming language documentation-
, SPNIX V3.3'-
));
INSERT INTO product_descriptions VALUES (1780-
, 'US'-
, UNISTR(-
'C for SPNIX3.3 - Sys'-
), UNISTR(-
'C programming software for SPNIX V3.3 - system compiler,-
libraries, linker'-
));
INSERT INTO product_descriptions VALUES (2371-
, 'US'-
, UNISTR(-
'C for SPNIX4.0 - Doc'-
), UNISTR(-
'C programming language documentation, SPNIX V4.0'-
));
INSERT INTO product_descriptions VALUES (2423-
, 'US'-
, UNISTR(-
'C for SPNIX4.0 - 1 Seat'-
), UNISTR(-
'C programming software for SPNIX V4.0 - single user'-
));
INSERT INTO product_descriptions VALUES (3501-
, 'US'-
, UNISTR(-
'C for SPNIX4.0 - Sys'-
), UNISTR(-
'C programming software for SPNIX V4.0 - system compiler,-
libraries, linker'-
));
INSERT INTO product_descriptions VALUES (3502-
, 'US'-
, UNISTR(-
'C for SPNIX3.3 -Sys/U'-
), UNISTR(-
'C programming software for SPNIX V3.3 - 4.0 Upgrade;-
system compiler, libraries, linker'-
));
INSERT INTO product_descriptions VALUES (3503-
, 'US'-
, UNISTR(-
'C for SPNIX3.3 - Seat/U'-
), UNISTR(-
'C programming software for SPNIX V3.3 - 4.0 Upgrade - single user'-
));
INSERT INTO product_descriptions VALUES (1774-
, 'US'-
, UNISTR(-
'Base ISO CP - BL'-
), UNISTR(-
'Base ISO Communication Package - Base License'-
));
INSERT INTO product_descriptions VALUES (1775-
, 'US'-
, UNISTR(-
'Client ISO CP - S'-
), UNISTR(-
'ISO Communication Package add-on license for additional SPNIX V3.3 client.'-
));
INSERT INTO product_descriptions VALUES (1794-
, 'US'-
, UNISTR(-
'OSI 8-16/IL'-
), UNISTR(-
'OSI Layer 8 to 16 - Incremental License'-
));
INSERT INTO product_descriptions VALUES (1825-
, 'US'-
, UNISTR(-
'X25 - 1 Line License'-
), UNISTR(-
'X25 network access control system, single user'-
));
INSERT INTO product_descriptions VALUES (2004-
, 'US'-
, UNISTR(-
'IC Browser - S'-
), UNISTR(-
'IC Web Browser for SPNIX. Browser with network mail capability.'-
));
INSERT INTO product_descriptions VALUES (2005-
, 'US'-
, UNISTR(-
'IC Browser Doc - S'-
), UNISTR(-
'Documentation set for IC Web Browser for SPNIX. Includes Installation-
Manual, Mail Server Administration Guide, and User Quick Reference.'-
));
INSERT INTO product_descriptions VALUES (2416-
, 'US'-
, UNISTR(-
'Client ISO CP - S'-
), UNISTR(-
'ISO Communication Package add-on license for additional SPNIX V4.0 client.'-
));
INSERT INTO product_descriptions VALUES (2417-
, 'US'-
, UNISTR(-
'Client ISO CP - V'-
), UNISTR(-
'ISO Communication Package add-on license for additional Vision client.'-
));
INSERT INTO product_descriptions VALUES (2449-
, 'US'-
, UNISTR(-
'OSI 1-4/IL'-
), UNISTR(-
'OSI Layer 1 to 4 - Incremental License'-
));
INSERT INTO product_descriptions VALUES (3101-
, 'US'-
, UNISTR(-
'IC Browser - V'-
), UNISTR(-
'IC Web Browser for Vision with manual. Browser with network mail capability.'-
));
INSERT INTO product_descriptions VALUES (3170-
, 'US'-
, UNISTR(-
'Smart Suite - V/SP'-
), UNISTR(-
'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for Vision.-
Spanish language software and user manuals.'-
));
INSERT INTO product_descriptions VALUES (3171-
, 'US'-
, UNISTR(-
'Smart Suite - S3.3/EN'-
), UNISTR(-
'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for SPNIX-
Version 3.3. English language software and user manuals.'-
));
INSERT INTO product_descriptions VALUES (3172-
, 'US'-
, UNISTR(-
'Graphics - DIK+'-
), UNISTR(-
'Software Kit Graphics: Draw-It Kwik-Plus. Includes extensive clip art-
files and advanced drawing tools for 3-D object manipulation, variable-
shading, and extended character fonts.'-
));
INSERT INTO product_descriptions VALUES (3173-
, 'US'-
, UNISTR(-
'Graphics - SA'-
), UNISTR(-
'Software Kit Graphics: SmartArt. Professional graphics package for-
SPNIX with multiple line styles, textures, built-in shapes and common symbols.'-
));
INSERT INTO product_descriptions VALUES (3175-
, 'US'-
, UNISTR(-
'Project Management - S4.0'-
), UNISTR(-
'Project Management Software, for SPNIX V4.0. Software includes command-
line and graphical interface with text, graphic, spreadsheet, and-
customizable report formats.'-
));
INSERT INTO product_descriptions VALUES (3176-
, 'US'-
, UNISTR(-
'Smart Suite - V/EN'-
), UNISTR(-
'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for-
Vision. English language software and user manuals.'-
));
INSERT INTO product_descriptions VALUES (3177-
, 'US'-
, UNISTR(-
'Smart Suite - V/FR'-
), UNISTR(-
'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for-
Vision. French language software and user manuals.'-
));
INSERT INTO product_descriptions VALUES (3245-
, 'US'-
, UNISTR(-
'Smart Suite - S4.0/FR'-
), UNISTR(-
'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for-
SPNIX V4.0. French language software and user manuals.'-
));
INSERT INTO product_descriptions VALUES (3246-
, 'US'-
, UNISTR(-
'Smart Suite - S4.0/SP'-
), UNISTR(-
'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for-
SPNIX V4.0. Spanish language software and user manuals.'-
));
INSERT INTO product_descriptions VALUES (3247-
, 'US'-
, UNISTR(-
'Smart Suite - V/DE'-
), UNISTR(-
'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for-
Vision. German language software and user manuals.'-
));
INSERT INTO product_descriptions VALUES (3248-
, 'US'-
, UNISTR(-
'Smart Suite - S4.0/DE'-
), UNISTR(-
'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for-
SPNIX V4.0. German language software and user manuals.'-
));
INSERT INTO product_descriptions VALUES (3250-
, 'US'-
, UNISTR(-
'Graphics - DIK'-
), UNISTR(-
'Software Kit Graphics: Draw-It Kwik. Simple graphics package for-
Vision systems, with options to save in GIF, JPG, and BMP formats.'-
));
INSERT INTO product_descriptions VALUES (3251-
, 'US'-
, UNISTR(-
'Project Management - V'-
), UNISTR(-
'Project Management Software, for Vision. Software includes command-
line and graphical interface with text, graphic, spreadsheet, and-
customizable report formats.'-
));
INSERT INTO product_descriptions VALUES (3252-
, 'US'-
, UNISTR(-
'Project Management - S3.3'-
), UNISTR(-
'Project Management Software, for SPNIX V3.3. Software includes command-
line and graphical interface with text, graphic, spreadsheet, and-
customizable report formats.'-
));
INSERT INTO product_descriptions VALUES (3253-
, 'US'-
, UNISTR(-
'Smart Suite - S4.0/EN'-
), UNISTR(-
'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for-
SPNIX V4.0. English language software and user manuals.'-
));
INSERT INTO product_descriptions VALUES (3257-
, 'US'-
, UNISTR(-
'Web Browser - SB/S 2.1'-
), UNISTR(-
'Software Kit Web Browser: SmartBrowse V2.1 for SPNIX V3.3. Includes-
context sensitive help files and online documentation.'-
));
INSERT INTO product_descriptions VALUES (3258-
, 'US'-
, UNISTR(-
'Web Browser - SB/V 1.0'-
), UNISTR(-
'Software Kit Web Browser: SmartBrowse V2.1 for Vision. Includes-
context sensitive help files and online documentation.'-
));
INSERT INTO product_descriptions VALUES (3362-
, 'US'-
, UNISTR(-
'Web Browser - SB/S 4.0'-
), UNISTR(-
'Software Kit Web Browser: SmartBrowse V4.0 for SPNIX V4.0. Includes-
context sensitive help files and online documentation.'-
));
INSERT INTO product_descriptions VALUES (2231-
, 'US'-
, UNISTR(-
'Desk - S/V'-
), UNISTR(-
'Standard-sized desk; capitalizable, taxable item. Final finish is from-
veneer in stock at time of order, including oak, ash, cherry, and mahogany.'-
));
INSERT INTO product_descriptions VALUES (2335-
, 'US'-
, UNISTR(-
'Mobile phone'-
), UNISTR(-
'Dual band mobile phone with low battery consumption. Lightweight,-
foldable, with socket for single earphone and spare battery compartment.'-
));
INSERT INTO product_descriptions VALUES (2350-
, 'US'-
, UNISTR(-
'Desk - W/48'-
), UNISTR(-
'Desk - 48 inch white laminate without return; capitalizable, taxable item.'-
));
INSERT INTO product_descriptions VALUES (2351-
, 'US'-
, UNISTR(-
'Desk - W/48/R'-
), UNISTR(-
'Desk - 60 inch white laminate with 48 inch return; capitalizable,-
taxable item.'-
));
INSERT INTO product_descriptions VALUES (2779-
, 'US'-
, UNISTR(-
'Desk - OS/O/F'-
), UNISTR(-
'Executive-style oversized oak desk with file drawers. Final finish is-
customizable when ordered, light or dark oak stain,-
or natural hand rubbed clear.'-
));
INSERT INTO product_descriptions VALUES (3337-
, 'US'-
, UNISTR(-
'Mobile Web Phone'-
), UNISTR(-
'Mobile phone including monthly fee for Web access. Slimline shape-
with leather-look carrying case and belt clip.'-
));
INSERT INTO product_descriptions VALUES (2091-
, 'US'-
, UNISTR(-
'Paper Tablet LW 8 1/2 x 11'-
), UNISTR(-
'Paper tablet, lined, white, size 8 1/2 x 11 inch'-
));
INSERT INTO product_descriptions VALUES (2093-
, 'US'-
, UNISTR(-
'Pens - 10/FP'-
), UNISTR(-
'Permanent ink pen dries quickly and is smear resistant. Provides smooth,-
skip-free writing. Fine point. Single color boxes (black, blue, red) or-
assorted box (6 black, 3 blue, and 1 red).'-
));
INSERT INTO product_descriptions VALUES (2144-
, 'US'-
, UNISTR(-
'Card Organizer Cover'-
), UNISTR(-
'Replacement cover for desk top style business card holder. Smoke-
grey (original color) or clear plastic.'-
));
INSERT INTO product_descriptions VALUES (2336-
, 'US'-
, UNISTR(-
'Business Cards Box - 250'-
), UNISTR(-
'Business cards box, capacity 250. Use form BC110-2, Rev. 3/2000-
(hardcopy or online) when ordering and complete all fields marked-
with an asterisk.'-
));
INSERT INTO product_descriptions VALUES (2337-
, 'US'-
, UNISTR(-
'Business Cards - 1000/2L'-
), UNISTR(-
'Business cards box, capacity 1000, 2-sided with different language on-
each side. Use form BC111-2, Rev. 12/1999 (hardcopy or online) when-
ordering - complete all fields marked with an asterisk and check box for-
second language (English is always on side 1).'-
));
INSERT INTO product_descriptions VALUES (2339-
, 'US'-
, UNISTR(-
'Paper - Std Printer'-
), UNISTR(-
'20 lb. 8.5x11 inch white laser printer paper (recycled),-
ten 500-sheet reams'-
));
INSERT INTO product_descriptions VALUES (2536-
, 'US'-
, UNISTR(-
'Business Cards - 250/2L'-
), UNISTR(-
'Business cards box, capacity 250, 2-sided with different language on-
each side. Use form BC111-2, Rev. 12/1999 (hardcopy or online) when-
ordering - complete all fields marked with an asterisk and check box for-
second language (English is always on side 1).'-
));
INSERT INTO product_descriptions VALUES (2537-
, 'US'-
, UNISTR(-
'Business Cards Box - 1000'-
), UNISTR(-
'Business cards box, capacity 1000. Use form BC110-3, Rev. 3/2000-
(hardcopy or online) when ordering and complete all fields marked with-
an asterisk.'-
));
INSERT INTO product_descriptions VALUES (2783-
, 'US'-
, UNISTR(-
'Clips - Paper'-
), UNISTR(-
'World brand paper clips set the standard for quality.10 boxes with 100-
clips each. #1 regular or jumbo, smooth or non-skid.'-
));
INSERT INTO product_descriptions VALUES (2808-
, 'US'-
, UNISTR(-
'Paper Tablet LY 8 1/2 x 11'-
), UNISTR(-
'Paper Tablet, Lined, Yellow, size 8 1/2 x 11 inch'-
));
INSERT INTO product_descriptions VALUES (2810-
, 'US'-
, UNISTR(-
'Inkvisible Pens'-
), UNISTR(-
'Rollerball pen is equipped with a smooth precision tip. See-through-
rubber grip allows for a visible ink supply and comfortable writing.-
4-pack with 1 each, black, blue, red, green.'-
));
INSERT INTO product_descriptions VALUES (2870-
, 'US'-
, UNISTR(-
'Pencil - Mech'-
), UNISTR(-
'Ergonomically designed mechanical pencil for improved writing comfort.-
Refillable erasers and leads. Available in three lead sizes: .5mm (fine));-
.7mm (medium)); and .9mm (thick).'-
));
INSERT INTO product_descriptions VALUES (3051-
, 'US'-
, UNISTR(-
'Pens - 10/MP'-
), UNISTR(-
'Permanent ink pen dries quickly and is smear resistant. Provides smooth,-
skip-free writing. Medium point. Single color boxes (black, blue, red) or-
assorted box (6 black, 3 blue, and 1 red).'-
));
INSERT INTO product_descriptions VALUES (3150-
, 'US'-
, UNISTR(-
'Card Holder - 25'-
), UNISTR(-
'Card Holder; heavy plastic business card holder with embossed corporate-
logo. Holds about 25 of your business cards, depending on card thickness.'-
));
INSERT INTO product_descriptions VALUES (3208-
, 'US'-
, UNISTR(-
'Pencils - Wood'-
), UNISTR(-
'Box of 2 dozen wooden pencils. Specify lead type when ordering: 2H-
(double hard), H (hard), HB (hard black), B (soft black).'-
));
INSERT INTO product_descriptions VALUES (3209-
, 'US'-
, UNISTR(-
'Sharpener - Pencil'-
), UNISTR(-
'Electric Pencil Sharpener Rugged steel cutters for long life.-
PencilSaver helps prevent over-sharpening. Non-skid rubber feet.-
Built-in pencil holder.'-
));
INSERT INTO product_descriptions VALUES (3224-
, 'US'-
, UNISTR(-
'Card Organizer - 250'-
), UNISTR(-
'Portable holder for organizing business cards, capacity 250. Booklet-
style with slip in, transparent pockets for business cards. Optional-
alphabet tabs. Specify cover color when ordering (dark brown, beige,-
burgundy, black, and light grey).'-
));
INSERT INTO product_descriptions VALUES (3225-
, 'US'-
, UNISTR(-
'Card Organizer - 1000'-
), UNISTR(-
'Holder for organizing business cards with alphabet dividers; capacity-
1000. Desk top style with smoke grey cover and black base. Lid is-
removable for storing inside drawer.'-
));
INSERT INTO product_descriptions VALUES (3511-
, 'US'-
, UNISTR(-
'Paper - HQ Printer'-
), UNISTR(-
'Quality paper for inkjet and laser printers tested to resist printer-
jams. Acid free for archival purposes. 22lb. weight with brightness of 92.-
Size: 8 1/2 x 11. Single 500-sheet ream.'-
));
INSERT INTO product_descriptions VALUES (3515-
, 'US'-
, UNISTR(-
'Lead Replacement'-
), UNISTR(-
'Refill leads for mechanical pencils. Each pack contains 25 leads and-
a replacement eraser. Available in three lead sizes: .5mm (fine)); .7mm-
(medium)); and .9mm (thick).'-
));
INSERT INTO product_descriptions VALUES (2986-
, 'US'-
, UNISTR(-
'Manual - Vision OS/2x +'-
), UNISTR(-
'Manuals for Vision Operating System V 2.x and Vision Office Suite'-
));
INSERT INTO product_descriptions VALUES (3163-
, 'US'-
, UNISTR(-
'Manual - Vision Net6.3/US'-
), UNISTR(-
'Vision Networking V6.3 Reference Manual. US version with advanced-
encryption.'-
));
INSERT INTO product_descriptions VALUES (3165-
, 'US'-
, UNISTR(-
'Manual - Vision Tools2.0'-
), UNISTR(-
'Vision Business Tools Suite V2.0 Reference Manual. Includes installation,-
configuration, and user guide.'-
));
INSERT INTO product_descriptions VALUES (3167-
, 'US'-
, UNISTR(-
'Manual - Vision OS/2.x'-
), UNISTR(-
'Vision Operating System V2.0/2.1/2/3 Reference Manual. Complete-
installation, configuration, management, and tuning information for Vision-
system administration. Note that this manual replaces the individual-
Version 2.0 and 2.1 manuals.'-
));
INSERT INTO product_descriptions VALUES (3216-
, 'US'-
, UNISTR(-
'Manual - Vision Net6.3'-
), UNISTR(-
'Vision Networking V6.3 Reference Manual. Non-US version with basic-
encryption.'-
));
INSERT INTO product_descriptions VALUES (3220-
, 'US'-
, UNISTR(-
'Manual - Vision OS/1.2'-
), UNISTR(-
'Vision Operating System V1.2 Reference Manual. Complete installation,-
configuration, management, and tuning information for Vision system-
administration.'-
));
INSERT INTO product_descriptions VALUES (1729-
, 'US'-
, UNISTR(-
'Chemicals - RCP'-
), UNISTR(-
'Cleaning Chemicals - 3500 roller clean pads'-
));
INSERT INTO product_descriptions VALUES (1910-
, 'US'-
, UNISTR(-
'FG Stock - H'-
), UNISTR(-
'Fiberglass Stock - heavy duty, 1 thick'-
));
INSERT INTO product_descriptions VALUES (1912-
, 'US'-
, UNISTR(-
'SS Stock - 3mm'-
), UNISTR(-
'Stainless steel stock - 3mm. Can be predrilled for standard power-
supplies, motherboard holders, and hard drives. Please use appropriate-
template to identify model number, placement, and size of finished sheet-
when placing order for drilled sheet.'-
));
INSERT INTO product_descriptions VALUES (1940-
, 'US'-
, UNISTR(-
'ESD Bracelet/Clip'-
), UNISTR(-
'Electro static discharge bracelet with alligator clip for easy-
connection to computer chassis or other ground.'-
));
INSERT INTO product_descriptions VALUES (2030-
, 'US'-
, UNISTR(-
'Latex Gloves'-
), UNISTR(-
'Latex Gloves for assemblers, chemical handlers, fitters. Heavy duty,-
safety orange, with textured grip on fingers and thumb. Waterproof and-
shock-proof up to 220 volts/2 amps, 110 volts/5 amps. Acid proof for up-
to 5 minutes.'-
));
INSERT INTO product_descriptions VALUES (2326-
, 'US'-
, UNISTR(-
'Plastic Stock - Y'-
), UNISTR(-
'Plastic Stock - Yellow, standard quality.'-
));
INSERT INTO product_descriptions VALUES (2330-
, 'US'-
, UNISTR(-
'Plastic Stock - R'-
), UNISTR(-
'Plastic Stock - Red, standard quality.'-
));
INSERT INTO product_descriptions VALUES (2334-
, 'US'-
, UNISTR(-
'Resin'-
), UNISTR(-
'General purpose synthetic resin.'-
));
INSERT INTO product_descriptions VALUES (2340-
, 'US'-
, UNISTR(-
'Chemicals - SW'-
), UNISTR(-
'Cleaning Chemicals - 3500 staticide wipes'-
));
INSERT INTO product_descriptions VALUES (2365-
, 'US'-
, UNISTR(-
'Chemicals - TCS'-
), UNISTR(-
'Cleaning Chemical - 2500 transport cleaning sheets'-
));
INSERT INTO product_descriptions VALUES (2594-
, 'US'-
, UNISTR(-
'FG Stock - L'-
), UNISTR(-
'Fiberglass Stock - light weight for internal heat shielding, 1/4 thick'-
));
INSERT INTO product_descriptions VALUES (2596-
, 'US'-
, UNISTR(-
'SS Stock - 1mm'-
), UNISTR(-
'Stainless steel stock - 3mm. Can be predrilled for standard model-
motherboard and battery holders. Please use appropriate template to-
identify model number, placement, and size of finished sheet when placing-
order for drilled sheet.'-
));
INSERT INTO product_descriptions VALUES (2631-
, 'US'-
, UNISTR(-
'ESD Bracelet/QR'-
), UNISTR(-
'Electro Static Discharge Bracelet: 2 piece lead with quick release-
connector. One piece stays permanently attached to computer chassis with-
screw, the other is attached to the bracelet. Additional permanent-
ends available.'-
));
INSERT INTO product_descriptions VALUES (2721-
, 'US'-
, UNISTR(-
'PC Bag - L/S'-
), UNISTR(-
'Black Leather Computer Case - single laptop capacity with pockets for-
manuals, additional hardware, and work papers. Adjustable protective straps-
and removable pocket for power supply and cables.'-
));
INSERT INTO product_descriptions VALUES (2722-
, 'US'-
, UNISTR(-
'PC Bag - L/D'-
), UNISTR(-
'Black Leather Computer Case - double laptop capacity with pockets for-
additional hardware or manuals and work papers. Adjustable protective straps-
and removable pockets for power supplies and cables. Double wide shoulder-
strap for comfort.'-
));
INSERT INTO product_descriptions VALUES (2725-
, 'US'-
, UNISTR(-
'Machine Oil'-
), UNISTR(-
'Machine Oil for Lubrication of CD-ROM drive doors and slides.-
Self-cleaning adjustable nozzle for fine to medium flow.'-
));
INSERT INTO product_descriptions VALUES (2782-
, 'US'-
, UNISTR(-
'PC Bag - C/S'-
), UNISTR(-
'Canvas Computer Case - single laptop capacity with pockets for manuals,-
additional hardware, and work papers. Adjustable protective straps and-
removable pocket for power supply and cables. Outside pocket with snap-
closure for easy access while travelling.'-
));
INSERT INTO product_descriptions VALUES (3187-
, 'US'-
, UNISTR(-
'Plastic Stock - B/HD'-
), UNISTR(-
'Plastic Stock - Blue, high density.'-
));
INSERT INTO product_descriptions VALUES (3189-
, 'US'-
, UNISTR(-
'Plastic Stock - G'-
), UNISTR(-
'Plastic Stock - Green, standard density.'-
));
INSERT INTO product_descriptions VALUES (3191-
, 'US'-
, UNISTR(-
'Plastic Stock - O'-
), UNISTR(-
'Plastic Stock - Orange, standard density.'-
));
INSERT INTO product_descriptions VALUES (3193-
, 'US'-
, UNISTR(-
'Plastic Stock - W/HD'-
), UNISTR(-
'Plastic Stock - White, high density.'-
));
commit;
set define on
