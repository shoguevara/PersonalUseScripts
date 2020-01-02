#!/bin/bash
#in order this script to work oath-toolkit should be installed
scriptname=`basename $0`
if [ -z $1 ]
then
    echo "$scriptname: Service Name Req’d"
    echo ""
    echo "Usage:"
    echo "   otp google"
    echo ""
    echo "Configuration: $HOME/.otpkeys"
    echo "Format: name=key"
    exit
fi
otpkey=` grep $1 $HOME/.otpkeys | cut -d"=" -f 2 | sed "s/ //g" `
if [ -z $otpkey ]
then
    echo "$scriptname: Bad Service Name"
    exit
fi
/usr/local/bin/oathtool --totp -b $otpkey
