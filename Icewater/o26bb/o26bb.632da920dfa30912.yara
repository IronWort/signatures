
rule o26bb_632da920dfa30912
{

   meta:
     copyright="Copyright (c) 2014-2018 Support Intelligence Inc, All Rights Reserved."
     engine="saphire/1.3.8 divinorum/0.9992 icewater/0.4"
     viz_url="http://icewater.io/en/cluster/query?h64=o26bb.632da920dfa30912"
     cluster="o26bb.632da920dfa30912"
     cluster_size="90"
     filetype = ""
     tlp = "amber"
     version = "icewater snowflake"
     author = "Rick Wesson (@wessorh) rick@support-intelligence.com"
     date = "20180909"
     license = "RIL-1.0 [Rick's Internet License]"
     family="bundler malicious adload"
     md5_hashes="['cd471eb0fab7d31622574bc57234f785c6428c79','98970699e2784b8b5c6632aae2377231cf057f62','bf5e137cdcff6dbb1edc061b1fd8b287fd76efa8']"
     cluster_members="http://icewater.io/en/cluster/detail?h64=o26bb.632da920dfa30912"

   strings:
      $hex_string = { c78dbbd9026f670bc88b5dac034dd881c38a4c2a8d03f98bcac1c70ef7d103fe23ce8bc723c20bc88bc6034dec33c703d9c1cb0c03df33c3054239faff0345d0 }

   condition:
      
      filesize > 1048576 and filesize < 4194304
      and $hex_string
}
