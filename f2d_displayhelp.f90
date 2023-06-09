!********1*********2*********3*********4*********5*********6*********7*********8

!               f2d_displayhelp.f90

! DO NOT ALTER THIS FILE

!  This file has been created automatically by "maketext"
!  from the ASCII text file:  f2d_displayhelp.text 
!  which should be edited and maketext should be re-run to 
!  create a new version of the subroutine.

!+ F2D_DISPLAYHELP interactive user help/message display facility
    Subroutine F2D_DISPLAYHELP (gui, status)

! Type Definitions:
    Implicit None

! Usage:
!   Private

! Import:
    Logical gui ! .True., if GUI is to be used
! Status:
    Integer status ! Status return variable

! Local Constants:
    Integer, Parameter :: Max_chars =  55 ! Maximum characters per line 
    Integer, Parameter :: Max_lines  =   60 ! Number of lines in message
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
      '      -----------------------------'/
    Data TX(   3) / &
      '      Welcome to the FIT2D DISPLAY'/
    Data TX(   4) / &
      '                              Graphical Menu'/
    Data TX(   5) / &
      '      -----------------------------'/
    Data TX(   6) / &
      ' ' /
    Data TX(   7) / &
      'The commands here allow you to display data in'/
    Data TX(   8) / &
      'different forms, and to output pixel values'/
    Data TX(   9) / &
      'and measure distances.'/
    Data TX(  10) / &
      ' ' /
    Data TX(  11) / &
      'Available commands:'/
    Data TX(  12) / &
      ' ' /
    Data TX(  13) / &
      'EXIT: Exit from sub-menu'/
    Data TX(  14) / &
      ' ' /
    Data TX(  15) / &
      'ARC SLICE: 1-D slice through a curved arc. The user'/
    Data TX(  16) / &
      'enters the starting coordinate, the end coordinate'/
    Data TX(  17) / &
      'and a coordinate on the arc.'/
    Data TX(  18) / &
      ' ' /
    Data TX(  19) / &
      'CONTOUR PLOT: Data displayed with contour lines.'/
    Data TX(  20) / &
      '(There is no control of the number of lines'/
    Data TX(  21) / &
      'or intensity values at present.)'/
    Data TX(  22) / &
      ' ' /
    Data TX(  23) / &
      'DISTANCE: Measure distance between two points.'/
    Data TX(  24) / &
      ' ' /
    Data TX(  25) / &
      '?: Display list of commands with short description'/
    Data TX(  26) / &
      ' ' /
    Data TX(  27) / &
      'NUMBERS: Print intensity values around a clicked'/
    Data TX(  28) / &
      'coordinate. The numbers are output to the terminal'/
    Data TX(  29) / &
      'window centred around the clicked pixel.'/
    Data TX(  30) / &
      ' ' /
    Data TX(  31) / &
      'PIXEL (X/Y): Details of cursor defined coordinate.'/
    Data TX(  32) / &
      ' ' /
    Data TX(  33) / &
      'PROJECTION: Re-binning of a region onto an arbitrary'/
    Data TX(  34) / &
      'line.'/
    Data TX(  35) / &
      ' ' /
    Data TX(  36) / &
      'HELP: This text explaining the menu choices.'/
    Data TX(  37) / &
      ' ' /
    Data TX(  38) / &
      'SATURATED: Number of pixels equal or above an'/
    Data TX(  39) / &
      'entered threshold value.'/
    Data TX(  40) / &
      ' ' /
    Data TX(  41) / &
      'SLICE: 1-D slice of line between two cursor input'/
    Data TX(  42) / &
      'points.'/
    Data TX(  43) / &
      ' ' /
    Data TX(  44) / &
      'PRINT: Output current graphics to PostScript file.'/
    Data TX(  45) / &
      ' ' /
    Data TX(  46) / &
      'STATISTICS: Integration statistics, average, sigma etc.'/
    Data TX(  47) / &
      ' ' /
    Data TX(  48) / &
      '3-D SURFACE: Data displayed as 3-D surface, viewing'/
    Data TX(  49) / &
      'angle and output style controlled by sub-menus.'/
    Data TX(  50) / &
      ' ' /
    Data TX(  51) / &
      '3-D LINES: Simple 3-d line plot of data.'/
    Data TX(  52) / &
      ' ' /
    Data TX(  53) / &
      '---------------'/
    Data TX(  54) / &
      'END OF HELP TEXT'/
    Data TX(  55) / &
      '---------------'/
    Data TX(  56) / &
      ' ' /
    Data TX(  57) / &
      ' ' /
    Data TX(  58) / &
      ' ' /
    Data TX(  59) / &
      ' ' /
    Data TX(  60) / &
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

    End Subroutine F2D_DISPLAYHELP
!********1*********2*********3*********4*********5*********6*********7*********8
