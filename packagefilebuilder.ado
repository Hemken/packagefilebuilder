*! version 1.3
*! Doug Hemken
*! 7 December 2017

* ISSUES
* search subdirs?

capture program drop packagefilebuilder _replaceext _fileext fentry
program define packagefilebuilder, rclass
	syntax anything(name=packagename), [replace noado nosthlp do dta]
* Package-file name	
	local packagename = ustrtrim(usubinstr(`"`packagename'"', `"""', "", .))
	
	if (ustrregexm(`"`packagename'"', " ")) {
		display "    {error: Spaces in package names break the page files}"
		error 198
		}
	else if (ustrlen(`"`packagename'"') <= 1) {
		display "    {error: Single letter package names break the page file in the Viewer}"
		}
	_replaceext using "`packagename'", new("pkg")
	local saving "`r(newfile)'"
	
	capture confirm file "`saving'"
	if (_rc==0 & "`replace'"=="") {
		display "    {error: File `saving' already exists, specify -replace-}"
		error 602
		}
* Build from a template
	preserve
	quietly infix str doc_line 1-256 using "PackageTemplate.txt"
	quietly compress doc_line
* File entries
	if ("`ado'" == "") {
		fentry ado, package("`packagename'")
	}
	if ("`sthlp'" == "") {
		fentry sthlp, package("`packagename'")
	}
	if ("`do'" == "do") {
		fentry do, package("`packagename'")
	}
	if ("`dta'" == "dta") {
		fentry dta, package("`packagename'")
	}
* Fill in template placeholders	
	quietly replace doc_line = `"d `packagename' workshop materials"' ///
		if ustrregexm(doc_line, "PackageName")
	quietly replace doc_line = `"d Updated: `c(current_date)'"' ///
		if ustrregexm(doc_line, "CurrentDate")
	
* Write out the result
	quietly compress doc_line
	outfile doc_line using `"`saving'"', noquote wide replace
	display "  {text:Output saved as {it:`saving'}}"
	restore
	return local outfile `"`saving'"'
end

program define _replaceext, rclass
	syntax using/, new(string)
	
	_fileext using "`using'"
	if "`r(extension)'" ~= "" {
		local newfile: subinstr local using "`r(extension)'" "`new'"
		}
		else {
		local newfile "`using'.`new'"
		}
	
	return local newfile "`newfile'"

end

program define _fileext, rclass
	syntax using/
	local check: subinstr local using "." "", all
	local dots = length("`using'") - length("`check'")
	if `dots' {
		local undot: subinstr local using "." " ", all
		local wc : word count `undot'
		local extension: word `wc' of `undot'
	} 
	else {
		local extension
		}
	return local extension "`extension'"
end

program define fentry
	syntax anything(name=opt), package(string)
	local opt_files : dir `"`package'"' files "*.`opt'"
	quietly foreach file of local opt_files {
		expand 2 in `=_N'
		replace doc_line = `"f `package'/`file'"' in `=_N'
		}
end
