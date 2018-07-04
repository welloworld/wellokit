#!/bin/bash
cp ~/.bashrc ./bashrc_copy

data="
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias e='sudo vim ~/.zshrc'
alias cl='clear'
alias l='ls'
alias ll='ls -lh'
alias la='ls -a'
alias lll='ls -alh'
alias u='source ~/.bashrc > /dev/null 2>&1; echo \"Updated!\"; source ~/.zshrc > /dev/null 2>&1'
alias des='cd ~/Desktop'
alias mac='ifconfig | grep ether | tail -1 | awk '\"'\"'{print \$2}'\"'\"''
alias ipa='ifconfig | grep inet | head -1 | awk '\"'\"'{print \$2}'\"'\"'' 
alias gate='ip route | grep default |  awk '\"'\"'{print \$3}'\"'\"''
alias ins='sudo apt-get install'
alias wire='sudo wireshark'
alias p3='ipython3'
alias p='ipython2'
alias k='kill -9'
alias server='ssh -i ~/mmm.pem ubuntu@11.111.111.11'
alias nocreds='git config --global credential.helper store'

insert() { sudo insmod ; }
remove() { sudo rmmod ; }
gitter() { git add -A && git commit -m \"\$1\" && git push; }
upload() { scp -i ~/mmm.pem  ubuntu@11.111.111.11:/home/; }
give() { scp -i ~/mmm.pem ubuntu@11.111.111.11:/home/ ; }

killer() {
	local length=\"\$(jobs | wc -l)\"
	if [[ -z \$length ]]; then
		echo \"[!] You have no jobs [!]\"
	else	
		for i in \`seq 1 \$length\`;
		do
			kill -9 %\$i
		done   
	fi	

	#local ref=\".*?([[:digit:]]+).*?\"
	#jobs -l | while read line
	#do
	#	if [[ \$line =~ \$ref ]]
	#	then
	#		echo \"\${BASH_REMATCH[1]}\"
	#	fi

		#if [ \"\$line\" -eq \"\$ref\" ]; then
			#echo \"\${BASH_REMATCH[1]}\"
		#	echo \"welo\"
		#	echo \$line
		#fi	
	#done	
}

locator() {

	echo 'Welcome to the Wellocator!'
	if [[ -z \$1 ]]; then
		echo '[!] Not enough arguments [!]'
	else
		echo -e \"\n******************************* FILES ***************************************\n\"
		sudo find / -type f -iname \"\$1\" 2>/dev/null

		echo -e \"\n***************************** IN_FILES *************************************\n\"
		sudo find / -type f -iname \"*\$1*\" 2>/dev/null 

		echo -e \"\n******************************* DIRS ***************************************\n\"
		sudo find / -type d -iname \"\$1\" 2>/dev/null

		echo -e \"\n***************************** IN_DIRS **************************************\n\"
		sudo find / -type d -iname \"*\$1*\" 2>/dev/null
		
	fi	

}

if [ -f /etc/bash.command-not-found ]; then
    . /etc/bash.command-not-found
fi
"

echo -e "$data" >> ~/.bashrc ; echo -e "$data" >> ~/.zshrc
source ~/.bashrc ; source ~/.zshrc

echo -e "[*] bashrc and zshrc changed [*]"
