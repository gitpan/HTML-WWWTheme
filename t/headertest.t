# This is -*-Perl-*-, believe it or not.
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..2\n"; }
END {print "not ok 1\n" unless $loaded;}
use HTML::WWWTheme;
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

my $testnum = 2;

my $Theme;


# First, we'll make a string that we know is correct.  Then we'll try
# to create one with the module and compare. If it works, then all is well.
# if it doesn't, we fail.  (of course, "correct" means correct on my 
# development machine.  Experience says that if it works on my machine, it
# should work everywhere.

my $goodstring =q{
<!-- HTML GENERATED BY HTML::WWWTheme
***********************************************************
Copyright (C) 2000 Chad Hogan <chogan@uvastro.phys.uvic.ca>
Copyright (C) 2000 Joint Astronomy Centre
All Rights Reserved.
HTML::WWWTheme is free software, licensed under the GNU General
Public License as published by the Free Software Foundation.  Please
see the source code for details.
-->

<BODY BGCOLOR="#FFFFFF" ALINK="#0F0F0F" LINK="#F0F0F0" TEXT="#CCCCCC" VLINK="#FFCCFF" >
    <table cellpadding="0" cellspacing="0" border="0">
      <!--This is the main row of stuff-->
      <tr valign="top">
	<TD bgcolor="#CCFFCC">
	  <TABLE cellspacing="0" cellpadding="0">
	<!--a gutter for the left side-->
	<TD width="3">
	  <IMG SRC="/WWW/images/blank.gif" alt="" width="3" height="1">
	</TD>
	<!--end of the gutter-->
	
	<!--beginning of the sidebar element-->
	<TD width="150">
	  <IMG SRC="/WWW/images/blank.gif" alt="" width="1" height="1" vspace="5"><BR>
	  <B><A NAME="top"></a><a href="nowhere.html">nowhere</a></B><BR>
	  <HR> 
	  
	  <!--a spacer-->
	  <IMG SRC="/WWW/images/blank.gif" alt="" width="1" height="1" vspace="17"><BR>
	  
	  <B>Cool stuff</B><BR><HR>
	  
	  <TABLE CELLSPACING="0" CELLPADDING="0">
	    <TR>
	      <TD WIDTH="5"><IMG SRC="/WWW/images/blank.gif" ALT="" WIDTH="5" HEIGHT="1" VSPACE="3"></TD>
	      <TD WIDTH="120">
		<FONT SIZE="-1" FACE="TIMES NEW ROMAN, TIMES ROMAN, TIMES, SERIF">
		  <IMG SRC="/WWW/images/blank.gif" ALT="" WIDTH="120" HEIGHT="1" VSPACE="3"><BR><a href="a.html">A</a><BR><IMG SRC="/WWW/images/blank.gif" ALT="" WIDTH="1" HEIGHT="1" VSPACE="2"><BR><a href="b.html">b</a><BR><IMG SRC="/WWW/images/blank.gif" ALT="" WIDTH="1" HEIGHT="1" VSPACE="2"><BR>
		</FONT>
	      </TD>
	    </TR>
	  </TABLE><!--a spacer-->
	  <IMG SRC="/WWW/images/blank.gif" alt="" width="1" height="1" vspace="17"><BR>
          <B>More Links</B><BR>
          <HR>
      	  <TABLE CELLSPACING="0" CELLPADDING="0">
	    <TR>
	      <TD WIDTH="5"><IMG SRC="/WWW/images/blank.gif" ALT="" WIDTH="5" HEIGHT="1" VSPACE="3">
              </TD>
	      <TD WIDTH="120">
		<FONT SIZE="-1" FACE="TIMES NEW ROMAN, TIMES ROMAN, TIMES, SERIF"><a href="here.html">here</a><IMG SRC="/WWW/images/blank.gif" ALT="" WIDTH="120" HEIGHT="1" VSPACE="3"><BR><a href="there.html">there</a><BR>
		  
		</FONT>
	      </TD>
	    </TR>
	  </TABLE>

	   <!--a spacer-->
	  <IMG SRC="/WWW/images/blank.gif" alt="" width="1" height="1" vspace="17"><BR>
        </TD>
       </TABLE>
      </TD>
       <!--That was the end of the sidebar element-->
	  <TD>
	    <TABLE background="" Cellspacing="0" cellpadding="0">
	      <TD WIDTH="25">
		<!-- This is just for space between the sidebar and the main body -->
		<IMG SRC="/WWW/images/blank.gif" alt="" width="25" height="1">
	      </TD>
		      
	      <!-- Now we make a table element for the real text!-->
	     <TD>

	       <!-- END OF GENERATED HTML
		 **********************************************************  
		   -->};

eval { 
  $Theme = new HTML::WWWTheme;
  $Theme->{bgcolor}           = "#FFFFFF";     
  $Theme->{alink}             = "#0F0F0F";
  $Theme->{"link"}            = "#F0F0F0";
  $Theme->{text}              = "#CCCCCC";
  $Theme->{vlink}             = "#FFCCFF";
  
  $Theme->{sidebarcolor}      = "#CCFFCC";
  $Theme->{blankgif}          = "/WWW/images/blank.gif";
  $Theme->{infolinks}         = [ "<a href=\"here.html\">here</a>", "<a href=\"there.html\">there</a>" ];
  $Theme->{sidebartop}        = "<a href=\"nowhere.html\">nowhere</a>";
  $Theme->{sidebarmenutitle}  = "Cool stuff";
  $Theme->{sidebarsearchbox}  = 0;
  $Theme->{sidebarmenulinks}  = [ "<a href=\"a.html\">A</a>", "<a href=\"b.html\">b</a>" ];
  $Theme->{morelinkstitle}    = "More Links";

  my $header = $Theme->MakeHeader();

  if ($header eq $goodstring) 
    {
      print "ok ", $testnum ++, "\n";
    }
  else
    {
      open FIRST, ">firstprint";
      open SECOND, ">secondprint";
      print FIRST $header;
      print SECOND $goodstring;
      print "not ok ", $testnum ++, "\n";
      close FIRST;
      close SECOND;
      #    }
      #};
      
      #if ($@) 
      #  {
      print STDOUT "...error: $@\n";
      print STDOUT "Examine files called firstprint and secondprint.\n";
      print STDOUT "firstprint was the generated HTML, and secondprint was the expected output.\n";
      print STDOUT "If there is a difference, then there might be something wrong.  If you can't\n";
      print STDOUT "figure it out yourself, email the results to chogan\@uvastro.phys.uvic.ca, \n";
      print STDOUT "with a brief summary of your set-up (platform, perl version, etc)\n";
      print STDOUT "and I'll see if I can figure it out.\n";
    }
};

