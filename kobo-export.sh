#!/bin/sh
# Generate an export from KoBo and download it
# Requirements: curl (1), jq (1)

if [ -r ./kobo-api-config.sh ]; then
    . ./kobo-api-config.sh
fi

if [ "X$KOBO_DOMAIN" = "X" ]; then
   KOBO_DOMAIN="https://kobo.humanitarianresponse.info/"
fi

if [ "X$KOBO_ASSET_UID" = "X" ]; then
    echo "Must set the KOBO_ASSET_UID environment variable to your Kobo asset UID" 1>&2
    exit 2
fi

if [ "X$KOBO_API_TOKEN" = "X" ]; then
    echo "Must set the KOBO_API_TOKEN environment variable to your private Kobo API token (see https://kobo.humanitarianresponse.info/#/account-settings)" 1>&2
    exit 2
fi

# The authentication header to send
auth_header="Authorization: Token ${KOBO_API_TOKEN}"

# Create an export
params="source=${KOBO_DOMAIN}assets/${KOBO_ASSET_UID}/&type=csv&lang=en&fields_from_all_versions=0&hierarchy_in_labels=0&group_sep=,"
export_info=$(curl -s -X POST "${KOBO_DOMAIN}exports/" -d "$params" -H "$auth_header" | jq -r '.url')

# Get the the export download link
url=$(curl -s -X GET "$export_info" -H "$auth_header" | jq -r '.result')

# Download the export and dump it to stdout
curl -s -X GET "$url" -H "$auth_header"


