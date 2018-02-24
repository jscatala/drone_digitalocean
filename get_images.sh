#!/bin/bash

token=$(grep do_token terraform.tfvars | cut -d\" -f2)

curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $token" "https://api.digitalocean.com/v2/images?private=true" | jq .

