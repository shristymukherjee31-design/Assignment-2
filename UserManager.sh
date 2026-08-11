#!/bin/bash

case $1 in

addTeam)
   groupadd $2
;;

addUser)
    useradd -m -g $3 $2
    mkdir /home/$2/team
    mkdir /home/$2/ninja
    chown -R $2:$3 /home/$2
    chmod 751 /home/$2
    chmod 770 /home/$2/team
    chmod 770 /home/$2/ninja
;;

changeShell)
        usermod -s $3 $2
;;

changePasswd)
        passwd $2
;;

delUser)
        userdel $2
;;

delTeam)
        groupdel $2
;;

ls)
        if [ "$2" = "User" ]
        then
              cat /etc/passwd
        else
            cat /etc/group
        fi
;;
esac
