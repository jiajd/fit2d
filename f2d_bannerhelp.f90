!********1*********2*********3*********4*********5*********6*********7*********8

!               f2d_bannerhelp.f90

! DO NOT ALTER THIS FILE

!  This file has been created automatically by "maketext"
!  from the ASCII text file:  f2d_bannerhelp.text 
!  which should be edited and maketext should be re-run to 
!  create a new version of the subroutine.

!+ F2D_BANNERHELP interactive user help/message display facility
    Subroutine F2D_BANNERHELP (gui, status)

! Type Definitions:
    Implicit None

! Usage:
!   Private

! Import:
    Logical gui ! .True., if GUI is to be used
! Status:
    Integer status ! Status return variable

! Local Constants:
    Integer, Parameter :: Max_chars =  52 ! Maximum characters per line 
    Integer, Parameter :: Max_lines  =   45 ! Number of lines in message
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
      ' ' /
    Data TX(   3) / &
      '                  ----------------------'/
    Data TX(   4) / &
      '                  FIT2D: BANNER PAGE HELP'/
    Data TX(   5) / &
      '                  ----------------------'/
    Data TX(   6) / &
      ' ' /
    Data TX(   7) / &
      ' ' /
    Data TX(   8) / &
      'Welcome to the FIT2D "Graphical User Interface"'/
    Data TX(   9) / &
      '(GUI). This is an alternative interface to the "old"'/
    Data TX(  10) / &
      'FIT2D keyboard interface, and will gradually allow'/
    Data TX(  11) / &
      'you to access more and more of the functionality of'/
    Data TX(  12) / &
      'the keyboard interface in an easy to understand'/
    Data TX(  13) / &
      'manner.'/
    Data TX(  14) / &
      ' ' /
    Data TX(  15) / &
      'For users who prefer the keyboard interface, or who'/
    Data TX(  16) / &
      'have old macro files written for the keyboard'/
    Data TX(  17) / &
      'interface an operation system command line option'/
    Data TX(  18) / &
      '"-keyboard" allows the old interface to be selected:'/
    Data TX(  19) / &
      'e.g. type'/
    Data TX(  20) / &
      ' ' /
    Data TX(  21) / &
      'fit2d -keyboard'/
    Data TX(  22) / &
      ' ' /
    Data TX(  23) / &
      '(with other command line options if required) to get'/
    Data TX(  24) / &
      'the "old" interface. The full keyboard interface is'/
    Data TX(  25) / &
      'still available as one of the choices of interfaces.'/
    Data TX(  26) / &
      ' ' /
    Data TX(  27) / &
      'The graphics window may be re-sized by dragging on'/
    Data TX(  28) / &
      'the corners of the windows. The displayed graphics'/
    Data TX(  29) / &
      'will automatically be re-drawn  to  the  new  sized'/
    Data TX(  30) / &
      'window. So if the text  is  a little small,  or  the'/
    Data TX(  31) / &
      'window takes up too much space; just re-size it.'/
    Data TX(  32) / &
      ' ' /
    Data TX(  33) / &
      'For a ''landscape'' page format you may use the'/
    Data TX(  34) / &
      'command line option ''-land''. e.g. type'/
    Data TX(  35) / &
      ' ' /
    Data TX(  36) / &
      'fit2d -land'/
    Data TX(  37) / &
      ' ' /
    Data TX(  38) / &
      '(for some options the default page layout may be'/
    Data TX(  39) / &
      'less well laid-out than for the normal ''portrait'''/
    Data TX(  40) / &
      'page.'/
    Data TX(  41) / &
      ' ' /
    Data TX(  42) / &
      ' ' /
    Data TX(  43) / &
      '---------------'/
    Data TX(  44) / &
      'END OF HELP TEXT'/
    Data TX(  45) / &
      '---------------'/
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

    End Subroutine F2D_BANNERHELP
!********1*********2*********3*********4*********5*********6*********7*********8
