import "hash"

rule k3e9_6b64d36b8b6b5912
{

   meta:
     copyright="Copyright (c) 2014-2017 Support Intelligence Inc, All Rights Reserved."
     engine="saphire/1.2.4 divinorum/0.992 icewater/0.4"
     viz_url="http://icewater.io/en/cluster/query?h64=k3e9.6b64d36b8b6b5912"
     cluster="k3e9.6b64d36b8b6b5912"
     cluster_size="49 samples"
     filetype = "pe"
     tlp = "amber"
     version = "icewater foxtail"
     author = "Rick Wesson (@wessorh) rick@support-intelligence.com"
     date = "20171031"
     license = "RIL v1.0 see https://raw.githubusercontent.com/SupportIntelligence/Icewater/master/LICENSE"
     family="virut virtob patched"
     md5_hashes="['d88965da0b12ded1d290c0866fffb1cb', 'ba658639fa08777f4cc0b62a0e629a73', 'c70699c96379b7388304fb4fe818535e']"


   condition:
      uint16(0) == 0x5A4D and 
      filesize > 16384 and filesize < 65536 and 
      hash.md5(5144,1036) == "bed4364ceb3d7a678c6b4e1366c04d45"
}

