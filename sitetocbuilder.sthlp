{smcl}
{* *! version 1.0.0  07dec2017}{...}
{vieweralsosee "net" " help net"}{...}
{vieweralsosee "packagefilebuilder" "help packagefilebuilder"}{...}
{vieweralsosee "" "--"}{...}
{viewerjumpto "Syntax" "sitetocbuilder##syntax"}{...}
{viewerjumpto "Description" "sitetocbuilder##description"}{...}
{viewerjumpto "Options" "sitetocbuilder##options"}{...}
{viewerjumpto "Remarks" "sitetocbuilder##remarks"}{...}
{viewerjumpto "Examples" "sitetocbuilder##examples"}{...}
{title:Title}

{phang}
{cmd:sitetocbuilder} {hline 2} Create a simple user-site
	table of contents file (stata.toc)
	from all packages in the current directory.


{marker syntax}{...}
{title:Syntax}

{p 8 17 2}
{cmd:sitetocbuilder}
[{cmd:,} {it:options}]

{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{syntab:Main}
{synopt:{opt replace}}replace an existing -stata.toc- file{p_end}
{synoptline}
{p2colreset}{...}

{marker description}{...}
{title:Description}

{pstd}
{cmd:sitetocbuilder} creates a simple user-site
	table-of-contents file (stata.toc)
	from all packages in the current directory.  It is
	intended for quick creation of a user-site that has fairly
	limited installation instructions, for example, class or
	workshop materials.{p_end}


{marker options}{...}
{title:Options}

{dlgtab:Main}

{phang}
{opt replace} replaces an existing -pkg- file.  This is required if
	such a file exists.{p_end}

{marker remarks}{...}
{title:Remarks}

{pstd}
{cmd:sitetocbuilder} creates a simple user-site
	table-of-contents file (stata.toc)
	from all the package files in the current directory.{p_end}
	
{pstd}This command {bf:requires} a template for the contents file,
	named {bf:StataSiteTemplate.txt}, which contains all the
	information about the user site except the list of packages
	to include.{p_end}
	
{pstd}This command is meant to be run in the directory where
	the final user-site table-of-contents file (stata.toc) is to
	be located.  The template should also be located in this
	same directory.{p_end}
	

{marker examples}{...}
{title:Examples}

{phang}{it:location of your user-site}{p_end}

{phang}{cmd:. cd "Z:/PUBLIC_web/testsite}{p_end}

{phang}{it:List packages in} {bf:testsite}{p_end}

{phang}{cmd:. sitetocbuilder, replace}{p_end}

{phang}{it:net from the user site}{p_end}

{phang}{cmd:. net from "https://www.ssc.wisc.edu/~hemken/testsite"}{p_end}
