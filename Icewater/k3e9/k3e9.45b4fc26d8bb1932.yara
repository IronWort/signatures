import "hash"

rule k3e9_45b4fc26d8bb1932
{

   meta:
     copyright="Copyright (c) 2014-2017 Support Intelligence Inc, All Rights Reserved."
     engine="saphire/1.2.4 divinorum/0.992 icewater/0.4"
     viz_url="http://icewater.io/en/cluster/query?h64=k3e9.45b4fc26d8bb1932"
     cluster="k3e9.45b4fc26d8bb1932"
     cluster_size="57 samples"
     filetype = "pe"
     tlp = "amber"
     version = "icewater foxtail"
     author = "Rick Wesson (@wessorh) rick@support-intelligence.com"
     date = "20171031"
     license = "RIL v1.0 see https://raw.githubusercontent.com/SupportIntelligence/Icewater/master/LICENSE"
     family="virut virtob virux"
     md5_hashes="['b42cc901a252d728e157cb501c923eb0', 'b42cc901a252d728e157cb501c923eb0', 'c94ed973d574b525a88eef9431caf5b2']"


   condition:
      uint16(0) == 0x5A4D and 
      filesize > 16384 and filesize < 65536 and 
      hash.md5(20480,1280) == "3e6f4cfcf731d063cebc1073d9d20cf0"
}

