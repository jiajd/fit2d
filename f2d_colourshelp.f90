!********1*********2*********3*********4*********5*********6*********7*********8

!               f2d_colourshelp.f90

! DO NOT ALTER THIS FILE

!  This file has been created automatically by "maketext"
!  from the ASCII text file:  f2d_colourshelp.text 
!  which should be edited and maketext should be re-run to 
!  create a new version of the subroutine.

!+ F2D_COLOURSHELP interactive user help/message display facility
    Subroutine F2D_COLOURSHELP (gui, status)

! Type Definitions:
    Implicit None

! Usage:
!   Private

! Import:
    Logical gui ! .True., if GUI is to be used
! Status:
    Integer status ! Status return variable

! Local Constants:
    Integer, Parameter :: Max_chars =  44 ! Maximum characters per line 
    Integer, Parameter :: Max_lines  =   68 ! Number of lines in message
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
      '          -----------------------'/
    Data TX(   3) / &
      '          Colour Table Selection Menu'/
    Data TX(   4) / &
      '          -----------------------'/
    Data TX(   5) / &
      ' ' /
    Data TX(   6) / &
      'This menu allows you to change the colour'/
    Data TX(   7) / &
      'table used to display image values as'/
    Data TX(   8) / &
      '"false colours". Different colour tables'/
    Data TX(   9) / &
      'may be useful to highlight different'/
    Data TX(  10) / &
      'aspects of the data. Colour often "confuses"'/
    Data TX(  11) / &
      'the eye concerning patterns in the data,'/
    Data TX(  12) / &
      'but can show more detail than black and'/
    Data TX(  13) / &
      'white. So for some types of data and work'/
    Data TX(  14) / &
      'grey-scales are better, whilst other data'/
    Data TX(  15) / &
      'benefits from using a much wider variety of'/
    Data TX(  16) / &
      'colours.'/
    Data TX(  17) / &
      ' ' /
    Data TX(  18) / &
      'Changing the colour table does not require'/
    Data TX(  19) / &
      're-drawing the displayed data, so is very'/
    Data TX(  20) / &
      'fast. Try clicking on the different choices'/
    Data TX(  21) / &
      'to see how they display your data.'/
    Data TX(  22) / &
      ' ' /
    Data TX(  23) / &
      '"COLOUR WHEEL" is a simple graduated'/
    Data TX(  24) / &
      'change through the primary/secondary'/
    Data TX(  25) / &
      'colours.'/
    Data TX(  26) / &
      ' ' /
    Data TX(  27) / &
      '"GEOGRAPHICAL" is the default colour'/
    Data TX(  28) / &
      'table, and is based on typical colour'/
    Data TX(  29) / &
      'tables indicating height in atlases.'/
    Data TX(  30) / &
      ' ' /
    Data TX(  31) / &
      '"GREY-SCALE" is a simple linear black to'/
    Data TX(  32) / &
      'white graduation with white representing'/
    Data TX(  33) / &
      'the most intense pixel values.'/
    Data TX(  34) / &
      ' ' /
    Data TX(  35) / &
      '"INVERSE GREY-SCALE" is a simple linear'/
    Data TX(  36) / &
      'white to black graduation with black'/
    Data TX(  37) / &
      'representing the most intense pixel values.'/
    Data TX(  38) / &
      'This is similar to exposed photographic'/
    Data TX(  39) / &
      'film.'/
    Data TX(  40) / &
      ' ' /
    Data TX(  41) / &
      '"ORIGINAL" was the first FIT2D colour'/
    Data TX(  42) / &
      'table, and is similar the "COLOUR WHEEL",'/
    Data TX(  43) / &
      'but with black at the start of the table'/
    Data TX(  44) / &
      'and white at the top.'/
    Data TX(  45) / &
      ' ' /
    Data TX(  46) / &
      '"PSYCHOLOGICAL" attempts to use visual'/
    Data TX(  47) / &
      'psychology to make the intense values'/
    Data TX(  48) / &
      '"stand out" by using "warm" colours,'/
    Data TX(  49) / &
      'and to use "cold" "distant" colours for'/
    Data TX(  50) / &
      'the low intensity values.'/
    Data TX(  51) / &
      ' ' /
    Data TX(  52) / &
      '"REPEATING" uses repeated dark to light'/
    Data TX(  53) / &
      'strips with the different primary and'/
    Data TX(  54) / &
      'secondary colours. This can bring out'/
    Data TX(  55) / &
      'small changes on a rapidly changing'/
    Data TX(  56) / &
      'background.'/
    Data TX(  57) / &
      ' ' /
    Data TX(  58) / &
      '"TEMPERATURE" uses a pseudo-"heat"'/
    Data TX(  59) / &
      'scale to represent intensity.'/
    Data TX(  60) / &
      ' ' /
    Data TX(  61) / &
      '"UPSIDE-DOWN" is the default'/
    Data TX(  62) / &
      '"GEOGRAPHICAL" colour table inversed.'/
    Data TX(  63) / &
      ' ' /
    Data TX(  64) / &
      ' ' /
    Data TX(  65) / &
      '---------------'/
    Data TX(  66) / &
      'END OF HELP TEXT'/
    Data TX(  67) / &
      '---------------'/
    Data TX(  68) / &
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

    End Subroutine F2D_COLOURSHELP
!********1*********2*********3*********4*********5*********6*********7*********8
