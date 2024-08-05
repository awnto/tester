#!/bin/bash
echo $@
mkdir -p pid
echo $$
echo $$ > pid/$1
exec ${@:2}
