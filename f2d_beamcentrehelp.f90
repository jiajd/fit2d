!********1*********2*********3*********4*********5*********6*********7*********8

!               f2d_beamcentrehelp.f90

! DO NOT ALTER THIS FILE

!  This file has been created automatically by "maketext"
!  from the ASCII text file:  f2d_beamcentrehelp.text 
!  which should be edited and maketext should be re-run to 
!  create a new version of the subroutine.

!+ F2D_BEAMCENTREHELP interactive user help/message display facility
    Subroutine F2D_BEAMCENTREHELP (gui, status)

! Type Definitions:
    Implicit None

! Usage:
!   Private

! Import:
    Logical gui ! .True., if GUI is to be used
! Status:
    Integer status ! Status return variable

! Local Constants:
    Integer, Parameter :: Max_chars =  37 ! Maximum characters per line 
    Integer, Parameter :: Max_lines  =   79 ! Number of lines in message
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
      '      -------------------------'/
    Data TX(   3) / &
      '      Welcome to the FIT2D Beam'/
    Data TX(   4) / &
      '            Centre Graphical Menu'/
    Data TX(   5) / &
      '      -------------------------'/
    Data TX(   6) / &
      ' ' /
    Data TX(   7) / &
      ' ' /
    Data TX(   8) / &
      'This menu allows you to choose one'/
    Data TX(   9) / &
      'of a variety of methods to use to'/
    Data TX(  10) / &
      'define the beam centre. This choice'/
    Data TX(  11) / &
      'is given as the best method depends'/
    Data TX(  12) / &
      'on the particular beam-line, or the'/
    Data TX(  13) / &
      'particular type of data. If a direct'/
    Data TX(  14) / &
      'mark of the beam has been imaged'/
    Data TX(  15) / &
      'using a semi-transparent beam-stop'/
    Data TX(  16) / &
      'of an equivalent method, then using'/
    Data TX(  17) / &
      'the "2-D GAUSSIAN FIT" is likely to'/
    Data TX(  18) / &
      'be the best method.'/
    Data TX(  19) / &
      ' ' /
    Data TX(  20) / &
      'The available methods are:'/
    Data TX(  21) / &
      ' ' /
    Data TX(  22) / &
      '2-D GAUSSIAN FIT: A 2-D Gaussian is'/
    Data TX(  23) / &
      '   fitted to a well defined peak e.g.'/
    Data TX(  24) / &
      '   the direct beam mark. The user'/
    Data TX(  25) / &
      '   clicks on the approximate centre'/
    Data TX(  26) / &
      '   of the peak. The beam centre is'/
    Data TX(  27) / &
      '   set to the centre of the fitted'/
    Data TX(  28) / &
      '   peak.'/
    Data TX(  29) / &
      ' ' /
    Data TX(  30) / &
      'AVERAGED GRAPHICAL: This allows you'/
    Data TX(  31) / &
      '   click on pairs of (symmetrical)'/
    Data TX(  32) / &
      '   peaks. The centre is calculated'/
    Data TX(  33) / &
      '   from the average of the inputs.'/
    Data TX(  34) / &
      ' ' /
    Data TX(  35) / &
      'CIRCLE COORDINATES: Three or more'/
    Data TX(  36) / &
      '   coordinates should be entered,'/
    Data TX(  37) / &
      '   which all fall on the same circle'/
    Data TX(  38) / &
      '   e.g. powder ring. A best fit'/
    Data TX(  39) / &
      '   circle is fitted to the entered'/
    Data TX(  40) / &
      '   coordinates.'/
    Data TX(  41) / &
      ' ' /
    Data TX(  42) / &
      'ELLIPSE COORDINATES: Four or more'/
    Data TX(  43) / &
      '   coordinates should be entered,'/
    Data TX(  44) / &
      '   which all fall on the same'/
    Data TX(  45) / &
      '   ellipse, e.g. powder ring on a'/
    Data TX(  46) / &
      '   non-orthogonal detector. This'/
    Data TX(  47) / &
      '   allows coordinates on an ellipse'/
    Data TX(  48) / &
      '   to be fitted to find the best'/
    Data TX(  49) / &
      '   fit centre.'/
    Data TX(  50) / &
      ' ' /
    Data TX(  51) / &
      'GRAPHICAL COORDINATE: A single'/
    Data TX(  52) / &
      '  coordinate is entered graphical'/
    Data TX(  53) / &
      '  to define directly the beam'/
    Data TX(  54) / &
      '  centre.'/
    Data TX(  55) / &
      ' ' /
    Data TX(  56) / &
      'FIT 1-D PROJECTION: This is a'/
    Data TX(  57) / &
      '   specialised method for grazing'/
    Data TX(  58) / &
      '   incidence SAXS data. The user'/
    Data TX(  59) / &
      '   defines a projection line and'/
    Data TX(  60) / &
      '   region. A 1-D projection is'/
    Data TX(  61) / &
      '   calculated and is fitted with'/
    Data TX(  62) / &
      '   a function symmetric about the'/
    Data TX(  63) / &
      '   "beam centre". This centre is'/
    Data TX(  64) / &
      '   refined. This defines one'/
    Data TX(  65) / &
      '   coordinate, and the user can'/
    Data TX(  66) / &
      '   define the other.'/
    Data TX(  67) / &
      ' ' /
    Data TX(  68) / &
      'KEYBOARD: The coordinate is'/
    Data TX(  69) / &
      '  entered as two real numbers'/
    Data TX(  70) / &
      '  using the keyboard.'/
    Data TX(  71) / &
      ' ' /
    Data TX(  72) / &
      'NO CHANGE: No input, use'/
    Data TX(  73) / &
      '   existing beam centre.'/
    Data TX(  74) / &
      ' ' /
    Data TX(  75) / &
      '---------------'/
    Data TX(  76) / &
      'END OF HELP TEXT'/
    Data TX(  77) / &
      '---------------'/
    Data TX(  78) / &
      ' ' /
    Data TX(  79) / &
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

    End Subroutine F2D_BEAMCENTREHELP
!********1*********2*********3*********4*********5*********6*********7*********8
