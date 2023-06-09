!********1*********2*********3*********4*********5*********6*********7*********8

!               f2d_cakehelp.f90

! DO NOT ALTER THIS FILE

!  This file has been created automatically by "maketext"
!  from the ASCII text file:  f2d_cakehelp.text 
!  which should be edited and maketext should be re-run to 
!  create a new version of the subroutine.

!+ F2D_CAKEHELP interactive user help/message display facility
    Subroutine F2D_CAKEHELP (gui, status)

! Type Definitions:
    Implicit None

! Usage:
!   Private

! Import:
    Logical gui ! .True., if GUI is to be used
! Status:
    Integer status ! Status return variable

! Local Constants:
    Integer, Parameter :: Max_chars =  63 ! Maximum characters per line 
    Integer, Parameter :: Max_lines  =   32 ! Number of lines in message
! Local Variables:
     Integer font_index ! Saves current font index
! Local Arrays:
    Character*(Max_chars) TX(Max_lines) ! Text array
! External Functions:
    Integer, External :: St_good ! Returns good status value
! Local Data:
    Data TX(   1) / &
      '      -----------------------------'/
    Data TX(   2) / &
      '      Welcome to the FIT2D "Cake"'/
    Data TX(   3) / &
      '                              Graphical Menu'/
    Data TX(   4) / &
      '      -----------------------------'/
    Data TX(   5) / &
      ' ' /
    Data TX(   6) / &
      '(This help text is under development.)'/
    Data TX(   7) / &
      ' ' /
    Data TX(   8) / &
      'The "CAKE" menu allows you to interactively'/
    Data TX(   9) / &
      'define an arbitrary data region, from a start'/
    Data TX(  10) / &
      'azimuth to an end azimuth, and with an inner'/
    Data TX(  11) / &
      'radius and an outer radial limit. This region'/
    Data TX(  12) / &
      'can be integrated to one of a number of types'/
    Data TX(  13) / &
      'of 1-D and 2-D scans and transformations.'/
    Data TX(  14) / &
      ' ' /
    Data TX(  15) / &
      'The following buttons are available:'/
    Data TX(  16) / &
      'EXIT: Exit Menu'/
    Data TX(  17) / &
      '?: This help on the menu choices'/
    Data TX(  18) / &
      'HELP: Help text on this graphical menu'/
    Data TX(  19) / &
      'BEAM CENTRE: Change beam centre'/
    Data TX(  20) / &
      'INTEGRATE: Calculate "polar" radial/2-theta, azimuth transform'/
    Data TX(  21) / &
      'END AZIMUTH: Change end azimuth'/
    Data TX(  22) / &
      'EXCHANGE: Swap current data with the "memory"'/
    Data TX(  23) / &
      'FULL: View image of full data'/
    Data TX(  24) / &
      'INNER RADIUS: Change inner radius/2-theta angle'/
    Data TX(  25) / &
      'OUTER RADIUS: Change outer radial/2-theta angle'/
    Data TX(  26) / &
      'START AZIMUTH: Change starting azimuthal angle'/
    Data TX(  27) / &
      'UN-ZOOM: Zoom out to see more of the data'/
    Data TX(  28) / &
      'ZOOM IN: Graphical region definition'/
    Data TX(  29) / &
      'Z-SCALING: Automatic or user control of intensity display range'/
    Data TX(  30) / &
      'MASK: Mask or Un-mask data (masked pixels are not re-binned)'/
    Data TX(  31) / &
      'ASPECT RATIO: Control automatic correct aspect ratio (or not)'/
    Data TX(  32) / &
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

    End Subroutine F2D_CAKEHELP
!********1*********2*********3*********4*********5*********6*********7*********8
