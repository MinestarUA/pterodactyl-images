#!/bin/bash

# Change directory to the container's working directory, or exit if it doesn't exist.
cd /home/container || exit 1

CODE_COLOR_BANNER='\033[1;35m'
CODE_COLOR_INFO='\033[0;34m'
CODE_COLOR_RESET='\033[0m'

BANNER="${CODE_COLOR_BANNER}┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃                                                                     ┃
┃    d888888P                                       oo                ┃
┃       88                                                            ┃
┃       88    .d8888b. 88d8b.d8b. dP    dP 88d888b. dP 88d888b.       ┃
┃       88    88ooood8 88'\`88'\`88 88    88 88'  \`88 88 88'  \`88       ┃
┃       88    88.  ... 88  88  88 88.  .88 88       88 88    88       ┃
┃       dP    \`88888P' dP  dP  dP \`88888P' dP       dP dP    dP       ┃
┃                                                                     ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${CODE_COLOR_RESET}"

echo -e "
${BANNER}
${CODE_COLOR_INFO}"

# Print the Java version for debugging purposes.
java -version

# Print the maintainer information.
echo -e "
Maintained and adapted by Minestar (https://minestar.com.ua) for Pterodactyl."

# Replace variables in the startup command.
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')

# Print the modified startup command.
echo -e "
STARTUP /home/container: ${MODIFIED_STARTUP}
"

# Run the startup command.
eval ${MODIFIED_STARTUP}
