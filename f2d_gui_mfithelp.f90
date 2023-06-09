!********1*********2*********3*********4*********5*********6*********7*********8

!               f2d_gui_mfithelp.f90

! DO NOT ALTER THIS FILE

!  This file has been created automatically by "maketext"
!  from the ASCII text file:  f2d_gui_mfithelp.text 
!  which should be edited and maketext should be re-run to 
!  create a new version of the subroutine.

!+ F2D_GUI_MFITHELP interactive user help/message display facility
    Subroutine F2D_GUI_MFITHELP (gui, status)

! Type Definitions:
    Implicit None

! Usage:
!   Private

! Import:
    Logical gui ! .True., if GUI is to be used
! Status:
    Integer status ! Status return variable

! Local Constants:
    Integer, Parameter :: Max_chars =  46 ! Maximum characters per line 
    Integer, Parameter :: Max_lines  =  144 ! Number of lines in message
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
      '              -------------------------------'/
    Data TX(   3) / &
      '              Welcome to the FIT2D MFIT'/
    Data TX(   4) / &
      '              (MULTIPLE 1-D FITTING)'/
    Data TX(   5) / &
      '              Graphical Menu'/
    Data TX(   6) / &
      '              -------------------------------'/
    Data TX(   7) / &
      ' ' /
    Data TX(   8) / &
      ' ' /
    Data TX(   9) / &
      'SUMMARY'/
    Data TX(  10) / &
      '--------------'/
    Data TX(  11) / &
      ' ' /
    Data TX(  12) / &
      'The commands here allow you to input data'/
    Data TX(  13) / &
      'from files  ("INPUT"), to enter an initial'/
    Data TX(  14) / &
      'fit model ("INITIALISE"), to optimise the'/
    Data TX(  15) / &
      'fit model to the data ("OPTIMISE"), and to'/
    Data TX(  16) / &
      'view the fitted parameters and deduced results'/
    Data TX(  17) / &
      '("RESULT"). It is also possible to not fit'/
    Data TX(  18) / &
      'specified regions of the data by using the'/
    Data TX(  19) / &
      '"MASK" sub-menu to "mask-out" data points.'/
    Data TX(  20) / &
      'A fit model may be applied to many spectra'/
    Data TX(  21) / &
      'automatically.'/
    Data TX(  22) / &
      ' ' /
    Data TX(  23) / &
      ' ' /
    Data TX(  24) / &
      'DETAILED INFORMATION'/
    Data TX(  25) / &
      '---------------------------------------'/
    Data TX(  26) / &
      ' ' /
    Data TX(  27) / &
      'Generally data analysis will start by using'/
    Data TX(  28) / &
      'the "INPUT" command to input data from file.'/
    Data TX(  29) / &
      '(Most of the options will not work until'/
    Data TX(  30) / &
      'data has been input or otherwise created.)'/
    Data TX(  31) / &
      ' ' /
    Data TX(  32) / &
      'Occasionally the "IMAGE PROCESSING'/
    Data TX(  33) / &
      '(GENERAL)" interface will be useful to'/
    Data TX(  34) / &
      'allow such operations as subtracting one'/
    Data TX(  35) / &
      'image from another prior to further analysis'/
    Data TX(  36) / &
      'in this menu.'/
    Data TX(  37) / &
      ' ' /
    Data TX(  38) / &
      'To help see and interact with the data, the'/
    Data TX(  39) / &
      'button "Z-SCALING" allows the intensity'/
    Data TX(  40) / &
      'limits of displayed data to be changed. A'/
    Data TX(  41) / &
      'number of different fixed or automatically'/
    Data TX(  42) / &
      're-scaling methods are available and a'/
    Data TX(  43) / &
      'choice of linear or logarithm intensity'/
    Data TX(  44) / &
      'representation is available.'/
    Data TX(  45) / &
      ' ' /
    Data TX(  46) / &
      '"ZOOM-IN" allows a sub-region of the data'/
    Data TX(  47) / &
      'to be selected and displayed. It should be'/
    Data TX(  48) / &
      'noted that ALL OPERATIONS INCLUDING'/
    Data TX(  49) / &
      '"OUTPUT" ONLY WORK ON THE CURRENT'/
    Data TX(  50) / &
      'SELECTED REGION. Care needs to be taken'/
    Data TX(  51) / &
      'when using "ZOOM-IN" that subsequent'/
    Data TX(  52) / &
      'operations are intended for only the'/
    Data TX(  53) / &
      'current sub-region. The full available'/
    Data TX(  54) / &
      'data region may be selected by using'/
    Data TX(  55) / &
      'the "FULL" button.'/
    Data TX(  56) / &
      ' ' /
    Data TX(  57) / &
      '"PRINT" may used to save the currently'/
    Data TX(  58) / &
      'displayed data image as a PostScript'/
    Data TX(  59) / &
      'file. You are prompted for the name of'/
    Data TX(  60) / &
      'the output file to create. After the'/
    Data TX(  61) / &
      'file is fully written, it may be sent'/
    Data TX(  62) / &
      'to a PostScript printer for printing.'/
    Data TX(  63) / &
      'Note: It can take some time to create'/
    Data TX(  64) / &
      'a file of a large 2-D data-set, and'/
    Data TX(  65) / &
      'often even longer for the file to be'/
    Data TX(  66) / &
      'printed.'/
    Data TX(  67) / &
      ' ' /
    Data TX(  68) / &
      'Having input data the next stage is'/
    Data TX(  69) / &
      'either to define an initial fitting'/
    Data TX(  70) / &
      'model, or to define "masked-off"'/
    Data TX(  71) / &
      'regions which are not be included in'/
    Data TX(  72) / &
      'fitting. The order in which these two'/
    Data TX(  73) / &
      'operations are performed is not'/
    Data TX(  74) / &
      'important.'/
    Data TX(  75) / &
      ' ' /
    Data TX(  76) / &
      'To define a fit model enter the'/
    Data TX(  77) / &
      '"INITIALISE" sub-menu. This allows'/
    Data TX(  78) / &
      'a variety of functions to be'/
    Data TX(  79) / &
      'specified which build up a fit'/
    Data TX(  80) / &
      'model with initial parameter values.'/
    Data TX(  81) / &
      'The "INITIALISE" sub-menu has its'/
    Data TX(  82) / &
      'own "HELP" text which describes'/
    Data TX(  83) / &
      'this in more detail.'/
    Data TX(  84) / &
      ' ' /
    Data TX(  85) / &
      'If some of the data points are invalid'/
    Data TX(  86) / &
      'or are not to be included in the fitting'/
    Data TX(  87) / &
      'for any other reason then they may be'/
    Data TX(  88) / &
      '"masked-off" using the "MASK" sub-menu.'/
    Data TX(  89) / &
      'This too has its own "HELP" text.'/
    Data TX(  90) / &
      ' ' /
    Data TX(  91) / &
      'Having defined a fit model and optionally'/
    Data TX(  92) / &
      '"masked-off" elements, then the model fit'/
    Data TX(  93) / &
      'may be optimised to the data using the'/
    Data TX(  94) / &
      '"OPTIMISE" command. This command may be'/
    Data TX(  95) / &
      'used repeately, which may be necessary in'/
    Data TX(  96) / &
      'some cases for the algorithm to fully'/
    Data TX(  97) / &
      'converge. (A message will tell you if'/
    Data TX(  98) / &
      'further iterations are thought to be'/
    Data TX(  99) / &
      'necessary.)'/
    Data TX( 100) / &
      ' ' /
    Data TX( 101) / &
      'After the "OPTIMISE" command, the display'/
    Data TX( 102) / &
      'will be replaced with a composite display'/
    Data TX( 103) / &
      'of the data. The upper graph shows the'/
    Data TX( 104) / &
      'data together with error bars if defined,'/
    Data TX( 105) / &
      'and the total fitted model (blue solid'/
    Data TX( 106) / &
      'line), and the separate "features" of the'/
    Data TX( 107) / &
      'fit model (blue dotted lines). The lower'/
    Data TX( 108) / &
      'graph shows the residual mis-fit between'/
    Data TX( 109) / &
      'the model and the data. Note that this'/
    Data TX( 110) / &
      'used a different scale. When this composite'/
    Data TX( 111) / &
      'graph is displayed, the "PRINT" command'/
    Data TX( 112) / &
      'will save a version to a PostScript file.'/
    Data TX( 113) / &
      'The fitted model values are stored in the'/
    Data TX( 114) / &
      '"memory" (overwriting any previous'/
    Data TX( 115) / &
      'values), and may be obtained by using the'/
    Data TX( 116) / &
      '"EXCHANGE" command.'/
    Data TX( 117) / &
      ' ' /
    Data TX( 118) / &
      'After the "OPTIMISE" command the fitted'/
    Data TX( 119) / &
      'parameter values and calculated results'/
    Data TX( 120) / &
      'may be viewed by using the "RESULTS"'/
    Data TX( 121) / &
      'command.'/
    Data TX( 122) / &
      ' ' /
    Data TX( 123) / &
      'The maximum of number of iterations per'/
    Data TX( 124) / &
      'model parameter may be changed using the'/
    Data TX( 125) / &
      '"SET-UP" command. Similarly weighted or'/
    Data TX( 126) / &
      'non-weighted fitting may be selected.'/
    Data TX( 127) / &
      '(Weighted fitting is only available if'/
    Data TX( 128) / &
      'variance arrays and error estimated have'/
    Data TX( 129) / &
      'been defined.)'/
    Data TX( 130) / &
      ' ' /
    Data TX( 131) / &
      'Individual model parameters may be'/
    Data TX( 132) / &
      'constrained or set free using the'/
    Data TX( 133) / &
      '"CONSTRAINTS" command.'/
    Data TX( 134) / &
      ' ' /
    Data TX( 135) / &
      ' ' /
    Data TX( 136) / &
      'Further help is available within the FIT2D'/
    Data TX( 137) / &
      'Reference Manual. This manual is available'/
    Data TX( 138) / &
      'by the web from the FIT2D home page URL:'/
    Data TX( 139) / &
      ' ' /
    Data TX( 140) / &
      'http://www.esrf.fr/computing/scientific/FIT2D/'/
    Data TX( 141) / &
      ' ' /
    Data TX( 142) / &
      '---------------------------'/
    Data TX( 143) / &
      'END OF HELP TEXT'/
    Data TX( 144) / &
      '---------------------------'/
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

    End Subroutine F2D_GUI_MFITHELP
!********1*********2*********3*********4*********5*********6*********7*********8
