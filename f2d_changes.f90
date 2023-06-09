!********1*********2*********3*********4*********5*********6*********7*********8

!               f2d_changes.f90

! DO NOT ALTER THIS FILE

!  This file has been created automatically by "maketext"
!  from the ASCII text file:  f2d_changes.text 
!  which should be edited and maketext should be re-run to 
!  create a new version of the subroutine.

!+ F2D_CHANGES interactive user help/message display facility
    Subroutine F2D_CHANGES (gui, status)

! Type Definitions:
    Implicit None

! Usage:
!   Private

! Import:
    Logical gui ! .True., if GUI is to be used
! Status:
    Integer status ! Status return variable

! Local Constants:
    Integer, Parameter :: Max_chars =  82 ! Maximum characters per line 
    Integer, Parameter :: Max_lines  =  541 ! Number of lines in message
! Local Variables:
     Integer font_index ! Saves current font index
! Local Arrays:
    Character*(Max_chars) TX(Max_lines) ! Text array
! External Functions:
    Integer, External :: St_good ! Returns good status value
! Local Data:
    Data TX(   1) / &
      ' ' /
    Data TX(   2) / &
      '           -----------------------------------'/
    Data TX(   3) / &
      '           IMPORTANT CHANGES IN FIT2D VERSIONS'/
    Data TX(   4) / &
      '           -----------------------------------'/
    Data TX(   5) / &
      ' ' /
    Data TX(   6) / &
      '-----------------------------------'/
    Data TX(   7) / &
      'FROM FIT2D VERSION 14.001 TO 14.013'/
    Data TX(   8) / &
      '-----------------------------------'/
    Data TX(   9) / &
      ' ' /
    Data TX(  10)(1:70)/ &
     'The experimental geometry and other experimental details are now store'/
    Data TX(  10)(71:) / &
     'd'/
    Data TX(  11)(1:70)/ &
     'in the "EXPERIMENT" data-structure. This replaces previous methods, an'/
    Data TX(  11)(71:) / &
     'd'/
    Data TX(  12) / &
      'allows much more information to be passed around the program. This is'/
    Data TX(  13) / &
      'especially important for the "RECIPROCAL SPACE MAPPING" interface.'/
    Data TX(  14) / &
      ' ' /
    Data TX(  15) / &
      'The graphics window can now be resized to arbitrary aspect ratios.'/
    Data TX(  16) / &
      ' ' /
    Data TX(  17) / &
      '!    10-Apr-2006: V14.013 Debug new indexing code (Hammersley)'/
    Data TX(  18) / &
      '!    05-Apr-2006: V14.012 Test updated I/O routines (Hammersley)'/
    Data TX(  19) / &
      '!    04-Apr-2006: V14.011 Update IO routines (Hammersley)'/
    Data TX(  20) / &
      '!    03-Apr-2006: V14.010 Use F90 version of "maketext" (Hammersley)'/
    Data TX(  21)(1:70)/ &
     '!    28-Mar-2006: V14.009 Correct input of diffractometer angles in "R'/
    Data TX(  21)(71:) / &
     'ECIPROCAL'/
    Data TX(  22) / &
      '!      MAPPING INTERFACE" (Hammersley)'/
    Data TX(  23)(1:70)/ &
     '!    28-Mar-2006: V14.008 Changes to dynammic memory allocation (Hamme'/
    Data TX(  23)(71:) / &
     'rsley)'/
    Data TX(  24) / &
      '!    23-Mar-2006: V14.007 Changes to allow for vertical look-up tables'/
    Data TX(  25) / &
      '!      (Hammersley)'/
    Data TX(  26) / &
      '!    22-Mar-2006: V14.006 Debugging resizing problems (Hammersley)'/
    Data TX(  27)(1:70)/ &
     '!    21-Mar-2006: V14.005 Changes to dynamic memory allocation (Hammer'/
    Data TX(  27)(71:) / &
     'sley)'/
    Data TX(  28) / &
      '!    20-Mar-2006: V14.004 Add "INPUT OPTIONS" support (Hammersley)'/
    Data TX(  29) / &
      '!    17-Mar-2006: V14.003 Window position remembered. (Hammersley)'/
    Data TX(  30)(1:70)/ &
     '!    16-Mar-2006: V14.002 Correct output of two theta angle. Window cl'/
    Data TX(  30)(71:) / &
     'ose button'/
    Data TX(  31) / &
      '!      is now disabled. (Hammersley)'/
    Data TX(  32) / &
      '!    15-Mar-2006: V14.001 Testing changes (Hammersley)'/
    Data TX(  33)(1:70)/ &
     '!    13-Mar-2006: V14.000 Many changes owing to use of "EXPERIMENT" st'/
    Data TX(  33)(71:) / &
     'ructure'/
    Data TX(  34) / &
      '!      to pass experimental details throughout program (Hammersley)'/
    Data TX(  35) / &
      ' ' /
    Data TX(  36) / &
      ' ' /
    Data TX(  37) / &
      '-----------------------------------'/
    Data TX(  38) / &
      'FROM FIT2D VERSION 13.001 TO 13.018'/
    Data TX(  39) / &
      '-----------------------------------'/
    Data TX(  40) / &
      ' ' /
    Data TX(  41)(1:70)/ &
     'The Intel Fortran compilers are now used on both Windows and Linux ver'/
    Data TX(  41)(71:) / &
     'sions.'/
    Data TX(  42) / &
      'The Fortran-90 version becomes the standard version.'/
    Data TX(  43) / &
      ' ' /
    Data TX(  44) / &
      '!    10-Mar-2006: V13.018 Control input of auxiliary information from'/
    Data TX(  45) / &
      '!      CBF/CIF files (Hammersley)'/
    Data TX(  46) / &
      '!    09-Mar-2006: V13.017 Input UB matrix from CIF''s (Hammersley)'/
    Data TX(  47)(1:70)/ &
     '!    08-Mar-2006: V13.016 Get sense of images from CBF files for recip'/
    Data TX(  47)(71:) / &
     'rocal'/
    Data TX(  48) / &
      '!      space mapping (Hammersley)'/
    Data TX(  49) / &
      '!    06-Mar-2006: V13.015 Test output of CBF''s (Hammersley)'/
    Data TX(  50)(1:70)/ &
     '!    04-Mar-2006: V13.014 Convert real data to integer and vice versa '/
    Data TX(  50)(71:) / &
     'for CBF''s'/
    Data TX(  51) / &
      '!      (Hammersley)'/
    Data TX(  52) / &
      '!    03-Mar-2006: V13.013 Add option to output CBF file with optional'/
    Data TX(  53) / &
      '!      auxiliary information (Hammersley)'/
    Data TX(  54)(1:70)/ &
     '!    02-Mar-2006: V13.012 New version of CBF library. Input pixel size'/
    Data TX(  54)(71:) / &
     's from'/
    Data TX(  55) / &
      '!      CBF files (Hammersley)'/
    Data TX(  56) / &
      '!    26-Feb-2006: V13.011 Add code to input pixel sizes for CBF files'/
    Data TX(  57) / &
      '!      (Hammersley)'/
    Data TX(  58) / &
      '!    24-Feb-2006: V13.010 Input pixel size for ADSC files (Hammersley)'/
    Data TX(  59)(1:70)/ &
     '!    23-Feb-2006: V13.009 Input more experiemental geometry informatio'/
    Data TX(  59)(71:) / &
     'n from'/
    Data TX(  60) / &
      '!      CIF file (Hammersley)'/
    Data TX(  61)(1:70)/ &
     '!    22-Feb-2006: V13.008 Use data structure for experiemental geometr'/
    Data TX(  61)(71:) / &
     'y input'/
    Data TX(  62) / &
      '!      (Hammersley)'/
    Data TX(  63)(1:70)/ &
     '!    18-Feb-2006: V13.007 Use mixed "C" / Fortran I/O libraries (Hamme'/
    Data TX(  63)(71:) / &
     'rsley)'/
    Data TX(  64)(1:70)/ &
     '!    16-Feb-2006: V13.006 Add "FILE INPUT GEOMETRY" option to "SETUP" '/
    Data TX(  64)(71:) / &
     'interface'/
    Data TX(  65) / &
      '!      (Hammersley)'/
    Data TX(  66)(1:70)/ &
     '!    15-Feb-2006: V13.005 Input auxiliary files in "MAP SERIES" (Hamme'/
    Data TX(  66)(71:) / &
     'rsley)'/
    Data TX(  67) / &
      '!    13-Feb-2006: V13.004 Re-compile for DA1 (Hammersley)'/
    Data TX(  68) / &
      '!    10-Feb-2006: V13.003 Windows Intel compiler version (Hammersley)'/
    Data TX(  69) / &
      '!    01-Feb-2006: V13.002 Windows Fortran-90 version (Hammersley)'/
    Data TX(  70) / &
      '!    23-Jan-2006: V13.001 Fortran-90 version (Hammersley)'/
    Data TX(  71) / &
      ' ' /
    Data TX(  72) / &
      '-----------------------------------'/
    Data TX(  73) / &
      'FROM FIT2D VERSION 12.028 TO 12.121'/
    Data TX(  74) / &
      '-----------------------------------'/
    Data TX(  75) / &
      ' ' /
    Data TX(  76)(1:70)/ &
     '!    05-Mar-2004: V12.028 Correct non-cancelling cancel at start of ca'/
    Data TX(  76)(71:) / &
     'ke'/
    Data TX(  77) / &
      '!      form input. Correct error message when files fail to input in'/
    Data TX(  78) / &
      '!      "FILE SERIES" commands. Correct colour table for X-11 8-bit'/
    Data TX(  79) / &
      '!      pseudo-color output (Hammersley)'/
    Data TX(  80)(1:70)/ &
     '!    09-Mar-2004: V12.029 Correct X-11 code for 8-bit "Pseudocolor" di'/
    Data TX(  80)(71:) / &
     'splays'/
    Data TX(  81) / &
      '!      (Hammersley)'/
    Data TX(  82) / &
      '!    10-Mar-2004: V12.030 Create mask at start-up, change in way the'/
    Data TX(  83) / &
      '!      vector array is defined internally (Hammersley)'/
    Data TX(  84)(1:70)/ &
     '!    12-Mar-2004: V12.031 Options to input and output mask files (Hamm'/
    Data TX(  84)(71:) / &
     'ersley)'/
    Data TX(  85) / &
      '!    15-Mar-2004: V12.032 Testing mask input (Hammersley)'/
    Data TX(  86)(1:70)/ &
     '!    19-Mar-2004: V12.033 Correct user messages for "INTERNAL MEMORY" '/
    Data TX(  86)(71:) / &
     'and'/
    Data TX(  87)(1:70)/ &
     '!      "BLOCK COPY" commands. Change "TRANSFORM" command so that defin'/
    Data TX(  87)(71:) / &
     'ed'/
    Data TX(  88)(1:70)/ &
     '!      output region is not reduced by a small transform output region'/
    Data TX(  88)(71:) / &
     '.'/
    Data TX(  89)(1:70)/ &
     '!      "SAVE MASK" implemented. Flip Mar image plate data top to botto'/
    Data TX(  89)(71:) / &
     'm'/
    Data TX(  90)(1:70)/ &
     '!      to agree with Mar software orientation, and FreeThinker (Hammer'/
    Data TX(  90)(71:) / &
     'sley)'/
    Data TX(  91)(1:70)/ &
     '!    24-Mar-2004: V12.034 Add option in "CAKE" form to default always '/
    Data TX(  91)(71:) / &
     'to one'/
    Data TX(  92) / &
      '!      degree azimuthal bins (Hammersley)'/
    Data TX(  93)(1:70)/ &
     '!    07-Apr-2004: V12.035 Add warning message when "edf" extension fil'/
    Data TX(  93)(71:) / &
     'es'/
    Data TX(  94)(1:70)/ &
     '!      are not valid edf files. Correct input of ROI of TIFF files (Ha'/
    Data TX(  94)(71:) / &
     'mmersley)'/
    Data TX(  95) / &
      '!    16-Apr-2004: V12.036 New user version (Hammersley)'/
    Data TX(  96) / &
      '!    30-Jun-2004: V12.037 Improve error reporting for "IO_READLINE"'/
    Data TX(  97) / &
      '!      to investigate problem of failure from perl script (but not'/
    Data TX(  98) / &
      '!      C-shell script) (Hammersley)'/
    Data TX(  99)(1:70)/ &
     '!    06-Jul-2004: V12.038 Test version for perl script problem (Hammer'/
    Data TX(  99)(71:) / &
     'sley)'/
    Data TX( 100) / &
      '!    15-Jul-2004: V12.039 New test version for perl script problem'/
    Data TX( 101) / &
      '!      (Hammersley)'/
    Data TX( 102) / &
      '!    19-Jul-2004: V12.040 Add "SET PIXEL VALUE" command to keyboard'/
    Data TX( 103) / &
      '!      interface. Add support in the "Klora" data format for unsigned'/
    Data TX( 104)(1:70)/ &
     '!      byte input. Add support for old Mar format images of 2300 x 230'/
    Data TX( 104)(71:) / &
     '0'/
    Data TX( 105) / &
      '!      pixels and 3450 x 3450 pixels (Hammersley)'/
    Data TX( 106)(1:70)/ &
     '!    26-Jul-2004: V12.041 Add "DRAW CAKE" command to keyboard interfac'/
    Data TX( 106)(71:) / &
     'e.'/
    Data TX( 107) / &
      '!      (Hammersley)'/
    Data TX( 108) / &
      '!    24-Aug-2004: V12.042 Add "2-D ASCII" free format support in GUI'/
    Data TX( 109) / &
      '!      (Hammersley)'/
    Data TX( 110) / &
      '!    26-Aug-2004: V12.043 Add "2-D ASCII" output format (Hammersley)'/
    Data TX( 111)(1:70)/ &
     '!    31-Aug-2004: V12.044 Use "e" format for "2-D ASCII" output (Hamme'/
    Data TX( 111)(71:) / &
     'rsley)'/
    Data TX( 112) / &
      '!    15-Sep-2004: V12.045 Parameter file I/O (Hammersley)'/
    Data TX( 113)(1:70)/ &
     '!    26-Oct-2004: V12.046 Option of integer output for "2-D ASCII" out'/
    Data TX( 113)(71:) / &
     'put'/
    Data TX( 114) / &
      '!      (Hammersley)'/
    Data TX( 115) / &
      '!    26-Oct-2004: V12.047 Change integer output to 10I8 (Hammersley)'/
    Data TX( 116) / &
      '!    28-Oct-2004: V12.048 Option to output floating point TIFF images'/
    Data TX( 117) / &
      '!      (Hammersley)'/
    Data TX( 118) / &
      '!    03-Nov-2004: V12.049 Correct output of floating point TIFF images'/
    Data TX( 119) / &
      '!      (Hammersley)'/
    Data TX( 120) / &
      '!    17-Nov-2004: V12.050 Option of "PROJECTIONS" in "FILE SERIES"'/
    Data TX( 121) / &
      '!      interface (Hammersley)'/
    Data TX( 122) / &
      '!    18-Nov-2004: V12.051 Implementing "PROJECTIONS" in "FILE SERIES"'/
    Data TX( 123) / &
      '!      interface (Hammersley)'/
    Data TX( 124) / &
      '!    19-Nov-2004: V12.052 Correct first file of "PROJECTIONS" in'/
    Data TX( 125) / &
      '!      "FILE SERIES" interface (Hammersley)'/
    Data TX( 126)(1:70)/ &
     '!    23-Nov-2004: V12.053 Testing problem with macro running under Lin'/
    Data TX( 126)(71:) / &
     'ux'/
    Data TX( 127) / &
      '!      (Hammersley)'/
    Data TX( 128) / &
      '!    26-Nov-2004: V12.054 New Linux version (Hammersley)'/
    Data TX( 129) / &
      '!    13-Dec-2004: V12.055 Test version (Hammersley)'/
    Data TX( 130) / &
      '!    15-Dec-2004: V12.056 Fix input problem (Hammersley)'/
    Data TX( 131) / &
      '!    22-Dec-2004: V12.057 Updating graphics module (Hammersley)'/
    Data TX( 132) / &
      '!    06-Jan-2005: V12.058 Allow input from pipes (Linux) (Hammersley)'/
    Data TX( 133) / &
      '!    10-Jan-2005: V12.059 Change to X-11 updating code (Hammersley)'/
    Data TX( 134) / &
      '!    11-Jan-2005: V12.060 Output geometry file (Hammersley)'/
    Data TX( 135) / &
      '!    14-Jan-2005: V12.061 Input geometry file (Hammersley)'/
    Data TX( 136) / &
      '!    20-Jan-2005: V12.062 Testing geometry file (Hammersley)'/
    Data TX( 137) / &
      '!    04-Feb-2005: V12.063 Testing (Hammersley)'/
    Data TX( 138)(1:70)/ &
     '!    07-Feb-2005: V12.064 Investigating problem of inputting geometry '/
    Data TX( 138)(71:) / &
     'file'/
    Data TX( 139) / &
      '!      (Hammersley)'/
    Data TX( 140)(1:70)/ &
     '!    07-Feb-2005: V12.065 Increase maximum number of strips which can '/
    Data TX( 140)(71:) / &
     'be'/
    Data TX( 141) / &
      '!      input in a TIFF image (Hammersley)'/
    Data TX( 142)(1:70)/ &
     '!    10-Feb-2005: V12.066 Testing MFIT problem: works fine on Windows '/
    Data TX( 142)(71:) / &
     'but'/
    Data TX( 143) / &
      '!      weird error on Linux ! (Hammersley)'/
    Data TX( 144)(1:70)/ &
     '!    11-Feb-2005: V12.067 Correct MFIT problem (non-intialised variabl'/
    Data TX( 144)(71:) / &
     'e)'/
    Data TX( 145) / &
      '!      (Hammersley)'/
    Data TX( 146) / &
      '!    14-Feb-2005: V12.068 Remove diagnositcs from Mar input routine'/
    Data TX( 147) / &
      '!      (Hammersley)'/
    Data TX( 148)(1:70)/ &
     '!    15-Feb-2005: V12.069 Correct beam centre position when outside im'/
    Data TX( 148)(71:) / &
     'age'/
    Data TX( 149) / &
      '!      for cake integration (Hammersley)'/
    Data TX( 150)(1:70)/ &
     '!    23-Feb-2005: V12.070 Add "GROW MASK" command to MASK menu (Hammer'/
    Data TX( 150)(71:) / &
     'sley)'/
    Data TX( 151)(1:70)/ &
     '!    24-Feb-2005: V12.071 Add full path to default name for Chiplot ou'/
    Data TX( 151)(71:) / &
     'tput'/
    Data TX( 152) / &
      '!      files (Hammersley)'/
    Data TX( 153)(1:70)/ &
     '!    16-Mar-2005: V12.072 Correct error in Powder Diffraction Interfac'/
    Data TX( 153)(71:) / &
     'e'/
    Data TX( 154)(1:70)/ &
     '!      input which meant that files of different type could not be inp'/
    Data TX( 154)(71:) / &
     'ut for'/
    Data TX( 155) / &
      '!      dark current subtraction and flat field correction (Hammersley)'/
    Data TX( 156) / &
      '!    17-Mar-2005: V12.073 Add "INVERT MASK" command to mask menu'/
    Data TX( 157) / &
      '!      (Hammersley)'/
    Data TX( 158) / &
      '!    21-Mar-2005: V12.074 Add "RECIPROCAL SPACE MAPPING" inferface'/
    Data TX( 159) / &
      '!      (Hammersley)'/
    Data TX( 160) / &
      '!    31-Mar-2005: V12.075 Decrease minimum wavelength limit to 0.00001'/
    Data TX( 161)(1:70)/ &
     '!      Angstroms as previous limit was too high for TEM 2D diffraction'/
    Data TX( 161)(71:) / &
     ' work'/
    Data TX( 162) / &
      '!    04-Apr-2005: V12.076 Add warning message on development phase of'/
    Data TX( 163) / &
      '!      "RECIPROCAL SPACE MAPPING" inferface (Hammersley)'/
    Data TX( 164)(1:70)/ &
     '!    05-Apr-2005: V12.077 Reduce minimum wavelength to 1.0e-4 Angstrom'/
    Data TX( 164)(71:) / &
     's'/
    Data TX( 165) / &
      '!      in "CALIBRANT" input form (Hammersley)'/
    Data TX( 166)(1:70)/ &
     '!    07-Apr-2005: V12.078 Minor changes to code for Mac OSX version to'/
    Data TX( 166)(71:) / &
     ' keep'/
    Data TX( 167) / &
      '!      IBM xlf compiler happy (Hammersley)'/
    Data TX( 168)(1:70)/ &
     '!    13-Apr-2005: V12.079 Try adding "-static" to Mac link to avoid ne'/
    Data TX( 168)(71:) / &
     'ed'/
    Data TX( 169) / &
      '!      for xlf dynamic libraries (Hammersley)'/
    Data TX( 170)(1:70)/ &
     '!    19-Apr-2005: V12.080 Give up and use "ld" with all .a files speci'/
    Data TX( 170)(71:) / &
     'fically'/
    Data TX( 171)(1:70)/ &
     '!      included to avoid need for xlf dynamic libraries on MacOSX (Ham'/
    Data TX( 171)(71:) / &
     'mersley)'/
    Data TX( 172)(1:70)/ &
     '!    20-Apr-2005: V12.081 Try changing Linux link to exclude shared li'/
    Data TX( 172)(71:) / &
     'braries'/
    Data TX( 173) / &
      '!      as much as possible (but this may cause problems) (Hammersley)'/
    Data TX( 174) / &
      '!    22-Apr-2005: V12.082 Implementing "MAP SERIES" (Hammersley)'/
    Data TX( 175) / &
      '!    25-Apr-2005: V12.083 Debugging crystal orientation  (Hammersley)'/
    Data TX( 176) / &
      '!    27-Apr-2005: V12.084 Reciprocal mapping ready for testing'/
    Data TX( 177) / &
      '!      (Hammersley)'/
    Data TX( 178)(1:70)/ &
     '!    10-May-2005: V12.085 Correct error on "TRANSFER SECTION TO MEMORY'/
    Data TX( 178)(71:) / &
     '"'/
    Data TX( 179) / &
      '!      (Hammersley)'/
    Data TX( 180) / &
      '!    11-May-2005: V12.086 De-bugging reciprocal mapping (Hammersley)'/
    Data TX( 181) / &
      '!    12-May-2005: V12.087 Reciprocal mapping apparantly working'/
    Data TX( 182) / &
      '!      (Hammersley)'/
    Data TX( 183) / &
      '!    13-May-2005: V12.088 Convert reciprocal mapping angles to radians'/
    Data TX( 184) / &
      '!      and optimise code (Hammersley)'/
    Data TX( 185) / &
      '!    02-Jun-2005: V12.089 Add support for horizontal and vertical'/
    Data TX( 186) / &
      '!      detector movement in "RECIPROCAL SPACE MAPPING" (Hammersley)'/
    Data TX( 187)(1:70)/ &
     '!    08-Jun-2005: V12.090 Correct angle calculations to take into acco'/
    Data TX( 187)(71:) / &
     'unt'/
    Data TX( 188) / &
      '!      skipping files in "RECIPROCAL SPACE MAPPING". Correct "Bruker"'/
    Data TX( 189)(1:70)/ &
     '!      input routines so that a bad file does not stop subsequent inpu'/
    Data TX( 189)(71:) / &
     't.'/
    Data TX( 190) / &
      '!      (Hammersley)'/
    Data TX( 191) / &
      '!    09-Jun-2005: V12.091 Set output section axes in "RECIPROCAL SPACE'/
    Data TX( 192) / &
      '!      MAPPING" to "step" units (Hammersley)'/
    Data TX( 193) / &
      '!    10-Jun-2005: V12.092 Implementing UB matrix calculation from'/
    Data TX( 194) / &
      '!      2 reflections (Hammersley)'/
    Data TX( 195)(1:70)/ &
     '!    12-Jul-2005: V12.093 Implement Busing and Levy UB matrix determin'/
    Data TX( 195)(71:) / &
     'ing'/
    Data TX( 196) / &
      '!      algorithm (Hammersley)'/
    Data TX( 197) / &
      '!    21-Jul-2005: V12.094 Debugging UB matrix calculation (Hammersley)'/
    Data TX( 198) / &
      '!    26-Jul-2005: V12.095 Add option to output program state to a'/
    Data TX( 199) / &
      '!      named file (Hammersley)'/
    Data TX( 200) / &
      '!    29-Jul-2005: V12.096 Add option to input program state from a'/
    Data TX( 201) / &
      '!      named file (Hammersley)'/
    Data TX( 202) / &
      '!    16-Aug-2005: V12.097 Calculate B matrix with double precision'/
    Data TX( 203) / &
      '!      arithmetic (Hammersley)'/
    Data TX( 204)(1:70)/ &
     '!    05-Sep-2005: V12.098 Add option to click on images for determinin'/
    Data TX( 204)(71:) / &
     'g'/
    Data TX( 205) / &
      '!      UB matrix (Hammersley)'/
    Data TX( 206) / &
      '!    06-Sep-2005: V12.099 Calculate angles from images (Hammersley)'/
    Data TX( 207) / &
      '!    07-Sep-2005: V12.100 Continue implementation (Hammersley)'/
    Data TX( 208) / &
      '!    27-Sep-2005: V12.101 Correct coordinate input (Hammersley)'/
    Data TX( 209) / &
      '!    29-Sep-2005: V12.102 Calculate pseudo-angles (Hammersley)'/
    Data TX( 210) / &
      '!    30-Sep-2005: V12.103 Testing (Hammersley)'/
    Data TX( 211) / &
      '!    06-Oct-2005: V12.104 Testing (Hammersley)'/
    Data TX( 212) / &
      '!    10-Oct-2005: V12.105 Testing (Hammersley)'/
    Data TX( 213) / &
      '!    12-Oct-2005: V12.106 Increase maximum number of files which can'/
    Data TX( 214)(1:70)/ &
     '!      be handled by the file selection component to 40000 (Hammersley'/
    Data TX( 214)(71:) / &
     ')'/
    Data TX( 215)(1:70)/ &
     '!    13-Oct-2005: V12.107 Correct image display when calculating UB ma'/
    Data TX( 215)(71:) / &
     'trix'/
    Data TX( 216) / &
      '!      by clicking on two reflections (Hammersley)'/
    Data TX( 217)(1:70)/ &
     '!    17-Oct-2005: V12.108 Output equivalent hkl position in "RECIPROCA'/
    Data TX( 217)(71:) / &
     'L'/
    Data TX( 218) / &
      '!      MAPPING" interface (Hammersley)'/
    Data TX( 219)(1:70)/ &
     '!    20-Oct-2005: V12.109 Debugging reciprocal space mapping (Hammersl'/
    Data TX( 219)(71:) / &
     'ey)'/
    Data TX( 220) / &
      '!    21-Oct-2005: V12.110 Convert to subroutine, called from a "C"'/
    Data TX( 221) / &
      '!      routine (Hammersley)'/
    Data TX( 222)(1:70)/ &
     '!    25-Oct-2005: V12.111 Correct reciprocal mapping for vertical dete'/
    Data TX( 222)(71:) / &
     'ctor'/
    Data TX( 223) / &
      '!      geometry (Hammersley)'/
    Data TX( 224) / &
      '!    26-Oct-2005: V12.112 Testing reciprocal mapping (Hammersley)'/
    Data TX( 225) / &
      '!    27-Oct-2005: V12.113 Testing reciprocal mapping (Hammersley)'/
    Data TX( 226) / &
      '!    28-Oct-2005: V12.114 Option to mirror images in reciprocal'/
    Data TX( 227) / &
      '!      mapping transform (Hammersley)'/
    Data TX( 228) / &
      '!    04-Nov-2005: V12.115 Testing mirror images in reciprocal'/
    Data TX( 229) / &
      '!      mapping transform (Hammersley)'/
    Data TX( 230)(1:70)/ &
     '!    07-Nov-2005: V12.116 Fill in any missing pixels in reciprocal map'/
    Data TX( 230)(71:) / &
     ' with'/
    Data TX( 231) / &
      '!      surrounding average value (Hammersley)'/
    Data TX( 232)(1:70)/ &
     '!    08-Nov-2005: V12.117 Set axis values for simple planes in recipro'/
    Data TX( 232)(71:) / &
     'cal'/
    Data TX( 233) / &
      '!      space mapping (Hammersley)'/
    Data TX( 234) / &
      '!    14-Nov-2005: V12.118 Option to input UB matrix from a text file'/
    Data TX( 235) / &
      '!      (Hammersley)'/
    Data TX( 236)(1:70)/ &
     '!    21-Nov-2005: V12.119 Changes to "F2D_RMAP_INUBMATRIX" (Hammersley'/
    Data TX( 236)(71:) / &
     ')'/
    Data TX( 237) / &
      '!    01-Dec-2005: V12.120 Correct "F2D_RMAP_INUBMATRIX" (Hammersley)'/
    Data TX( 238) / &
      '!    07-Dec-2005: V12.121 Update parser (Hammersley)'/
    Data TX( 239) / &
      ' ' /
    Data TX( 240) / &
      ' ' /
    Data TX( 241) / &
      '-----------------------------------'/
    Data TX( 242) / &
      'FROM FIT2D VERSION 12.001 TO 12.027'/
    Data TX( 243) / &
      '-----------------------------------'/
    Data TX( 244) / &
      ' ' /
    Data TX( 245)(1:70)/ &
     '*       06-Nov-2003: V12.001 Change to use "Io_readline" on Unix syste'/
    Data TX( 245)(71:) / &
     'ms'/
    Data TX( 246) / &
      '*        (Hammersley)'/
    Data TX( 247)(1:70)/ &
     '*       12-Nov-2003: V12.002 Option of giving identifer to shared memo'/
    Data TX( 247)(71:) / &
     'ry'/
    Data TX( 248) / &
      '*         segment (Hammersley)'/
    Data TX( 249)(1:70)/ &
     '*       13-Nov-2003: V12.003 Separate subroutine to Free memory (Hamme'/
    Data TX( 249)(71:) / &
     'rsley)'/
    Data TX( 250) / &
      '*       18-Nov-2003: V12.004 Add mask array to shared memory arrays'/
    Data TX( 251) / &
      '*         (Hammersley)'/
    Data TX( 252)(1:70)/ &
     '*       26-Nov-2003: V12.005 Correct problem in input of coordinates f'/
    Data TX( 252)(71:) / &
     'or'/
    Data TX( 253) / &
      '*         2-D fit model (Hammersley)'/
    Data TX( 254) / &
      '*       01-Dec-2003: V12.006 Debug shared memory use (Hammersley)'/
    Data TX( 255) / &
      '*       03-Dec-2003: V12.007 Change default so markers are not drawn'/
    Data TX( 256) / &
      '*         (Hammersley)'/
    Data TX( 257)(1:70)/ &
     '*       12-Dec-2003: V12.008 Make sure image is re-drawn when help mes'/
    Data TX( 257)(71:) / &
     'sages'/
    Data TX( 258) / &
      '*         are output during "CALIBRANT" choice (Hammersley)'/
    Data TX( 259)(1:70)/ &
     '*       15-Dec-2003: V12.009 Change references to "active data region"'/
    Data TX( 259)(71:) / &
     ' (ADR)'/
    Data TX( 260) / &
      '*         to refer to "region of interest" (ROI) (Hammersley)'/
    Data TX( 261)(1:70)/ &
     '*       22-Dec-2003: V12.010 Investigating problem inputting "FIT2D" f'/
    Data TX( 261)(71:) / &
     'ormat'/
    Data TX( 262) / &
      '*         file (Hammersley)'/
    Data TX( 263) / &
      '*       05-Jan-2004: V12.011 Minor syntax changes (Hammersley)'/
    Data TX( 264)(1:69)/ &
     '*       08-Jan-2004: V12.012 Change text referring to ''active data re'/
    Data TX( 264)(70:) / &
     'gion (ADR)'''/
    Data TX( 265) / &
      '*         the refer to ''region of interest (ROI)" (Hammersley)'/
    Data TX( 266)(1:70)/ &
     '*       14-Jan-2004: V12.013 Remove diagnostics from FIT2D file input '/
    Data TX( 266)(71:) / &
     'code,'/
    Data TX( 267)(1:70)/ &
     '*         problem was clearly corrupted file probably from using ftp f'/
    Data TX( 267)(71:) / &
     'rom Unix'/
    Data TX( 268) / &
      '*         to PC in ASCII mode (Hammersley)'/
    Data TX( 269)(1:70)/ &
     '*       03-Feb-2004: V12.014 Correct file selection problem with Windo'/
    Data TX( 269)(71:) / &
     'ws version'/
    Data TX( 270) / &
      '*         (Hammersley)'/
    Data TX( 271)(1:70)/ &
     '*       04-Feb-2004: V12.015 Output diagnostics to try to identify Exc'/
    Data TX( 271)(71:) / &
     'eed'/
    Data TX( 272)(1:70)/ &
     '*         versions which contain X-server information bug and those wh'/
    Data TX( 272)(71:) / &
     'ere this'/
    Data TX( 273) / &
      '*         has been corrected (Hammersley)'/
    Data TX( 274)(1:70)/ &
     '*       06-Feb-2004: V12.016 Try to correct eXceed X-server bug only f'/
    Data TX( 274)(71:) / &
     'or old'/
    Data TX( 275) / &
      '*         exceed versions (Hammersley)'/
    Data TX( 276)(1:70)/ &
     '*       11-Feb-2004: V12.017 Change method to find out byte offset val'/
    Data TX( 276)(71:) / &
     'ues for'/
    Data TX( 277)(1:70)/ &
     '*         output of images. Now write primary colour rectangles to scr'/
    Data TX( 277)(71:) / &
     'een'/
    Data TX( 278)(1:70)/ &
     '*         and read back pixel values. This seems to be the only way to'/
    Data TX( 278)(71:) / &
     ' get'/
    Data TX( 279)(1:70)/ &
     '*         Hummingbird eXceed to tell the truth. Notably visualList.red'/
    Data TX( 279)(71:) / &
     '_mask etc.'/
    Data TX( 280) / &
      '*         are set wrongly. (Hammersley)'/
    Data TX( 281)(1:70)/ &
     '*       19-Feb-2004: V12.018 Apparently still problems with eXceed. Co'/
    Data TX( 281)(71:) / &
     'mpile'/
    Data TX( 282) / &
      '*         new version with diagnostics, so as to be sure of version'/
    Data TX( 283) / &
      '*         (Hammersley)'/
    Data TX( 284)(1:70)/ &
     '*       20-Feb-2004: V12.019 Colours O.K, but character input is often'/
    Data TX( 284)(71:) / &
     ' not'/
    Data TX( 285)(1:70)/ &
     '*         being input correctly in the GUI. This however works on some'/
    Data TX( 285)(71:) / &
     ' X-servers'/
    Data TX( 286) / &
      '*         (Hammersley)'/
    Data TX( 287)(1:70)/ &
     '*       23-Feb-2004: V12.020 Further investigation of X-server charact'/
    Data TX( 287)(71:) / &
     'er input'/
    Data TX( 288) / &
      '*         problem (Hammersley)'/
    Data TX( 289) / &
      '*       24-Feb-2004: V12.021 Investigation shows that something in the'/
    Data TX( 290)(1:70)/ &
     '*         "syntax.h" file is causing X-11 to screw up ! So use "WIN32"'/
    Data TX( 290)(71:) / &
     ' defined'/
    Data TX( 291)(1:70)/ &
     '*         to get rid of dubious defines. In fact the problem is from t'/
    Data TX( 291)(71:) / &
     'he stupid'/
    Data TX( 292)(1:70)/ &
     '*         way that X-11 defines and uses "True". It is defined as 1, a'/
    Data TX( 292)(71:) / &
     'nd not'/
    Data TX( 293)(1:70)/ &
     '*         "~0" which is the "proper" ANSI-C way of doing things. This '/
    Data TX( 293)(71:) / &
     'causes a'/
    Data TX( 294)(1:70)/ &
     '*         problem with event input, probably owing to "XSendEvent" usi'/
    Data TX( 294)(71:) / &
     'ng "True".'/
    Data TX( 295) / &
      '*         So for X-11 "True" is re-defined to 1. X-11 input now works'/
    Data TX( 296) / &
      '*         (Hammersley)'/
    Data TX( 297)(1:70)/ &
     '*       25-Feb-2004: V12.022 Correct output region for spatial correct'/
    Data TX( 297)(71:) / &
     'ion'/
    Data TX( 298)(1:70)/ &
     '*         of regions not starting at pixel 1. Correct crash owing to w'/
    Data TX( 298)(71:) / &
     'eak peak'/
    Data TX( 299)(1:70)/ &
     '*         algorithm suffering from rounding errors leading to calculat'/
    Data TX( 299)(71:) / &
     'ion'/
    Data TX( 300)(1:70)/ &
     '*         of the square root of a negative number. Support right-hand '/
    Data TX( 300)(71:) / &
     'side'/
    Data TX( 301)(1:69)/ &
     '*         menus for lanspace orientated windows. Fix error in ''PROJEC'/
    Data TX( 301)(70:) / &
     'TION'''/
    Data TX( 302) / &
      '*         command for coordinate input (Hammersley)'/
    Data TX( 303)(1:70)/ &
     '*       26-Feb-2004: V12.023 Test spatial distortion correction for of'/
    Data TX( 303)(71:) / &
     'fset'/
    Data TX( 304) / &
      '*         images (Hammersley)'/
    Data TX( 305)(1:68)/ &
     '*       27-Feb-2004: V12.024 Add ''BLOCK COPY'' command to keyboard me'/
    Data TX( 305)(69:) / &
     'nu'/
    Data TX( 306) / &
      '*         for more efficient access to internal memories (Hammersley)'/
    Data TX( 307) / &
      '*       01-Mar-2004: V12.025 Set default value for output file name in'/
    Data TX( 308) / &
      '*         keyboard menu (Hammersley)'/
    Data TX( 309) / &
      '*       02-Mar-2004: V12.026 Fix start-up problem for X-11 version, as'/
    Data TX( 310)(1:70)/ &
     '*         colour table was not defined to default prior to creating gr'/
    Data TX( 310)(71:) / &
     'aphics'/
    Data TX( 311) / &
      '*         window (Hammersley)'/
    Data TX( 312) / &
      '*       03-Mar-2004: V12.027 Correct left to right precedence ordering'/
    Data TX( 313)(1:69)/ &
     '*         of arithmetic operations in expression evaluations. Add ''SE'/
    Data TX( 313)(70:) / &
     'T-UP'''/
    Data TX( 314)(1:70)/ &
     '*         interface with possibility to over-ride file header informat'/
    Data TX( 314)(71:) / &
     'ion.'/
    Data TX( 315) / &
      '*         Up-date internal help information. (Hammersley)'/
    Data TX( 316) / &
      ' ' /
    Data TX( 317) / &
      '---------------------------'/
    Data TX( 318) / &
      'FROM FIT2D VERSION 11 TO 12'/
    Data TX( 319) / &
      '---------------------------'/
    Data TX( 320) / &
      ' ' /
    Data TX( 321)(1:70)/ &
     'From Version 11: Windows XP becomes the best supported and tested vers'/
    Data TX( 321)(71:) / &
     'ion.'/
    Data TX( 322)(1:70)/ &
     'A Macintosh OSX version is available. Correction to bug when using neg'/
    Data TX( 322)(71:) / &
     'ative'/
    Data TX( 323) / &
      'angle ranges in "CAKE" menu.'/
    Data TX( 324) / &
      ' ' /
    Data TX( 325)(1:70)/ &
     '*       11-Apr-2003: V11.001 Allow sample to detector distances of up '/
    Data TX( 325)(71:) / &
     'to 100m'/
    Data TX( 326) / &
      '*        (Hammersley)'/
    Data TX( 327)(1:70)/ &
     '*       14-Apr-2003: V11.002 Correct bug(let) when 0 rotation and 0 tr'/
    Data TX( 327)(71:) / &
     'anslation'/
    Data TX( 328)(1:70)/ &
     '*        transform applied to data. Investigate problem inputting BSL '/
    Data TX( 328)(71:) / &
     'files'/
    Data TX( 329) / &
      '*        with extension "308" (Hammersley)'/
    Data TX( 330)(1:70)/ &
     '*       15-Apr-2003: V11.003 Remove file input diagnostics and re-comp'/
    Data TX( 330)(71:) / &
     'ile'/
    Data TX( 331) / &
      '*        optimised version (Hammersley)'/
    Data TX( 332)(1:70)/ &
     '*       27-May-2003: V11.004 Investigating problem with negative range'/
    Data TX( 332)(71:) / &
     ' angles'/
    Data TX( 333) / &
      '*        in Cake integration (Hammersley)'/
    Data TX( 334)(1:70)/ &
     '*       04-Jul-2003: V11.005 Investigate problem with peak search cras'/
    Data TX( 334)(71:) / &
     'h. In'/
    Data TX( 335)(1:70)/ &
     '*        fact only old version crashes, but no obvious changes have be'/
    Data TX( 335)(71:) / &
     'en'/
    Data TX( 336) / &
      '*        made to code (?). (Hammersley)'/
    Data TX( 337) / &
      '*       08-Jul-2003: V11.006 Change Mar input code owing to problem'/
    Data TX( 338)(1:69)/ &
     '*        inputting re-written Mar files i.e. files written by ''automa'/
    Data TX( 338)(70:) / &
     'r''.'/
    Data TX( 339)(1:69)/ &
     '*        Result: the Mar file header appears to be incorrect. It''s co'/
    Data TX( 339)(70:) / &
     'ded for'/
    Data TX( 340)(1:70)/ &
     '*        uncompressed data, whereas the data is clearly compressed. Ac'/
    Data TX( 340)(71:) / &
     'cording'/
    Data TX( 341)(1:70)/ &
     '*        to Claudio Klein all Mar345 files are compressed, so set comp'/
    Data TX( 341)(71:) / &
     'ression'/
    Data TX( 342) / &
      '*        (Hammersley)'/
    Data TX( 343)(1:68)/ &
     '*       11-Jul-2003: V11.007 Change format in ''f2d_cal2_cake'' owing '/
    Data TX( 343)(69:) / &
     'to Mac OSX'/
    Data TX( 344)(1:70)/ &
     '*        crash. Mac OSX user test version. Correct powder ring out-lie'/
    Data TX( 344)(71:) / &
     'r'/
    Data TX( 345) / &
      '*        rejection code, which was not rejecting the right positions'/
    Data TX( 346) / &
      '*        (Hammersley)'/
    Data TX( 347)(1:68)/ &
     '*       16-Jul-2003: V11.008 Add recognition of ''.mar1800'' files (Ha'/
    Data TX( 347)(69:) / &
     'mmersley)'/
    Data TX( 348)(1:70)/ &
     '*       21-Jul-2003: V11.009 Correct problem with cake not correctly r'/
    Data TX( 348)(71:) / &
     'e-binning'/
    Data TX( 349) / &
      '*        negative angle azimuth ranges (Hammersley)'/
    Data TX( 350)(1:70)/ &
     '*       22-Jul-2003: V11.010 Correct azimuthal range calculation for C'/
    Data TX( 350)(71:) / &
     'AKE'/
    Data TX( 351)(1:70)/ &
     '*         command. Previously, angles before start were being forgotte'/
    Data TX( 351)(71:) / &
     'n'/
    Data TX( 352) / &
      '*         (Hammersley)'/
    Data TX( 353)(1:70)/ &
     '*       01-Aug-2003: V11.011 Problem inputting from directory with 704'/
    Data TX( 353)(71:) / &
     '6 files'/
    Data TX( 354)(1:70)/ &
     '*         owing to limit of 65535 characters in string. Try increasing'/
    Data TX( 354)(71:) / &
     ' limit'/
    Data TX( 355) / &
      '*         to 200000 and check fail message (Hammersley)'/
    Data TX( 356)(1:70)/ &
     '*       06-Aug-2003: V11.012 Test inputting from directory with too ma'/
    Data TX( 356)(71:) / &
     'ny files'/
    Data TX( 357) / &
      '*        (Hammersley)'/
    Data TX( 358)(1:70)/ &
     '*       18-Aug-2003: V11.013 Check that the keyboard 2-theta integrati'/
    Data TX( 358)(71:) / &
     'on gives'/
    Data TX( 359) / &
      '*         the same results as the GUI (Hammersley)'/
    Data TX( 360)(1:70)/ &
     '*       02-Oct-2003: V11.014 Re-compile for Windows-XP system (Hammers'/
    Data TX( 360)(71:) / &
     'ley)'/
    Data TX( 361)(1:70)/ &
     '*       10-Oct-2003: V11.015 Re-compile for Linux Suse 8.2 system (Ham'/
    Data TX( 361)(71:) / &
     'mersley)'/
    Data TX( 362) / &
      '*       22-Oct-2003: V11.016 Changes to "Io_input_key" (Hammersley)'/
    Data TX( 363)(1:70)/ &
     '*       29-Oct-2003: V11.017 Option of re-directing input to command f'/
    Data TX( 363)(71:) / &
     'or pipe'/
    Data TX( 364) / &
      '*         sub-process control (Hammersley)'/
    Data TX( 365) / &
      '*       31-Oct-2003: V11.018 Test re-directed input (Hammersley)'/
    Data TX( 366) / &
      '*       03-Nov-2003: V11.019 Correct command line input (Hammersley)'/
    Data TX( 367) / &
      ' ' /
    Data TX( 368) / &
      '---------------------------'/
    Data TX( 369) / &
      'FROM FIT2D VERSION 10 TO 11'/
    Data TX( 370) / &
      '---------------------------'/
    Data TX( 371) / &
      ' ' /
    Data TX( 372) / &
      'From Version 10: WindowsNT and Windows~9X support became available.'/
    Data TX( 373) / &
      ' ' /
    Data TX( 374) / &
      'The "symbol" system was replaced by the "variable" system. The'/
    Data TX( 375) / &
      '"variable" system allows internal program variables to'/
    Data TX( 376) / &
      'be defined from the command-line or within FIT2D and used within'/
    Data TX( 377) / &
      'macros to allow attempts like file names  to be automatically varied.'/
    Data TX( 378) / &
      'The "variable" system is very similar to the previous "symbol"'/
    Data TX( 379) / &
      'system, but variables have the concept of type i.e. a variable may be'/
    Data TX( 380)(1:70)/ &
     'an integer value, a logical (boolean) state value, a floating point re'/
    Data TX( 380)(71:) / &
     'al'/
    Data TX( 381) / &
      'value, or a character string value. The commands "DEFINE SYMBOL",'/
    Data TX( 382) / &
      '"SYMBOL", "LIST SYMBOLS" and "UN-DEFINE SYMBOL" have been replaced'/
    Data TX( 383) / &
      'by the commands "DEFINE VARIABLE", "VARIABLE", "LIST VARIABLES" and'/
    Data TX( 384) / &
      '"UN-DEFINE VARIABLE". The "DEFINE VARIABLE" / "VARIABLE" command'/
    Data TX( 385) / &
      'now prompts for the type of variable to be defined. (The "SYMBOL"'/
    Data TX( 386) / &
      'command is now an alias for the "DEFINE VARIABLE" command.'/
    Data TX( 387) / &
      ' ' /
    Data TX( 388) / &
      '--------------------------'/
    Data TX( 389) / &
      'FROM FIT2D VERSION 9 TO 10'/
    Data TX( 390) / &
      '--------------------------'/
    Data TX( 391) / &
      ' ' /
    Data TX( 392) / &
      '-------------------------'/
    Data TX( 393) / &
      'FROM FIT2D VERSION 8 TO 9'/
    Data TX( 394) / &
      '-------------------------'/
    Data TX( 395) / &
      ' ' /
    Data TX( 396) / &
      'FIT2D Version 9 contains no commercial code. In particular the last'/
    Data TX( 397)(1:70)/ &
     'remaining calls to NAG routines have been replaced with calls to publi'/
    Data TX( 397)(71:) / &
     'c'/
    Data TX( 398) / &
      'domain software e.g. FITPACK, or new code has been written. In some'/
    Data TX( 399)(1:70)/ &
     'cases this has meant that the underlying algorithm has also been chang'/
    Data TX( 399)(71:) / &
     'ed.'/
    Data TX( 400)(1:70)/ &
     'It is hoped that overall this will be both more efficient and better t'/
    Data TX( 400)(71:) / &
     'han'/
    Data TX( 401) / &
      'before. However, it is important to realise that some results will be'/
    Data TX( 402) / &
      'different and may in some circumstances by less appropriate than'/
    Data TX( 403) / &
      'before.'/
    Data TX( 404) / &
      ' ' /
    Data TX( 405) / &
      'Distortion Fitting'/
    Data TX( 406) / &
      '------------------'/
    Data TX( 407) / &
      ' ' /
    Data TX( 408) / &
      'The code to perform the fitting and interpolation of the spatial'/
    Data TX( 409) / &
      'distortion "surfaces" has been changed to use FITPACK routines, which'/
    Data TX( 410) / &
      'are public domain. These are in fact the source of the routines used'/
    Data TX( 411)(1:70)/ &
     'previously, so the algorithm is exactly as before. Only slight differe'/
    Data TX( 411)(71:) / &
     'nces'/
    Data TX( 412) / &
      'in information or error messages should be noticable. The routine'/
    Data TX( 413)(1:70)/ &
     'which calculates the spline surface has been optimised and is now abou'/
    Data TX( 413)(71:) / &
     't'/
    Data TX( 414) / &
      '30% faster.'/
    Data TX( 415) / &
      ' ' /
    Data TX( 416) / &
      'General Fitting and minimisation'/
    Data TX( 417) / &
      '--------------------------------'/
    Data TX( 418) / &
      ' ' /
    Data TX( 419) / &
      'A new minimisation algorithm has been implemented. This is similar to'/
    Data TX( 420) / &
      'the old algorithm, but slightly different in a number of ways, so'/
    Data TX( 421) / &
      'the number of iterations may increase in some case. Tests so far show'/
    Data TX( 422) / &
      'the final convergence to be at least equal to the previous routine, in'/
    Data TX( 423) / &
      'most cases slightly better.'/
    Data TX( 424) / &
      ' ' /
    Data TX( 425) / &
      'The graphical input of the fit model has been changed to remove'/
    Data TX( 426) / &
      'unnecessary questions, and confirm more to the "GUI" interface which'/
    Data TX( 427) / &
      'is gradually extending to cover more and more of the functionality of'/
    Data TX( 428)(1:70)/ &
     'FIT2D. (The input of a "background" fitting 2-D polynomial has also be'/
    Data TX( 428)(71:) / &
     'en'/
    Data TX( 429) / &
      'changed; see above.)'/
    Data TX( 430) / &
      ' ' /
    Data TX( 431) / &
      'When initialising the fit model, the entered features are subtracted'/
    Data TX( 432) / &
      'successively from the data. The resulting "residuals" are left in the'/
    Data TX( 433) / &
      '"memory" when the model has been entered. (Previously, the "memory"'/
    Data TX( 434) / &
      'contained the model. The command "MODEL" will calculate the current'/
    Data TX( 435) / &
      'model in the "memory".)'/
    Data TX( 436) / &
      ' ' /
    Data TX( 437) / &
      '2-D polynomial Fitting'/
    Data TX( 438) / &
      '----------------------'/
    Data TX( 439) / &
      ' ' /
    Data TX( 440) / &
      'Chebyshev polynomial fitting is now used instead of the previous power'/
    Data TX( 441)(1:70)/ &
     'order polynomial definition. This should be much more stable numerical'/
    Data TX( 441)(71:) / &
     'ly'/
    Data TX( 442) / &
      'and allow higher order polynomials to be successfully fitted. However,'/
    Data TX( 443) / &
      'this means old fit parameter files (from version 8 or before) are not'/
    Data TX( 444) / &
      'compatible with FIT2D version 9.*.'/
    Data TX( 445) / &
      ' ' /
    Data TX( 446) / &
      '"SURFACE INTERPOLATION"'/
    Data TX( 447) / &
      '-----------------------'/
    Data TX( 448) / &
      ' ' /
    Data TX( 449) / &
      'The "SURFACE INTERPOLATION" command in the keyboard menu has been c'/
    Data TX( 450) / &
      'changed to fit a bi-cubic spline instead of a polynomial. (If needed,'/
    Data TX( 451) / &
      'the choice of spline or polynomial fitting could be added.)'/
    Data TX( 452) / &
      ' ' /
    Data TX( 453) / &
      '"SURFACE POLYNOMIAL"'/
    Data TX( 454) / &
      '--------------------'/
    Data TX( 455) / &
      ' ' /
    Data TX( 456) / &
      'The "SURFACE POLYNOMIAL" command within the "FIT" keyboard sub-menu'/
    Data TX( 457) / &
      'should now be much faster. The code has been re-written, but uses the'/
    Data TX( 458) / &
      'same algorithm as before, so the results should be equivalent.'/
    Data TX( 459) / &
      ' ' /
    Data TX( 460) / &
      '-------------------------'/
    Data TX( 461) / &
      'FROM FIT2D VERSION 7 TO 8'/
    Data TX( 462) / &
      '-------------------------'/
    Data TX( 463) / &
      ' ' /
    Data TX( 464) / &
      'FIT2D Version 8 uses a "Graphical User Interface" as the default'/
    Data TX( 465) / &
      'interface. To obtain the previous "Keyboard Interface" the option'/
    Data TX( 466) / &
      '''-key'' can be used on the command line when starting FIT2D: e.g.'/
    Data TX( 467) / &
      ' ' /
    Data TX( 468) / &
      '> fit2d -key'/
    Data TX( 469) / &
      ' ' /
    Data TX( 470)(1:70)/ &
     'or the main graphical menu includes the "button": "KEYBOARD INTERFACE"'/
    Data TX( 470)(71:) / &
     '.'/
    Data TX( 471) / &
      ' ' /
    Data TX( 472) / &
      'Thus, all the commands of version 7 and before and fully available, as'/
    Data TX( 473)(1:70)/ &
     'when as a number of additional possibilities which are available throu'/
    Data TX( 473)(71:) / &
     'gh'/
    Data TX( 474) / &
      'the graphical interfaces.'/
    Data TX( 475) / &
      ' ' /
    Data TX( 476) / &
      '-------------------------'/
    Data TX( 477) / &
      'FROM FIT2D VERSION 6 TO 7'/
    Data TX( 478) / &
      '-------------------------'/
    Data TX( 479) / &
      ' ' /
    Data TX( 480) / &
      'FIT2D version 7 no longer uses the commercial GPHIGS graphics system.'/
    Data TX( 481) / &
      'A simple efficient graphics system has been written with present'/
    Data TX( 482) / &
      'support for X-window and PostScript output. This makes distribution'/
    Data TX( 483) / &
      'much easier, and results in much faster start-up and graphics output,'/
    Data TX( 484) / &
      'and much smaller and faster to print PostScript files.'/
    Data TX( 485) / &
      ' ' /
    Data TX( 486) / &
      'Changes in style in interactive "buttons" will be apparent, but the'/
    Data TX( 487) / &
      'style of graphics output should be identical or superior. (e.g. Axis'/
    Data TX( 488) / &
      'enumeration is better centred.)'/
    Data TX( 489) / &
      ' ' /
    Data TX( 490) / &
      '-------------------------'/
    Data TX( 491) / &
      'FROM FIT2D VERSION 5 TO 6'/
    Data TX( 492) / &
      '-------------------------'/
    Data TX( 493) / &
      ' ' /
    Data TX( 494) / &
      'FIT2D version 6 supports non-square pixels for many operations.'/
    Data TX( 495) / &
      ' ' /
    Data TX( 496) / &
      '-------------------------'/
    Data TX( 497) / &
      'FROM FIT2D VERSION 4 TO 5'/
    Data TX( 498) / &
      '-------------------------'/
    Data TX( 499) / &
      ' ' /
    Data TX( 500) / &
      'FIT2D version 5 optional creation of "memory" arrays, necessiating'/
    Data TX( 501) / &
      'changes to many commands.'/
    Data TX( 502) / &
      ' ' /
    Data TX( 503)(1:70)/ &
     'This allows larger images to be viewed without problems of insufficien'/
    Data TX( 503)(71:) / &
     't'/
    Data TX( 504) / &
      'system memory. However, many operations cannot work when the "memory"'/
    Data TX( 505) / &
      'array are not created, so will give error messages.'/
    Data TX( 506) / &
      ' ' /
    Data TX( 507) / &
      '-------------------------'/
    Data TX( 508) / &
      'FROM FIT2D VERSION 3 TO 4'/
    Data TX( 509) / &
      '-------------------------'/
    Data TX( 510) / &
      ' ' /
    Data TX( 511) / &
      'History re-call, command editing, and file name completion supported.'/
    Data TX( 512) / &
      ' ' /
    Data TX( 513) / &
      '-------------------------'/
    Data TX( 514) / &
      'FROM FIT2D VERSION 2 TO 3'/
    Data TX( 515) / &
      '-------------------------'/
    Data TX( 516) / &
      ' ' /
    Data TX( 517) / &
      'The error arrays, if created, now contain variance estimates instead'/
    Data TX( 518) / &
      'of the previous standard deviations. In almost all cases of error'/
    Data TX( 519) / &
      'propagation, and where the error estimates are used, this is more'/
    Data TX( 520) / &
      'efficient.'/
    Data TX( 521) / &
      ' ' /
    Data TX( 522) / &
      '-------------------------'/
    Data TX( 523) / &
      'FROM FIT2D VERSION 1 TO 2'/
    Data TX( 524) / &
      '-------------------------'/
    Data TX( 525) / &
      ' ' /
    Data TX( 526) / &
      'Port from VMS to Unix system, and replace previous GKS based graphics'/
    Data TX( 527) / &
      'to PHIGS based graphics. (Of the two changes the change to PHIGS is'/
    Data TX( 528) / &
      'by far the bigger change.)'/
    Data TX( 529) / &
      ' ' /
    Data TX( 530) / &
      '---------------'/
    Data TX( 531) / &
      'FIT2D VERSION 1'/
    Data TX( 532) / &
      '---------------'/
    Data TX( 533) / &
      ' ' /
    Data TX( 534) / &
      '(For historical interest.)'/
    Data TX( 535) / &
      ' ' /
    Data TX( 536) / &
      '*	03-May-1988: V0.1 Original, based on MFIT (HAMMERSLEY)'/
    Data TX( 537) / &
      ' ' /
    Data TX( 538) / &
      '---------------------------'/
    Data TX( 539) / &
      'END OF VERSION CHANGES TEXT'/
    Data TX( 540) / &
      '---------------------------'/
    Data TX( 541) / &
      ' ' /
!--------1---------2---------3---------4---------5---------6---------7---------8
! Check status value
    If (status .Eq. St_good()) Then
       If (gui) Then
 
          Call LG_INQ_TEXTFONT (font_index, status)
 
          Call LG_TEXTFONT (2, status)
 
          Call GS_MESSAGE (Max_lines, Max_lines, TX, status)
 
          Call LG_TEXTFONT (font_index, status)
 
       Else
          Call IO_TEXT (Max_lines, TX, status)
       End If
    End If

    End Subroutine F2D_CHANGES
!********1*********2*********3*********4*********5*********6*********7*********8
