# emailwhendone
A script that sends an email when a task has been completed

## Requirement

- It is a bash script. 
-  Assumes Linux or MacOS with a working ``mail`` command.

## Usage

Instead of typing

```bash
sort giganticfile
```

and forgetting about it...

Try

```
emailwhendone.sh myemail@something sort giganticfile
````

It will email myemail@something when the task terminates.

## Credit

Inspired by Emmanuel Bernard's script 
https://emmanuelbernard.com/blog/2015/03/26/being-notified-when-commands-end/
