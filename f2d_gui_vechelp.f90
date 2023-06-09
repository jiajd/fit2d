!********1*********2*********3*********4*********5*********6*********7*********8

!               f2d_gui_vechelp.f90

! DO NOT ALTER THIS FILE

!  This file has been created automatically by "maketext"
!  from the ASCII text file:  f2d_gui_vechelp.text 
!  which should be edited and maketext should be re-run to 
!  create a new version of the subroutine.

!+ F2D_GUI_VECHELP interactive user help/message display facility
    Subroutine F2D_GUI_VECHELP (gui, status)

! Type Definitions:
    Implicit None

! Usage:
!   Private

! Import:
    Logical gui ! .True., if GUI is to be used
! Status:
    Integer status ! Status return variable

! Local Constants:
    Integer, Parameter :: Max_chars =  43 ! Maximum characters per line 
    Integer, Parameter :: Max_lines  =   38 ! Number of lines in message
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
      '      --------------------------'/
    Data TX(   3) / &
      '                Welcome to the FIT2D VECTOR'/
    Data TX(   4) / &
      '                Operations'/
    Data TX(   5) / &
      '                Graphical Menu'/
    Data TX(   6) / &
      '      --------------------------'/
    Data TX(   7) / &
      ' ' /
    Data TX(   8) / &
      '(NOTE: THIS INTERFACE IS UNDER DEVELOPMENT'/
    Data TX(   9) / &
      'AND IS SUBJECT TO CHANGE. )'/
    Data TX(  10) / &
      ' ' /
    Data TX(  11) / &
      ' ' /
    Data TX(  12) / &
      'SUMMARY'/
    Data TX(  13) / &
      '-------'/
    Data TX(  14) / &
      ' ' /
    Data TX(  15) / &
      'The commands here allow you to input data'/
    Data TX(  16) / &
      'from files  ("INPUT"), to define one of'/
    Data TX(  17) / &
      'a number of 1-D data-sets (vectors). These'/
    Data TX(  18) / &
      'may be used with "FILE SERIES" operations'/
    Data TX(  19) / &
      'e.g. normalisation constants, or for other'/
    Data TX(  20) / &
      'purposes. "VECTORS" of values may also'/
    Data TX(  21) / &
      'be defined by fitting of series of 1-D'/
    Data TX(  22) / &
      'data-sets ("MFIT" interface). Here they may'/
    Data TX(  23) / &
      'be examined and "OUTPUT".'/
    Data TX(  24) / &
      ' ' /
    Data TX(  25) / &
      ' ' /
    Data TX(  26) / &
      'Further help is available within the FIT2D'/
    Data TX(  27) / &
      'Reference Manual. This manual is available'/
    Data TX(  28) / &
      'by the web from the FIT2D home page URL:'/
    Data TX(  29) / &
      ' ' /
    Data TX(  30) / &
      'http://www.esrf.fr/computing/expg/'/
    Data TX(  31) / &
      'subgroups/data_analysis/FIT2D'/
    Data TX(  32) / &
      ' ' /
    Data TX(  33) / &
      '---------------'/
    Data TX(  34) / &
      'END OF HELP TEXT'/
    Data TX(  35) / &
      '---------------'/
    Data TX(  36) / &
      ' ' /
    Data TX(  37) / &
      ' ' /
    Data TX(  38) / &
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

    End Subroutine F2D_GUI_VECHELP
!********1*********2*********3*********4*********5*********6*********7*********8
