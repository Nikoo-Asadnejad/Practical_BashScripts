#!/bin/bash
# check_ssl_expiry.sh
#
# Description:
#   Checks the expiration date of an SSL certificate for a domain.
#
# Usage:
#   ./check_ssl_expiry.sh example.com
#
# Output:
#   Shows the certificate's "notBefore" and "notAfter" dates.

DOMAIN=$1
echo | openssl s_client -servername "$DOMAIN" -connect "$DOMAIN:443" 2>/dev/null | openssl x509 -noout -dates
