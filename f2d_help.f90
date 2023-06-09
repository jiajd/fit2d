!********1*********2*********3*********4*********5*********6*********7*********8

!               f2d_help.f90

! DO NOT ALTER THIS FILE

!  This file has been created automatically by "maketext"
!  from the ASCII text file:  f2d_help.text 
!  which should be edited and maketext should be re-run to 
!  create a new version of the subroutine.

!+ F2D_HELP interactive user help/message display facility
    Subroutine F2D_HELP (gui, status)

! Type Definitions:
    Implicit None

! Usage:
!   Private

! Import:
    Logical gui ! .True., if GUI is to be used
! Status:
    Integer status ! Status return variable

! Local Constants:
    Integer, Parameter :: Max_chars =  79 ! Maximum characters per line 
    Integer, Parameter :: Max_lines  = 1196 ! Number of lines in message
! Local Variables:
     Integer font_index ! Saves current font index
! Local Arrays:
    Character*(Max_chars) TX(Max_lines) ! Text array
! External Functions:
    Integer, External :: St_good ! Returns good status value
! Local Data:
    Data TX(   1)(1:70)/ &
     '----------------------------------------------------------------------'/
    Data TX(   1)(71:) / &
     '---------'/
    Data TX(   2) / &
      '-              BEGINNING OF fit2d HELP TEXT, SEE User Guide FOR'/
    Data TX(   3) / &
      '-                           MORE INFORMATION'/
    Data TX(   4)(1:70)/ &
     '----------------------------------------------------------------------'/
    Data TX(   4)(71:) / &
     '--------'/
    Data TX(   5) / &
      ' ' /
    Data TX(   6)(1:70)/ &
     '"fit2d" is an interactive menu driven program for 2-D fitting of data,'/
    Data TX(   6)(71:) / &
     ' but'/
    Data TX(   7)(1:70)/ &
     'also has basic arithmetic operations and graphics display possibilites'/
    Data TX(   7)(71:) / &
     '.'/
    Data TX(   8) / &
      ' ' /
    Data TX(   9)(1:70)/ &
     'By default all user prompts are short but further information is alway'/
    Data TX(   9)(71:) / &
     's'/
    Data TX(  10) / &
      '   available by entering a question mark (?).'/
    Data TX(  11) / &
      ' ' /
    Data TX(  12)(1:70)/ &
     'Menu commands may be shortened to any non-ambiguous command; upper, lo'/
    Data TX(  12)(71:) / &
     'wer, or'/
    Data TX(  13) / &
      'mixed case input is fine.'/
    Data TX(  14) / &
      ' ' /
    Data TX(  15)(1:70)/ &
     'Previously issued commands may be recovered, edited, and re-used using'/
    Data TX(  15)(71:) / &
     ' the'/
    Data TX(  16)(1:70)/ &
     'arrow keys (command line history recall) in the same manner as the `T-'/
    Data TX(  16)(71:) / &
     'shell'''/
    Data TX(  17)(1:70)/ &
     'or emacs. The up-arrow key may be used to go backwards through the `hi'/
    Data TX(  17)(71:) / &
     'story'','/
    Data TX(  18)(1:70)/ &
     'and the down-arrow key forwards. Once a history line has been selected'/
    Data TX(  18)(71:) / &
     ' it may'/
    Data TX(  19)(1:70)/ &
     'be edited using the left and right-arrow keys, the delete key, and by '/
    Data TX(  19)(71:) / &
     'typing'/
    Data TX(  20)(1:70)/ &
     'text which will be inserted automatically. The <RETURN> key may be use'/
    Data TX(  20)(71:) / &
     'd to'/
    Data TX(  21)(1:70)/ &
     'enter the whole line of text regardless of the position of the cursor.'/
    Data TX(  21)(71:) / &
     ' (More'/
    Data TX(  22)(1:70)/ &
     'commands are available, but these are the most important ones. GNU Rea'/
    Data TX(  22)(71:) / &
     'dline'/
    Data TX(  23) / &
      'documentation describes fully the available possibilities.)'/
    Data TX(  24) / &
      ' ' /
    Data TX(  25)(1:70)/ &
     'When entering a file name it is possible to type only part of the file'/
    Data TX(  25)(71:) / &
     ' name'/
    Data TX(  26)(1:70)/ &
     'and have the name automatically completed. After typing one or more ch'/
    Data TX(  26)(71:) / &
     'aracters'/
    Data TX(  27) / &
      'of the file name you may type the <TAB> key and FIT2D will complete or'/
    Data TX(  28)(1:70)/ &
     'partially complete the file name up to a difference between two file n'/
    Data TX(  28)(71:) / &
     'ames.'/
    Data TX(  29)(1:70)/ &
     'If the characters uniquely define a file the name will be completed. e'/
    Data TX(  29)(71:) / &
     'macs'/
    Data TX(  30)(1:70)/ &
     'uses will be familiar with this functionality as it is provided by the'/
    Data TX(  30)(71:) / &
     ' GNU'/
    Data TX(  31) / &
      'Readline library.'/
    Data TX(  32) / &
      ' ' /
    Data TX(  33)(1:70)/ &
     'Generally the user can enter a double backslash (\\) instead of the no'/
    Data TX(  33)(71:) / &
     'rmal'/
    Data TX(  34)(1:69)/ &
     'input to `escape'' from a particular command. This should return the p'/
    Data TX(  34)(70:) / &
     'rogram to'/
    Data TX(  35)(1:70)/ &
     'the main menu. (It is possible that there are still some occasions whe'/
    Data TX(  35)(71:) / &
     'n this'/
    Data TX(  36)(1:69)/ &
     '`user escape'' option does not work as it should. If this happens plea'/
    Data TX(  36)(70:) / &
     'se inform'/
    Data TX(  37) / &
      'me of the command so that it can be rectified for future versions.)'/
    Data TX(  38) / &
      ' ' /
    Data TX(  39)(1:70)/ &
     'This help facility allows searching for keywords by using the key ">" '/
    Data TX(  39)(71:) / &
     'for'/
    Data TX(  40) / &
      'forwards searching and "<" for backwards searching. Thus you can jump'/
    Data TX(  41)(1:70)/ &
     'quickly to information on a certain command or topic. (Further possibi'/
    Data TX(  41)(71:) / &
     'lites'/
    Data TX(  42) / &
      'of the pager may be inquired by entering a question mark "?".'/
    Data TX(  43) / &
      ' ' /
    Data TX(  44) / &
      'The most important menu commands are:'/
    Data TX(  45) / &
      '    "INPUT DATA", "REGION", "PLOT DATA", "FIT", and "EXIT"'/
    Data TX(  46) / &
      ' ' /
    Data TX(  47) / &
      '"INPUT DATA" allows data to be input one of a number of defined file'/
    Data TX(  48) / &
      'formats. More formats will be added as appropriate.'/
    Data TX(  49) / &
      ' ' /
    Data TX(  50)(1:70)/ &
     '"REGION" allows the region that commands act on to be changed. Initial'/
    Data TX(  50)(71:) / &
     'ly'/
    Data TX(  51) / &
      'the region will be the whole data, but usually it is very useful to'/
    Data TX(  52)(1:70)/ &
     'restrict actions to only a sub-set of the data. This sets the REGION O'/
    Data TX(  52)(71:) / &
     'F'/
    Data TX(  53)(1:70)/ &
     'INTEREST (ROI). Understanding the ROI concept is very important to eff'/
    Data TX(  53)(71:) / &
     'icient'/
    Data TX(  54) / &
      'and powerful use of fit2d.'/
    Data TX(  55) / &
      ' ' /
    Data TX(  56)(1:70)/ &
     '"PIXEL REGION" is like "REGION", but the region is defined by pixel li'/
    Data TX(  56)(71:) / &
     'mits'/
    Data TX(  57) / &
      'rather than "data coordinates".'/
    Data TX(  58) / &
      ' ' /
    Data TX(  59)(1:70)/ &
     '"PLOT DATA" plots previously input data as a false colour image accord'/
    Data TX(  59)(71:) / &
     'ing'/
    Data TX(  60) / &
      'to the current attributes (style) which have been set by the user.'/
    Data TX(  61) / &
      ' ' /
    Data TX(  62)(1:70)/ &
     '"IMAGE" plots input data in the same manner as "PLOT DATA", but additi'/
    Data TX(  62)(71:) / &
     'onally'/
    Data TX(  63)(1:70)/ &
     'provides a graphics menu allowing zooming in and out and movement arou'/
    Data TX(  63)(71:) / &
     'nd the'/
    Data TX(  64)(1:70)/ &
     'image. The graphics sub-menu "OPTIONS" allows various of the style att'/
    Data TX(  64)(71:) / &
     'ributes'/
    Data TX(  65)(1:70)/ &
     'to be changed, and the graphics sub-menu "DISPLAY" allows alternative '/
    Data TX(  65)(71:) / &
     'forms'/
    Data TX(  66) / &
      'of display and information from the image.'/
    Data TX(  67) / &
      ' ' /
    Data TX(  68)(1:70)/ &
     '"PRINT GRAPHICS" will print the current graphics in a PostScript outpu'/
    Data TX(  68)(71:) / &
     't file.'/
    Data TX(  69)(1:70)/ &
     '   The first time this is called the user is prompted for the name of '/
    Data TX(  69)(71:) / &
     'the'/
    Data TX(  70)(1:70)/ &
     '   output file. Subsequent graphics are stored in the same file, unles'/
    Data TX(  70)(71:) / &
     's the'/
    Data TX(  71)(1:70)/ &
     '   command "END GRAPHICS FILE" is issued, in which case the next "PRIN'/
    Data TX(  71)(71:) / &
     'T'/
    Data TX(  72)(1:70)/ &
     '   GRAPHICS" command will prompt for a new output file. After the prog'/
    Data TX(  72)(71:) / &
     'ram has'/
    Data TX(  73) / &
      '   been exited these files may be sent to a PostScript printer.'/
    Data TX(  74) / &
      ' ' /
    Data TX(  75)(1:70)/ &
     '   The PostScript files are suitable for inclusion into a LaTeX docume'/
    Data TX(  75)(71:) / &
     'nt using'/
    Data TX(  76) / &
      '   the \psfig command. The \psfig command is defined in the input file'/
    Data TX(  77)(1:70)/ &
     '   psfig.tex so include the following line at the beginning of the doc'/
    Data TX(  77)(71:) / &
     'ument:'/
    Data TX(  78) / &
      ' ' /
    Data TX(  79) / &
      '   \input psfig.tex'/
    Data TX(  80) / &
      ' ' /
    Data TX(  81)(1:70)/ &
     '   To include a PostScript file "file.ps" which should take up 150mm u'/
    Data TX(  81)(71:) / &
     'se the'/
    Data TX(  82) / &
      '   following command in the text:'/
    Data TX(  83) / &
      ' ' /
    Data TX(  84) / &
      '   \centerline{\psfig{file=file.ps,height=150mm}}'/
    Data TX(  85) / &
      ' ' /
    Data TX(  86)(1:70)/ &
     '   The full page diagram will be reduced in size to fill 150mm. NOTE: '/
    Data TX(  86)(71:) / &
     'no'/
    Data TX(  87)(1:70)/ &
     '   spaces are allowed within the curly brackets of the \psfig command.'/
    Data TX(  87)(71:) / &
     ' Only'/
    Data TX(  88)(1:70)/ &
     '   one diagram per file is successfully displayed, so use the "END GRA'/
    Data TX(  88)(71:) / &
     'PHICS'/
    Data TX(  89) / &
      '   FILE" command to output multiple graphs in different files.'/
    Data TX(  90) / &
      ' ' /
    Data TX(  91)(1:70)/ &
     '"EXIT" (or "QUIT") is used to exit, fit2d demands confirmation, to avo'/
    Data TX(  91)(71:) / &
     'id'/
    Data TX(  92) / &
      '   accidental loss of results.'/
    Data TX(  93) / &
      ' ' /
    Data TX(  94)(1:70)/ &
     'All aspects of the graphics may be altered in style by calling one of '/
    Data TX(  94)(71:) / &
     'the'/
    Data TX(  95)(1:70)/ &
     'many other menu commands. Generally these commands start with "SET" e.'/
    Data TX(  95)(71:) / &
     'g.'/
    Data TX(  96)(1:70)/ &
     '"SET TITLE STYLE" allows the font, colour, size, etc. of the title tex'/
    Data TX(  96)(71:) / &
     't to'/
    Data TX(  97)(1:70)/ &
     'be altered. For a list of all the menu commands and their purpose retu'/
    Data TX(  97)(71:) / &
     'rn to'/
    Data TX(  98) / &
      'the top menu level (q) and type a question mark.'/
    Data TX(  99) / &
      ' ' /
    Data TX( 100) / &
      'Here are a few of the most important attribute commands.'/
    Data TX( 101) / &
      ' ' /
    Data TX( 102)(1:70)/ &
     '"PUBLICATION QUALITY" sets all line widths, except those of the grid t'/
    Data TX( 102)(71:) / &
     'o double'/
    Data TX( 103)(1:70)/ &
     '   thickness and sets all text font choices to the best available text'/
    Data TX( 103)(71:) / &
     ' font.'/
    Data TX( 104) / &
      '   (Thicker lines are needed for photo-reduction of graphics.)'/
    Data TX( 105) / &
      ' ' /
    Data TX( 106)(1:70)/ &
     '"PAGE POSITION" allows the position on the page of the graph to be alt'/
    Data TX( 106)(71:) / &
     'ered. The'/
    Data TX( 107)(1:70)/ &
     '   position is specified in page coordinates e.g. for A4 portrait Y va'/
    Data TX( 107)(71:) / &
     'ries from'/
    Data TX( 108)(1:70)/ &
     '   0.0 to 1.0 and X varies from 0.0 to 0.7071; (0.0, 0.0) is the botto'/
    Data TX( 108)(71:) / &
     'm left'/
    Data TX( 109) / &
      '   corner.'/
    Data TX( 110) / &
      ' ' /
    Data TX( 111)(1:70)/ &
     '"MACRO" runs a previously defined macro i.e. a series of commands. Mac'/
    Data TX( 111)(71:) / &
     'ros may'/
    Data TX( 112)(1:70)/ &
     '   be defined using the "START MACRO" and the "STOP MACRO" command. Th'/
    Data TX( 112)(71:) / &
     'e'/
    Data TX( 113)(1:70)/ &
     '   "START MACRO" command prompts for a file name to store the macro. T'/
    Data TX( 113)(71:) / &
     'he file'/
    Data TX( 114)(1:70)/ &
     '   is an ASCII file which contains the instructions as entered by the '/
    Data TX( 114)(71:) / &
     'user.'/
    Data TX( 115)(1:70)/ &
     '   Thus sequences of commands such as style setting commands can be de'/
    Data TX( 115)(71:) / &
     'fined'/
    Data TX( 116) / &
      '   once and re-used. The "STOP MACRO" command closes the macro.'/
    Data TX( 117) / &
      ' ' /
    Data TX( 118)(1:70)/ &
     '   Macros may be "parameterised" by using symbols within them (see "SY'/
    Data TX( 118)(71:) / &
     'MBOL").'/
    Data TX( 119) / &
      ' ' /
    Data TX( 120)(1:70)/ &
     '   Macros are run using the "MACRO" command which prompts for a file n'/
    Data TX( 120)(71:) / &
     'ame.'/
    Data TX( 121)(1:70)/ &
     '   Macros may call other macros, the effect is to include the called f'/
    Data TX( 121)(71:) / &
     'ile'/
    Data TX( 122)(1:70)/ &
     '   instructions within the calling macro.  Note: if the called macro i'/
    Data TX( 122)(71:) / &
     's later'/
    Data TX( 123)(1:70)/ &
     '   modified this does not affect the other macro. Since the macro file'/
    Data TX( 123)(71:) / &
     's are'/
    Data TX( 124)(1:70)/ &
     '   ASCII files they may be modified using an editor, but GREAT CARE mu'/
    Data TX( 124)(71:) / &
     'st be'/
    Data TX( 125) / &
      '   taken.'/
    Data TX( 126) / &
      ' ' /
    Data TX( 127) / &
      '"CLEAR DATA" may be used to reset the data array to zero.'/
    Data TX( 128) / &
      ' ' /
    Data TX( 129)(1:70)/ &
     '----------------------------------------------------------------------'/
    Data TX( 129)(71:) / &
     '---------'/
    Data TX( 130) / &
      '                              FIT2D COMMANDS'/
    Data TX( 131)(1:70)/ &
     '----------------------------------------------------------------------'/
    Data TX( 131)(71:) / &
     '---------'/
    Data TX( 132) / &
      ' ' /
    Data TX( 133) / &
      '"?"'/
    Data TX( 134) / &
      '---'/
    Data TX( 135) / &
      ' ' /
    Data TX( 136) / &
      'Entering a question mark will produce a list of all the available main'/
    Data TX( 137)(1:70)/ &
     'commands followed by a brief description of the corresponding operatio'/
    Data TX( 137)(71:) / &
     'n. The'/
    Data TX( 138)(1:70)/ &
     'list is controlled by the pager. (Further information on the commands '/
    Data TX( 138)(71:) / &
     'may be'/
    Data TX( 139) / &
      'obtained by the command "HELP").'/
    Data TX( 140) / &
      ' ' /
    Data TX( 141) / &
      '"ADD"'/
    Data TX( 142) / &
      '-----'/
    Data TX( 143) / &
      ' ' /
    Data TX( 144)(1:69)/ &
     'Adds the contents of the `memory'' to the current data array throughou'/
    Data TX( 144)(70:) / &
     't'/
    Data TX( 145) / &
      'the ROI.'/
    Data TX( 146) / &
      ' ' /
    Data TX( 147) / &
      '"ANNOTATION LABEL"'/
    Data TX( 148) / &
      '------------------'/
    Data TX( 149) / &
      ' ' /
    Data TX( 150) / &
      'All graphical display (images, contour plots, X/Y graphs) may contain'/
    Data TX( 151) / &
      'additional annotation labels. These text labels may be arbitrarily'/
    Data TX( 152) / &
      'placed and may include arrows to point to areas of the graphics. The'/
    Data TX( 153) / &
      'annotation labels and arrows may be defined in either page coordinates'/
    Data TX( 154)(1:70)/ &
     'or data coordinates. By using data coordinates the relative position o'/
    Data TX( 154)(71:) / &
     'f'/
    Data TX( 155)(1:70)/ &
     'the label or arrows will not change if different regions of the data a'/
    Data TX( 155)(71:) / &
     're'/
    Data TX( 156) / &
      'displayed.'/
    Data TX( 157) / &
      ' ' /
    Data TX( 158) / &
      'Many different annotation labels may be added and their style may be'/
    Data TX( 159)(1:70)/ &
     'controlled individually using "SET ANNOTATION STYLE" and "SET ARROW ST'/
    Data TX( 159)(71:) / &
     'YLE".'/
    Data TX( 160) / &
      ' ' /
    Data TX( 161) / &
      '"BLOCK COPY"'/
    Data TX( 162) / &
      '------------'/
    Data TX( 163) / &
      ' ' /
    Data TX( 164) / &
      'Copies a defined block of data to and from the internal memories. An'/
    Data TX( 165) / &
      'internal memory to be used must have been previously created using the'/
    Data TX( 166) / &
      '"INTERNAL MEMORY" command. The copy can move the relative position of'/
    Data TX( 167) / &
      'the output region. The input region and the start of the output region'/
    Data TX( 168)(1:70)/ &
     'are specified. The input and output regions must be fully defined for '/
    Data TX( 168)(71:) / &
     'the'/
    Data TX( 169) / &
      'command to work. (This command can be much more efficient than using'/
    Data TX( 170) / &
      'the "INTERNAL MEMORY" command to transfer to and from the current data'/
    Data TX( 171) / &
      'array, as only the region defined is copied. The rest is unaffected.'/
    Data TX( 172) / &
      ' ' /
    Data TX( 173) / &
      '"BLUR"'/
    Data TX( 174) / &
      '------'/
    Data TX( 175) / &
      ' ' /
    Data TX( 176)(1:70)/ &
     'Blurs (smoothes) data in the ROI by convolution with a top-hat functio'/
    Data TX( 176)(71:) / &
     'n'/
    Data TX( 177) / &
      'of user specified size. The output is in the memory.'/
    Data TX( 178) / &
      ' ' /
    Data TX( 179) / &
      '"CADD"'/
    Data TX( 180) / &
      '------'/
    Data TX( 181) / &
      ' ' /
    Data TX( 182)(1:70)/ &
     'Adds a constant to every element throughout the ROI. The user is promp'/
    Data TX( 182)(71:) / &
     'ted for'/
    Data TX( 183) / &
      'the value of the constant.'/
    Data TX( 184) / &
      ' ' /
    Data TX( 185) / &
      '"CALIBRATION"'/
    Data TX( 186) / &
      '-------------'/
    Data TX( 187) / &
      ' ' /
    Data TX( 188) / &
      'Enters sub-menu for calibration and correction or spatial distortions.'/
    Data TX( 189) / &
      'See calibration sub-menu "HELP".'/
    Data TX( 190) / &
      ' ' /
    Data TX( 191) / &
      '"CDIVIDE"'/
    Data TX( 192) / &
      '---------'/
    Data TX( 193) / &
      ' ' /
    Data TX( 194)(1:70)/ &
     'Divides every element throughout the ROI by a constant. The user is pr'/
    Data TX( 194)(71:) / &
     'ompted'/
    Data TX( 195) / &
      'for the value of the constant.'/
    Data TX( 196) / &
      ' ' /
    Data TX( 197) / &
      '"CLEAR DATA"'/
    Data TX( 198) / &
      '------------'/
    Data TX( 199) / &
      ' ' /
    Data TX( 200) / &
      'Initialise data.'/
    Data TX( 201) / &
      ' ' /
    Data TX( 202) / &
      '"CLOSE LOG"'/
    Data TX( 203) / &
      '-----------'/
    Data TX( 204) / &
      ' ' /
    Data TX( 205) / &
      'Closes any log file (See "OPEN LOG").'/
    Data TX( 206) / &
      ' ' /
    Data TX( 207) / &
      '"CMULTIPLY"'/
    Data TX( 208) / &
      '-----------'/
    Data TX( 209) / &
      ' ' /
    Data TX( 210) / &
      'Multiplies every element throughout the ROI by a constant. The user is'/
    Data TX( 211) / &
      'prompted for the value of the constant.'/
    Data TX( 212) / &
      ' ' /
    Data TX( 213) / &
      '"COLOUR TABLE"'/
    Data TX( 214) / &
      '--------------'/
    Data TX( 215) / &
      ' ' /
    Data TX( 216)(1:70)/ &
     'Allows the type of false colour table used to represent intensity valu'/
    Data TX( 216)(71:) / &
     'es of'/
    Data TX( 217)(1:70)/ &
     '2-D images to be changed. A choice of a number of different colour sch'/
    Data TX( 217)(71:) / &
     'emes is'/
    Data TX( 218)(1:70)/ &
     'available to the user. The different available colour schemes are refe'/
    Data TX( 218)(71:) / &
     'rred by'/
    Data TX( 219) / &
      'a name e.g. TEMPERATURE, GREY-SCALE, GEOGRAPHICAL.'/
    Data TX( 220) / &
      ' ' /
    Data TX( 221) / &
      '"CONTOUR PLOT"'/
    Data TX( 222) / &
      '--------------'/
    Data TX( 223) / &
      ' ' /
    Data TX( 224) / &
      'This will display the ROI of the current data in contour plot form. It'/
    Data TX( 225)(1:70)/ &
     'should be noted that this is more calculation intensive than producing'/
    Data TX( 225)(71:) / &
     ' a'/
    Data TX( 226) / &
      'false colour image.'/
    Data TX( 227) / &
      ' ' /
    Data TX( 228) / &
      '(At present no attribute control is available, but if control over the'/
    Data TX( 229) / &
      'number of contour lines, and their style is required it can be added.)'/
    Data TX( 230) / &
      ' ' /
    Data TX( 231) / &
      '"CREATE DATA"'/
    Data TX( 232) / &
      '-------------'/
    Data TX( 233) / &
      ' ' /
    Data TX( 234)(1:70)/ &
     'Normally if you try an instruction such as "IMAGE" before any data has'/
    Data TX( 234)(71:) / &
     ' been'/
    Data TX( 235)(1:70)/ &
     'input you will receive a warning message telling you that first you mu'/
    Data TX( 235)(71:) / &
     'st'/
    Data TX( 236)(1:70)/ &
     '"INPUT DATA" or "CREATE DATA". "CREATE DATA" makes FIT2D create progra'/
    Data TX( 236)(71:) / &
     'm data,'/
    Data TX( 237)(1:70)/ &
     'although initially the data array elements are all zero. This can be u'/
    Data TX( 237)(71:) / &
     'seful'/
    Data TX( 238) / &
      'for simulation purposes.'/
    Data TX( 239) / &
      ' ' /
    Data TX( 240)(1:70)/ &
     'The user is prompted for the size of artificial data to create. This m'/
    Data TX( 240)(71:) / &
     'ust'/
    Data TX( 241) / &
      'clearly be not greater in size than the current program arrays.'/
    Data TX( 242) / &
      ' ' /
    Data TX( 243) / &
      '"CURVE STYLES"'/
    Data TX( 244) / &
      '--------------'/
    Data TX( 245) / &
      ' ' /
    Data TX( 246) / &
      'This is a shorter form of the command "SET CURVE STYLES".'/
    Data TX( 247) / &
      ' ' /
    Data TX( 248) / &
      '"DIFFRACTION PATTERN"'/
    Data TX( 249) / &
      '---------------------'/
    Data TX( 250) / &
      ' ' /
    Data TX( 251)(1:70)/ &
     'This allows the diffraction pattern produced by an arbitrary tri-clini'/
    Data TX( 251)(71:) / &
     'c'/
    Data TX( 252) / &
      'unit cell to be predicted (at present this assumes 360 degree rotation'/
    Data TX( 253) / &
      'about a rotation axis). For the diffraction pattern to be predicted it'/
    Data TX( 254) / &
      'is necessary to have defined the geometry of the experimental set-up;'/
    Data TX( 255) / &
      'this must be done beforehand using "GEOMETRY (EXPERIMENT)".'/
    Data TX( 256) / &
      ' ' /
    Data TX( 257) / &
      'FIT2D calculates the position of the centre of each Bragg peak for a'/
    Data TX( 258) / &
      'range of hkl indices. The user is prompted for the cell parameters and'/
    Data TX( 259) / &
      'for the range of indices.'/
    Data TX( 260) / &
      ' ' /
    Data TX( 261) / &
      'The user is allowed the option of creating an overlay diagram of the'/
    Data TX( 262) / &
      'predicted diffraction pattern on top of an image of the ROI.'/
    Data TX( 263) / &
      ' ' /
    Data TX( 264) / &
      'The definitions of the cell orientation angles are those used by'/
    Data TX( 265) / &
      'Fraser and MacRae for a fibre (R D B Fraser and T P MacRae, "Unit'/
    Data TX( 266) / &
      'cell and Molecular Connectivity in Tendon Collagen", Int. J. Biol.'/
    Data TX( 267) / &
      'Macromol., Vol 3, pp 193-200, 1981).'/
    Data TX( 268) / &
      ' ' /
    Data TX( 269)(1:70)/ &
     'The command "UNIT CELL PARAMETERS" can be to convert between reciproca'/
    Data TX( 269)(71:) / &
     'l'/
    Data TX( 270) / &
      'space cell parameters and normal cell parameters, and vice versa.'/
    Data TX( 271) / &
      ' ' /
    Data TX( 272) / &
      'The command "SET CURVE STYLE" can be used to change the style of'/
    Data TX( 273) / &
      'markers used to draw the projected reciprocal lattice positions.'/
    Data TX( 274) / &
      'Curve 1 is used for the general hkl lattice points, and curve 2 is'/
    Data TX( 275) / &
      'used for all l=0 points.'/
    Data TX( 276) / &
      ' ' /
    Data TX( 277) / &
      '"DIMENSIONS"'/
    Data TX( 278) / &
      '------------'/
    Data TX( 279) / &
      ' ' /
    Data TX( 280)(1:70)/ &
     'Changes the size of program arrays and allows variance arrays to be us'/
    Data TX( 280)(71:) / &
     'ed'/
    Data TX( 281)(1:70)/ &
     'or not. The user is prompted for the new size of program arrays. WARNI'/
    Data TX( 281)(71:) / &
     'NG:'/
    Data TX( 282)(1:70)/ &
     'this operation destroys any data that was already present in the curre'/
    Data TX( 282)(71:) / &
     'nt'/
    Data TX( 283)(1:70)/ &
     'data array or in the memory. The user should save any data ("OUTPUT DA'/
    Data TX( 283)(71:) / &
     'TA")'/
    Data TX( 284) / &
      'before performing this operation.'/
    Data TX( 285) / &
      ' ' /
    Data TX( 286) / &
      'As with all other operations which allocate memory this may fail owing'/
    Data TX( 287) / &
      'to system limits. If this does fail trying to continue regardless will'/
    Data TX( 288) / &
      'almost certainly lead to false results or further errors.'/
    Data TX( 289) / &
      ' ' /
    Data TX( 290) / &
      '"DISPLAY LIMITS"'/
    Data TX( 291) / &
      '----------------'/
    Data TX( 292) / &
      ' ' /
    Data TX( 293)(1:70)/ &
     'When a large region of data is output as a PostScript image there is a'/
    Data TX( 293)(71:) / &
     'n upper'/
    Data TX( 294)(1:70)/ &
     'limit of the maximum number of pixels to be drawn. This sames file spa'/
    Data TX( 294)(71:) / &
     'ce'/
    Data TX( 295)(1:70)/ &
     'and time for the image to be printed. The default value is close to th'/
    Data TX( 295)(71:) / &
     'e'/
    Data TX( 296) / &
      'reasonable limit for most printers, but "DISPLAY LIMITS" allows this'/
    Data TX( 297) / &
      'value to be changed. If necessary, prior to output, the region is'/
    Data TX( 298) / &
      'automatically re-binned to a smaller size. The data is re-binned by an'/
    Data TX( 299) / &
      'equal factor in both directions, and scaled by the number of re-binned'/
    Data TX( 300)(1:70)/ &
     'pixels, so the range is approximately the same as the range of the ful'/
    Data TX( 300)(71:) / &
     'l data.'/
    Data TX( 301) / &
      ' ' /
    Data TX( 302)(1:70)/ &
     'The upper limit may changed by the user, so that higher or lower resol'/
    Data TX( 302)(71:) / &
     'ution'/
    Data TX( 303) / &
      'images may be output.'/
    Data TX( 304) / &
      ' ' /
    Data TX( 305) / &
      '"DIVIDE"'/
    Data TX( 306) / &
      '--------'/
    Data TX( 307) / &
      ' ' /
    Data TX( 308) / &
      'Divides ROI of current data by the memory. If a zero is encountered in'/
    Data TX( 309)(1:70)/ &
     'the memory data, the output element will be set to -1.7014117e38. If e'/
    Data TX( 309)(71:) / &
     'rror'/
    Data TX( 310)(1:70)/ &
     'propagation is being carried out and a zero occurs in a memory element'/
    Data TX( 310)(71:) / &
     ' the'/
    Data TX( 311) / &
      'variance array value is similarly set to -1.7014117e38.'/
    Data TX( 312) / &
      ' ' /
    Data TX( 313)(1:70)/ &
     '(Overflow and underflow may occur if the numbers are sufficiently larg'/
    Data TX( 313)(71:) / &
     'e'/
    Data TX( 314) / &
      'or small.)'/
    Data TX( 315) / &
      ' ' /
    Data TX( 316) / &
      '"END GRAPHICS FILE"'/
    Data TX( 317) / &
      '-------------------'/
    Data TX( 318) / &
      ' ' /
    Data TX( 319)(1:70)/ &
     'Closes the file used for graphics output (after the "PRINT GRAPHICS" c'/
    Data TX( 319)(71:) / &
     'ommand).'/
    Data TX( 320)(1:70)/ &
     'This allows different files to be used for different graphics. A subse'/
    Data TX( 320)(71:) / &
     'quent'/
    Data TX( 321) / &
      '"PRINT GRAPHICS" command will prompt for the name of a new file.'/
    Data TX( 322) / &
      ' ' /
    Data TX( 323)(1:70)/ &
     '(This may be useful for putting different diagrams in different files '/
    Data TX( 323)(71:) / &
     'for'/
    Data TX( 324)(1:70)/ &
     'later inclusion into a LaTeX , or other type, of document, or for forc'/
    Data TX( 324)(71:) / &
     'ing the'/
    Data TX( 325) / &
      'same question sequence during a macro.)'/
    Data TX( 326) / &
      ' ' /
    Data TX( 327) / &
      '"EXCHANGE"'/
    Data TX( 328) / &
      '----------'/
    Data TX( 329) / &
      ' ' /
    Data TX( 330)(1:70)/ &
     'Exchange current data with the memory contents. The previous data in t'/
    Data TX( 330)(71:) / &
     'he'/
    Data TX( 331)(1:70)/ &
     'memory becomes the current data, and the previous current data becomes'/
    Data TX( 331)(71:) / &
     ' the'/
    Data TX( 332)(1:70)/ &
     'memory data. Axis values, text labels, and the ROI are similarly swapp'/
    Data TX( 332)(71:) / &
     'ed.'/
    Data TX( 333) / &
      ' ' /
    Data TX( 334)(1:70)/ &
     '(The program in fact exchanges the pointers to various arrays instead '/
    Data TX( 334)(71:) / &
     'of'/
    Data TX( 335) / &
      'swapping element by element. This makes "EXCHANGE" a fast operation'/
    Data TX( 336)(1:70)/ &
     'independent of the size of the program array, unlike the "STORE" and "'/
    Data TX( 336)(71:) / &
     'RECALL"'/
    Data TX( 337) / &
      'commands which must operate element by element.)'/
    Data TX( 338) / &
      ' ' /
    Data TX( 339) / &
      '"EXIT"'/
    Data TX( 340) / &
      '------'/
    Data TX( 341) / &
      ' ' /
    Data TX( 342)(1:70)/ &
     'Command to exit or quit the program. To make accidentally termination '/
    Data TX( 342)(71:) / &
     'unlikely,'/
    Data TX( 343)(1:70)/ &
     'the user is prompted to confirm the request to exit. If not confirmed '/
    Data TX( 343)(71:) / &
     'FIT2D'/
    Data TX( 344) / &
      'returns to the main menu.'/
    Data TX( 345) / &
      ' ' /
    Data TX( 346) / &
      '"FILTER"'/
    Data TX( 347) / &
      '--------'/
    Data TX( 348) / &
      ' ' /
    Data TX( 349) / &
      '(Not implemented at present. This can be re-implemented if required.)'/
    Data TX( 350) / &
      'Fourier Filtering of data with sharp cutoff filter.'/
    Data TX( 351) / &
      ' ' /
    Data TX( 352) / &
      '"FIT"'/
    Data TX( 353) / &
      '-----'/
    Data TX( 354) / &
      ' ' /
    Data TX( 355)(1:70)/ &
     'This command enters the fitting sub-menu. The fitting sub-menu contain'/
    Data TX( 355)(71:) / &
     's'/
    Data TX( 356)(1:70)/ &
     'a variety of commands which allow fit models to be defined, minimised,'/
    Data TX( 356)(71:) / &
     ' and'/
    Data TX( 357) / &
      'the inspection of subsequent results.'/
    Data TX( 358) / &
      ' ' /
    Data TX( 359) / &
      '"FLIP"'/
    Data TX( 360) / &
      '------'/
    Data TX( 361) / &
      ' ' /
    Data TX( 362)(1:70)/ &
     'The "FLIP" command allows the ROI to be reflected about its middle eit'/
    Data TX( 362)(71:) / &
     'her'/
    Data TX( 363) / &
      'horizontally or vertically. FIT2D gives the following prompt:'/
    Data TX( 364) / &
      ' ' /
    Data TX( 365) / &
      'FLIP LEFT TO RIGHT ("NO" = TOP/BOTTOM)'/
    Data TX( 366) / &
      ' ' /
    Data TX( 367) / &
      'Entering "Y" will flip the image about its vertical middle, and "N"'/
    Data TX( 368)(1:70)/ &
     'will flip the ROI about its horizontal middle. The operation is perfor'/
    Data TX( 368)(71:) / &
     'med'/
    Data TX( 369) / &
      'in place so the memory is not affected.'/
    Data TX( 370) / &
      ' ' /
    Data TX( 371) / &
      '"FONT"'/
    Data TX( 372) / &
      '------'/
    Data TX( 373) / &
      ' ' /
    Data TX( 374) / &
      'See "SET FONT"'/
    Data TX( 375) / &
      ' ' /
    Data TX( 376) / &
      '"FUJI LINEARISATION"'/
    Data TX( 377) / &
      '--------------------'/
    Data TX( 378) / &
      ' ' /
    Data TX( 379)(1:70)/ &
     'The "FUJI LINEARISATION" command allows Fuji image plate intensities a'/
    Data TX( 379)(71:) / &
     's read'/
    Data TX( 380)(1:70)/ &
     'in from a binary file to be converted to a linear scale. At present th'/
    Data TX( 380)(71:) / &
     'e images'/
    Data TX( 381) / &
      'are stored in a Log form and must be converted to a linear scale. The'/
    Data TX( 382) / &
      'conversion formula is:'/
    Data TX( 383) / &
      ' ' /
    Data TX( 384) / &
      'x_out = 10^(x_in*log_10(4000) / 1023)'/
    Data TX( 385) / &
      ' ' /
    Data TX( 386) / &
      'NOTE: At present no error propagation is performed.'/
    Data TX( 387) / &
      ' ' /
    Data TX( 388) / &
      '"FULL REGION"'/
    Data TX( 389) / &
      '-------------'/
    Data TX( 390) / &
      ' ' /
    Data TX( 391) / &
      'Fast method of making the ROI cover all the defined data.'/
    Data TX( 392) / &
      ' ' /
    Data TX( 393) / &
      '"GAUSSIAN"'/
    Data TX( 394) / &
      '----------'/
    Data TX( 395) / &
      ' ' /
    Data TX( 396) / &
      'The user can define a 2-D Gaussian function which is added to the data'/
    Data TX( 397) / &
      'within the current ROI. (The peak intensity may be negative to allow'/
    Data TX( 398) / &
      'peaks to be subtracted.)'/
    Data TX( 399) / &
      ' ' /
    Data TX( 400) / &
      '"GEOMETRY (EXPERIMENT)"'/
    Data TX( 401) / &
      '-----------------------'/
    Data TX( 402) / &
      ' ' /
    Data TX( 403) / &
      'A number of commands are only possible if an experimental geometry has'/
    Data TX( 404) / &
      'been defined e.g. "DIFFRACTION PATTERN" which predicts the centres of'/
    Data TX( 405) / &
      'Bragg peaks on a detector.'/
    Data TX( 406) / &
      ' ' /
    Data TX( 407) / &
      '"GEOMETRY (EXPERIMENT)" allows the user to define general aspects of'/
    Data TX( 408)(1:70)/ &
     'a real or simulated experiment such as energy (or wavelength), sample '/
    Data TX( 408)(71:) / &
     'to'/
    Data TX( 409) / &
      'detector distance, and pixel sizes.'/
    Data TX( 410) / &
      ' ' /
    Data TX( 411) / &
      'The centre of the beam on the detector may be defined in one of three'/
    Data TX( 412) / &
      'different methods:'/
    Data TX( 413) / &
      ' ' /
    Data TX( 414) / &
      '   "AVERAGED GRAPHICAL" The user clicks on a series of pairs of'/
    Data TX( 415)(1:70)/ &
     '   symmetric points (peaks) and the program calculates the beam centre'/
    Data TX( 415)(71:) / &
     ' to'/
    Data TX( 416) / &
      '   be the average of the input coordinates.'/
    Data TX( 417) / &
      '   "GRAPHICAL COORDINATE" The user clicks on the estimated centre'/
    Data TX( 418) / &
      '   of the beam (useful for semi-transparent beam-stops).'/
    Data TX( 419) / &
      '   "KEYBOARD" The user is prompted for keyboard input of the X and'/
    Data TX( 420) / &
      '   Y coordinates of the beam centre. (The user must know the values by'/
    Data TX( 421) / &
      '   some other method.)'/
    Data TX( 422) / &
      ' ' /
    Data TX( 423) / &
      '(The "PEEP" command will output angles and corresponding d-spacings'/
    Data TX( 424) / &
      'once the geometry has been defined.)'/
    Data TX( 425) / &
      ' ' /
    Data TX( 426) / &
      '"GRID"'/
    Data TX( 427) / &
      '------'/
    Data TX( 428) / &
      ' ' /
    Data TX( 429)(1:70)/ &
     'User can turn on and off horizontal and vertical, coarse and fine grid'/
    Data TX( 429)(71:) / &
     ' lines.'/
    Data TX( 430)(1:68)/ &
     'The coarse grid lines are drawn where ever there are ''large ticks'' o'/
    Data TX( 430)(69:) / &
     'n the'/
    Data TX( 431)(1:68)/ &
     'axes, and the fine grid lines are drawn where there are ''small ticks'/
    Data TX( 431)(69:) / &
     '''.'/
    Data TX( 432)(1:70)/ &
     'The style of the grid lines can be changed with "SET GRID STYLE", and '/
    Data TX( 432)(71:) / &
     'the'/
    Data TX( 433) / &
      'number of fine grid lines is changed by "SET AXES STYLE". "LOGARITHMIC'/
    Data TX( 434) / &
      'DISPLAY" will also change the aspect of the grid.'/
    Data TX( 435) / &
      ' ' /
    Data TX( 436) / &
      '"HELP"'/
    Data TX( 437) / &
      '------'/
    Data TX( 438) / &
      ' ' /
    Data TX( 439)(1:68)/ &
     'This help text, controlled by a ''pager'' allowing backwards and forwa'/
    Data TX( 439)(69:) / &
     'rds'/
    Data TX( 440)(1:70)/ &
     'scrolling, searching for keywords, and many other possibilities. (Type'/
    Data TX( 440)(71:) / &
     ' ?'/
    Data TX( 441) / &
      'more information on the pager, and the available commands.)'/
    Data TX( 442) / &
      ' ' /
    Data TX( 443) / &
      '"IMAGE"'/
    Data TX( 444) / &
      '-------'/
    Data TX( 445) / &
      ' ' /
    Data TX( 446)(1:70)/ &
     'Display of the ROI of the current data as a 2-D false colour pixel ima'/
    Data TX( 446)(71:) / &
     'ge with'/
    Data TX( 447)(1:70)/ &
     'graphical input to change displayed region and set display attributes.'/
    Data TX( 447)(71:) / &
     ' This'/
    Data TX( 448)(1:70)/ &
     'option is still under development and in the future many more aspects '/
    Data TX( 448)(71:) / &
     'of the'/
    Data TX( 449) / &
      'graphical display should be controllable from simple graphical menus.'/
    Data TX( 450) / &
      ' ' /
    Data TX( 451)(1:70)/ &
     'Most of the commands in the graphics menu are for movement around the '/
    Data TX( 451)(71:) / &
     'image.'/
    Data TX( 452)(1:70)/ &
     'The commands change the ROI, and after exiting the "IMAGE" sub-menu th'/
    Data TX( 452)(71:) / &
     'e ROI'/
    Data TX( 453) / &
      'will be left as it was set within "IMAGE".'/
    Data TX( 454) / &
      ' ' /
    Data TX( 455) / &
      'The "ZOOM IN" button allows a sub-set of the ROI to be selected by'/
    Data TX( 456)(1:70)/ &
     'graphical input. The user is asked to click on the extremes of the req'/
    Data TX( 456)(71:) / &
     'uired'/
    Data TX( 457)(1:70)/ &
     'ROI. The new ROI is automatically displayed. The "OPTIONS" button prod'/
    Data TX( 457)(71:) / &
     'uces an'/
    Data TX( 458)(1:70)/ &
     'options sub-menu which allows further control of the graphics. The fol'/
    Data TX( 458)(71:) / &
     'lowing'/
    Data TX( 459) / &
      'options are presently available (more will be added):'/
    Data TX( 460) / &
      ' ' /
    Data TX( 461) / &
      '    "EXIT": Return to "IMAGE" graphical main menu'/
    Data TX( 462) / &
      '   "?": Explanation for available button commands'/
    Data TX( 463) / &
      '   "COLOUR TABLE": Choice of available colour tables'/
    Data TX( 464) / &
      '   "POSITION": Graphical input of graph page position e.g. the extent'/
    Data TX( 465) / &
      '   on the screen and on paper output of a graph or image.'/
    Data TX( 466) / &
      '   "ROTATE LUT": Graphical user interface for rotating the false'/
    Data TX( 467) / &
      '   colour look-up table.'/
    Data TX( 468) / &
      '   "TITLE": Change title of image data'/
    Data TX( 469) / &
      '   "X-AXIS LABEL": Change X-axis label of image data'/
    Data TX( 470) / &
      '   "Y-AXIS LABEL": Change Y-axis label of image data'/
    Data TX( 471) / &
      '   "Z-AXIS LABEL": Change Z-axis (intensity) label of image data'/
    Data TX( 472) / &
      '   "Z-SCALING": Choice of automatic or user set values for colour'/
    Data TX( 473) / &
      '   table scaling of intensity values'/
    Data TX( 474) / &
      ' ' /
    Data TX( 475) / &
      'The "DISPLAY" button enters a graphical sub-menu which offers various'/
    Data TX( 476) / &
      'display possibilities:'/
    Data TX( 477) / &
      ' ' /
    Data TX( 478) / &
      '   "EXIT": Return to "IMAGE" graphical main menu'/
    Data TX( 479) / &
      '   "?": Explanation for available button commands'/
    Data TX( 480) / &
      '   "ARC SLICE": Graphical input of three coordinates which define an'/
    Data TX( 481)(1:70)/ &
     '   arc. The 1-D slice through this arc is then displayed as an X-Y gra'/
    Data TX( 481)(71:) / &
     'ph with'/
    Data TX( 482) / &
      '   the choice to print the graph'/
    Data TX( 483) / &
      '   "CONTOUR PLOT": Display the data as a contour plot with option to'/
    Data TX( 484) / &
      '   print'/
    Data TX( 485) / &
      '   "PIXEL X/Y": Graphical input of a pixel coordinate with details'/
    Data TX( 486)(1:70)/ &
     '   of the pixel position, intensity, and average surrounding intensity'/
    Data TX( 486)(71:) / &
     ' output.'/
    Data TX( 487)(1:70)/ &
     '   If the experiment geometry has been defined estimates of D-spacing '/
    Data TX( 487)(71:) / &
     'will'/
    Data TX( 488) / &
      '   also be output'/
    Data TX( 489) / &
      '   "SLICE": Graphical input of two coordinates to define a 1-D'/
    Data TX( 490) / &
      '   slice. The slice is displayed as an X-Y graph with the choice to'/
    Data TX( 491) / &
      '   print the graph'/
    Data TX( 492) / &
      '   "3-D SURFACE": Representation of the ROI as a 3-D surface with'/
    Data TX( 493)(1:70)/ &
     '   false colour also representing intensity. Graphics buttons allow th'/
    Data TX( 493)(71:) / &
     'e surface'/
    Data TX( 494) / &
      '   view orientation to be changed'/
    Data TX( 495)(1:70)/ &
     '   "PRINT": Prompts for the name of an output file, unless one is alre'/
    Data TX( 495)(71:) / &
     'ady'/
    Data TX( 496) / &
      '   open, and outputs a PostScript version of the current data image.'/
    Data TX( 497) / &
      ' ' /
    Data TX( 498) / &
      'The "PRINT" button prompts for the name of an output file, unless one'/
    Data TX( 499)(1:70)/ &
     'is already open, and outputs a PostScript version of the current data '/
    Data TX( 499)(71:) / &
     'image.'/
    Data TX( 500) / &
      ' ' /
    Data TX( 501) / &
      'Many of the main menu commands change the behaviour of the displayed'/
    Data TX( 502) / &
      'graphics:'/
    Data TX( 503) / &
      ' ' /
    Data TX( 504) / &
      '"ANNOTATION LABELS": Add annotation labels to the graphics.'/
    Data TX( 505) / &
      ' ' /
    Data TX( 506)(1:70)/ &
     '"DISPLAY LIMITS": Set the maximum number of pixels which will be used '/
    Data TX( 506)(71:) / &
     'in'/
    Data TX( 507)(1:70)/ &
     'either the X or the Y-direction to output the image. Larger images, or'/
    Data TX( 507)(71:) / &
     ' image'/
    Data TX( 508) / &
      'regions, will be automatically re-binned to make the number of pixels'/
    Data TX( 509) / &
      'smaller than the limit.'/
    Data TX( 510) / &
      ' ' /
    Data TX( 511) / &
      '"GRID": Control horizontal and vertical, coarse and fine grid lines on'/
    Data TX( 512) / &
      'top of image.'/
    Data TX( 513) / &
      ' ' /
    Data TX( 514)(1:70)/ &
     '"SET ****": The set commands will change the aspect of the displayed g'/
    Data TX( 514)(71:) / &
     'raphical'/
    Data TX( 515) / &
      'items.'/
    Data TX( 516) / &
      ' ' /
    Data TX( 517) / &
      '"TITLE": Change title of image.'/
    Data TX( 518) / &
      ' ' /
    Data TX( 519) / &
      '"X-AXIS LABEL": Change text for X-axis label.'/
    Data TX( 520) / &
      ' ' /
    Data TX( 521) / &
      '"Y-AXIS LABEL": Change text for Y-axis label.'/
    Data TX( 522) / &
      ' ' /
    Data TX( 523) / &
      '"Z-AXIS LABEL": Change text for Z-axis (intensity) label.'/
    Data TX( 524) / &
      ' ' /
    Data TX( 525) / &
      '"Z-SCALE": Change scaling mode for the Z-scale (intensity). By'/
    Data TX( 526) / &
      'default the data is always automatically scaled to display the full'/
    Data TX( 527) / &
      'range of data values within the display region.'/
    Data TX( 528) / &
      ' ' /
    Data TX( 529) / &
      '"INFORMATION"'/
    Data TX( 530) / &
      '-------------'/
    Data TX( 531) / &
      ' ' /
    Data TX( 532)(1:70)/ &
     'Produces information on the internal state of FIT2D, such as the prese'/
    Data TX( 532)(71:) / &
     'nt'/
    Data TX( 533) / &
      'size of program arrays and whether or not current data and memory data'/
    Data TX( 534)(1:70)/ &
     'are presently defined. If so the current values of the ROI are also ou'/
    Data TX( 534)(71:) / &
     'tput.'/
    Data TX( 535) / &
      ' ' /
    Data TX( 536) / &
      '"INPUT DATA"'/
    Data TX( 537) / &
      '------------'/
    Data TX( 538) / &
      ' ' /
    Data TX( 539)(1:69)/ &
     'Input of data from defined file formats into FIT2D''s internal data-ba'/
    Data TX( 539)(70:) / &
     'se.'/
    Data TX( 540) / &
      ' ' /
    Data TX( 541)(1:70)/ &
     '"BINARY (UNFORMATTED)": This allows unformatted binary data to be inpu'/
    Data TX( 541)(71:) / &
     't'/
    Data TX( 542) / &
      '"FIT2D STANDARD FORMAT": This is the standard format which a flexible'/
    Data TX( 543) / &
      'self describing format'/
    Data TX( 544) / &
      '"IMAGEQUANT":For input of data from the IMAGEQUANT Imaging plate PC'/
    Data TX( 545) / &
      'systems (a TIFF based format file)'/
    Data TX( 546) / &
      '"MAR RESEARCH FORMAT": For input of data from the Mar Research'/
    Data TX( 547) / &
      'image plate system (a VAX Integer*2 1200*1200 image)'/
    Data TX( 548) / &
      '"PHOTOMETRICS CCD FORMAT": Integer*2 binary data described by a'/
    Data TX( 549)(1:70)/ &
     'short header. Produced by the X-ray image intensifier/CCD read-out det'/
    Data TX( 549)(71:) / &
     'ector'/
    Data TX( 550) / &
      'system'/
    Data TX( 551) / &
      '"PRINCETON CCD FORMAT": Integer*2 binary data described by a'/
    Data TX( 552)(1:70)/ &
     'short header. Produced by the X-ray image intensifier/CCD read-out det'/
    Data TX( 552)(71:) / &
     'ector'/
    Data TX( 553)(1:70)/ &
     'system. (Very similar but slightly different format to the Photometric'/
    Data TX( 553)(71:) / &
     's'/
    Data TX( 554) / &
      'format.)'/
    Data TX( 555) / &
      '"USER INTENSITIES": Interactive entry of data values'/
    Data TX( 556) / &
      '"WESS FORMAT": For input of film densitometer data (Unformatted'/
    Data TX( 557) / &
      'unsigned byte data)'/
    Data TX( 558) / &
      ' ' /
    Data TX( 559) / &
      '"INTERNAL MEMORY"'/
    Data TX( 560) / &
      '-----------------'/
    Data TX( 561) / &
      ' ' /
    Data TX( 562)(1:70)/ &
     'This command allows data to be transfered between the current data arr'/
    Data TX( 562)(71:) / &
     'ay'/
    Data TX( 563) / &
      'and one or more internal memories. From the current data array, only'/
    Data TX( 564) / &
      'the region of interest (ROI) is copied. Transferring from an internal'/
    Data TX( 565)(1:70)/ &
     'memory will copy the stored region of interest back to the current dat'/
    Data TX( 565)(71:) / &
     'a'/
    Data TX( 566)(1:70)/ &
     'array, but will lose any offset position. (The "BLOCK COPY" command ca'/
    Data TX( 566)(71:) / &
     'n'/
    Data TX( 567)(1:70)/ &
     'be used to copy a block region to and from the internal memories witho'/
    Data TX( 567)(71:) / &
     'ut'/
    Data TX( 568) / &
      'affecting the rest of the data.)'/
    Data TX( 569) / &
      ' ' /
    Data TX( 570) / &
      '"LINEARISE FILM"'/
    Data TX( 571) / &
      '----------------'/
    Data TX( 572) / &
      ' ' /
    Data TX( 573)(1:70)/ &
     'Corrects the non-linearity response of film data. The correction appli'/
    Data TX( 573)(71:) / &
     'ed'/
    Data TX( 574)(1:70)/ &
     'is a quadratic which has been found to agree with experimental results'/
    Data TX( 574)(71:) / &
     '.'/
    Data TX( 575)(1:70)/ &
     'It is necessary to know the type of film, and the maximum optical dens'/
    Data TX( 575)(71:) / &
     'ity'/
    Data TX( 576) / &
      'measured by the micro-densitometer.'/
    Data TX( 577) / &
      ' ' /
    Data TX( 578) / &
      '"LOGARITHM"'/
    Data TX( 579) / &
      '-----------'/
    Data TX( 580) / &
      ' ' /
    Data TX( 581) / &
      'Take logarithm base 10 of all elements in the ROI.'/
    Data TX( 582) / &
      ' ' /
    Data TX( 583)(1:70)/ &
     'If any of the elements are zero or negative the user will be prompted '/
    Data TX( 583)(71:) / &
     'for the'/
    Data TX( 584)(1:70)/ &
     'lower threshold value to be used to set these elements. If variances e'/
    Data TX( 584)(71:) / &
     'xist'/
    Data TX( 585) / &
      'they will be set to the absolute value of the input lower threshold.'/
    Data TX( 586) / &
      ' ' /
    Data TX( 587) / &
      '"MACRO"'/
    Data TX( 588) / &
      '-------'/
    Data TX( 589) / &
      ' ' /
    Data TX( 590) / &
      'Allows a previously defined macro file to be run. See "START MACRO"'/
    Data TX( 591) / &
      ' ' /
    Data TX( 592) / &
      '"MEDIAN FILTER"'/
    Data TX( 593) / &
      '---------------'/
    Data TX( 594) / &
      ' ' /
    Data TX( 595) / &
      'Filters data within ROI by taking median value within a user defined'/
    Data TX( 596) / &
      'window for each data point. The output is in the memory.'/
    Data TX( 597) / &
      ' ' /
    Data TX( 598)(1:70)/ &
     'Median filtering is a non-linear filtering technique which is sometime'/
    Data TX( 598)(71:) / &
     's'/
    Data TX( 599)(1:70)/ &
     'useful as it can preserve sharp features (e.g. lines) in an image whil'/
    Data TX( 599)(71:) / &
     'st'/
    Data TX( 600) / &
      'filtering noise.'/
    Data TX( 601) / &
      ' ' /
    Data TX( 602) / &
      'The disadvantage is that it is difficult to treat analytically the'/
    Data TX( 603) / &
      'effect of a median filter. {\bf There is no error propagation.}'/
    Data TX( 604) / &
      ' ' /
    Data TX( 605) / &
      '"MOVE/ROTATE"'/
    Data TX( 606) / &
      '-------------'/
    Data TX( 607) / &
      ' ' /
    Data TX( 608) / &
      'The user can specify a rotation about a fixed point FOLLOWED by a'/
    Data TX( 609) / &
      'translation. The user is also prompted for the output region of the'/
    Data TX( 610)(1:70)/ &
     'memory where the data may be output. The pixel values within this regi'/
    Data TX( 610)(71:) / &
     'on'/
    Data TX( 611)(1:70)/ &
     'will initially be set to zero and incremented by any input pixels whic'/
    Data TX( 611)(71:) / &
     'h'/
    Data TX( 612)(1:70)/ &
     'are transformed to lie on top of output pixels. The output is in the m'/
    Data TX( 612)(71:) / &
     'emory.'/
    Data TX( 613) / &
      ' ' /
    Data TX( 614) / &
      'Alternatively it is possible to specify the coordinates'/
    Data TX( 615)(1:70)/ &
     'of two independent points on the input data and two corresponding outp'/
    Data TX( 615)(71:) / &
     'ut'/
    Data TX( 616)(1:70)/ &
     'points. The program will use these to calculate a required rotation an'/
    Data TX( 616)(71:) / &
     'd'/
    Data TX( 617)(1:70)/ &
     'translation. For this to be correct the distance between the two input'/
    Data TX( 617)(71:) / &
     ' and'/
    Data TX( 618)(1:70)/ &
     'two output coordinates should ideally be the same. If the distances ar'/
    Data TX( 618)(71:) / &
     'e'/
    Data TX( 619) / &
      'different the rotation angle will be calculated to align exactly the'/
    Data TX( 620) / &
      'lines, and the translation will be calculated so that the centre point'/
    Data TX( 621) / &
      'between each pair of points is aligned i.e. the discrepancy will be'/
    Data TX( 622) / &
      'equal for two points.'/
    Data TX( 623) / &
      ' ' /
    Data TX( 624) / &
      '"MULTIPLY"'/
    Data TX( 625) / &
      '----------'/
    Data TX( 626) / &
      ' ' /
    Data TX( 627) / &
      'Multiply element by element each element of the current data ROI with'/
    Data TX( 628) / &
      'the corresponding element in the memory.'/
    Data TX( 629) / &
      ' ' /
    Data TX( 630) / &
      '"OFFSET/SCALE"'/
    Data TX( 631) / &
      '--------------'/
    Data TX( 632) / &
      ' ' /
    Data TX( 633)(1:70)/ &
     'When two datasets have been taken of essentially the same experiment, '/
    Data TX( 633)(71:) / &
     'but'/
    Data TX( 634)(1:70)/ &
     'perhaps with a difference of scaling, this command tries to estimate t'/
    Data TX( 634)(71:) / &
     'he'/
    Data TX( 635) / &
      'scale factor between the two data sets. This process is complicated by'/
    Data TX( 636) / &
      'signal independent noise such as film fog for film data and electronic'/
    Data TX( 637) / &
      'noise in many other detectors.'/
    Data TX( 638) / &
      ' ' /
    Data TX( 639) / &
      '"OFFSET/SCALE": estimates a signal independent offset and scale'/
    Data TX( 640) / &
      'factor between two images (one in the memory). For this to be possible'/
    Data TX( 641) / &
      'there must be a range of intensity values in both images.'/
    Data TX( 642) / &
      ' ' /
    Data TX( 643) / &
      '(NOTE: This operation is presently under development. Tests show'/
    Data TX( 644) / &
      'the results to be correct for non-noisy images, but the results in the'/
    Data TX( 645) / &
      'presence of noise are not very stable. Hopefully the stability can be'/
    Data TX( 646) / &
      'improved.)'/
    Data TX( 647) / &
      ' ' /
    Data TX( 648) / &
      '"OPEN LOG"'/
    Data TX( 649) / &
      '----------'/
    Data TX( 650) / &
      ' ' /
    Data TX( 651) / &
      'Allows a file to be opened to contain a log of the program until the'/
    Data TX( 652)(1:70)/ &
     '"CLOSE LOG" command is issued, or the program is terminated. The log f'/
    Data TX( 652)(71:) / &
     'ile'/
    Data TX( 653)(1:70)/ &
     'contains all the input and output as seen on the screen. Producing log'/
    Data TX( 653)(71:) / &
     ' files'/
    Data TX( 654)(1:70)/ &
     'can be particularly useful if problems are encountered, or bugs are su'/
    Data TX( 654)(71:) / &
     'spected.'/
    Data TX( 655) / &
      ' ' /
    Data TX( 656) / &
      '"OUTPUT DATA"'/
    Data TX( 657) / &
      '-------------'/
    Data TX( 658) / &
      ' ' /
    Data TX( 659)(1:70)/ &
     'Output data in ROI to named data file in one of a choice of data forma'/
    Data TX( 659)(71:) / &
     'ts.'/
    Data TX( 660) / &
      'More output formats will be added as is appropriate. At present the'/
    Data TX( 661) / &
      'following output formats are available:'/
    Data TX( 662) / &
      ' ' /
    Data TX( 663)(1:69)/ &
     '"BINARY (UNFORMATTED)": This is an unformatted binary `dump'' of the R'/
    Data TX( 663)(70:) / &
     'OI of the'/
    Data TX( 664) / &
      'current data. This can be used to output data in a suitable format for'/
    Data TX( 665) / &
      'input to MOSFLM or DENZO.'/
    Data TX( 666) / &
      '"DUMP": This is the same as "BINARY (UNFORMATTED)" format.'/
    Data TX( 667) / &
      '"CHIPLOT": Single rows or columns of the data may be output as'/
    Data TX( 668) / &
      '1-D series of X/Y coordinates for plotting with CHIPLOT. The values'/
    Data TX( 669) / &
      'are output in a simple ASCII format together with title and axis label'/
    Data TX( 670) / &
      'information.'/
    Data TX( 671)(1:70)/ &
     '"FIT2D STANDARD FORMAT": This flexible format saves the ROI of the cur'/
    Data TX( 671)(71:) / &
     'rent'/
    Data TX( 672) / &
      'data together with any variances, axis data, and text labels.'/
    Data TX( 673)(1:70)/ &
     '"MCA FORMAT": An ASCII dump of data values in 8 columns per line g10.3'/
    Data TX( 673)(71:) / &
     ' format'/
    Data TX( 674) / &
      ' ' /
    Data TX( 675) / &
      '"PAGE POSITION"'/
    Data TX( 676) / &
      '---------------'/
    Data TX( 677) / &
      ' ' /
    Data TX( 678) / &
      'Allows the position of the graph on the ''page'' to be controlled. The'/
    Data TX( 679)(1:70)/ &
     'coordinates input are those of the axes frame of the graph. Since the '/
    Data TX( 679)(71:) / &
     'title'/
    Data TX( 680)(1:68)/ &
     'and axis label positions are ''attached'' to the axes frame this also '/
    Data TX( 680)(69:) / &
     'changes'/
    Data TX( 681)(1:70)/ &
     'their position (see "SET LAYOUT STYLE"). ("ASPECT RATIO" may also chan'/
    Data TX( 681)(71:) / &
     'ge'/
    Data TX( 682) / &
      'the page position.)'/
    Data TX( 683) / &
      ' ' /
    Data TX( 684) / &
      '"PEEP"'/
    Data TX( 685) / &
      '------'/
    Data TX( 686) / &
      ' ' /
    Data TX( 687) / &
      '"PEEP" allows the user to use the graphics cursor to click on'/
    Data TX( 688) / &
      'pixels within the current ROI and obtain information associated with'/
    Data TX( 689) / &
      'those pixels e.g. pixel coordinate, pixel number, data coordinate, and'/
    Data TX( 690) / &
      'pixel intensity.'/
    Data TX( 691) / &
      ' ' /
    Data TX( 692) / &
      'If the experimental geometry has been defined "PEEP" will also produce'/
    Data TX( 693) / &
      'angular information and corresponding d-spacings.'/
    Data TX( 694) / &
      ' ' /
    Data TX( 695) / &
      'The user clicks in a large `button'' to exit this option.'/
    Data TX( 696) / &
      ' ' /
    Data TX( 697) / &
      '"PIXEL REGION"'/
    Data TX( 698) / &
      '--------------'/
    Data TX( 699) / &
      ' ' /
    Data TX( 700)(1:70)/ &
     '"PIXEL REGION" is an alternative method to "REGION" to set the ROI. "P'/
    Data TX( 700)(71:) / &
     'IXEL'/
    Data TX( 701) / &
      'REGION" uses pixel numbers to set the ROI whereas "REGION" uses data'/
    Data TX( 702)(1:70)/ &
     'coordinates which may be very different owing to offsets and re-binnin'/
    Data TX( 702)(71:) / &
     'g'/
    Data TX( 703) / &
      'of images.'/
    Data TX( 704) / &
      ' ' /
    Data TX( 705)(1:70)/ &
     'The user is prompted for the X/Y lower and upper limits of the require'/
    Data TX( 705)(71:) / &
     'd'/
    Data TX( 706)(1:70)/ &
     'ROI . The values must be within the given ranges, which are between 1 '/
    Data TX( 706)(71:) / &
     'and'/
    Data TX( 707)(1:70)/ &
     'the number of defined values for the lower limits, and between the low'/
    Data TX( 707)(71:) / &
     'er'/
    Data TX( 708) / &
      'limits and the number of defined values for the upper limits.'/
    Data TX( 709) / &
      ' ' /
    Data TX( 710) / &
      '"PLOT DATA"'/
    Data TX( 711) / &
      '-----------'/
    Data TX( 712) / &
      ' ' /
    Data TX( 713) / &
      'Produce image on the screen of the input data according to'/
    Data TX( 714) / &
      'the current graphical style.'/
    Data TX( 715) / &
      ' ' /
    Data TX( 716) / &
      '"POISSONIAN NOISE"'/
    Data TX( 717) / &
      '------------------'/
    Data TX( 718) / &
      ' ' /
    Data TX( 719) / &
      'Adds noise with Poisson statistics to data within ROI. Each element'/
    Data TX( 720) / &
      'within the ROI is taken to be the mean of a Poisson distribution. A'/
    Data TX( 721) / &
      'random sample is generated from each distribution. (This can take a'/
    Data TX( 722) / &
      'long time for large images.)'/
    Data TX( 723) / &
      ' ' /
    Data TX( 724)(1:70)/ &
     'If variance arrays are present then the values of the data array BEFOR'/
    Data TX( 724)(71:) / &
     'E'/
    Data TX( 725) / &
      'adding Poisson statistics will be used as the variance values.'/
    Data TX( 726) / &
      ' ' /
    Data TX( 727) / &
      '"POWER SPECTRUM"'/
    Data TX( 728) / &
      '----------------'/
    Data TX( 729) / &
      ' ' /
    Data TX( 730) / &
      '(Not implemented at present; this can be re-implemented if required.)'/
    Data TX( 731) / &
      ' ' /
    Data TX( 732) / &
      'Calculate power spectrum of ROI.'/
    Data TX( 733) / &
      ' ' /
    Data TX( 734) / &
      '"PRINT GRAPHICS"'/
    Data TX( 735) / &
      '----------------'/
    Data TX( 736) / &
      ' ' /
    Data TX( 737)(1:70)/ &
     'Output current screen graphics to a PostScript file. The first time "P'/
    Data TX( 737)(71:) / &
     'RINT'/
    Data TX( 738)(1:70)/ &
     'GRAPHICS" is used it will prompt for the name of an output file. Subse'/
    Data TX( 738)(71:) / &
     'quent'/
    Data TX( 739)(1:70)/ &
     'commands will send the graphics to the same file, unless an "END GRAPH'/
    Data TX( 739)(71:) / &
     'ICS'/
    Data TX( 740) / &
      'FILE" command is issued to close the file (see "END GRAPHICS FILE").'/
    Data TX( 741)(1:70)/ &
     '(For graphs to be included in LaTeX documents only one graph per file '/
    Data TX( 741)(71:) / &
     'is'/
    Data TX( 742) / &
      'presently suitable.)'/
    Data TX( 743) / &
      ' ' /
    Data TX( 744) / &
      '"PUBLICATION QUALITY"'/
    Data TX( 745) / &
      '---------------------'/
    Data TX( 746) / &
      ' ' /
    Data TX( 747)(1:70)/ &
     'This command is designed to quickly select all the attributes for grap'/
    Data TX( 747)(71:) / &
     'hics'/
    Data TX( 748)(1:70)/ &
     'quality suitable for publication. Principly this means that all line w'/
    Data TX( 748)(71:) / &
     'idths,'/
    Data TX( 749)(1:70)/ &
     'except those of the grid, are set to double thickness, and all fonts a'/
    Data TX( 749)(71:) / &
     're set'/
    Data TX( 750) / &
      'to the ''best'' available font. Thicker lines are generally needed for'/
    Data TX( 751) / &
      'photo-reduction.'/
    Data TX( 752) / &
      ' ' /
    Data TX( 753) / &
      '"QUIT"'/
    Data TX( 754) / &
      '------'/
    Data TX( 755) / &
      ' ' /
    Data TX( 756) / &
      'See "EXIT"'/
    Data TX( 757) / &
      ' ' /
    Data TX( 758) / &
      '"RAISE TO A POWER"'/
    Data TX( 759) / &
      '------------------'/
    Data TX( 760) / &
      ' ' /
    Data TX( 761) / &
      '"RAISE TO A POWER" allows all the elements of the ROI of the current'/
    Data TX( 762)(1:70)/ &
     'data to be raised to a desired power. Depending on the power entered t'/
    Data TX( 762)(71:) / &
     'his'/
    Data TX( 763)(1:70)/ &
     'allows the elements to be squared (POWER = 2), the square root of the '/
    Data TX( 763)(71:) / &
     'elements'/
    Data TX( 764)(1:70)/ &
     'obtained (POWER = 0.5), the reciprocal of the elements calculated (POW'/
    Data TX( 764)(71:) / &
     'ER = -1),'/
    Data TX( 765) / &
      'or an arbitrary power calculated. The operation is performed in place,'/
    Data TX( 766) / &
      'the memory is not affected.'/
    Data TX( 767) / &
      ' ' /
    Data TX( 768) / &
      'Depending on the power the range of valid input element values changes'/
    Data TX( 769) / &
      'e.g. negative numbers are not valid if the square root is being taken.'/
    Data TX( 770) / &
      'If invalid numbers are encountered the output will be given a special'/
    Data TX( 771) / &
      'value and a warning message will be issued.'/
    Data TX( 772) / &
      ' ' /
    Data TX( 773) / &
      '"REBIN"'/
    Data TX( 774) / &
      '-------'/
    Data TX( 775) / &
      ' ' /
    Data TX( 776)(1:70)/ &
     'Re-bins data in the ROI by integer amounts. The user specifies the num'/
    Data TX( 776)(71:) / &
     'ber'/
    Data TX( 777)(1:70)/ &
     'of input pixels to be re-binned into an output pixel in each direction'/
    Data TX( 777)(71:) / &
     '.'/
    Data TX( 778) / &
      'Output is in the memory.'/
    Data TX( 779) / &
      ' ' /
    Data TX( 780) / &
      '"RECALL"'/
    Data TX( 781) / &
      '--------'/
    Data TX( 782) / &
      ' ' /
    Data TX( 783) / &
      'Recalls a data-set from internal memory, Data previously stored as'/
    Data TX( 784) / &
      'current data is lost.'/
    Data TX( 785) / &
      ' ' /
    Data TX( 786) / &
      '"REFLECT"'/
    Data TX( 787) / &
      '---------'/
    Data TX( 788) / &
      ' ' /
    Data TX( 789)(1:70)/ &
     'Reflects data in the ROI about a line of reflection specified by the u'/
    Data TX( 789)(71:) / &
     'ser.'/
    Data TX( 790)(1:70)/ &
     'The user is prompted for the coordinates of two distinct points to def'/
    Data TX( 790)(71:) / &
     'ine a'/
    Data TX( 791)(1:70)/ &
     'line of reflection, and for the extent of the output region in the `me'/
    Data TX( 791)(71:) / &
     'mory''.'/
    Data TX( 792) / &
      ' ' /
    Data TX( 793) / &
      'The reflected data is output in memory. Only the region of the memory'/
    Data TX( 794) / &
      'corresponding to the current data ROI is overwritten.'/
    Data TX( 795) / &
      ' ' /
    Data TX( 796) / &
      '"REGION"'/
    Data TX( 797) / &
      '--------'/
    Data TX( 798) / &
      ' ' /
    Data TX( 799)(1:70)/ &
     'User input of coordinates to specify a new region of interest. The use'/
    Data TX( 799)(71:) / &
     'r'/
    Data TX( 800)(1:70)/ &
     'is prompted for the coordinates of the lower left and upper right limi'/
    Data TX( 800)(71:) / &
     'ts'/
    Data TX( 801)(1:70)/ &
     'of the required ROI. The coordinates are all in data coordinates, whic'/
    Data TX( 801)(71:) / &
     'h'/
    Data TX( 802) / &
      'are then converted to pixel numbers.'/
    Data TX( 803) / &
      ' ' /
    Data TX( 804) / &
      'Note: The current ROI affects almost all data manipulation and data'/
    Data TX( 805) / &
      'display commands.'/
    Data TX( 806) / &
      ' ' /
    Data TX( 807) / &
      '"ROTATE LUT"'/
    Data TX( 808) / &
      '------------'/
    Data TX( 809) / &
      ' ' /
    Data TX( 810)(1:70)/ &
     'Interactive rotation of the colour table controlled by a graphics menu'/
    Data TX( 810)(71:) / &
     '.'/
    Data TX( 811) / &
      'A series of `buttons'' is produced within the graphics window which'/
    Data TX( 812) / &
      'allows the current colour table to be rotated by set amounts. By'/
    Data TX( 813) / &
      'clicking in the different `buttons'' the user should see the immediate'/
    Data TX( 814) / &
      'effect of rotating the colour table. The `button'' labelled "DEFAULT"'/
    Data TX( 815)(1:70)/ &
     'returns the colour table to the values that were defined at the start '/
    Data TX( 815)(71:) / &
     'of'/
    Data TX( 816) / &
      'the operation. The `button'' labelled "EXIT" is used to return to'/
    Data TX( 817) / &
      'the main menu.'/
    Data TX( 818) / &
      ' ' /
    Data TX( 819) / &
      'Note: As the background and text are drawn using two of the colour'/
    Data TX( 820)(1:70)/ &
     'levels, they will change colour during the rotation of the colour tabl'/
    Data TX( 820)(71:) / &
     'e.'/
    Data TX( 821)(1:70)/ &
     'Text may no longer be visible. After the "ROTATE LUT" command a "PLOT '/
    Data TX( 821)(71:) / &
     'DATA"'/
    Data TX( 822)(1:70)/ &
     'command can be issued to draw the data with the rotated colour table a'/
    Data TX( 822)(71:) / &
     'nd'/
    Data TX( 823) / &
      'correct background and text colours.'/
    Data TX( 824) / &
      ' ' /
    Data TX( 825) / &
      '"RUN MACRO"'/
    Data TX( 826) / &
      '-----------'/
    Data TX( 827) / &
      ' ' /
    Data TX( 828) / &
      'See "MACRO"'/
    Data TX( 829) / &
      ' ' /
    Data TX( 830) / &
      '"SET ****"'/
    Data TX( 831) / &
      ' ' /
    Data TX( 832)(1:70)/ &
     'The "SET ****" commands allows many aspects of the graphs items style '/
    Data TX( 832)(71:) / &
     'to be'/
    Data TX( 833)(1:70)/ &
     'altered including basic items such as colour, line type, line thicknes'/
    Data TX( 833)(71:) / &
     's, fill'/
    Data TX( 834)(1:70)/ &
     'colour, and also more sophisticated attributes such as arrow head styl'/
    Data TX( 834)(71:) / &
     'e,'/
    Data TX( 835)(1:70)/ &
     'line interpolation method, and the number of characters used to enumer'/
    Data TX( 835)(71:) / &
     'ation'/
    Data TX( 836) / &
      'the axes.'/
    Data TX( 837) / &
      ' ' /
    Data TX( 838) / &
      '"SET ANNOTATION STYLE"'/
    Data TX( 839) / &
      '----------------------'/
    Data TX( 840) / &
      ' ' /
    Data TX( 841)(1:70)/ &
     'The user may define the text style (font, size, character spacing), an'/
    Data TX( 841)(71:) / &
     'd'/
    Data TX( 842)(1:70)/ &
     'direction individually for all possible annotation labels (independent'/
    Data TX( 842)(71:) / &
     'ly'/
    Data TX( 843) / &
      'of whether or not they are being used).'/
    Data TX( 844) / &
      ' ' /
    Data TX( 845) / &
      '"SET ARROW STYLE"'/
    Data TX( 846) / &
      '-----------------'/
    Data TX( 847) / &
      ' ' /
    Data TX( 848)(1:70)/ &
     'The user may define the arrow style (colour, line width, arrow head ty'/
    Data TX( 848)(71:) / &
     'pe),'/
    Data TX( 849)(1:70)/ &
     'for all possible annotation arrows (independently of whether or not th'/
    Data TX( 849)(71:) / &
     'ey'/
    Data TX( 850) / &
      'are being used).'/
    Data TX( 851) / &
      ' ' /
    Data TX( 852) / &
      '"SET AXES STYLE"'/
    Data TX( 853) / &
      '----------------'/
    Data TX( 854) / &
      ' ' /
    Data TX( 855)(1:70)/ &
     'The user may define the axes style (colour, line width, number of smal'/
    Data TX( 855)(71:) / &
     'l'/
    Data TX( 856) / &
      'tick marks), for horizontal and vertical axes.'/
    Data TX( 857) / &
      ' ' /
    Data TX( 858) / &
      '"SET BACKGROUND STYLE"'/
    Data TX( 859) / &
      '----------------------'/
    Data TX( 860) / &
      ' ' /
    Data TX( 861) / &
      'By default the background of the graphics window is white, and axes'/
    Data TX( 862) / &
      'lines and text are black. "SET BACKGROUND STYLE" allows the background'/
    Data TX( 863) / &
      'colour to be set. A number of basic colours are available.'/
    Data TX( 864) / &
      ' ' /
    Data TX( 865)(1:70)/ &
     'Note: if a chosen colour is not available in the current colour table '/
    Data TX( 865)(71:) / &
     'it'/
    Data TX( 866) / &
      'will be approximated by the ``closest'''' available colour.'/
    Data TX( 867) / &
      ' ' /
    Data TX( 868) / &
      '"SET COLOUR"'/
    Data TX( 869) / &
      '------------'/
    Data TX( 870) / &
      ' ' /
    Data TX( 871) / &
      'By default the axes lines and text are black. "SET COLOUR" allows the'/
    Data TX( 872)(1:70)/ &
     'general foreground colour to be set. A number of basic colours are ava'/
    Data TX( 872)(71:) / &
     'ilable.'/
    Data TX( 873)(1:70)/ &
     'When used this will replace all colours as previously specified for in'/
    Data TX( 873)(71:) / &
     'dividual'/
    Data TX( 874) / &
      'graphics items.'/
    Data TX( 875) / &
      ' ' /
    Data TX( 876)(1:70)/ &
     'Note: if a chosen colour is not available in the current colour table '/
    Data TX( 876)(71:) / &
     'it'/
    Data TX( 877) / &
      'will be approximated by the ``closest'''' available colour.'/
    Data TX( 878) / &
      ' ' /
    Data TX( 879) / &
      '"SET CURVE STYLES"'/
    Data TX( 880) / &
      '------------------'/
    Data TX( 881) / &
      ' ' /
    Data TX( 882)(1:70)/ &
     '"SET CURVE STYLES" allows the style of representation of all possible '/
    Data TX( 882)(71:) / &
     'curves'/
    Data TX( 883)(1:70)/ &
     'which may be displayed by the program to be changed. (Typically 100 di'/
    Data TX( 883)(71:) / &
     'fferent'/
    Data TX( 884) / &
      'curve styles may be set.) The user specifies the range of curves to be'/
    Data TX( 885) / &
      'affected, and specifies whether line, marker, and/or error bars are to'/
    Data TX( 886) / &
      'be displayed. If a line is to be displayed the user is requested to'/
    Data TX( 887) / &
      'choose colour, line type, and line width attributes. If markers are to'/
    Data TX( 888) / &
      'be displayed the user can select the type of markers to be displayed,'/
    Data TX( 889) / &
      'together with their colour, size, line width and interior fill colour.'/
    Data TX( 890)(1:70)/ &
     'Similarly for error bars the style, colour, and line width may be sele'/
    Data TX( 890)(71:) / &
     'cted.'/
    Data TX( 891)(1:70)/ &
     '(If variance estimates are not present no error bars will be displayed'/
    Data TX( 891)(71:) / &
     ', even'/
    Data TX( 892) / &
      'if they are selected herewithin.)'/
    Data TX( 893) / &
      ' ' /
    Data TX( 894) / &
      '"SET FONT"'/
    Data TX( 895) / &
      '----------'/
    Data TX( 896) / &
      ' ' /
    Data TX( 897)(1:70)/ &
     'The user may select the text font to be used for all subsequent graphi'/
    Data TX( 897)(71:) / &
     'cs'/
    Data TX( 898) / &
      'Roman text e.g. titles, labels, etc. The user is prompted for a number'/
    Data TX( 899) / &
      'corresponding to each of the available fonts. Users are recommended to'/
    Data TX( 900)(1:70)/ &
     'try different fonts to find the best one for their purposes. The defau'/
    Data TX( 900)(71:) / &
     'lt'/
    Data TX( 901) / &
      'font is chosen to be a simple and fast software (scalable) font.'/
    Data TX( 902) / &
      ' ' /
    Data TX( 903) / &
      '(The command "PUBLICATION QUALITY" also changes the text fonts to'/
    Data TX( 904) / &
      'the type of font considered best for high quality output.)'/
    Data TX( 905) / &
      ' ' /
    Data TX( 906) / &
      '"SET GRID STYLE"'/
    Data TX( 907) / &
      '----------------'/
    Data TX( 908) / &
      ' ' /
    Data TX( 909)(1:70)/ &
     'The user may define the style of horizontal and vertical, fine and coa'/
    Data TX( 909)(71:) / &
     'rse grid'/
    Data TX( 910) / &
      'lines (colour, line width, line type).'/
    Data TX( 911) / &
      ' ' /
    Data TX( 912) / &
      '"SPATIAL FILTERING"'/
    Data TX( 913) / &
      '-------------------'/
    Data TX( 914) / &
      ' ' /
    Data TX( 915)(1:70)/ &
     'High-pass or low-pass filtering of the ROI using simple spatial filter'/
    Data TX( 915)(71:) / &
     's.'/
    Data TX( 916) / &
      'The user may select low or high-pass filtering with a choice of three'/
    Data TX( 917) / &
      'degrees of filtering for each. The output is in the memory.'/
    Data TX( 918) / &
      ' ' /
    Data TX( 919) / &
      'NOTE: At present there is no error propagation for this command.'/
    Data TX( 920) / &
      ' ' /
    Data TX( 921) / &
      '"START MACRO"'/
    Data TX( 922) / &
      '-------------'/
    Data TX( 923) / &
      ' ' /
    Data TX( 924)(1:70)/ &
     'Start recording commands within a named file for later re-use as a mac'/
    Data TX( 924)(71:) / &
     'ro.'/
    Data TX( 925)(1:70)/ &
     'After the file is opened all subsequent commands are recorded in the f'/
    Data TX( 925)(71:) / &
     'ile'/
    Data TX( 926)(1:70)/ &
     'until the "STOP MACRO" command is issued. The macro can later be run w'/
    Data TX( 926)(71:) / &
     'ith the'/
    Data TX( 927)(1:70)/ &
     '"MACRO command. If the "MACRO" command itself is used, the contents of'/
    Data TX( 927)(71:) / &
     ' the'/
    Data TX( 928) / &
      'macro are written into the new macro file. (See "STOP MACRO", "MACRO")'/
    Data TX( 929) / &
      ' ' /
    Data TX( 930) / &
      '"STATISTICS"'/
    Data TX( 931) / &
      '------------'/
    Data TX( 932) / &
      ' ' /
    Data TX( 933)(1:70)/ &
     'Calculate a number of basic statistical quantities from the data withi'/
    Data TX( 933)(71:) / &
     'n'/
    Data TX( 934) / &
      'the current ROI e.g. mean, total counts, and standard deviation.'/
    Data TX( 935) / &
      ' ' /
    Data TX( 936) / &
      '(By changing the ROI and using "STATISTICS" a basic from of peak'/
    Data TX( 937) / &
      'integration may be carried out.)'/
    Data TX( 938) / &
      ' ' /
    Data TX( 939) / &
      '"STOP MACRO"'/
    Data TX( 940) / &
      '------------'/
    Data TX( 941) / &
      ' ' /
    Data TX( 942) / &
      'Closes a previously opened macro file (The "STOP MACRO" command is not'/
    Data TX( 943) / &
      'recorded within the macro.) (See "START MACRO", MACRO).'/
    Data TX( 944) / &
      ' ' /
    Data TX( 945) / &
      '"STORE"'/
    Data TX( 946) / &
      '-------'/
    Data TX( 947) / &
      ' ' /
    Data TX( 948)(1:70)/ &
     'Stores current data set in internal memory. The data is copied from th'/
    Data TX( 948)(71:) / &
     'e'/
    Data TX( 949) / &
      'current data into the memory. Any previous data in the memory is'/
    Data TX( 950) / &
      'destroyed.'/
    Data TX( 951) / &
      ' ' /
    Data TX( 952)(1:70)/ &
     'Note: "EXCHANGE" may often be a much more efficient alternative to "ST'/
    Data TX( 952)(71:) / &
     'ORE"'/
    Data TX( 953) / &
      'for large data-sets.'/
    Data TX( 954) / &
      ' ' /
    Data TX( 955) / &
      '"SUBTRACT"'/
    Data TX( 956) / &
      '----------'/
    Data TX( 957) / &
      ' ' /
    Data TX( 958)(1:70)/ &
     'Subtract the memory data from the current data throughout the current '/
    Data TX( 958)(71:) / &
     'ROI.'/
    Data TX( 959) / &
      ' ' /
    Data TX( 960) / &
      '"SURFACE INTERPOLATION"'/
    Data TX( 961) / &
      '-----------------------'/
    Data TX( 962) / &
      ' ' /
    Data TX( 963)(1:70)/ &
     'The user defines a number of points in the current data ROI by clickin'/
    Data TX( 963)(71:) / &
     'g'/
    Data TX( 964) / &
      'with the graphical cursor. The program calculates an average intensity'/
    Data TX( 965) / &
      'in the 3*3 pixel region centred on each user defined coordinate.'/
    Data TX( 966) / &
      'Triangulation and bi-cubic spline interpolation is used to define a'/
    Data TX( 967)(1:70)/ &
     'surface throughout the ROI based on the user defined points. The outpu'/
    Data TX( 967)(71:) / &
     't'/
    Data TX( 968) / &
      'is in the memory.'/
    Data TX( 969) / &
      ' ' /
    Data TX( 970) / &
      'For best results the input coordinates should be spaced throughout the'/
    Data TX( 971) / &
      'ROI and more coordinates need to be defined where the surface should'/
    Data TX( 972) / &
      'change quickly.'/
    Data TX( 973) / &
      ' ' /
    Data TX( 974) / &
      '(An alternative and generally superior method of estimating background'/
    Data TX( 975) / &
      'surfaces is available as part of the "FIT" sub-menu.)'/
    Data TX( 976) / &
      ' ' /
    Data TX( 977) / &
      '"SYMBOL"'/
    Data TX( 978) / &
      '--------'/
    Data TX( 979) / &
      ' ' /
    Data TX( 980) / &
      'Internal program symbols may be defined using the "SYMBOL" command.'/
    Data TX( 981)(1:66)/ &
     'This is similar to the Unix ''alias'' command, or the VMS ''DEFINE'' o'/
    Data TX( 981)(67:) / &
     'r'/
    Data TX( 982)(1:66)/ &
     '''ASSIGN'' commands. A ``token'''' can be defined as a symbol and give'/
    Data TX( 982)(67:) / &
     'n a'/
    Data TX( 983) / &
      'value. Once defined, whenever the symbol is encountered, it will be'/
    Data TX( 984)(1:70)/ &
     'replaced by its "value", prior to further input processing. The symbol'/
    Data TX( 984)(71:) / &
     ' must'/
    Data TX( 985)(1:70)/ &
     'be separated from other characters by one or more spaces, a comma, or '/
    Data TX( 985)(71:) / &
     'a <Tab>.'/
    Data TX( 986) / &
      ' ' /
    Data TX( 987)(1:70)/ &
     'This is very powerful, but also very dangerous, and potentially very c'/
    Data TX( 987)(71:) / &
     'onfusing.'/
    Data TX( 988)(1:70)/ &
     'Users are recommended to only use unlikely character strings for symbo'/
    Data TX( 988)(71:) / &
     'ls'/
    Data TX( 989) / &
      'e.g. Start every symbol with a hash sign (#).'/
    Data TX( 990) / &
      ' ' /
    Data TX( 991) / &
      'Re-defining an existing symbol will overwrite its previous value.'/
    Data TX( 992) / &
      ' ' /
    Data TX( 993)(1:70)/ &
     'Symbol may be used as a manner of "parameterising" a macro. By pre-def'/
    Data TX( 993)(71:) / &
     'ining'/
    Data TX( 994)(1:70)/ &
     'symbols for file names, symbols may be used within a macro. By re-defi'/
    Data TX( 994)(71:) / &
     'ning'/
    Data TX( 995)(1:70)/ &
     'the symbols with different file names the macro may be re-run on diffe'/
    Data TX( 995)(71:) / &
     'rent'/
    Data TX( 996) / &
      'files.'/
    Data TX( 997) / &
      ' ' /
    Data TX( 998) / &
      '"SYMMETRIC FUNCTION"'/
    Data TX( 999) / &
      '--------------------'/
    Data TX(1000) / &
      ' ' /
    Data TX(1001)(1:70)/ &
     'Adds a radially symmetric function to the current data, calculated fro'/
    Data TX(1001)(71:) / &
     'm'/
    Data TX(1002) / &
      'a 1-D profile.'/
    Data TX(1003) / &
      'The 1-D profile needs to have been previously loaded into the memory'/
    Data TX(1004) / &
      '(the first row in the memory is used to store the 1-D profile).'/
    Data TX(1005) / &
      'The user specifies the centre of the required function in data'/
    Data TX(1006) / &
      'coordinates. The function is added to the current data.'/
    Data TX(1007) / &
      ' ' /
    Data TX(1008) / &
      '(A 1-D radial profile can be calculated within the "FIT" sub-menu.)'/
    Data TX(1009) / &
      ' ' /
    Data TX(1010) / &
      '"TITLE"'/
    Data TX(1011) / &
      '-------'/
    Data TX(1012) / &
      ' ' /
    Data TX(1013) / &
      'Allows the user to enter a title for the graph. This will replace the'/
    Data TX(1014) / &
      'old title. The title style may be altered using "SET TITLE STYLE" and'/
    Data TX(1015) / &
      'its position relative to the upper limit of the graph frame may be'/
    Data TX(1016) / &
      'changed using "SET LAYOUT STYLE".'/
    Data TX(1017) / &
      ' ' /
    Data TX(1018) / &
      '"THRESHOLD"'/
    Data TX(1019) / &
      '-----------'/
    Data TX(1020) / &
      ' ' /
    Data TX(1021) / &
      'The user is prompted for a minimum and a maximum threshold value. Any'/
    Data TX(1022)(1:70)/ &
     'element of the ROI which is below the minimum value is set to this val'/
    Data TX(1022)(71:) / &
     'ue'/
    Data TX(1023)(1:70)/ &
     'and any value which is above the maximum value is set to the maximum v'/
    Data TX(1023)(71:) / &
     'alue.'/
    Data TX(1024) / &
      ' ' /
    Data TX(1025) / &
      'Note: There is no error propagation for this operation.'/
    Data TX(1026) / &
      ' ' /
    Data TX(1027) / &
      '"TRANSPOSE"'/
    Data TX(1028) / &
      '-----------'/
    Data TX(1029) / &
      ' ' /
    Data TX(1030) / &
      'Provided that the program array sizes are big enough the ROI will be'/
    Data TX(1031) / &
      'transposed and output in the memory. i.e. DATA(x,y) will be'/
    Data TX(1032) / &
      'transferred to MEMORY(y,x). This will not only set the memory'/
    Data TX(1033) / &
      'ROI, but will also re-define the memory defined data sizes.'/
    Data TX(1034) / &
      ' ' /
    Data TX(1035) / &
      '"UNIT CELL PARAMETERS"'/
    Data TX(1036) / &
      '----------------------'/
    Data TX(1037) / &
      ' ' /
    Data TX(1038)(1:70)/ &
     'Allows the user to convert the standard real space unit cell parameter'/
    Data TX(1038)(71:) / &
     's,'/
    Data TX(1039)(1:70)/ &
     'a, b, c, alpha, beta, and gamma into the reciprocal space parameters a'/
    Data TX(1039)(71:) / &
     '*,'/
    Data TX(1040)(1:70)/ &
     'b*, c*, alpha*, beta*, and gamma*. All angles are entered and displaye'/
    Data TX(1040)(71:) / &
     'd'/
    Data TX(1041)(1:70)/ &
     'in degrees, and all distances should be in Angstroms or inverse Angstr'/
    Data TX(1041)(71:) / &
     'oms.'/
    Data TX(1042) / &
      ' ' /
    Data TX(1043)(1:70)/ &
     'The user starts by choosing the direction of the conversion, followed '/
    Data TX(1043)(71:) / &
     'by'/
    Data TX(1044) / &
      'the parameters of the unit cell.'/
    Data TX(1045) / &
      ' ' /
    Data TX(1046) / &
      '"VARIANCES DEFINITION"'/
    Data TX(1047) / &
      '----------------------'/
    Data TX(1048) / &
      ' ' /
    Data TX(1049) / &
      'Often data is obtained which essentially is affected by counting'/
    Data TX(1050) / &
      'statistics, but which has been scaled by an unknown scaling factor. To'/
    Data TX(1051) / &
      'be able to estimate the variance of each data point it is necessary to'/
    Data TX(1052) / &
      'be able to estimate the scaling factor. This command estimates the'/
    Data TX(1053) / &
      'scaling factor and hence estimates the variance of each data-point in'/
    Data TX(1054) / &
      'the ROI.'/
    Data TX(1055) / &
      ' ' /
    Data TX(1056) / &
      'This task is made slightly more complicated by detector background and'/
    Data TX(1057) / &
      'by saturation of the detector.'/
    Data TX(1058) / &
      ' ' /
    Data TX(1059)(1:70)/ &
     'The user inputs the range of non-background and non-saturated data-val'/
    Data TX(1059)(71:) / &
     'ues.'/
    Data TX(1060) / &
      'The program outputs the scaling factor and calculates estimated'/
    Data TX(1061) / &
      'variances. The variances are calculated by applying local smoothing to'/
    Data TX(1062) / &
      'the input data values and multiplying the result by the square of the'/
    Data TX(1063) / &
      'estimated scale factor.'/
    Data TX(1064) / &
      ' ' /
    Data TX(1065) / &
      '"V2C"'/
    Data TX(1066) / &
      '-----'/
    Data TX(1067) / &
      ' ' /
    Data TX(1068) / &
      '"V2C" exchanges the current data with the variance array (if defined).'/
    Data TX(1069)(1:70)/ &
     'This can be used to allow the variances to be altered. (This is clearl'/
    Data TX(1069)(71:) / &
     'y'/
    Data TX(1070) / &
      'a highly specialist command, so great care should be taken if this'/
    Data TX(1071) / &
      'command is used.)'/
    Data TX(1072) / &
      ' ' /
    Data TX(1073) / &
      '"WEIGHTED AVERAGE"'/
    Data TX(1074) / &
      '------------------'/
    Data TX(1075) / &
      ' ' /
    Data TX(1076) / &
      'Combines two images (one in the memory), both of which MUST have'/
    Data TX(1077) / &
      'corresponding variance estimates, in the ``optimal'''' manner of the'/
    Data TX(1078) / &
      'weighted average. The operation is truly optimal only if the'/
    Data TX(1079)(1:70)/ &
     'variances are correct and the error statistics are independent Gaussia'/
    Data TX(1079)(71:) / &
     'n'/
    Data TX(1080) / &
      'errors. In practical situations neither of these conditions are likely'/
    Data TX(1081) / &
      'to be true, but with care in estimating the variances, the results'/
    Data TX(1082) / &
      'should be statistically better than simple addition.'/
    Data TX(1083) / &
      ' ' /
    Data TX(1084) / &
      '"X-AXIS LABEL"'/
    Data TX(1085) / &
      '--------------'/
    Data TX(1086) / &
      ' ' /
    Data TX(1087) / &
      'Allows the user to enter a X-axis label text for the graph. This will'/
    Data TX(1088) / &
      'replace the text. The X-axis label style may be altered using "SET'/
    Data TX(1089) / &
      'X-LABEL STYLE" and its position relative to the lower limit of the'/
    Data TX(1090) / &
      'graph frame may be changed using "SET LAYOUT STYLE".'/
    Data TX(1091) / &
      ' ' /
    Data TX(1092) / &
      '"Y-AXIS LABEL"'/
    Data TX(1093) / &
      '--------------'/
    Data TX(1094) / &
      ' ' /
    Data TX(1095) / &
      'Allows the user to enter a Y-axis label text for the graph. This will'/
    Data TX(1096) / &
      'replace the text. The Y-axis label style may be altered using "SET'/
    Data TX(1097) / &
      'Y-LABEL STYLE" and its position relative to the left-hand limit of the'/
    Data TX(1098) / &
      'graph frame may be changed using "SET LAYOUT STYLE".'/
    Data TX(1099) / &
      ' ' /
    Data TX(1100) / &
      '"Z-AXIS LABEL"'/
    Data TX(1101) / &
      '--------------'/
    Data TX(1102) / &
      ' ' /
    Data TX(1103) / &
      'Allows the user to enter text for the label of the Z-axis (intensity)'/
    Data TX(1104)(1:70)/ &
     'of the graphics. This is the text that will appear alongside the bar s'/
    Data TX(1104)(71:) / &
     'howing'/
    Data TX(1105) / &
      'the current colour table. This will replace the old text.'/
    Data TX(1106) / &
      ' ' /
    Data TX(1107) / &
      '"Z-SCALE"'/
    Data TX(1108) / &
      '---------'/
    Data TX(1109) / &
      ' ' /
    Data TX(1110)(1:70)/ &
     'By default displayed images are automatically scaled to display the co'/
    Data TX(1110)(71:) / &
     'mplete'/
    Data TX(1111)(1:70)/ &
     'range of intensities in the displayed region. This behaviour can be mo'/
    Data TX(1111)(71:) / &
     'dified'/
    Data TX(1112) / &
      'using "Z-SCALE". Four Z-axis (intensity) scaling modes are available:'/
    Data TX(1113) / &
      ' ' /
    Data TX(1114) / &
      '   0: Automatic full data range (default)'/
    Data TX(1115) / &
      '   1: User set minimum and maximum'/
    Data TX(1116) / &
      '   2: User set minimum, but automatic maximum'/
    Data TX(1117) / &
      '   3: Automatic minimum, and user set maximum'/
    Data TX(1118) / &
      ' ' /
    Data TX(1119) / &
      'Depending on the scaling  mode selected you may be prompted for the'/
    Data TX(1120) / &
      'minimum and the maximum values to be displayed. Once set the scaling'/
    Data TX(1121) / &
      'mode continues to operate on all subsequent images, until "Z-SCALE" is'/
    Data TX(1122)(1:70)/ &
     'used again to change the mode. (This may lead to strange results if yo'/
    Data TX(1122)(71:) / &
     'u forget'/
    Data TX(1123) / &
      'that you have set a particular scaling range.)'/
    Data TX(1124) / &
      ' ' /
    Data TX(1125) / &
      '"3-D SURFACE PLOT"'/
    Data TX(1126) / &
      '------------------'/
    Data TX(1127) / &
      ' ' /
    Data TX(1128) / &
      'Allows the ROI of the current data to be viewed as a 3-d surface,'/
    Data TX(1129) / &
      'together with colour. The view angle may controlled by the user.'/
    Data TX(1130) / &
      ' ' /
    Data TX(1131) / &
      'Users should not try to view large numbers of pixels with many colours'/
    Data TX(1132) / &
      'as this can require very large amounts of system memory. Users are'/
    Data TX(1133) / &
      'recommended to use "REGION" to restrict the viewing region and "REBIN"'/
    Data TX(1134) / &
      'to further reduce the number of pixels. "COLOUR TABLE" should'/
    Data TX(1135)(1:70)/ &
     'be used to reduce the number of colour indices by setting "MINIMUM IND'/
    Data TX(1135)(71:) / &
     'EX"'/
    Data TX(1136) / &
      'and "MAXIMUM INDEX" to use a limited range of colour indices.'/
    Data TX(1137) / &
      '(System memory requirements will be roughly proportional to the number'/
    Data TX(1138) / &
      'of pixels multiplied by the number of colour indices.)'/
    Data TX(1139) / &
      ' ' /
    Data TX(1140)(1:70)/ &
     'Based on the starting view position the surface is calculated and draw'/
    Data TX(1140)(71:) / &
     'n'/
    Data TX(1141) / &
      'from back to front. This means that no hidden surface removal is'/
    Data TX(1142) / &
      'necessary, yet the surface will appear correctly. Graphical menu'/
    Data TX(1143) / &
      '``buttons'''' allow the user to change the angle and zoom in and out.'/
    Data TX(1144) / &
      'However, it is possible to change the viewing angle such that it is'/
    Data TX(1145)(1:70)/ &
     'outside the range for which the back to front drawing method is correc'/
    Data TX(1145)(71:) / &
     't.'/
    Data TX(1146) / &
      ' ' /
    Data TX(1147)(1:69)/ &
     'To obtain hard-copy is it necessary to click on the "PRINT" ``button'''/
    Data TX(1147)(70:) / &
     ''''/
    Data TX(1148) / &
      'within the menu and specify a file name.'/
    Data TX(1149) / &
      ' ' /
    Data TX(1150) / &
      'Note: This command is still under development.'/
    Data TX(1151) / &
      ' ' /
    Data TX(1152)(1:70)/ &
     '----------------------------------------------------------------------'/
    Data TX(1152)(71:) / &
     '---------'/
    Data TX(1153) / &
      '                     EXPLANATION OF IMPORTANT CONCEPTIONS'/
    Data TX(1154)(1:70)/ &
     '----------------------------------------------------------------------'/
    Data TX(1154)(71:) / &
     '---------'/
    Data TX(1155) / &
      ' ' /
    Data TX(1156) / &
      'COORDINATE SYSTEM'/
    Data TX(1157) / &
      '-----------------'/
    Data TX(1158) / &
      ' ' /
    Data TX(1159) / &
      'The position of all graphical items is specified in X/Y coordinates,'/
    Data TX(1160) / &
      'where the X-axis is horizontal and a larger X-value is further to the'/
    Data TX(1161) / &
      'right, and the Y-axis is vertical and a larger Y-value is higher on'/
    Data TX(1162) / &
      'the page.'/
    Data TX(1163) / &
      ' ' /
    Data TX(1164) / &
      'There are two different types of coordinate system:'/
    Data TX(1165) / &
      ' ' /
    Data TX(1166) / &
      '   ''DATA COORDINATES'''/
    Data TX(1167) / &
      '   ''PAGE COORDINATES'''/
    Data TX(1168) / &
      ' ' /
    Data TX(1169) / &
      '''Data coordinates'' are the coordinate system of the data, and the'/
    Data TX(1170) / &
      'range of displayed data coordinates is either automatically determined'/
    Data TX(1171) / &
      'or is set by the user ("REGION"). This region is referred to as the'/
    Data TX(1172) / &
      '''DATA DISPLAY REGION'' (DDR). The drawing of all lines, markers, and'/
    Data TX(1173) / &
      'error boxes of data-sets is in data coordinates.'/
    Data TX(1174) / &
      ' ' /
    Data TX(1175)(1:66)/ &
     '''PAGE COORDINATES'' are the coordinates of the ''page'' and the posit'/
    Data TX(1175)(67:) / &
     'ion'/
    Data TX(1176) / &
      'of all the graphical items may be altered by altering their page'/
    Data TX(1177) / &
      'coordinate. The position of the graph on the page is referred to as'/
    Data TX(1178) / &
      'the ''GRAPH PAGE POSITION'' (GPP). This is the position of DDR on the'/
    Data TX(1179) / &
      'page. There is a mapping, or transformation, between data coordinates'/
    Data TX(1180) / &
      'and page coordinates.'/
    Data TX(1181) / &
      ' ' /
    Data TX(1182) / &
      'The page coordinate system goes from 0.0 to 1.0 in the longest edge,'/
    Data TX(1183) / &
      'and from 0.0 to the page aspect ratio in the the other direction. e.g.'/
    Data TX(1184) / &
      'For A4 portrait, X may be between 0.0 and 0.7071, and Y may be between'/
    Data TX(1185) / &
      '0.0 and 1.0.'/
    Data TX(1186) / &
      ' ' /
    Data TX(1187) / &
      'Almost all items whose layout position may be changed are in page'/
    Data TX(1188) / &
      'coordinates. The exception is annotation labels and annotation arrows.'/
    Data TX(1189) / &
      'These may be defined in either page coordinates or in data'/
    Data TX(1190) / &
      'coordinates. This allows the possibly to link the position of'/
    Data TX(1191) / &
      'annotation labels the arrows to parts of the graph.'/
    Data TX(1192) / &
      ' ' /
    Data TX(1193)(1:70)/ &
     '----------------------------------------------------------------------'/
    Data TX(1193)(71:) / &
     '---------'/
    Data TX(1194) / &
      '-             END OF fit2d HELP TEXT, SEE User Guide FOR MORE'/
    Data TX(1195) / &
      '-                                 INFORMATION'/
    Data TX(1196)(1:70)/ &
     '----------------------------------------------------------------------'/
    Data TX(1196)(71:) / &
     '---------'/
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

    End Subroutine F2D_HELP
!********1*********2*********3*********4*********5*********6*********7*********8
