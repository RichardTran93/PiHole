# download adblock lists
curl -s -L https://adaway.org/hosts.txt > adblock.unsorted
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
