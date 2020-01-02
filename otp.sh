#!/bin/bash
# in order this script to work oath-toolkit should be installed
# there's also an .otpkeys file, that should be created in homedir 

# create script file
#   touch /usr/local/bin/otp
#   chmod 751 /usr/local/bin/otp
#   chmod +x /usr/local/bin/otp  
#   echo 'export PATH="/usr/local/opt/curl/bin:/usr/local/sbin:$PATH"' > ~/.bash_profile

# create keys file
#   touch ~/.otpkeys
#   sudo chown root:wheel .otpkeys
# change permissions so only sudo user can see what's inside the file
#   sudo chmod 751 .otpkeys
#Fill with 'servicename=KEYCODE'

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

# After everything is done you can run sudo otp servicename to get your OTP keys
