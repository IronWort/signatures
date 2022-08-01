import "pe"

rule apt_win_flipflop_ldr : APT29
{
    meta:
        author = "threatintel@volexity.com"
        date = "2021-05-25"
        description = "A loader for the CobaltStrike malware family, which ultimately takes the first and second bytes of an embedded file, and flips them prior to executing the resulting payload."
        hash = "ee42ddacbd202008bcc1312e548e1d9ac670dd3d86c999606a3a01d464a2a330" 
        license = "See license at https://github.com/volexity/threat-intel/blob/main/LICENSE.txt"

    strings:
        $s1 = "irnjadle"
        $s2 = "BADCFEHGJILKNMPORQTSVUXWZY"
        $s3 = "iMrcsofo taBesC yrtpgoarhpciP orived r1v0."

    condition:
        all of ($s*)
}

rule trojan_win_cobaltstrike : Commodity
{
    meta:
        author = "threatintel@volexity.com"
        date = "2021-05-25"
        description = "The CobaltStrike malware family."
        hash = "b041efb8ba2a88a3d172f480efa098d72eef13e42af6aa5fb838e6ccab500a7c"
        license = "See license at https://github.com/volexity/threat-intel/blob/main/LICENSE.txt"

    strings:
        $s1 = "%s (admin)" fullword
        $s2 = {48 54 54 50 2F 31 2E 31 20 32 30 30 20 4F 4B 0D 0A 43 6F 6E 74 65 6E 74 2D 54 79 70 65 3A 20 61 70 70 6C 69 63 61 74 69 6F 6E 2F 6F 63 74 65 74 2D 73 74 72 65 61 6D 0D 0A 43 6F 6E 74 65 6E 74 2D 4C 65 6E 67 74 68 3A 20 25 64 0D 0A 0D 0A 00}
        $s3 = "%02d/%02d/%02d %02d:%02d:%02d" fullword
        $s4 = "%s as %s\\%s: %d" fullword
        $s5 = "%s&%s=%s" fullword
        $s6 = "rijndael" fullword
        $s7 = "(null)"

    condition:
        all of them
}

rule apt_win_freshfire : APT29
{
    meta:
        author = "threatintel@volexity.com"
        date = "2021-05-27"
        description = "The FRESHFIRE malware family. The malware acts as a downloader, pulling down an encrypted snippet of code from a remote source, executing it, and deleting it from the remote server."
        hash = "ad67aaa50fd60d02f1378b4155f69cffa9591eaeb80523489a2355512cc30e8c"
        license = "See license at https://github.com/volexity/threat-intel/blob/main/LICENSE.txt"

    strings:
        $uniq1 = "UlswcXJJWhtHIHrVqWJJ"
        $uniq2 = "gyibvmt\x00"

        $path1 = "root/time/%d/%s.json"
        $path2 = "C:\\dell.sdr"
        $path3 = "root/data/%d/%s.json" 

    condition:
        (
            pe.number_of_exports == 1 and
            pe.exports("WaitPrompt")
        ) or
        any of ($uniq*) or
        2 of ($path*)
}