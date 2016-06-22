# Paper_Plane
Paper Plane is a script to interact with telegram cli (https://github.com/vysheng/tg) written in LUA, the script is ment to be used on a Raspberry Pi with a Pi camera but can easly be reused as example on different machines/architectures , at the moment it support the following commands :

Help    : will send you the list of the commands. 

Ping    : Answer with Pong.

Photo   : Send you a picture taken from the webcam/camera

Reboot  : Reboot the machine in 5 seconds (in case you are running this as user and not root you have to change the
permission on the reboot command).

Vrec    : Start record a video.
Vstop   : Stop record a video.
Vsend   : Send the video(s) recorded,broken at the moment.
Vdel    : Delete all the videos saved.
Disk    : Give you the ammount of free space on the / partition.
Ip      : Send you the public IP of the network.
Update  : update from this repository, you will need to reboot after it.

