#!/bin/bash

# This Script just opens the League of Legends download webpage if the user forgot to download LoL. 
# Yes, I did all this work for that.

# We can make it a bit easier on the user if the League of Legends link is in the correct language
# first, get the locale of the Steam Deck
LOCALE=$(locale | grep LANG | cut -d= -f2 | cut -d. -f1)
# then change the underscore "_" to a dash "-"
LOCALE=${LOCALE//"_"/"-"}
# finally, make it all lowercase
LOCALE="$(tr [A-Z] [a-z] <<< "$LOCALE")"

# Riot has several locales for the download webpage, they sort everyone based on country rather than language.
# I think we can do better than that, by setting the locale based on language.
# Since we are using Bash, we will use arrays for the locales
enus=("en-ca" "en-us" "en-mx" "en-co" "en-pe" "en-ve" "en-cu" "en-ht" "en-pr" "en-ar" "en-cl" "en-bo" "en-py" "en-br")
engb=("en-gb" "en-fr" "en-it" "en-de" "en-be" "en-ie" "en-nl" "en-es" "en-pt" "en-tr" "en-jp" "en-ru")
esmx=("es-co" "es-mx" "es-pe" "es-ve" "es-cu" "es-pr" "es-ar" "es-cl" "es-bo" "es-py" "es-br")
enpl=("en-pl" "en-hu" "en-ro" "en-ua" "ru-ua")
eses=("es-es" "es-fr" "es-pt")
ptbr=("pt-pt" "pt-br")
frfr=("fr-be" "fr-fr" "fr-ht" "fr-ca")
enau=("en-au" "en-nz")
# This last array contains languages that have only one locale each
otherlang=("tr-tr" "ja-jp" "th-th" "zh-tw" "en-sg" "en-ph" "vi-vn" "hu-hu" "pl-pl" "ro-ro" "cs-cz" "el-gr" "de-de" "it-it" "ru-ru")

# This function checks if a locale is in an array
contains() {
        typeset _x;
        typeset -n _A="$1"
        for _x in "${_A[@]}" ; do
                [ "$_x" = "$2" ] && return 0
        done
        return 1
}

# Now we run the locale through the function for each array until we find a match
if contains enus "$LOCALE"
  then
  echo "locale will be en-us"
  LoLLOCALE="en-us"
elif contains engb "$LOCALE"
  then
  echo "locale will be en-gb"
  LoLLOCALE="en-gb"
elif contains esmx "$LOCALE"
  then
  echo "locale will be es-mx"
  LoLLOCALE="es-mx"
elif contains enpl "$LOCALE"
  then
  echo "locale will be en-pl"
  LoLLOCALE="en-pl"
elif contains eses "$LOCALE"
  then
  echo "locale will be es-es"
  LoLLOCALE="es-es"
elif contains ptbr "$LOCALE"
  then
  echo "locale will be pt-br"
  LoLLOCALE="pt-br"
elif contains frfr "$LOCALE"
  then
  echo "locale will be fr-fr"
  LoLLOCALE="fr-fr"
elif contains enau "$LOCALE"
  then
  echo "locale will be en-au"
  LoLLOCALE="en-au"
elif contains otherlang "$LOCALE"
  then
  echo "locale will be unchanged"
  LoLLOCALE=$LOCALE
else
# If the locale is not in any array, we will set it to en-gb, because British people will get mad if I used en-us as default
  echo "local option not found"
  LoLLOCALE="en-gb"
fi

# Now we can finally open a browser, so the user can download their LoL executable

xdg-open https://signup.leagueoflegends.com/$LoLLOCALE/signup/redownload

# now we exit the script

exit 0