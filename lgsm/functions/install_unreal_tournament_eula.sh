#!/bin/bash
# LinuxGSM install_unreal_tournament_eula.sh function
# Author: Daniel Gibbs
# Website: https://gameservermanagers.com
# Description: Gets user to accept the EULA.

echo ""
echo "Accept ${gamename} EULA"
echo "================================="
sleep 1
echo "You are required to accept the EULA:"
echo "https://www.epicgames.com/unrealtournament/unreal-tournament-pre-alpha-test-development-build-eula/"

echo "eula=false" > "${filesdir}/eula.txt"

if [ -z "${autoinstall}" ]; then
echo "By continuing you are indicating your agreement to the EULA."
echo ""
	if ! fn_prompt_yn "Continue?" Y; then
		core_exit.sh
	fi
else
echo "By using auto-install you are indicating your agreement to the EULA."
echo ""
	sleep 5
fi

sed -i "s/eula=false/eula=true/g" "${filesdir}/eula.txt"
