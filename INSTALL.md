##  Installing SETL4

Install SETL4 by visiting http://github.com/setl4/setl4 and cloning the repository
or downloading the zip file.

Set the environment variable SETL4PATH to reference the directory containing the
SETL4 files.

Once you have installed the files in the directory, copy the file `bin/setl4`
to a directory on your PATH, usually `$HOME/bin`. You can then use the command
```
$ setl4 prog.stl
```
to translate and execute the program _prog.stl_. 

## Installing and running SETL4 on a Chromebook

Here are the instructions on how to install Linux on a Chromebook, tested on the

Chromebook I use:   ACER Chromebook 14  CB3-431.

Use Google to search for 'crouton' and go there. This is the 'crouton' program for
installing Linux alongside the standard Chrome OS. This requires installng the
crouton extension, downloading the crouton program, and then installing your
desired Linux variant.

I use lxde, as disk space on Chromebook is limited, and lxde has small footprint.

```
 sudo sh ~/Downloads/crouton -t xiwi,lxde

```

This will run for a while and them seem to stop. However, if you look
closely, you will find that Crouton is waiting for you to enter a username.
(This is not immediately obvious, as the question is displayed in dark
colors against an even darker background.)

You should install the the following useful programs:

- meld, a visual file comparator
- okular, a reader for PDF files. SETL4 documention is in directory `./docs`.``
- git - to clone the SETL4 system from github.

Going forwrd, access Linux as follows:

From Chrome OS, type 
```
       ctrl-alt-t
```
to open shell

Type
```
   sudo startlxde
```
to start lxde

You can now switch between lxde and Chrome OS using
```
   ctrl-alt-tab-back
```
or
```
   ctrl-alt-tab-forward
```

where 'back' is the back arrown key, the second from left on top row, and
'forward' is the forward rrow key, the third from left on the top row.

Good luck. Away you go ...

