
---------------------------------------------------------------------------
SlavePc 1.01, Last updated at 19 Dec 94
Copyright 1994, C.K. Hung, Hong Kong, All rights reserved
Written by C.K.Hung based on an idea of Jeff
http://campoinfo.com/ckhung    email: hungchongki@gmail.com
---------------------------------------------------------------------------


Introduction:
=============


This is a DOS batch program which is able to remote "SlavePC" from other pc in LAN.

This program consists of several batch files, you must place them in a
directory and add this path to DOS search path, and you also have to set
a environment variable before using this program, type as following:

   Set SlavePath=[YourPath]

Now, you can setup a PC as the "SlavePC", type the command

   Slave.Bat [SlaveName]

Then, you can remote this PC from other PC in LAN using one of the following:

 (1) Order [SlaveName] [DosCommand]   => Send order to a slave
 (2) Hi    [SlaveName] [Dos Command]  => Send order to a slave
 (3) Run   [DosCommand]               => Send order to any slave
 (4) View  [SlaveName] [DosCommand]   => Send order & View output
 (5) List                             => List slaves
 (6) Release [Slave Name]|[ALL]       => Release slave

Please note that you can have many SlavePC and control them as the same time,
But because of the capability of batch command, then command you pass to
SlavePC must be able to return to DOS after execution, otherwise, SlavePc
will waiting for a keystroke.


Examples   (Suppose files are stored under S:\Slave)
========

1. Set environment variable     "Set SlavePath=s:\slave"
2. Register a Slave name CK     "slave ck"
3. Order CK to run DIR          "order ck dir c:\windows"
4. Order CK to run DIR          "hi ck dir c:\windows"
5. Order and view result        "view ck dir c:\windows"
6. Order anyone to run chkdsk   "run chkdsk"
7. List the registered slaves   "list"
8. Release ck                   "release ck"
9. Release all slaves           "release all"


Notes
=====
This program is freeware, enjoy it!


---------------------------------------------------------------------------
SlavePc 1.01, Last updated at 19 Dec 94
Copyright 1994, C.K. Hung, Hong Kong, All rights reserved
Written by C.K.Hung based on an idea of Jeff
http://campoinfo.com/ckhung    email: hungchongki@gmail.com
---------------------------------------------------------------------------
