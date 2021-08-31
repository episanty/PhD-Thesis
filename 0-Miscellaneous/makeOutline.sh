
#!/bin/bash


pdfjam ../build/Thesis.pdf --outfile ThesisSinglePage.pdf  --nup 22x11 --frame true --landscape 

echo "finished with pdf stuff"

convert -density 750 -quality 90 -background "rgb(255,255,255)" -alpha background ThesisSinglePage.pdf ThesisSinglePage.png


echo "finished with png stuff"
