#!/bin/sh

domain='www.homesandcommunities.co.uk'

cachedir=./cache
cachefile=$cachedir/$domain

mkdir -p cache
: curl -s "http://wayback.archive.org/web/*/$domain*" > $cachefile

cat  $cachefile |
    grep '<a ' |
    sed -e 's/^.*>http/http/' -e 's/<.*$//' -e '/^ *$/d' -e "s/$domain:80\//$domain\//' |
    {
        cat <<-!
!
    }
