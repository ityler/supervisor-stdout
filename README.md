# Supervisord::Stderr

A [Supervisord](https://supervisord.org/ "Supervisor: A Process Control System") event listener that sends process state changes to stderr.

Provides access to the PROCESS_STATE of supervisor managed daemons.

Useful for debugging supervisor event listeners or for producing output that can be collected by a third party logging framework.

Module is dependency free.

## Installation
---
To install this module type the following:
```
perl Makefile.PL
make
make test
make install
```

## Usage
---
One-liner approach to using the module within a supervisor configuration:
```
...
[eventlistener:mylistener]
command=perl -MSupervisord::Stderr -e 'Supervisord::Stderr::listener()'
events=PROCESS_STATE
...
```

Example output produced after a process named 'test_process' dies and restarts:

```
processname:test_process groupname:test_process from_state:STARTING pid:57632ver:3.0 server:supervisor serial:43 pool:mylistener poolserial:43 eventname:PROCESS_STATE_EXITED len:87

processname:test_process groupname:test_process from_state:RUNNING expected:1 pid:57632ver:3.0 server:supervisor serial:44 pool:mylistener poolserial:44 eventname:PROCESS_STATE_STARTING len:73

processname:test_process groupname:test_process from_state:EXITED tries:0ver:3.0 server:supervisor serial:45 pool:mylistener poolserial:45 eventname:PROCESS_STATE_RUNNING len:77
```
