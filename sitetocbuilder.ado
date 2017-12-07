*! version 1.1
*! Doug Hemken
*! 7 December 2017

capture program drop sitetocbuilder
program define sitetocbuilder, rclass
	syntax , [replace]
* Package-file name	
		
	local saving "stata.toc"
	
	capture confirm file "`saving'"
	if (_rc==0 & "`replace'"=="") {
		display "    {error: File `saving' already exists, specify -replace-}
		error 602
		}
* Build from a template
	preserve
	quietly infix str doc_line 1-256 using "StataSiteTemplate.txt"
	quietly compress doc_line

	local pkg_files : dir `"."' files "*.pkg", respect
	quietly foreach file of local pkg_files {
		expand 2 in `=_N'
		local file = ustrregexra(`"`file'"', ".pkg", "")
		replace doc_line = `"p `file'"' in `=_N'
		}
	
* Write out the result
	quietly compress doc_line
	outfile doc_line using `"`saving'"', noquote wide replace
	display "  {text:Output saved as {it:`saving'}}"
	restore
	return local outfile `"`saving'"'
end
