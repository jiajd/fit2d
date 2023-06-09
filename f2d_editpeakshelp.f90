!********1*********2*********3*********4*********5*********6*********7*********8

!               f2d_editpeakshelp.f90

! DO NOT ALTER THIS FILE

!  This file has been created automatically by "maketext"
!  from the ASCII text file:  f2d_editpeakshelp.text 
!  which should be edited and maketext should be re-run to 
!  create a new version of the subroutine.

!+ F2D_EDITPEAKSHELP interactive user help/message display facility
    Subroutine F2D_EDITPEAKSHELP (gui, status)

! Type Definitions:
    Implicit None

! Usage:
!   Private

! Import:
    Logical gui ! .True., if GUI is to be used
! Status:
    Integer status ! Status return variable

! Local Constants:
    Integer, Parameter :: Max_chars =  47 ! Maximum characters per line 
    Integer, Parameter :: Max_lines  =   36 ! Number of lines in message
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
      '                     --------------------'/
    Data TX(   3) / &
      '                     Peak List Edit Menu'/
    Data TX(   4) / &
      '                     --------------------'/
    Data TX(   5) / &
      ' ' /
    Data TX(   6) / &
      'The commands here allow you to add new "peaks"'/
    Data TX(   7) / &
      'to the peak list, or to remove exisitng "peaks"'/
    Data TX(   8) / &
      'from the list. To help this editing of the'/
    Data TX(   9) / &
      'peak list, it is possible to change the'/
    Data TX(  10) / &
      'displayed region and the range of the false'/
    Data TX(  11) / &
      'colour scaling.'/
    Data TX(  12) / &
      ' ' /
    Data TX(  13) / &
      'To add peaks click on the "ADD PEAKS" button,'/
    Data TX(  14) / &
      'and then click on the centre of each of the'/
    Data TX(  15) / &
      'peaks to be added to the peak list. (Note:'/
    Data TX(  16) / &
      'there is no check that you are not adding a'/
    Data TX(  17) / &
      'peak which is already in the list.)'/
    Data TX(  18) / &
      ' ' /
    Data TX(  19) / &
      'To remove peaks click on the "REMOVE PEAKS"'/
    Data TX(  20) / &
      'button, and then click on or close to'/
    Data TX(  21) / &
      'the crosses depicting the existing peaks'/
    Data TX(  22) / &
      'in the list. The closest existing peak to'/
    Data TX(  23) / &
      'each of the entered coordinates will be'/
    Data TX(  24) / &
      'removed from the peak list.'/
    Data TX(  25) / &
      ' ' /
    Data TX(  26) / &
      'When finished use the "EXIT" button to'/
    Data TX(  27) / &
      'continue the processing.'/
    Data TX(  28) / &
      ' ' /
    Data TX(  29) / &
      '---------------'/
    Data TX(  30) / &
      'END OF HELP TEXT'/
    Data TX(  31) / &
      '---------------'/
    Data TX(  32) / &
      ' ' /
    Data TX(  33) / &
      ' ' /
    Data TX(  34) / &
      ' ' /
    Data TX(  35) / &
      ' ' /
    Data TX(  36) / &
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

    End Subroutine F2D_EDITPEAKSHELP
!********1*********2*********3*********4*********5*********6*********7*********8
