
rule k2318_27324d4adbeb0b12
{

   meta:
     copyright="Copyright (c) 2014-2018 Support Intelligence Inc, All Rights Reserved."
     engine="saphire/1.3.8 divinorum/0.9992 icewater/0.4"
     viz_url="http://icewater.io/en/cluster/query?h64=k2318.27324d4adbeb0b12"
     cluster="k2318.27324d4adbeb0b12"
     cluster_size="24"
     filetype = ""
     tlp = "amber"
     version = "icewater snowflake"
     author = "Rick Wesson (@wessorh) rick@support-intelligence.com"
     date = "20180910"
     license = "RIL-1.0 [Rick's Internet License]"
     family="iframe html redir"
     md5_hashes="['9b06d15da5d1cf3fdb75fe9352a1ef0fb61cc578','8c428f3518fa5a669722c5fa2fe85b8beabe1ac9','9bd71d463669643f9ee049cd14723733f3f4ad39']"
     cluster_members="http://icewater.io/en/cluster/detail?h64=k2318.27324d4adbeb0b12"

   strings:
      $hex_string = { 697a653d223122207374796c653d2277696474683a2031303025223e3c6f7074696f6e2076616c75653d22222053454c45435445443ec2fbe1e5f0e8f2e53c2f }

   condition:
      
      filesize > 16384 and filesize < 65536
      and $hex_string
}
