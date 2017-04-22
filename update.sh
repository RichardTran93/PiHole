# download adblock lists
curl -s -L https://easylist.to/easylist/easylist.txt https://fanboy.co.nz/enhancedstats.txt https://easylist-downloads.adblockplus.org/fb_annoyances_full.txt https://raw.githubusercontent.com/gioxx/xfiles/master/facebook.txt https://easylist-downloads.adblockplus.org/fb_annoyances_full.txt https://fanboy.co.nz/fanboy-antifacebook.txt https://easylist-downloads.adblockplus.org/fb_annoyances_full.txt https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt https://www.malwaredomainlist.com/hostslist/hosts.txt https://easylist-downloads.adblockplus.org/easyprivacy+easylist.txt https://adaway.org/hosts.txt https://raw.githubusercontent.com/reek/anti-adblock-killer/master/anti-adblock-killer-filters.txt https://raw.githubusercontent.com/Yhonay/antipopads/master/popads.txt https://raw.githubusercontent.com/IDKwhattoputhere/uBlock-Filters-Plus/master/uBlock-Filters-Plus.txt https://easylist-downloads.adblockplus.org/adwarefilters.txt https://easylist-downloads.adblockplus.org/easylist.txt https://easylist-downloads.adblockplus.org/malwaredomains_full.txt > adblock.unsorted

# look for:  ||domain.tld^
sort -u adblock.unsorted | grep ^\|\|.*\^$ | grep -v \/ > adblock.sorted

# remove extra chars
sed 's/[\|^]//g' < adblock.sorted > adblock.txt

echo -n "# updated on `date +'%Y-%m-%d %H:%M:%S'`" >> adblock.txt

# remove files we no longer need
rm adblock.unsorted adblock.sorted

git add *
git commit -a -m "updated on `date +'%Y-%m-%d %H:%M:%S'`";
git push

# remove time stamp
head -n -1 adblock.txt > temp.txt; mv temp.txt adblock.txt

echo " `date +'%Y-%m-%d %H:%M:%S'`" >> log.txt
