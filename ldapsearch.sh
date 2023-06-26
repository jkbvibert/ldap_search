
#for line in $(sed 's/:x:.*/ /' /etc/group); do
echo "Select team or all"
read option

if [ $option == "team" ] 
then
	export team="<space delimited email addresses>"
else

export team="<email addresses, each on a separate line>"
fi

for member in $team
do
    ldapsearch -LLL -H ldap://<server FQDN>:<port> -x -b "ou=People,o=<correct filling>" "(uid=$member)" | grep dn:
done
