!********1*********2*********3*********4*********5*********6*********7*********8

!               f2d_conditionshelp.f90

! DO NOT ALTER THIS FILE

!  This file has been created automatically by "maketext"
!  from the ASCII text file:  f2d_conditionshelp.text 
!  which should be edited and maketext should be re-run to 
!  create a new version of the subroutine.

!+ F2D_CONDITIONSHELP interactive user help/message display facility
    Subroutine F2D_CONDITIONSHELP (gui, status)

! Type Definitions:
    Implicit None

! Usage:
!   Private

! Import:
    Logical gui ! .True., if GUI is to be used
! Status:
    Integer status ! Status return variable

! Local Constants:
    Integer, Parameter :: Max_chars =  59 ! Maximum characters per line 
    Integer, Parameter :: Max_lines  =   51 ! Number of lines in message
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
      '                           ------------------------'/
    Data TX(   3) / &
      '                           FIT2D: "CONDITIONS OF USE"'/
    Data TX(   4) / &
      '                           ------------------------'/
    Data TX(   5) / &
      ' ' /
    Data TX(   6) / &
      'I accept to only use FIT2D for non-profit making,'/
    Data TX(   7) / &
      'non-military, academic research (except if alternative'/
    Data TX(   8) / &
      'arrangements have been made).'/
    Data TX(   9) / &
      ' ' /
    Data TX(  10) / &
      'o I accept that no guarantee of correctness of methods is'/
    Data TX(  11) / &
      '  given by the author(s).'/
    Data TX(  12) / &
      ' ' /
    Data TX(  13) / &
      'o I undertake to acknowledge both the author'/
    Data TX(  14) / &
      '  (A P Hammersley) and the home institute of FIT2D (ESRF)'/
    Data TX(  15) / &
      '  for any "major" use. The following use should be'/
    Data TX(  16) / &
      '  considered "major" i.e. requires acknowlegement.'/
    Data TX(  17) / &
      ' ' /
    Data TX(  18) / &
      '     i.  Detector distortion calibration and correction'/
    Data TX(  19) / &
      ' ' /
    Data TX(  20) / &
      '     ii. Use of any data analysis operation not in the'/
    Data TX(  21) / &
      '         list below'/
    Data TX(  22) / &
      ' ' /
    Data TX(  23) / &
      '  The following use does not require any acknowledgement:'/
    Data TX(  24) / &
      ' ' /
    Data TX(  25) / &
      '     i.   Graphical display and output (without ``major'''''/
    Data TX(  26) / &
      '          data analysis)'/
    Data TX(  27) / &
      ' ' /
    Data TX(  28) / &
      '     ii.  Trivial data analysis i.e. addition, subtraction,'/
    Data TX(  29) / &
      '          multiplication, division pixel by pixel or by'/
    Data TX(  30) / &
      '          scalars. Basic mathematical functions applied'/
    Data TX(  31) / &
      '          pixel by pixel (Log, exponention, square root)'/
    Data TX(  32) / &
      ' ' /
    Data TX(  33) / &
      '     iii. File format conversion, including the following'/
    Data TX(  34) / &
      '          image transformations: reflection, rotation,'/
    Data TX(  35) / &
      '          transposition'/
    Data TX(  36) / &
      ' ' /
    Data TX(  37) / &
      'o I agree to cite appropriate references (as described'/
    Data TX(  38) / &
      '  within the FIT2D Reference Guide) for publications which'/
    Data TX(  39) / &
      '  result from "major" data analysis using FIT2D.'/
    Data TX(  40) / &
      ' ' /
    Data TX(  41) / &
      ' ' /
    Data TX(  42) / &
      '---------------'/
    Data TX(  43) / &
      'END OF HELP TEXT'/
    Data TX(  44) / &
      '---------------'/
    Data TX(  45) / &
      ' ' /
    Data TX(  46) / &
      ' ' /
    Data TX(  47) / &
      ' ' /
    Data TX(  48) / &
      ' ' /
    Data TX(  49) / &
      ' ' /
    Data TX(  50) / &
      ' ' /
    Data TX(  51) / &
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

    End Subroutine F2D_CONDITIONSHELP
!********1*********2*********3*********4*********5*********6*********7*********8
