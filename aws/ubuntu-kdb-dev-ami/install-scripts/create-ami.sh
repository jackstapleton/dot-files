#!/bin/bash

echo "Running $0"

AMIDATE=$(echo $(date +%DD%T) | sed 's/\//./g' | sed 's/:/./g')
AZ=$(ec2metadata --availability-zone)
AMINAME=${AZ::-1}-dev-ec2.ami-$AMIDATE

INSTANCEID=$(ec2metadata --instance-id)
aws ec2 create-image --instance-id $INSTANCEID --name $AMINAME
