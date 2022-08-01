rule RANSOM_Babuk_Packed_Feb2021 {

    meta:
        description = "Rule to detect Babuk Locker packed"
        author = "McAfee ATR"
        date = "2021-02-19"
        hash = "48e0f7d87fe74a2b61c74f0d32e6a8a5"
        rule_version = "v1"
        malware_family = "Ransom:Win/Babuk"
        malware_type = "Ransom"
        mitre_attack = "T1027.005, T1027, T1083, T1082, T1059, T1129"

    strings:

        // First stage
        $first_stage1 = { 81 ec 30 04 00 00 68 6c 49 43 00 ff 15 74 20 43 00 a3 60 4e f8 02 b8 db d9 2b 00 ba c5 62 8e 76 b9 35 11 5f 39 eb 09 8d a4 24 00 00 00 00 8b ff 89 14 24 89 4c 24 04 81 04 24 25 10 a3 3b 81 04 24 cf e0 fb 07 81 04 24 35 26 9f 42 81 04 24 65 2b 39 06 81 04 24 3c 37 33 5b 81 44 24 04 48 4f c2 5d 83 e8 01 c7 05 54 4e f8 02 00 00 00 00 75 bf 8b 0d 54 aa 43 00 53 8b 1d 58 20 43 00 55 8b 2d 60 20 43 00 56 81 c1 01 24 0a 00 57 8b 3d 50 20 43 00 89 0d 64 4e f8 02 33 f6 eb 03 8d 49 00 81 f9 fc 00 00 00 75 08 6a 00 ff 15 40 20 43 00 6a 00 ff d7 8b 0d 64 4e f8 02 81 f9 7c 0e 00 00 75 19 6a 00 ff d3 6a 00 6a 00 8d 44 24 48 50 6a 00 6a 00 ff d5 8b 0d 64 4e f8 02 81 fe e5 84 c1 09 7e 0a 81 7c 24 2c 0f 11 00 00 75 12 46 8b c6 99 83 fa 14 7c aa 7f 07 3d 30 c1 cf c7 72 a1 51 6a 00 ff 15 2c 20 43 00 8b 0d 08 a4 43 00 33 f6 a3 f4 31 f8 02 89 0d f4 07 fb 02 39 35 64 4e f8 02 76 10 8b c6 e8 56 e4 ff ff 46 3b 35 64 4e f8 02 72 f0 8b 35 80 20 43 00 bf f0 72 e9 00 8b ff 81 3d 64 4e f8 02 4d 09 00 00 75 04 6a 00 ff d6 83 ef 01 75 eb e8 d6 e3 ff ff e8 11 fe ff ff e8 0c e4 ff ff 5f 5e 5d 33 c0 5b 81 c4 30 04 00 00 c3 }
        $first_stage2 = {81ec3??4????68????????ff??????????a3????????b8????????ba????????b9????????eb??891424894c240481????????????81????????????81????????????81????????????81????????????81??????????????83e801c7??????????????????75??8b??????????538b??????????558b??????????5681??????????578b??????????89??????????33f6eb??81??????????75??6a??ff??????????6a??ffd78b??????????81??????????75??6a??ffd36a??6a??8d442448506a??6a??ffd58b??????????81??????????7e??817c242c0f11????75??468bc69983????7c??7f??3d????????72??516a??ff??????????8b??????????33f6a3????????89??????????39??????????76??8bc6e8????????463b??????????72??8b??????????bf????????8bff81??????????????????75??6a??ffd683ef0175??e8????????e8????????e8????????5f5e5d33c05b81c43??4????c3}
        $first_stage3 = {81ec3??4????68????????ff??????????a3????????b8????????ba????????b9????????[2-6]891424894c240481????????????81????????????81????????????81????????????81????????????81??????????????83e801c7??????????????????[2-6]8b??????????538b??????????558b??????????5681??????????578b??????????89??????????33f6[2-6]81??????????[2-6]6a??ff??????????6a??ffd78b??????????81??????????[2-6]6a??ffd36a??6a??8d442448506a??6a??ffd58b??????????81??????????[2-6]817c242c0f11????[2-6]468bc69983????[2-6][2-6]3d????????[2-6]516a??ff??????????8b??????????33f6a3????????89??????????39??????????[2-6]8bc6e8????????463b??????????[2-6]8b??????????bf????????8bff81??????????????????[2-6]6a??ffd683ef01[2-6]e8????????e8????????e8????????5f5e5d33c05b81c43??4????c3}
        $first_stage4 = { 81 EC 30 04 00 00 68 6C 49 43 00 FF 15 ?? ?? ?? ?? A3 ?? ?? ?? ?? B8 DB D9 2B 00 BA C5 62 8E 76 B9 35 11 5F 39 EB ?? 8D A4 24 ?? ?? ?? ?? 8B FF 89 14 24 89 4C 24 ?? 81 04 24 25 10 A3 3B 81 04 24 CF E0 FB 07 81 04 24 35 26 9F 42 81 04 24 65 2B 39 06 81 04 24 3C 37 33 5B 81 44 24 ?? 48 4F C2 5D 83 E8 01 C7 05 ?? ?? ?? ?? 00 00 00 00 75 ?? 8B 0D ?? ?? ?? ?? 53 8B 1D ?? ?? ?? ?? 55 8B 2D ?? ?? ?? ?? 56 81 C1 01 24 0A 00 57 8B 3D ?? ?? ?? ?? 89 0D ?? ?? ?? ?? 33 F6 EB ?? 8D 49 ?? 81 F9 FC 00 00 00 75 ?? 6A 00 FF 15 ?? ?? ?? ?? 6A 00 FF D7 8B 0D ?? ?? ?? ?? 81 F9 7C 0E 00 00 75 ?? 6A 00 FF D3 6A 00 6A 00 8D 44 24 ?? 50 6A 00 6A 00 FF D5 8B 0D ?? ?? ?? ?? 81 FE E5 84 C1 09 7E ?? 81 7C 24 ?? 0F 11 00 00 75 ?? 46 8B C6 99 83 FA 14 7C ?? 7F ?? 3D 30 C1 CF C7 72 ?? 51 6A 00 FF 15 ?? ?? ?? ?? 8B 0D ?? ?? ?? ?? 33 F6 A3 ?? ?? ?? ?? 89 0D ?? ?? ?? ?? 39 35 ?? ?? ?? ?? 76 ?? 8B C6 E8 ?? ?? ?? ?? 46 3B 35 ?? ?? ?? ?? 72 ?? 8B 35 ?? ?? ?? ?? BF F0 72 E9 00 8B FF 81 3D ?? ?? ?? ?? 4D 09 00 00 75 ?? 6A 00 FF D6 83 EF 01 75 ?? E8 ?? ?? ?? ?? E8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 5F 5E 5D 33 C0 5B 81 C4 30 04 00 00 C3}
    
        // Files encryption function 
        $files_encryption1 = { 8a 46 02 c1 e9 02 88 47 02 83 ee 02 83 ef 02 83 f9 08 72 88 fd f3 a5 fc ff 24 95 20 81 40 00 }
        $files_encryption2 = {8a4602c1e90288470283ee0283ef0283????72??fdf3a5fcff????????????}
        $files_encryption3 = { 8A 46 ?? C1 E9 02 88 47 ?? 83 EE 02 83 EF 02 83 F9 08 72 ?? FD F3 A5 FC FF 24 95 ?? ?? ?? ??}

    condition:
        filesize <= 300KB and 
        any of ($first_stage*) and
        any of ($files_encryption*)
}
