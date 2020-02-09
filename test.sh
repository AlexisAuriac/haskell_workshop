#!/bin/bash

if [[ $# -eq 0 ]]; then
	stack test
elif [[ $# -eq 1 ]]; then
	stack test --test-arguments="-m $1"
else
	stack test --test-arguments="-m $1.$2"
fi
