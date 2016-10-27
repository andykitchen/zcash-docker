#!/bin/bash

exec docker run --name zcash -d \
	-v $HOME/.zcash:/home/user/.zcash \
	-v $HOME/.zcash-params:/home/user/.zcash-params \
	zcash zcashd -equihashsolver=tromp -genproclimit=-1
