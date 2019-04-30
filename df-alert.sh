#!/bin/bash

# Alert user if storage disk size exceeds 60%
mapfile X <<< "$(df -h /dev/sda1)"
read -ra X <<< "${X[1]}"
if [ "${X[4]%\%}" -gt 60 ]; then
	cat <<-EOF

		        Alert!!!

		        Storage usage is over ${X[4]} percent.
		        Please remove unecessary junk from the operating system.

		        Suggestion: sudo apt autoremove

	EOF
fi
