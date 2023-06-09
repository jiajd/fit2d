!********1*********2*********3*********4*********5*********6*********7*********8

!               f2d_1dinithelp.f90

! DO NOT ALTER THIS FILE

!  This file has been created automatically by "maketext"
!  from the ASCII text file:  f2d_1dinithelp.text 
!  which should be edited and maketext should be re-run to 
!  create a new version of the subroutine.

!+ F2D_1DINITHELP interactive user help/message display facility
    Subroutine F2D_1DINITHELP (gui, status)

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
    Integer, Parameter :: Max_lines  =   58 ! Number of lines in message
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
      '       -----------------------------------'/
    Data TX(   3) / &
      '       1-D FITTING MODEL INITIALISATION MENU'/
    Data TX(   4) / &
      '       -----------------------------------'/
    Data TX(   5) / &
      ' ' /
    Data TX(   6) / &
      'The commands here allow you to create an initial'/
    Data TX(   7) / &
      'fit model, for optimisation to the data. The'/
    Data TX(   8) / &
      'buttons "GAUSSIAN", "LORENTZIAN", and'/
    Data TX(   9) / &
      '"VOIGTIAN" all allow a peak function to be'/
    Data TX(  10) / &
      'added to the model by clicking on the approximate'/
    Data TX(  11) / &
      'peak maximum, and a position on either side of the'/
    Data TX(  12) / &
      'maximum at half the peak height. From these'/
    Data TX(  13) / &
      'two inputs, initial value for the peak position,'/
    Data TX(  14) / &
      'maximum and half width at half maximum are'/
    Data TX(  15) / &
      'calculated. In the case of the Voigt function'/
    Data TX(  16) / &
      'it is initially assumed to have equal half'/
    Data TX(  17) / &
      'widths for the Gaussian and Lorentz components.'/
    Data TX(  18) / &
      ' ' /
    Data TX(  19) / &
      'The initial peaks will be drawn on top of the'/
    Data TX(  20) / &
      'data using "inverse video".'/
    Data TX(  21) / &
      ' ' /
    Data TX(  22) / &
      'A polynomial function of user defined order may'/
    Data TX(  23) / &
      'also be added to the fit model by clicking on'/
    Data TX(  24) / &
      '"POLYNOMIAL" and entering the required order.'/
    Data TX(  25) / &
      'IT SHOULD BE NOTED THAT UNLIKE THE'/
    Data TX(  26) / &
      'PROGRAM MFIT, THE USER MUST CLICK ON'/
    Data TX(  27) / &
      '"POLYNOMIAL" OR NO POLYNOMIAL WILL BE'/
    Data TX(  28) / &
      'INCLUDED IN THE MODEL.'/
    Data TX(  29) / &
      ' ' /
    Data TX(  30) / &
      'The polynomial is initially fitted to the'/
    Data TX(  31) / &
      'data minus the previously entered peaks,'/
    Data TX(  32) / &
      'thus it is best to enter the polynomial'/
    Data TX(  33) / &
      'after the peaks have been defined.'/
    Data TX(  34) / &
      ' ' /
    Data TX(  35) / &
      'During initialisation of the model it is'/
    Data TX(  36) / &
      'possible to use the "ZOOM IN" and'/
    Data TX(  37) / &
      '"UN-ZOOM" buttons to allow a sub-region'/
    Data TX(  38) / &
      'of the data to be selected and displayed.'/
    Data TX(  39) / &
      'It should be noted that ALL OPERATIONS'/
    Data TX(  40) / &
      'ONLY WORK ON THE CURRENT SELECTED'/
    Data TX(  41) / &
      'REGION, so "UN-ZOOM" should be used'/
    Data TX(  42) / &
      'prior to "OPTIMISE" unless only a'/
    Data TX(  43) / &
      'sub-region is of interest.'/
    Data TX(  44) / &
      ' ' /
    Data TX(  45) / &
      'When the model is complete, use the "EXIT"'/
    Data TX(  46) / &
      'button to return to the main menu of the'/
    Data TX(  47) / &
      'MFIT interface. (Usually "OPTIMISE" will'/
    Data TX(  48) / &
      'then be used to optimise the fit model to'/
    Data TX(  49) / &
      'the data values.)'/
    Data TX(  50) / &
      ' ' /
    Data TX(  51) / &
      '---------------'/
    Data TX(  52) / &
      'END OF HELP TEXT'/
    Data TX(  53) / &
      '---------------'/
    Data TX(  54) / &
      ' ' /
    Data TX(  55) / &
      ' ' /
    Data TX(  56) / &
      ' ' /
    Data TX(  57) / &
      ' ' /
    Data TX(  58) / &
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

    End Subroutine F2D_1DINITHELP
!********1*********2*********3*********4*********5*********6*********7*********8
