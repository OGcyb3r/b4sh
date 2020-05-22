#!/bin/bash
clearme(){
  clear
}
txt="dns_new.sql"
check_if_found(){
  GotIP=$(echo $Getip | cut -d : -f 1)
  if [[ $GotIP != "resolveip" ]]; then
    printf "\e[1;42m[ + ]\e[0m \e[1;37m$ip1.$ip2.$ip3.$random\e[0m\e[1;37m \e[1;32m : \e[0m \e[1;37m$Getip\e[0m\n"
    echo "('$ip1.$ip2.$ip3.$random', '$Getip')," >> $txt.txt
  else
    printf "\e[33;41m[ - ]\e[0m \e[30;41m$ip1.$ip2.$ip3.$random\e[0m\n"
  fi
}
check_if_found_2(){
  GotIP=$(echo $Getip | cut -d : -f 1)
  GotSys2=$(echo $system2 | cut -d : -f 1)
  GotSys3=$(echo $system3 | cut -d : -f 1)
  if [[ $GotIP != "resolveip" ]]; then
    printf "\e[1;42m[ + ]\e[0m \e[1;37m$ip1.$ip2.$c.$b\e[0m\e[1;37m \e[1;32m : \e[0m \e[1;37m$Getip\e[0m\n"
	echo "('$ip1.$ip2.$c.$b', '$Getip')," >> $txt.txt
  #else
	#printf "\e[33;41m[ - ]\e[0m \e[30;41m$ip1.$ip2.$c.$b\e[0m\n"
	fi
}
theSecond(){
  read -p $'\e[1;37m# Enter the ip address : \e[0m' ip
  ip1=$(echo $ip | cut -d . -f 1)
  ip2=$(echo $ip | cut -d . -f 2)
  ip3=$(echo $ip | cut -d . -f 3)
  ip4=$(echo $ip | cut -d . -f 4)
  res_ip_test=$( (host -s $ip) 2>&1 )
  if [[ $res_ip_test ]];
  then
    clearme
    printf "\e[1;37mTesting the ip\e[0m	:	\e[0m[\e[1;32m+\e[0m] $ip \e[0m	\e[32m Good\e[0m
    \e[1;37mHostname\e[0m	:	\e[0m[\e[1;32m+\e[0m] $res_ip_test \e[0m \e[32m Good\e[0m\n"
  else
    printf "\e[1;31m status : \e[0m[\e[1;31m-\e[0m] $ip \e[1;31m [BAD]\e[0m
    "
  fi
  echo ""
  printf "\e[48;5;94m\e[1;37mChoice a number to scan the $ip\e[0m :
  [\e[1;33m1\e[0m] $ip1.$ip2.$ip3.\e[1;31mxxx\e[0m
  [\e[1;33m2\e[0m] $ip1.$ip2.\e[1;31mxxx\e[0m.$ip4
  "
  read -p $'\e[1;37mEnter number : \e[0m' number
  echo ""
  if [[ $number == "1" ]];
  then
    printf "\e[1;37mStarting brute ... \e[0m\n"
    random=0
    ip4=0
    until [[ $ip4 -gt 254 ]]
    do
      random=$(( $random + 1 ))
      if
      Getip=$( (host -s $ip1.$ip2.$ip3.$random) 2>&1 )
      system2=$( (dig $Getip +short) 2>&1 )
      system3=$( (host -s $system2 ) 2>&1 )
      sleep 0.5	#slow down
      then
        check_if_found
      fi
      if [[ $random -gt 254 ]];then
        exit 1
      fi
    done
    exit 1
  elif [[ $number == "2" ]];
  then
    a=254
    while [[ "$a" -lt 255 ]]
    do
      b="$a"
      while [ "$b" -ge 1 ]
      do
        c="$b"
        while [ "$c" -ge 1 ]
        do
          Getip=$( (host -s $ip1.$ip2.$c.$b) 2>&1 )
          system2=$( (dig $Getip +short) 2>&1 )
          system3=$( (host -s $system2 ) 2>&1 )
          if [[ $Getip != "host" ]];
          then
            sleep 0.5	#slow down
            check_if_found_2
          fi
          c=`expr $c - 1`
        done
        #printf "127.0.$a.$b\n"
        b=`expr $b - 1`
      done
      a=`expr $a + 1`
    done
    exit 1
  fi
}
theSecond
