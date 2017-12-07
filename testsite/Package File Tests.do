cd "z:/public_web/stataworkshops/packagefilebuilder/testsite"
cscript
run "../packagefilebuilder.ado"
run "../sitetocbuilder.ado"

* net from https://www.ssc.wisc.edu/~hemken/Stataworkshops
* net from https://www.ssc.wisc.edu/~hemken/Stataworkshops/packagefilebuilder/testsite

packagefilebuilder a, replace
file_equal `r(outfile)' using asimple.txt
* net describe a
* net set ado "."
* net install a

packagefilebuilder a, do dta replace
file_equal `r(outfile)' using aall.txt
* net describe a
* net set ado "."
* net install a
* net get a

capture noisily packagefilebuilder "a b"
assert _rc == 198

capture noisily packagefilebuilder ab
assert _rc == 602

packagefilebuilder ab, noado nosthlp dta replace
file_equal `r(outfile)' using abdta.txt

capture noisily sitetocbuilder
assert _rc == 602

sitetocbuilder, replace
file_equal `r(outfile)' using statatoc.txt

net from https://www.ssc.wisc.edu/~hemken/Stataworkshops/packagefilebuilder/testsite
