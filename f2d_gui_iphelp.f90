!********1*********2*********3*********4*********5*********6*********7*********8

!               f2d_gui_iphelp.f90

! DO NOT ALTER THIS FILE

!  This file has been created automatically by "maketext"
!  from the ASCII text file:  f2d_gui_iphelp.text 
!  which should be edited and maketext should be re-run to 
!  create a new version of the subroutine.

!+ F2D_GUI_IPHELP interactive user help/message display facility
    Subroutine F2D_GUI_IPHELP (gui, status)

! Type Definitions:
    Implicit None

! Usage:
!   Private

! Import:
    Logical gui ! .True., if GUI is to be used
! Status:
    Integer status ! Status return variable

! Local Constants:
    Integer, Parameter :: Max_chars =  49 ! Maximum characters per line 
    Integer, Parameter :: Max_lines  =  132 ! Number of lines in message
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
      '        ---------------------------------'/
    Data TX(   3) / &
      '        Welcome to the FIT2D Image'/
    Data TX(   4) / &
      '        Processing Graphical Menu'/
    Data TX(   5) / &
      '        ---------------------------------'/
    Data TX(   6) / &
      ' ' /
    Data TX(   7) / &
      'The commands here allow you to input data from'/
    Data TX(   8) / &
      'files (INPUT), to view them (DISPLAY),'/
    Data TX(   9) / &
      'perform mathematical operations (MATHS),'/
    Data TX(  10) / &
      'apply geometrical transformations (GEOMETRIC),'/
    Data TX(  11) / &
      'or "filtering" operations (FILTER), and'/
    Data TX(  12) / &
      'output analysed data (OUTPUT). Many of the'/
    Data TX(  13) / &
      'buttons will start sub-menus.'/
    Data TX(  14) / &
      ' ' /
    Data TX(  15) / &
      'Generally data analysis will start by using the'/
    Data TX(  16) / &
      '"INPUT" command to input data from file.'/
    Data TX(  17) / &
      '(Most of the options will not work until data'/
    Data TX(  18) / &
      'has been input or otherwise created.)'/
    Data TX(  19) / &
      ' ' /
    Data TX(  20) / &
      'Some operations (i.e. binary ones) require two'/
    Data TX(  21) / &
      'images to be input. This is achieved by first'/
    Data TX(  22) / &
      'inputting one image in the "program array" and'/
    Data TX(  23) / &
      'transferring it to the "memory array" using the'/
    Data TX(  24) / &
      '"EXCHANGE" command. A second image can then be'/
    Data TX(  25) / &
      'loaded into the "program array" by using'/
    Data TX(  26) / &
      '"INPUT" again. Once two images are present, they'/
    Data TX(  27) / &
      'can be swapped by using the "EXCHANGE" command.'/
    Data TX(  28) / &
      ' ' /
    Data TX(  29) / &
      'Note: All commands, except "EXCHANGE" only work'/
    Data TX(  30) / &
      'on the current "Region of Interest" (ROI).'/
    Data TX(  31) / &
      ' ' /
    Data TX(  32) / &
      ' ' /
    Data TX(  33) / &
      '                          COMMANDS'/
    Data TX(  34) / &
      '                          ----------------'/
    Data TX(  35) / &
      ' ' /
    Data TX(  36) / &
      '"EXIT": exit "IMAGE PROCESSING" interface and'/
    Data TX(  37) / &
      'return to top Interface/Mode menu.'/
    Data TX(  38) / &
      ' ' /
    Data TX(  39) / &
      '"DISPLAY": starts a sub-menu which allows various'/
    Data TX(  40) / &
      'different formas of display of the image e.g.'/
    Data TX(  41) / &
      '3-D views, contour plot, as well as allowing'/
    Data TX(  42) / &
      'slices, and projections through the data to be'/
    Data TX(  43) / &
      'defined. Number fields may be extracted.'/
    Data TX(  44) / &
      ' ' /
    Data TX(  45) / &
      '"EXCHANGE": transfers an image from the "main'/
    Data TX(  46) / &
      'program array" to the "memory array", and the'/
    Data TX(  47) / &
      'inverse if the "memory array" already contains'/
    Data TX(  48) / &
      'data. This is useful to "charge" the "memory"'/
    Data TX(  49) / &
      'with data for binary operations.'/
    Data TX(  50) / &
      ' ' /
    Data TX(  51) / &
      '"FILTER": starts a sub-menu which allows'/
    Data TX(  52) / &
      'various filtering and smoothing of the data.'/
    Data TX(  53) / &
      ' ' /
    Data TX(  54) / &
      '"?": Brief explanation of available commands.'/
    Data TX(  55) / &
      ' ' /
    Data TX(  56) / &
      '"FULL": Sets the extent of the "Region Of'/
    Data TX(  57) / &
      'Interest (ROI)" to be the whole of the currently'/
    Data TX(  58) / &
      'defined data. This may be useful after the'/
    Data TX(  59) / &
      '"ZOOM-IN" command.'/
    Data TX(  60) / &
      ' ' /
    Data TX(  61) / &
      '"GEOMETRIC": starts a sub-menu which allows'/
    Data TX(  62) / &
      'various geometrical transformations to be'/
    Data TX(  63) / &
      'applied to the data.'/
    Data TX(  64) / &
      ' ' /
    Data TX(  65) / &
      '"INPUT": starts an interactive file'/
    Data TX(  66) / &
      'selection tool to allow selection of'/
    Data TX(  67) / &
      'directories, and of a file for input.'/
    Data TX(  68) / &
      ' ' /
    Data TX(  69) / &
      '"HELP": This help text.'/
    Data TX(  70) / &
      ' ' /
    Data TX(  71) / &
      '"OPTIONS": starts a sub-menu which allows'/
    Data TX(  72) / &
      'various display options to be modified, and'/
    Data TX(  73) / &
      'control of the graphical output style.'/
    Data TX(  74) / &
      ' ' /
    Data TX(  75) / &
      '"OUTPUT": allows the current "Region Of'/
    Data TX(  76) / &
      'Interest (ROI)" to be saved in a file.'/
    Data TX(  77) / &
      'The user is given a choice of file formats'/
    Data TX(  78) / &
      'in which to save the data.'/
    Data TX(  79) / &
      ' ' /
    Data TX(  80) / &
      '"MATHS": starts a sub-menu which allows'/
    Data TX(  81) / &
      'various unitary and binary mathematical'/
    Data TX(  82) / &
      'operations to be performed pixel by pixel'/
    Data TX(  83) / &
      'on the data.'/
    Data TX(  84) / &
      ' ' /
    Data TX(  85) / &
      '"PRINT" may used to save the currently'/
    Data TX(  86) / &
      'displayed data image as a PostScript'/
    Data TX(  87) / &
      'file. You are prompted for the name of'/
    Data TX(  88) / &
      'the output file to create. After the'/
    Data TX(  89) / &
      'file is fully written, it may be sent'/
    Data TX(  90) / &
      'to a PostScript printer for printing.'/
    Data TX(  91) / &
      'Note: It can take some time to create'/
    Data TX(  92) / &
      'a file of a large 2-D data-set, and'/
    Data TX(  93) / &
      'often even longer for the file to be'/
    Data TX(  94) / &
      'printed.'/
    Data TX(  95) / &
      ' ' /
    Data TX(  96) / &
      '"MOVEMENT": starts a sub-menu which'/
    Data TX(  97) / &
      'allows movement within the currently'/
    Data TX(  98) / &
      'defined data.'/
    Data TX(  99) / &
      ' ' /
    Data TX( 100) / &
      '"UN-ZOOM": increases the size of the'/
    Data TX( 101) / &
      'current "Region Of Interest" (ROI).'/
    Data TX( 102) / &
      ' ' /
    Data TX( 103) / &
      '"ZOOM-IN" allows a sub-region of the data'/
    Data TX( 104) / &
      'to be selected and displayed. It should'/
    Data TX( 105) / &
      'be noted that ALL OPERATIONS INCLUDING'/
    Data TX( 106) / &
      '"OUTPUT" ONLY WORK ON THE CURRENT'/
    Data TX( 107) / &
      'SELECTED REGION. Care needs to be taken'/
    Data TX( 108) / &
      'when using "ZOOM-IN" that subsequent'/
    Data TX( 109) / &
      'operations are intended for only the'/
    Data TX( 110) / &
      'current sub-region. The full available'/
    Data TX( 111) / &
      'data region may be selected by using'/
    Data TX( 112) / &
      'the "FULL" button.'/
    Data TX( 113) / &
      ' ' /
    Data TX( 114) / &
      '"Z-SCALING" starts a sub-menu which'/
    Data TX( 115) / &
      'allows the false colour/ grey scale'/
    Data TX( 116) / &
      'used to display image intensities to'/
    Data TX( 117) / &
      'be changed. Different automatic and'/
    Data TX( 118) / &
      'fixed scaling methods can be selected.'/
    Data TX( 119) / &
      ' ' /
    Data TX( 120) / &
      ' ' /
    Data TX( 121) / &
      'Further help is available within the FIT2D'/
    Data TX( 122) / &
      'Reference Manual. This manual is available'/
    Data TX( 123) / &
      'by the web from the FIT2D home page URL:'/
    Data TX( 124) / &
      ' ' /
    Data TX( 125) / &
      'http://www.esrf.fr/computing/scientific/FIT2D/'/
    Data TX( 126) / &
      ' ' /
    Data TX( 127) / &
      '-------------------------'/
    Data TX( 128) / &
      'END OF HELP TEXT'/
    Data TX( 129) / &
      '-------------------------'/
    Data TX( 130) / &
      ' ' /
    Data TX( 131) / &
      ' ' /
    Data TX( 132) / &
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

    End Subroutine F2D_GUI_IPHELP
!********1*********2*********3*********4*********5*********6*********7*********8
