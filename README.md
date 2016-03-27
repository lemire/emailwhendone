# emailwhendone
A script that sends an email and generally tries to notify you 
when a task has been completed.

## Requirement

- It is a bash script. 
- Assumes Linux or MacOS with a working ``mail`` command.

## Usage

Instead of typing

```bash
sort giganticfile
```

and forgetting about it...

Try

```bash
emailwhendone.sh myemail@something sort giganticfile
````

It will email myemail@something when the task terminates.

## Extra

In addition to email, the script will try to notify you using
``growl`` or ``notify-send`. On a Mac, you can install the legacy 
growl for free: https://bitbucket.org/pmetzger/growl/downloads
Make sure to install ``growlnotify`` from the extras. On a recent
Linux installation, notify-send should already be present.

## Troubles

Though most Linux and Mac computers come with a working ``mail``
command, it may not actually work because of anti-spam measures.

You should check whether email works with a command such as
this one :

```bash
echo "test"| mail -s "test" youremail
```

If this does not work, you need to seek help.


## Credit

Inspired by Emmanuel Bernard's script 
https://emmanuelbernard.com/blog/2015/03/26/being-notified-when-commands-end/
