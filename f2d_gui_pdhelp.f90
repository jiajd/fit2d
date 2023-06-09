!********1*********2*********3*********4*********5*********6*********7*********8

!               f2d_gui_pdhelp.f90

! DO NOT ALTER THIS FILE

!  This file has been created automatically by "maketext"
!  from the ASCII text file:  f2d_gui_pdhelp.text 
!  which should be edited and maketext should be re-run to 
!  create a new version of the subroutine.

!+ F2D_GUI_PDHELP interactive user help/message display facility
    Subroutine F2D_GUI_PDHELP (gui, status)

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
    Integer, Parameter :: Max_lines  =  129 ! Number of lines in message
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
      '           -------------------------------------'/
    Data TX(   3) / &
      '           Welcome to the FIT2D Powder'/
    Data TX(   4) / &
      '           Diffraction Graphical Menu'/
    Data TX(   5) / &
      '           -------------------------------------'/
    Data TX(   6) / &
      ' ' /
    Data TX(   7) / &
      'The commands here allow you to input data from'/
    Data TX(   8) / &
      'files  ("INPUT"),  to  integrate powder rings to'/
    Data TX(   9) / &
      'a choice of 1-D scans, including "2-theta" and'/
    Data TX(  10) / &
      'D-spacing scans,  with  large  flexibility in'/
    Data TX(  11) / &
      'choosing different 2-theta and azimuth ranges.'/
    Data TX(  12) / &
      ' ' /
    Data TX(  13) / &
      'Generally data analysis will start by using the'/
    Data TX(  14) / &
      '"INPUT" command to input data from file.'/
    Data TX(  15) / &
      '(Most of the options will not work until data'/
    Data TX(  16) / &
      'has been input or otherwise created.)'/
    Data TX(  17) / &
      ' ' /
    Data TX(  18) / &
      'Occasionally the "IMAGE PROCESSING'/
    Data TX(  19) / &
      '(GENERAL)" interface will be useful to'/
    Data TX(  20) / &
      'allow such operations as subtracting one'/
    Data TX(  21) / &
      'image from another prior to further analysis'/
    Data TX(  22) / &
      'in this menu.'/
    Data TX(  23) / &
      ' ' /
    Data TX(  24) / &
      'To help see and interact with the data, the'/
    Data TX(  25) / &
      'button "Z-SCALING" allows the intensity'/
    Data TX(  26) / &
      'limits of displayed data to be changed. A'/
    Data TX(  27) / &
      'number of different fixed or automatically'/
    Data TX(  28) / &
      're-scaling methods are available and a'/
    Data TX(  29) / &
      'choice of linear or logarithm intensity'/
    Data TX(  30) / &
      'representation is available.'/
    Data TX(  31) / &
      ' ' /
    Data TX(  32) / &
      'Data from spatially distorted detector systems'/
    Data TX(  33) / &
      'may be corrected using the "CORRECTION"'/
    Data TX(  34) / &
      'button and prior to integration unwanted areas'/
    Data TX(  35) / &
      'of the image may be "masked-out" using the'/
    Data TX(  36) / &
      'mask menu which is selected through the'/
    Data TX(  37) / &
      '"MASK" button.'/
    Data TX(  38) / &
      ' ' /
    Data TX(  39) / &
      'To correct for non-orthogonality of the detector'/
    Data TX(  40) / &
      'to the direct beam, the "TILT" button allows'/
    Data TX(  41) / &
      'the non-orthogonality (tilt) to be determined'/
    Data TX(  42) / &
      'as well as the beam centre from the shape of'/
    Data TX(  43) / &
      'recorded powder rings. "BEAM CENTRE" is'/
    Data TX(  44) / &
      'an alternative and simpler method for'/
    Data TX(  45) / &
      'determining just the position of the direct'/
    Data TX(  46) / &
      'beam of the detector. This is useful when the'/
    Data TX(  47) / &
      'detector non-orthogonality has been previously'/
    Data TX(  48) / &
      'determined, and the data contains a direct mark'/
    Data TX(  49) / &
      'of the beam. ("CALIBRANT" is another'/
    Data TX(  50) / &
      'method for determining the tilt and beam'/
    Data TX(  51) / &
      'centre when special calibrants are used, see'/
    Data TX(  52) / &
      'below.)'/
    Data TX(  53) / &
      ' ' /
    Data TX(  54) / &
      'Two  forms  of  integration are available:  the'/
    Data TX(  55) / &
      '"INTEGRATE" button integrates all of the un-'/
    Data TX(  56) / &
      'masked data to a simple 1-D "2-theta" scan.'/
    Data TX(  57) / &
      'Alternatively, arbitrary 2-theta and azimuthal'/
    Data TX(  58) / &
      'regions may be integrated to a defined number'/
    Data TX(  59) / &
      'of "2-theta" scans using the "CAKE" menu.'/
    Data TX(  60) / &
      'This is an interactive menu allowing easy'/
    Data TX(  61) / &
      'control of start and end azimuthal and radial'/
    Data TX(  62) / &
      'regions. This can be useful for samples with'/
    Data TX(  63) / &
      'preferred orientation and other non-symmetric'/
    Data TX(  64) / &
      'diffraction.'/
    Data TX(  65) / &
      ' ' /
    Data TX(  66) / &
      'Having integrated a powder pattern the resulting'/
    Data TX(  67) / &
      'scan  or  scans  can  be  saved to output files in'/
    Data TX(  68) / &
      'a variety of different file formats using the'/
    Data TX(  69) / &
      '"OUTPUT"  button.'/
    Data TX(  70) / &
      ' ' /
    Data TX(  71) / &
      'Once the original data has been transformed to'/
    Data TX(  72) / &
      'a 1-D or series of 1-D 2-theta or other scans'/
    Data TX(  73) / &
      'it replaces the original data in the main'/
    Data TX(  74) / &
      'program array (i.e. the data that is displayed).'/
    Data TX(  75) / &
      'The original data is still stored within an'/
    Data TX(  76) / &
      'internal "memory". To recover the original'/
    Data TX(  77) / &
      'data the "EXCHANGE" command can be used to'/
    Data TX(  78) / &
      'swap the two data-sets. The previously'/
    Data TX(  79) / &
      'displayed data, e.g. a two-theta scan, will'/
    Data TX(  80) / &
      'now be in the "memory". Using "EXCHANGE"'/
    Data TX(  81) / &
      'twice is an "identity operation".'/
    Data TX(  82) / &
      ' ' /
    Data TX(  83) / &
      '"ZOOM-IN" allows a sub-region of the data'/
    Data TX(  84) / &
      'to be selected and displayed. It should be'/
    Data TX(  85) / &
      'noted that ALL OPERATIONS INCLUDING'/
    Data TX(  86) / &
      '"OUTPUT" ONLY WORK ON THE CURRENT'/
    Data TX(  87) / &
      'SELECTED REGION. Care needs to be taken'/
    Data TX(  88) / &
      'when using "ZOOM-IN" that subsequent'/
    Data TX(  89) / &
      'operations are intended for only the'/
    Data TX(  90) / &
      'current sub-region. The full available'/
    Data TX(  91) / &
      'data region may be selected by using'/
    Data TX(  92) / &
      'the "FULL" button.'/
    Data TX(  93) / &
      ' ' /
    Data TX(  94) / &
      '"PRINT" may used to save the currently'/
    Data TX(  95) / &
      'displayed data image as a PostScript'/
    Data TX(  96) / &
      'file. You are prompted for the name of'/
    Data TX(  97) / &
      'the output file to create. After the'/
    Data TX(  98) / &
      'file is fully written, it may be sent'/
    Data TX(  99) / &
      'to a PostScript printer for printing.'/
    Data TX( 100) / &
      'Note: It can take some time to create'/
    Data TX( 101) / &
      'a file of a large 2-D data-set, and'/
    Data TX( 102) / &
      'often even longer for the file to be'/
    Data TX( 103) / &
      'printed.'/
    Data TX( 104) / &
      ' ' /
    Data TX( 105) / &
      '"CALIBRANT" allows calibration of the'/
    Data TX( 106) / &
      'X-ray wavelength, sample to detector'/
    Data TX( 107) / &
      'distance, beam centre, and the detector'/
    Data TX( 108) / &
      'non-orthogonality when special calibrant'/
    Data TX( 109) / &
      'samples are used. At present Cerium Dioxide,'/
    Data TX( 110) / &
      'Lanthanum Hexaboride, Sodium Chloride,'/
    Data TX( 111) / &
      'Paraffin Wax, and Silicon are available,'/
    Data TX( 112) / &
      'but other samples can be added if accurate'/
    Data TX( 113) / &
      'D-spacings are available.'/
    Data TX( 114) / &
      ' ' /
    Data TX( 115) / &
      ' ' /
    Data TX( 116) / &
      'Further help is available within the FIT2D'/
    Data TX( 117) / &
      'Reference Manual. This manual is available'/
    Data TX( 118) / &
      'by the web from the FIT2D home page URL:'/
    Data TX( 119) / &
      ' ' /
    Data TX( 120) / &
      'http://www.esrf.fr/computing/scientific/FIT2D/'/
    Data TX( 121) / &
      ' ' /
    Data TX( 122) / &
      '---------------------------'/
    Data TX( 123) / &
      'END OF HELP TEXT'/
    Data TX( 124) / &
      '---------------------------'/
    Data TX( 125) / &
      ' ' /
    Data TX( 126) / &
      ' ' /
    Data TX( 127) / &
      ' ' /
    Data TX( 128) / &
      ' ' /
    Data TX( 129) / &
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

    End Subroutine F2D_GUI_PDHELP
!********1*********2*********3*********4*********5*********6*********7*********8
