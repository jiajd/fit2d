!********1*********2*********3*********4*********5*********6*********7*********8

!               f2d_gui_2dfithelp.f90

! DO NOT ALTER THIS FILE

!  This file has been created automatically by "maketext"
!  from the ASCII text file:  f2d_gui_2dfithelp.text 
!  which should be edited and maketext should be re-run to 
!  create a new version of the subroutine.

!+ F2D_GUI_2DFITHELP interactive user help/message display facility
    Subroutine F2D_GUI_2DFITHELP (gui, status)

! Type Definitions:
    Implicit None

! Usage:
!   Private

! Import:
    Logical gui ! .True., if GUI is to be used
! Status:
    Integer status ! Status return variable

! Local Constants:
    Integer, Parameter :: Max_chars =  50 ! Maximum characters per line 
    Integer, Parameter :: Max_lines  =   86 ! Number of lines in message
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
      '           ----------------------------------'/
    Data TX(   3) / &
      '           Welcome to the FIT2D 2-D'/
    Data TX(   4) / &
      '           FITTING Graphical Menu'/
    Data TX(   5) / &
      '           ----------------------------------'/
    Data TX(   6) / &
      ' ' /
    Data TX(   7) / &
      'The commands here allow you to input data from'/
    Data TX(   8) / &
      'files  ("INPUT"),  to  fit a model of peak and'/
    Data TX(   9) / &
      'other functions to a 1-D data-set, and then to'/
    Data TX(  10) / &
      'apply the same fit model to multiple 1-D datasets.'/
    Data TX(  11) / &
      ' ' /
    Data TX(  12) / &
      'Generally data analysis will start by using the'/
    Data TX(  13) / &
      '"INPUT" command to input data from file.'/
    Data TX(  14) / &
      '(Most of the options will not work until data'/
    Data TX(  15) / &
      'has been input or otherwise created.)'/
    Data TX(  16) / &
      ' ' /
    Data TX(  17) / &
      'Occasionally the "IMAGE PROCESSING'/
    Data TX(  18) / &
      '(GENERAL)" interface will be useful to'/
    Data TX(  19) / &
      'allow such operations as subtracting one'/
    Data TX(  20) / &
      'image from another prior to further analysis'/
    Data TX(  21) / &
      'in this menu.'/
    Data TX(  22) / &
      ' ' /
    Data TX(  23) / &
      'Having "INPUT" the data, the next operation'/
    Data TX(  24) / &
      'is normally to enter a fitting model using'/
    Data TX(  25) / &
      'the "INITIALISE" button. This allows a'/
    Data TX(  26) / &
      'fitting model to be built up out of a number'/
    Data TX(  27) / &
      'of different "peak" functions e.g. Gaussian,'/
    Data TX(  28) / &
      'Lorentzian, Voigtian, and a "background"'/
    Data TX(  29) / &
      'polynomial or other functions. Initialise'/
    Data TX(  30) / &
      'values of the fitting model are defined.'/
    Data TX(  31) / &
      ' ' /
    Data TX(  32) / &
      'Having defined an initial fit model this'/
    Data TX(  33) / &
      'can be optimised using the "OPTIMISE"'/
    Data TX(  34) / &
      'button. This will try to optimise the'/
    Data TX(  35) / &
      'model to the data. The number of iterations'/
    Data TX(  36) / &
      'used and certain other control parameters'/
    Data TX(  37) / &
      'can be changed using the "SET-UP" button'/
    Data TX(  38) / &
      'proir to running or re-running the optimisation.'/
    Data TX(  39) / &
      '"OPTIMISE" may be used several times in a row,'/
    Data TX(  40) / &
      'if required.'/
    Data TX(  41) / &
      ' ' /
    Data TX(  42) / &
      'To help see and interact with the data, the'/
    Data TX(  43) / &
      'button "Z-SCALING" allows the intensity'/
    Data TX(  44) / &
      'limits of displayed data to be changed. A'/
    Data TX(  45) / &
      'number of different fixed or automatically'/
    Data TX(  46) / &
      're-scaling methods are available and a'/
    Data TX(  47) / &
      'choice of linear or logarithm intensity'/
    Data TX(  48) / &
      'representation is available.'/
    Data TX(  49) / &
      ' ' /
    Data TX(  50) / &
      '"ZOOM-IN" allows a sub-region of the data'/
    Data TX(  51) / &
      'to be selected and displayed. It should be'/
    Data TX(  52) / &
      'noted that ALL OPERATIONS INCLUDING'/
    Data TX(  53) / &
      '"OUTPUT" ONLY WORK ON THE CURRENT'/
    Data TX(  54) / &
      'SELECTED REGION. Care needs to be taken'/
    Data TX(  55) / &
      'when using "ZOOM-IN" that subsequent'/
    Data TX(  56) / &
      'operations are intended for only the'/
    Data TX(  57) / &
      'current sub-region. The full available'/
    Data TX(  58) / &
      'data region may be selected by using'/
    Data TX(  59) / &
      'the "FULL" button.'/
    Data TX(  60) / &
      ' ' /
    Data TX(  61) / &
      '"PRINT" may used to save the currently'/
    Data TX(  62) / &
      'displayed data image as a PostScript'/
    Data TX(  63) / &
      'file. You are prompted for the name of'/
    Data TX(  64) / &
      'the output file to create. After the'/
    Data TX(  65) / &
      'file is fully written, it may be sent'/
    Data TX(  66) / &
      'to a PostScript printer for printing.'/
    Data TX(  67) / &
      'Note: It can take some time to create'/
    Data TX(  68) / &
      'a file of a large 2-D data-set, and'/
    Data TX(  69) / &
      'often even longer for the file to be'/
    Data TX(  70) / &
      'printed.'/
    Data TX(  71) / &
      ' ' /
    Data TX(  72) / &
      ' ' /
    Data TX(  73) / &
      'Further help is available within the FIT2D'/
    Data TX(  74) / &
      'Reference Manual. This manual is available'/
    Data TX(  75) / &
      'by the web from the FIT2D home page URL:'/
    Data TX(  76) / &
      ' ' /
    Data TX(  77) / &
      'http://www.esrf.fr/computing/scientific/FIT2D/'/
    Data TX(  78) / &
      ' ' /
    Data TX(  79) / &
      '-------------------------'/
    Data TX(  80) / &
      'END OF HELP TEXT'/
    Data TX(  81) / &
      '-------------------------'/
    Data TX(  82) / &
      ' ' /
    Data TX(  83) / &
      ' ' /
    Data TX(  84) / &
      ' ' /
    Data TX(  85) / &
      ' ' /
    Data TX(  86) / &
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

    End Subroutine F2D_GUI_2DFITHELP
!********1*********2*********3*********4*********5*********6*********7*********8
