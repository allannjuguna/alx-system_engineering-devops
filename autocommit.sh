#! /bin/bash
#  @author: zerofrost🦊
#  @date: 2022-5-22
#  @description: Automatic commits


white="\033[0m"
red="\033[91m"
green="\033[92m"
bold="\033[01m"
yellow="\033[93m"
blue="\033[94m"
success="${bold}${green}[+]${white} - "
alert="${bold}${yellow}[!]${white} - "
progress="${bold}${blue}[*]${white} - "
fail="${bold}${red}[*]${white} - "
end="${white}"

commit_messages=(
	"New Update" 
	"Restructured Code" 
	"Minor changes"
	"New feature"
	"Updated Readme.md"
	"Minimized clutter in code"
	"Added files via upload"
	)

total=${#commit_messages[@]}
index=$(( ( RANDOM % $total ) + 0 ))
result=$(($total - $index))

if [[ $result < 0 ]];then
	echo "[-] Try again"
	exit
else
	message=${commit_messages[index]}
	echo -e "${success} Committing with message: $message $end"
	echo
	git add * && sleep 1 && git commit -m "${message}"
	git add * || sleep 1 && git commit -m "${message}"
	echo 
	git push && echo -e "$success Committed successfully $end" || echo -e "$fail An error occurred while committing $end"
fi

