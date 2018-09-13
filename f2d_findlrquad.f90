!********1*********2*********3*********4*********5*********6*********7*********8
 
!  **********************
!  *                    *
!  * f2d_findlrquad.f90 *
!  *                    *
!  **********************
 
!+ F2D_FINDLRQUAD - Fit2D: FIND Lower right QUADrant of peak positions
     Subroutine F2D_FINDLRQUAD (xmaxdat, ymaxdat, xstrelm, ystrelm, xendelm, &
       yendelm, DATA, xmaxtemplate, ymaxtemplate, xnumtemplate, ynumtemplate, &
       TEMPLATE, xmaxsubtemplate, ymaxsubtemplate, xnumsubtemplate, &
       ynumsubtemplate, sub_pixelling, SUBTEMPLATE, search_limit, &
       detect_ratio, output_frequency, xmax_peaks, ymax_peaks, num_right, &
       num_down, ref_correlation, num_peaks, X_2DPEAKS, Y_2DPEAKS, status)
!  Description:
!    Tries to find approximately regularly spaced peaks which are placed in a 
!    grid e.g. part of a calibration grid which has been measured by a detector 
!    which introduces some spatial distortion. The search is limited to the 
!    region of the data from "(xstrelm, ystrelm)" to "(xendelm, yendelm)". The 
!    search assumes that the first row and column of peaks have been found, and 
!    that these can be used to estimate positions for the remaining peaks
!  Keywords:
!    Peak~Search, Centre.Peak.Determination,
!    Peak.Centre.Determination, Calibration.Peak~Positions
!  Method:
!    The method consists of searching towards an edge of the ROI, jumping over 
!    missing peaks if necessary. Where present the starting peak position is 
!    predicted from the three already found peaks (average of two vectors).
!  Deficiencies:
!  Bugs:
!  Authors:
!    A P Hammersley (hammersley@esrf.eu)
!  History:
!    01-Nov-1995: V0.5 Change error message to warning message (Hammersley)
!    06-Sep-1995: V0.4 Only output peak found message if a peak has been found 
!      (Hammersley)
!    23-Dec-1993: V0.3 Check that search does not go outside defined search 
!      quadrant (Hammersley)
!    22-Dec-1993: V0.2 End of line check include Y-limits check owing to larger 
!      distortions on X-ray image intensifier system (Hammersley)
!    01-Nov-1993: V0.1 Original (Hammersley)
!  Type Definitions:
     Implicit None
!  Global Constants:
     Include 'st_symbols.inc'
!  Import:
     Integer, Intent(IN) :: xmaxdat ! First Dimension size for "DATA"
     Integer, Intent(IN) :: ymaxdat ! Second Dimension size for "DATA"
     Integer, Intent(IN) :: xstrelm ! First X-element of data region
     Integer, Intent(IN) :: ystrelm ! First Y-element of data region
     Integer, Intent(IN) :: xendelm ! Last X-element of data region
     Integer, Intent(IN) :: yendelm ! Last Y-element of data region
     Real, Intent(IN) :: DATA(xmaxdat, ymaxdat) ! Array containing data,
!      with grid peaks
     Integer, Intent(IN) :: xmaxtemplate ! First Dimension size for "TEMPLATE"
     Integer, Intent(IN) :: ymaxtemplate ! Second Dimension size for "TEMPLATE"
     Integer, Intent(IN) :: xnumtemplate ! Number of elements in first
!      dimension in "TEMPLATE"
     Integer, Intent(IN) :: ynumtemplate ! Number of elements in second
!      dimension in "TEMPLATE"
     Real, Intent(IN) :: TEMPLATE(xmaxtemplate, ymaxtemplate) ! Template
!      function at pixel resolution
     Integer, Intent(IN) :: xmaxsubtemplate ! First Dimension size for
!      "SUBTEMPLATE"
     Integer, Intent(IN) :: ymaxsubtemplate ! Second Dimension size for
!      "SUBTEMPLATE"
     Integer, Intent(IN) :: xnumsubtemplate ! Number of elements in first
!      dimension in "SUBTEMPLATE"
     Integer, Intent(IN) :: ynumsubtemplate ! Number of elements in second
!      dimension in "SUBTEMPLATE"
     Integer, Intent(IN) :: sub_pixelling ! The number of sub-pixels to use for 
!      over-sampling the data, when cross-correlating with the template function
     Real, Intent(IN) :: SUBTEMPLATE(xmaxsubtemplate, ymaxsubtemplate)
!      Template function e.g. calculated peak profile (If "sub_pixelling" is 
!      greater than 1 then, this function must be calculated on this resolution 
!      scale
     Integer, Intent(IN) :: search_limit ! Maximum distance from the starting
!      position at which a peak is accepted as found
     Real, Intent(IN) :: detect_ratio ! Ratio of a cross-correlation value
!      found for a peak divided by previous found peak value, above which a new
!      "peak" is accepted (avoids noise being classed as peaks)
     Integer, Intent(IN) :: output_frequency ! Frequency with which progress
!      report is given to the user (use very big numbers to avoid output)
     Integer, Intent(IN) :: xmax_peaks ! First dimension size of "X_2DPEAKS"
!      and "Y_2DPEAKS"
     Integer, Intent(IN) :: ymax_peaks ! First dimension size of "X_2DPEAKS"
!      and "Y_2DPEAKS"
     Integer, Intent(IN) :: num_right ! Number of columns of holes to search
!      in quadrant
     Integer, Intent(IN) :: num_down ! Number of rows of holes to search in
!      quadrant
!  Import/Export:
     Real, Intent(INOUT) :: ref_correlation ! On input this is the reference
!      correlation value for comparison of the first found peak correlation 
!      value. On output this is the cross-correlation value of last found peak
     Integer, Intent(INOUT) :: num_peaks ! Total number of found peaks
!      found, each time a new peak is found this number is incremented
!  Export:
     Real, Intent(OUT) :: X_2DPEAKS(xmax_peaks, ymax_peaks)
!      The best correlation positions (pixel coordinates)
     Real, Intent(OUT) :: Y_2DPEAKS(xmax_peaks, ymax_peaks)
!      The best correlation positions (pixel coordinates)
!  Status:
     Integer, Intent(INOUT) :: status ! Status variable
!  Local Constants:
     Character(Len = 5), Parameter :: Version = 'V0.5' ! Version number
!  Local Variables:
     Character(Len = 80) :: message ! User messages
     Integer :: gap ! Number of grid spacings since last found peak
     Integer :: x_subpixel ! X-sub-pixel coordinate for peak centre
     Integer :: xpeak ! Array element for X-direction
     Integer :: xprevious ! Array element for X-direction for previously defined
!      peak
     Integer :: y_subpixel ! Y-sub-pixel coordinate for peak centre
     Integer :: ypeak ! Array element for Y-direction
     Integer :: yprevious ! Array element for Y-direction for previously defined
!      peak
     Logical :: continue ! .True., until edge of ROI reached
     Logical :: peak_found ! .True., if a peak is found
     Logical :: success ! .True., if a peak is found in the search area
     Real :: correlation ! Cross-correlation value of peak
     Real :: x_coordinate ! X-coordinate for a peak centre
     Real :: x_vector ! X-component of vector between peaks
     Real :: y_coordinate ! Y-coordinate for a peak centre
     Real :: y_vector ! Y-component of vector between peaks
!  Local Data:
!  Internal Functions:
     Integer :: Pc2subpixel ! Convert pixel coordinate to sub-pixel number
     Integer :: Wrap_y ! Convert Y-element to wrapped element
     Real :: Subpixel2pc ! Convert sub-pixel number to pixel coordinate
!--------1---------2---------3---------4---------5---------6---------7---------8
!  Define in-line functions
 
!  Convert pixel coordinate to sub-pixel number
     Pc2subpixel(x_coordinate) = Int(x_coordinate * Real(sub_pixelling)) + 1
 
!  Convert sub-pixel number to pixel coordinate
     Subpixel2pc(x_subpixel) = Real(x_subpixel) / Real(sub_pixelling) - 1.0 / &
       Real(sub_pixelling * 2)
 
!  Calculate Y-element reference given wrapping
     Wrap_y(ypeak) = Mod(ypeak - 1, ymax_peaks) + 1
 
!--------1---------2---------3---------4---------5---------6---------7---------8
!**DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG
!  Write (*, '(''Entered F2D_FINDLRQUAD'')')
!**DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG
 
!  Check status.
     If (status .Ne. St_goodvalue) Then
        Call ST_SAVE ('Subroutine F2D_FINDLRQUAD ' // Version)
        Return
     End If
 
!  Check that the region to be examined is reasonably defined
     If (xmaxdat .Le. 0 .Or. xmaxtemplate .Le. 0 .Or. xmaxsubtemplate .Le. 0 &
       .Or. xmax_peaks .Le. 1) Then
        status = St_bad_dim1
     Else If (ymaxdat .Le. 0 .Or. ymaxtemplate .Le. 0 .Or. ymaxsubtemplate &
       .Le. 0 .Or. ymax_peaks .Le. 1) Then
        status = St_bad_dim2
     Else If (xstrelm .Le. 0 .Or. xendelm .Gt. xmaxdat .Or. xstrelm .Gt. &
       xendelm) Then
        status = St_bad_adr1
     Else If (ystrelm .Le. 0 .Or. yendelm .Gt. ymaxdat .Or. ystrelm .Gt. &
       yendelm) Then
        status = St_bad_adr2
     Else If (sub_pixelling .Le. 0 .Or. search_limit .Le. 0) Then
        status = St_bad_int1
     End If
 
!  Re-check status
     If (status .Ne. St_goodvalue) Then
        status = St_mod_ma + status
        Call ST_SAVE ('Subroutine F2D_FINDLRQUAD ' // Version)
     Else
 
! - - - -1- - - - -2- - - - -3- - - - -4- - - - -5- - - - -6- - - - -7- - - - -8
!     Input parameters appear to be correct
 
!     Search upper-left quadrant
        xpeak = 2
        ypeak = ymax_peaks
        xprevious = 1
        yprevious = ymax_peaks
        x_vector = X_2DPEAKS(2, 1) - X_2DPEAKS(1, 1)
        y_vector = Y_2DPEAKS(2, 1) - Y_2DPEAKS(1, 1)
        x_coordinate = X_2DPEAKS(1, ymax_peaks) + x_vector
        y_coordinate = Y_2DPEAKS(1, ymax_peaks) + y_vector
 
! - - - -1- - - - -2- - - - -3- - - - -4- - - - -5- - - - -6- - - - -7- - - - -8
!     Search for peaks until corner of ROI or storage array is full
        peak_found = .True.
        gap = 1
        continue = x_coordinate .Ge. Real(xstrelm - 1) .And. x_coordinate .Le. &
          Real(xendelm) .And. y_coordinate .Ge. Real(ystrelm - 1) .And. &
          y_coordinate .Le. Real(yendelm) .And. xpeak .Le. num_right .And. &
          ymax_peaks - ypeak .Le. num_down
 
        Do While (continue)
 
!        Calculate estimated position of peak from previously found peaks
 
!**DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG
!        If (ypeak .Eq. 185 .And. xpeak .Gt. 18) Then
!        Write (*, '(''xpeak, ypeak, estimated x, y = '',
!        :             2i8, 2f12.5)')
!        :             xpeak, ypeak, x_coordinate, y_coordinate
!        End If
!**DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG
 
           If (X_2DPEAKS(xpeak, Wrap_y(ypeak + 1)) .Gt. -1.7e38 .And. &
             X_2DPEAKS(xpeak - 1, Wrap_y(ypeak + 1)) .Gt. -1.7e38 .And. &
             X_2DPEAKS(xpeak - 1, ypeak) .Gt. -1.7e38) Then
 
!           The three corner peaks have been found, so vector
!           can be calculated
              x_coordinate = X_2DPEAKS(xpeak - 1, ypeak) + (X_2DPEAKS(xpeak, &
                Wrap_y(ypeak + 1)) - X_2DPEAKS(xpeak - 1, Wrap_y(ypeak + 1)))
              y_coordinate = Y_2DPEAKS(xpeak - 1, ypeak) + (Y_2DPEAKS(xpeak, &
                Wrap_y(ypeak + 1)) - Y_2DPEAKS(xpeak - 1, Wrap_y(ypeak + 1)))
 
!           Convert pixel coordinates to sub-pixel numbers
              x_subpixel = Pc2subpixel(x_coordinate)
              y_subpixel = Pc2subpixel(y_coordinate)
 
!           Calculate optimum centre to nearest sub-pixel
              Call MA_BESTCENTRE (xmaxdat, ymaxdat, xstrelm, ystrelm, xendelm, &
                yendelm, DATA, xmaxsubtemplate, ymaxsubtemplate, &
                xnumsubtemplate, ynumsubtemplate, sub_pixelling, &
                sub_pixelling, SUBTEMPLATE, search_limit * sub_pixelling, &
                search_limit * sub_pixelling, x_subpixel, y_subpixel, success, &
                correlation, status)
 
!           Convert sub-pixel numbers to pixel coordinates
              x_coordinate = Subpixel2pc(x_subpixel)
              y_coordinate = Subpixel2pc(y_subpixel)
 
           Else
 
!**DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG
!           Write (*, '(''Using running vector estimate'')')
!**DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG
 
!           First conduct search to nearest pixel over defined
!           region, followed by a sub-pixel search
              Call F2D_FINDCENTRE (xmaxdat, ymaxdat, xstrelm, ystrelm, &
                xendelm, yendelm, DATA, xmaxtemplate, ymaxtemplate, &
                xnumtemplate, ynumtemplate, TEMPLATE, xmaxsubtemplate, &
                ymaxsubtemplate, xnumsubtemplate, ynumsubtemplate, &
                sub_pixelling, SUBTEMPLATE, search_limit, x_coordinate, &
                y_coordinate, success, correlation, status)
 
           End If
 
!**DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG
!        If (ypeak .Eq. 185 .And. xpeak .Gt. 18) Then
!        Write (*, '(''success, x, y = '', l3, 2f12.5)')
!        :             success, x_coordinate, y_coordinate
!        End If
!**DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG
 
           If (success .And. correlation / ref_correlation .Gt. detect_ratio) &
             Then
 
!           Peak found
              peak_found = .True.
              num_peaks = num_peaks + 1
 
!           Store centre
              X_2DPEAKS(xpeak, ypeak) = x_coordinate
              Y_2DPEAKS(xpeak, ypeak) = y_coordinate
              ref_correlation = correlation
 
!           Update vector
              x_vector = (x_coordinate - X_2DPEAKS(xprevious, yprevious)) / &
                Real(gap)
              y_vector = (y_coordinate - Y_2DPEAKS(xprevious, yprevious)) / &
                Real(gap)
              x_coordinate = x_coordinate + x_vector
              y_coordinate = y_coordinate + y_vector
              xprevious = xpeak
              yprevious = ypeak
              gap = 1
 
!**DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG
!           If (ypeak .Eq. 185 .And. xpeak .Gt. 18) Then
!           Write (*, '(''x_vector, y_vector = '', 2f12.5)')
!           :             x_vector, y_vector
!           End If
!**DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG
 
           Else
 
              peak_found = .False.
              gap = gap + 1
              x_coordinate = X_2DPEAKS(xprevious, yprevious) + x_vector * gap
              y_coordinate = Y_2DPEAKS(xprevious, yprevious) + y_vector * gap
 
           End If
 
!        Update array element for new peaks
           xpeak = xpeak + 1
 
!        Check that search is still within ROI
           If (x_coordinate .Lt. Real(xstrelm - 1) .Or. x_coordinate .Gt. &
             Real(xendelm) .Or. y_coordinate .Lt. Real(ystrelm - 1) .Or. &
             y_coordinate .Gt. Real(yendelm) .Or. xpeak .Gt. num_right) Then
 
!           End of line, start new line
 
!**DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG
!           Write (*, '(''End of line'')')
!**DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG***DEBUG
 
!           Set-up for new row
              xpeak = 2
              ypeak = ypeak - 1
              xprevious = 1
              yprevious = ypeak
              gap = 1
 
              If (X_2DPEAKS(1, ypeak+1) .Gt. -1.7e38 .And. X_2DPEAKS(2, &
                ypeak+1) .Gt. -1.7e38 .And. X_2DPEAKS(1, ypeak) .Gt. -1.7e38) &
                Then
 
!              Peaks exist, new vectors are easy to define
                 x_vector = X_2DPEAKS(2, ypeak+1) - X_2DPEAKS(1, ypeak + 1)
                 y_vector = Y_2DPEAKS(2, ypeak+1) - Y_2DPEAKS(1, ypeak + 1)
                 x_coordinate = X_2DPEAKS(1, ypeak) + x_vector
                 y_coordinate = Y_2DPEAKS(1, ypeak) + y_vector
 
              Else If (ymax_peaks - ypeak .Gt. num_down) Then
 
!              Problem
                 Call IO_WRITE ('WARNING: Peak search ' // &
                   'problem, starting cross contains missing peak', status)
                 Return
 
              End If
 
!           Check coordinate is within search area
              continue = x_coordinate .Ge. Real(xstrelm - 1) .And. &
                x_coordinate .Le. Real(xendelm) .And. y_coordinate .Ge. &
                Real(ystrelm - 1) .And. y_coordinate .Le. Real(yendelm) .And. &
                ymax_peaks - ypeak .Le. num_down
 
           End If
 
!        Output progress
           If (peak_found .And. Mod(num_peaks, output_frequency) .Eq. 0) Then
              Write (message, '(''INFO: Found '', i6, ''  peaks'')') num_peaks
              Call IO_WRITE (message, status)
           End If
 
        End Do
 
     End If
 
     End Subroutine F2D_FINDLRQUAD
!********1*********2*********3*********4*********5*********6*********7*********8
 
 
 
 
 
