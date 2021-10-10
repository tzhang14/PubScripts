#/bin/bash
url="https://repo.zenk-security.com/?dir=./Virus-Infections-Detections-Preventions"
grep_link='<a href=\"[^"]+\">'
grep_filetype='.pdf\">$'
search_1='<a href=\"\.\/'
replace_1='https\:\/\/repo\.zenk\-security\.com\/'
search_2='\s'
replace_2='\%20'
search_3='\.pdf\">'
replace_3='\.pdf\n'
wget_urls=$(curl "$url" | grep -oE "$grep_link"| grep -E "$grep_filetype"| sed "s/$search_1/$replace_1/g" | sed "s/$search_2/$replace_2/g" | sed "s/$search_3/$replace_3/g")
#echo $wget_urls
for download_url in $wget_urls
do     
  echo "$download_url";
  wget "$download_url";
done