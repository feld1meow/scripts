#!/bin/bash


if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi


#creating hostname.txt
hostname | touch "$(hostname -s).txt"


#current date
date >> "$(hostname -s).txt"




#1 basic system information
echo -e "\n\n\n#################################################################################################################################" >> "$(hostname -s).txt"
echo "BASIC SYSTEM INFORMATION" >> "$(hostname -s).txt"
echo -e "#################################################################################################################################" >> "$(hostname -s).txt"

#1.1 OS info
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command uname" >> "$(hostname -s).txt"
uname -a >> "$(hostname -s).txt"

#1.2 username associated with current effective user ID
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command whoami" >> "$(hostname -s).txt"
whoami >> "$(hostname -s).txt"

#1.3 displays information about the users currently on the machine
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command w" >> "$(hostname -s).txt"
w >> "$(hostname -s).txt"

#1.4 hostname info
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command hostnamectl" >> "$(hostname -s).txt"
hostnamectl >> "$(hostname -s).txt"

#1.5 distributive version
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command lsb_release -a" >> "$(hostname -s).txt"
lsb_release -a >> "$(hostname -s).txt"

#1.6 hardware info
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command dmidecode" >> "$(hostname -s).txt"
dmidecode >> "$(hostname -s).txt"

#1.7 cpuinfo
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command cat /proc/cpuinfo" >> "$(hostname -s).txt"
cat /proc/cpuinfo >> "$(hostname -s).txt"

#1.8
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command nvidia-smi" >> "$(hostname -s).txt"
nvidia-smi >> "$(hostname -s).txt"

#1.9 meminfo
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command cat /proc/meminfo" >> "$(hostname -s).txt"
cat /proc/meminfo >> "$(hostname -s).txt"

#1.10 enable display resolutions
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command xrandr" >> "$(hostname -s).txt"
xrandr >> "$(hostname -s).txt"

#1.11
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command cat /proc/asound/cards" >> "$(hostname -s).txt"
cat /proc/asound/cards >> "$(hostname -s).txt"




#2 information about drives
echo -e "\n\n\n#################################################################################################################################" >> "$(hostname -s).txt"
echo "INFORMATION ABOUT DRIVES" >> "$(hostname -s).txt"
echo -e "#################################################################################################################################" >> "$(hostname -s).txt"

#2.1
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command fdisk -l" >> "$(hostname -s).txt"
fdisk -l >> "$(hostname -s).txt"

#2.2
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command df -h" >> "$(hostname -s).txt"
df -h >> "$(hostname -s).txt"

#2.3
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command mount | grep /dev/" >> "$(hostname -s).txt"
mount | grep /dev/ >> "$(hostname -s).txt"

#2.4
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command free -h" >> "$(hostname -s).txt"
free -h >> "$(hostname -s).txt"

#2.5
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command lsblk" >> "$(hostname -s).txt"
lsblk >> "$(hostname -s).txt"

#2.6
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command lspci && lspci -vvvn" >> "$(hostname -s).txt"
lspci && lspci -vvvn >> "$(hostname -s).txt"

#2.7
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command iostat" >> "$(hostname -s).txt"
iostat >> "$(hostname -s).txt"

#2.8
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command lsusb && lsusb -vt" >> "$(hostname -s).txt"
lsusb && lsusb -vt >> "$(hostname -s).txt"

#2.9
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command blkid" >> "$(hostname -s).txt"
blkid >> "$(hostname -s).txt"




#3 information about users and sessions
echo -e "\n\n\n#################################################################################################################################" >> "$(hostname -s).txt"
echo "INFORMATION ABOUT USERS AND SESSIONS" >> "$(hostname -s).txt"
echo -e "#################################################################################################################################" >> "$(hostname -s).txt"

#3.1
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command uptime\n" >> "$(hostname -s).txt"
uptime >> "$(hostname -s).txt"

#3.2
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command last reboot" >> "$(hostname -s).txt"
last reboot >> "$(hostname -s).txt"

#3.3
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command last shutdown" >> "$(hostname -s).txt"
last shutdown >> "$(hostname -s).txt"

#3.4
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command cat /etc/passwd" >> "$(hostname -s).txt"
cat /etc/passwd >> "$(hostname -s).txt"

#3.5
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command cat /etc/shadow" >> "$(hostname -s).txt"
cat /etc/shadow >> "$(hostname -s).txt"

#3.6
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command cat /etc/group" >> "$(hostname -s).txt"
cat /etc/group >> "$(hostname -s).txt"

#3.7 info about change password
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command chage -l root" >> "$(hostname -s).txt"
chage -l root >> "$(hostname -s).txt"

#3.8
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command echo PATH" >> "$(hostname -s).txt"
echo $PATH >> "$(hostname -s).txt"

#3.9
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command last -Faiwx" >> "$(hostname -s).txt"
last -Faiwx >> "$(hostname -s).txt"

#3.10
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command runlevel" >> "$(hostname -s).txt"
runlevel >> "$(hostname -s).txt"

#echo -e "\n\n#command history\n" >> "$(hostname -s).txt"
#history | cat >> "$(hostname -s).txt"

#3.11
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command dmesg" >> "$(hostname -s).txt"
dmesg >> "$(hostname -s).txt"

#3.12 enabled kernel modules
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command lsmod" >> "$(hostname -s).txt"
lsmod >> "$(hostname -s).txt"




#4 network information
echo -e "\n\n\n#################################################################################################################################" >> "$(hostname -s).txt"
echo "NETWORK INFORMATION" >> "$(hostname -s).txt"
echo -e "#################################################################################################################################" >> "$(hostname -s).txt"

#4.1
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command ip a" >> "$(hostname -s).txt"
ip a >> "$(hostname -s).txt"

#4.2 external IP-address
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command wget -qO- eth0.me" >> "$(hostname -s).txt"
wget -qO- eth0.me >> "$(hostname -s).txt"

#4.3
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command ifconfig && iwconfig" >> "$(hostname -s).txt"
ifconfig && iwconfig >> "$(hostname -s).txt"

#4.4
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command ip route" >> "$(hostname -s).txt"
ip route >> "$(hostname -s).txt"

#4.5 DNS Servers
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command cat /etc/resolv.conf" >> "$(hostname -s).txt"
cat /etc/resolv.conf >> "$(hostname -s).txt"

#4.6
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command cat /etc/hosts" >> "$(hostname -s).txt"
cat /etc/hosts >> "$(hostname -s).txt"

#4.7 IP routing table
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command ip netstat -r" >> "$(hostname -s).txt"
netstat -r >> "$(hostname -s).txt"

#4.8
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command arp" >> "$(hostname -s).txt"
arp >> "$(hostname -s).txt"

#4.9
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command arp-scan -l" >> "$(hostname -s).txt"
arp-scan -l >> "$(hostname -s).txt"

#4.10
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command nestat" >> "$(hostname -s).txt"
netstat >> "$(hostname -s).txt"

#4.11
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command netstat -anp" >> "$(hostname -s).txt"
netstat -anp >> "$(hostname -s).txt"

#4.12 firewall rules
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command iptables -L -n -v" >> "$(hostname -s).txt"
iptables -L -n -v >> "$(hostname -s).txt"

#4.13 network and local sockets
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command ss" >> "$(hostname -s).txt"
ss >> "$(hostname -s).txt"

#4.14 all listen ports
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command ss -l" >> "$(hostname -s).txt"
ss -l >> "$(hostname -s).txt"

#4.15 only network ports
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command ss -tulpn" >> "$(hostname -s).txt"
ss -tulpn >> "$(hostname -s).txt"




#5 information about packages and services
echo -e "\n\n\n#################################################################################################################################" >> "$(hostname -s).txt"
echo "INFORMATION ABOUT PACKAGES AND SERVICES" >> "$(hostname -s).txt"
echo -e "#################################################################################################################################" >> "$(hostname -s).txt"

#5.1
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command dpkg -l" >> "$(hostname -s).txt"
dpkg -l >> "$(hostname -s).txt"

#5.2
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command cat /var/log/dpkg.log | grep installed" >> "$(hostname -s).txt"
cat /var/log/dpkg.log | grep installed >> "$(hostname -s).txt"

#5.3
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command ls /opt /usr/local" >> "$(hostname -s).txt"
ls /opt /usr/local >> "$(hostname -s).txt"

#5.4
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command ls /etc/init.d/" >> "$(hostname -s).txt"
ls /etc/init.d/ >> "$(hostname -s).txt"

#5.5
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command service --status-all" >> "$(hostname -s).txt"
service --status-all >> "$(hostname -s).txt"

#5.6
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command cat /etc/crontab" >> "$(hostname -s).txt"
cat /etc/crontab >> "$(hostname -s).txt"

#5.7
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command ps aux" >> "$(hostname -s).txt"
ps aux >> "$(hostname -s).txt"

#5.8
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command systemctl list-units --type service --state running" >> "$(hostname -s).txt"
systemctl list-units --type service --state running >> "$(hostname -s).txt" #all running services




#6 information from logs
echo -e "\n\n\n#################################################################################################################################" >> "$(hostname -s).txt"
echo "INFORMATION FROM LOGS" >> "$(hostname -s).txt"
echo -e "#################################################################################################################################" >> "$(hostname -s).txt"

#6.1
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command cat /var/log/auth.log" >> "$(hostname -s).txt"
cat /var/log/auth.log >> "$(hostname -s).txt"

#6.2
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command cat /var/log/auth.log.1" >> "$(hostname -s).txt"
cat /var/log/auth.log.1 >> "$(hostname -s).txt"

#6.3
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command cat /var/log/kern.log" >> "$(hostname -s).txt"
cat /var/log/kern.log >> "$(hostname -s).txt"

#6.4
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command cat /var/log/kern.log.1" >> "$(hostname -s).txt"
cat /var/log/kern.log.1 >> "$(hostname -s).txt"

#6.5
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command cat /var/log/dpkg.log" >> "$(hostname -s).txt"
cat /var/log/dpkg.log >> "$(hostname -s).txt"

#6.6
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command cat /var/log/dpkg.log.1" >> "$(hostname -s).txt"
cat /var/log/dpkg.log.1 >> "$(hostname -s).txt"

#6.7
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command cat /var/log/daemon.log" >> "$(hostname -s).txt"
cat /var/log/daemon.log >> "$(hostname -s).txt"

#6.8
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command cat /var/log/cron.log" >> "$(hostname -s).txt"
cat /var/log/cron.log >> "$(hostname -s).txt"

#6.9
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command cat /var/log/boot.log" >> "$(hostname -s).txt"
cat /var/log/boot.log >> "$(hostname -s).txt"

#6.10
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command cat /var/log/boot.log.1" >> "$(hostname -s).txt"
cat /var/log/boot.log.1 >> "$(hostname -s).txt"

#6.11
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command cat /var/log/syslog" >> "$(hostname -s).txt"
cat /var/log/syslog >> "$(hostname -s).txt"

#6.12
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command cat /var/log/syslog.1" >> "$(hostname -s).txt"
cat /var/log/syslog.1 >> "$(hostname -s).txt"

#6.13
echo -e "\n\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$(hostname -s).txt"
echo -e "#command cat /var/log/user.log" >> "$(hostname -s).txt"
cat /var/log/user.log >> "$(hostname -s).txt"

#find /home/ -type f -size +1024k -exec ls -lh {} \;
#find / -mtime -2 -ls
#cat /proc/loadavg
#cat /proc/cmdline #kernel start parameters
#lsof -V #open files in system
#tcpdump