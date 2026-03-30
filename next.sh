#!/bin/bash
ext=0

echo -e "\n\n====== Welcome to next.sh ======\n"
read -p "* Current level: " lvl

while [ $ext -ne "1" ];
do
	## if number value
	if [[ "$lvl" =~ ^[0-9] ]]; then
		ext=1

		## http & passwd
		echo -e "\nhttp://natas$lvl.natas.labs.overthewire.org"
		pass=$(grep -oP "natas${lvl} is \K.*" ./natas.md)
		echo -e "$pass\n"

		## curl req
		echo -n "* curl? "
		read -p "" req
		printf '\033[1A'
		if [[ "$req" == *"y"* ]]; then
			echo -e "Executing: \n"
			echo -ne "curl -u natas$lvl:$pass http://natas$lvl.natas.labs.overthewire.org\n"
			echo -e "\n================================\n"
			curl -u natas$lvl:$pass http://natas$lvl.natas.labs.overthewire.org
		## curl flags (if not empty)
		elif [[ -n "$req" ]] && [[ "$req" == *"-"*  ]]; then
			echo -e "Executing:                                  \n"
			echo -ne "curl $req -u natas$lvl:$pass http://natas$lvl.natas.labs.overthewire.org\n"
			echo -e "\n================================\n"
			eval curl $req -u natas$lvl:$pass http://natas$lvl.natas.labs.overthewire.org
		## if empty / else
		else
			echo -ne "* Good luck!\n"
		fi
	## idk level tech
	elif [[ "$lvl" == *"?"* ]]; then
		ext2=0
		var=34
		while [ $ext2 -eq "0" ]
		do
			exec 2> /dev/null
			finder=$(grep -oP "natas${var} \K.*" ./natas.md)
			## if grep empty
			if [[ -z $finder ]]; then 
				$((var--))
			## if grep is(n)t empty
			elif [[ -n $finder ]]; then
				printf '\033[1A'
				echo -n "natas$var: "
				lvl=$var
				ext2=1
			fi
			exec 2> /dev/pts/0
		done
	## empty lvl
	else
		echo "If unsure, use: ?"
		ext=1
	fi
done
echo -e "\n================================\n\n"
