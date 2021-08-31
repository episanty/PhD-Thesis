#!/bin/bash
# 

inputfile="../build/Thesis.bbl"
#texfile="Thesis.tex"

#for testing
#cp draft.bbl test.bbl
#inputfile="test.bbl"

# Move periods next to DOIs
perl -pi -0 -w -e 's@\\href\{http://dx.doi.org/(.*)}\{.\n\\newblock@. \\newblock \\href{http://dx.doi.org/$1}{@g' $inputfile
# Note that this will mangle any article title that ends in ! or ?

# This also messes up messes up the GitHub record by adding an extra period. To remove it:
perl -pi -w -e 's@ . @ @g' $inputfile


# Specific fixes
# Titi & Drake (add period and year)
perl -pi -0 -w -e 's@ionization\{@ionization (2015). {@g' $inputfile
# Agostini ionization review (shift link start down to the series title)
perl -pi -0 -w -e 's@\\href\{http://dx.doi.org/10.1016/B978-0-12-396482-3.00003-X}\{ In \\textsc\{P.~Berman, E.~Arimondo and C.~Lin} \(eds.\), @In \\textsc{P.~Berman, E.~Arimondo and C.~Lin} (eds.), \\href{http://dx.doi.org/10.1016/B978-0-12-396482-3.00003-X}{@g' $inputfile


# Hackish fix for titles ending in ? if needed
#perl -pi -0 -w -e 's@?.@?@g' $inputfile

# Run pdflatex to implement changes, if wanted
#pdflatex $texfile

