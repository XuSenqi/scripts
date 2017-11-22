#!/bin/bash

#create a uuid
uuid=$(uuidgen)
echo $uuid

#switch to all upper case
uuid=${uuid^^}
echo $uuid

#switch to all lower case
uuid=${uuid,,}
echo $uuid
