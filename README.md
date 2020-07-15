kobo-export
===========

Simple shell script for exporting private datasets from https://kobo.humanitarianresponse.info , a survey tool that is available free for use by the humanitarian-aid community.

# Setup

You will need to set two environment variables to use this script:

* KOBO_ASSET_UID - the asset id for the Kobo project that you want to export from (you must have permission to access the project). You can extract this from the Kobo project URL, e.g. for https://kobo.humanitarianresponse.info/#/forms/abCDefGH1234/summary the asset id would be "/abCDefGH1234"

* KOBO_API_TOKEN - your personal token for the Kobo API, which is available from https://kobo.humanitarianresponse.info/#/account-settings
  
You may also set the environment variable KOBO_DOMAIN to use a different implementation of Kobo (it defaults to "https://kobo.humanitarianresponse.info/"

Alternatively, you can copy the file kobo-api-config.sh.TEMPLATE to kobo-api-config.sh and set the values there. The script will read that file if it exists in the current directory.

# Usage

Once the environment variables are set up, simple invoke

    $ sh kobo-export.sh

to download the latest data from your Kobo project and dump it to standard output.

# License

This code is released into the Public Domain
