# Ubuntu-Commands
Useful Commands for ubuntu

Check which process uses a specific port no.
-------------------------------------------------
lsof -i :{PORTNO}

Ex: lsof -i :5555
Result: 
COMMAND  PID        USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
java    8461 enlightened   11u  IPv6 138527      0t0  UDP *:8888

-In the above example it is seen that port 8888 is being held in use by the command java with pid 8461.
Now kill the process by doing any of the following

Kill a process by process id or command
-------------------------------------------------
kill {PID}
killall -9 {PID/COMMAND}

Ex: kill 8461
    killall -9 8461
    killall -9 java

Check tcp port details
-------------------------------------------------

netstat -t -ap

Check udp port details
-------------------------------------------------

netstat -u -ap

How to check the background process in Linux?
-------------------------------------------------

ps -l (list all process)
ps -ef (all full details of process)