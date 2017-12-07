{smcl}
{* *! version 1.0.0  07dec2017}{...}
{vieweralsosee "net" " help net"}{...}
{vieweralsosee "sitetocbuilder" "help sitetocbuilder"}{...}
{vieweralsosee "" "--"}{...}
{viewerjumpto "Syntax" "packagefilebuilder##syntax"}{...}
{viewerjumpto "Description" "packagefilebuilder##description"}{...}
{viewerjumpto "Options" "packagefilebuilder##options"}{...}
{viewerjumpto "Remarks" "packagefilebuilder##remarks"}{...}
{viewerjumpto "Examples" "packagefilebuilder##examples"}{...}
{title:Title}

{phang}
{cmd:packagefilebuilder} {hline 2} Create a simple package file (pkg)
	from a folder in the current directory.


{marker syntax}{...}
{title:Syntax}

{p 8 17 2}
{cmd:packagefilebuilder}
{it:packagename}
[{cmd:,} {it:options}]

{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{syntab:Main}
{synopt:{opt replace}}replace an existing -pkg- file{p_end}
{synopt:{opt noado}}do not include -ado- files{p_end}
{synopt:{opt nosthlp}}do not include help files{p_end}
{synopt:{opt do}}include -do- files{p_end}
{synopt:{opt dta}}include data files{p_end}
{synoptline}
{p2colreset}{...}

{marker description}{...}
{title:Description}

{pstd}
{cmd:packagefilebuilder} creates a simple package file (pkg)
	from a specified folder in the current directory.  It is
	intended for quick creation of a user-site that has fairly
	limited installation instructions, for example class or
	workshop materials.{p_end}


{marker options}{...}
{title:Options}

{dlgtab:Main}

{phang}
{opt replace} replaces an existing -pkg- file.  This is required if
	such a file exists.{p_end}

{phang}
{opt noado} specifies that -ado- files not be included among the
	package files that users can install.{p_end}

{phang}
{opt nosthlp} specifies that Stata help files not be included among the
	package files that users can install.{p_end}

{phang}
{opt do} specifies that Stata -do- files should be included among the
	package files that users can install.  These are automatically
	listed as ancillary files.{p_end}

{phang}
{opt dta} specifies that Stata data files should be included among the
	package files that users can install.  These are automatically
	listed as ancillary files.{p_end}


{marker remarks}{...}
{title:Remarks}

{pstd}
{cmd:packagefilebuilder} creates a simple package file (pkg)
	from a specified folder in the current directory.  All of
	the files to be distributed in the package must reside in
	the same subfolder.{p_end}
	
{pstd}This command {bf:requires} a template for the pkg file,
	named {bf:PackageTemplate.txt}, which contains all the
	information about the package(s) except the list of files
	to include.{p_end}
	
{pstd}This command is meant to be run in the directory where
	the user-site table-of-contents file (stata.toc) is to
	be located.  The template should also be located in this
	same directory.{p_end}
	
{pstd}By default, -ado- and help files are included (program
	files, the normal package files).  Optionally
	the inclusion of these files can be suppressed.  
	Additionally, -do- files and data files may be included
	(ancillary files).  Any combination is valid.{p_end}


{marker examples}{...}
{title:Examples}

{phang}{it:location of your user-site}{p_end}

{phang}{cmd:. cd "Z:/PUBLIC_web/testsite}{p_end}

{phang}{it:Package up files in} {bf:mypackage}{p_end}

{phang}{cmd:. packagebuilder mypackage, replace}{p_end}

{phang}{it:net from the user site}{p_end}

{phang}{cmd:. net from "https://www.ssc.wisc.edu/~hemken/testsite"}{p_end}
{phang}{cmd:. net describe mypackage}{p_end}
{phang}{cmd:. net install mypackage}{p_end}
