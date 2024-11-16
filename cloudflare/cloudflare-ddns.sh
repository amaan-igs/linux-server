#!/bin/bash

##############  CLOUDFLARE CREDENTIALS  ##############
auth_email="a**********@gmail.com"
auth_method="global"
auth_key="6***************************a0"
zone_identifier="f****************************5f"

#############  DNS RECORD CONFIGURATION  #############
record_name="jenkins.inotech-pk.com"
ttl=3600
proxy="false"

###############  SCRIPT CONFIGURATION  ###############
log_header_name="DDNS Updater_v4"

#############  WEBHOOKS CONFIGURATION  ###############
sitename=""
slackchannel=""
slackuri=""
discorduri=""

################################################
## Fetch the IPv4 Address
################################################
ip=$(curl -s https://ipv4.icanhazip.com)

# Check if the IP is valid (basic check for format)
if [[ ! "$ip" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    logger -s "$log_header_name: Failed to retrieve a valid IPv4 address."
    exit 1
fi

################################################
## Check and set the proper auth header
################################################
if [[ "${auth_method}" == "global" ]]; then
    auth_header="X-Auth-Key:"
else
    auth_header="Authorization: Bearer"
fi

################################################
## Seek for the A record
################################################
logger "$log_header_name: Check Initiated"
record=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/$zone_identifier/dns_records?type=A&name=$record_name" \
    -H "X-Auth-Email: $auth_email" \
    -H "$auth_header $auth_key" \
    -H "Content-Type: application/json")

################################################
## Check if the domain has an A record
################################################
if [[ $record == *"\"count\":0"* ]]; then
    logger -s "$log_header_name: Record does not exist, perhaps create one first? (${ip} for ${record_name})"
    exit 1
fi

################################################
## Get existing IP
################################################
old_ip=$(echo "$record" | sed -E 's/.*"content":"([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+)".*/\1/')

# Compare if they're the same
if [[ $ip == $old_ip ]]; then
    logger "$log_header_name: IP ($ip) for ${record_name} has not changed."
    exit 0
fi

################################################
## Set the record identifier from result
################################################
record_identifier=$(echo "$record" | sed -E 's/.*"id":"([A-Za-z0-9_]+)".*/\1/')

################################################
## Change the IP at Cloudflare using the API
################################################
update=$(curl -s -X PATCH "https://api.cloudflare.com/client/v4/zones/$zone_identifier/dns_records/$record_identifier" \
    -H "X-Auth-Email: $auth_email" \
    -H "$auth_header $auth_key" \
    -H "Content-Type: application/json" \
    --data "{\"content\":\"$ip\",\"ttl\":$ttl,\"proxied\":$proxy}")

################################################
## Report the status
################################################
case "$update" in
*"\"success\":false"*)
    echo -e "$log_header_name: $ip $record_name DDNS failed for $record_identifier ($ip). DUMPING RESULTS:\n$update" | logger -s
    if [[ $slackuri != "" ]]; then
        curl -L -X POST $slackuri \
            --data-raw "{
                \"channel\": \"$slackchannel\",
                \"text\": \"$sitename DDNS Update Failed: $record_name: $record_identifier ($ip).\"
            }"
    fi
    if [[ $discorduri != "" ]]; then
        curl -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST \
            --data-raw "{
                \"content\": \"$sitename DDNS Update Failed: $record_name: $record_identifier ($ip).\"
            }" $discorduri
    fi
    exit 1
    ;;
*)
    logger "$log_header_name: $ip $record_name DDNS updated."
    if [[ $slackuri != "" ]]; then
        curl -L -X POST $slackuri \
            --data-raw "{
                \"channel\": \"$slackchannel\",
                \"text\": \"$sitename Updated: $record_name's new IPv4 Address is $ip\"
            }"
    fi
    if [[ $discorduri != "" ]]; then
        curl -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST \
            --data-raw "{
                \"content\": \"$sitename Updated: $record_name's new IPv4 Address is $ip\"
            }" $discorduri
    fi
    exit 0
    ;;
esac