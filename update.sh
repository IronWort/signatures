#!/bin/bash

REPOS=(
"https://github.com/CyberDefenses/CDI_yara"
"https://github.com/citizenlab/malware-signatures"
"https://github.com/f0wl/yara_rules"
"https://github.com/fboldewin/YARA-rules"
"https://github.com/godaddy/yara-rules"
"https://github.com/InQuest/yara-rules"
"https://github.com/mikesxrs/Open-Source-YARA-rules"
"https://github.com/prolsen/yara-rules"
"https://github.com/reversinglabs/reversinglabs-yara-rules"
"https://github.com/Yara-Rules/rules"
"https://github.com/kevthehermit/YaraRules"
"https://github.com/malpedia/signator-rules"
"https://github.com/prolsen/yara-rules"
"https://github.com/volexity/threat-intel"
"https://github.com/telekom-security/malware_analysis"
"https://github.com/Xumeiquer/yara-forensics"
"https://github.com/advanced-threat-research/Yara-Rules"
"https://github.com/Hestat/lw-yara"
"https://github.com/jeFF0Falltrades/YARA-Signatures"
"https://github.com/SupportIntelligence/Icewater"
"https://github.com/fboldewin/YARA-rules"
"https://github.com/tenable/yara-rules"
"https://github.com/fr0gger/Yara-Unprotect"
"https://github.com/JPCERTCC/jpcert-yara"
"https://github.com/thewhiteninja/yarasploit"
)

#for REPO in ${REPOS[@]}; 
#do
#	git submodule add $REPO;
#done
git submodule update --recursive --remote