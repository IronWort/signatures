rule win_spyder_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.spyder."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.spyder"
        malpedia_rule_date = "20211007"
        malpedia_hash = "e5b790e0f888f252d49063a1251ca60ec2832535"
        malpedia_version = "20211008"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { 48895c2408 57 4883ec20 488bfa 488bd9 488d05b1840000 }
            // n = 6, score = 500
            //   48895c2408           | mov                 edx, dword ptr [esi + 0x38]
            //   57                   | dec                 eax
            //   4883ec20             | lea                 ecx, dword ptr [ebx + 4]
            //   488bfa               | dec                 esp
            //   488bd9               | lea                 eax, dword ptr [0x3dd8]
            //   488d05b1840000       | mov                 edx, 0x16

        $sequence_1 = { b9c1000000 ff15???????? 496374243c 4903f4 813e50450000 }
            // n = 5, score = 500
            //   b9c1000000           | sub                 esp, 0x20
            //   ff15????????         |                     
            //   496374243c           | dec                 eax
            //   4903f4               | mov                 edi, edx
            //   813e50450000         | dec                 eax

        $sequence_2 = { 488364243000 8364242800 41b803000000 488d0d84340000 4533c9 ba00000040 }
            // n = 6, score = 500
            //   488364243000         | mov                 edi, eax
            //   8364242800           | jne                 0xde
            //   41b803000000         | dec                 eax
            //   488d0d84340000       | lea                 ecx, dword ptr [0x5f93]
            //   4533c9               | dec                 eax
            //   ba00000040           | mov                 esi, eax

        $sequence_3 = { 755a 488d0d13330000 e8???????? 488d1da7a20000 488d3da8a20000 }
            // n = 5, score = 500
            //   755a                 | mov                 ebx, ecx
            //   488d0d13330000       | dec                 eax
            //   e8????????           |                     
            //   488d1da7a20000       | lea                 eax, dword ptr [0x84b1]
            //   488d3da8a20000       | dec                 eax

        $sequence_4 = { 488d4b04 4c8d05d83d0000 ba16000000 e8???????? 85c0 750c }
            // n = 6, score = 500
            //   488d4b04             | mov                 esi, 0
            //   4c8d05d83d0000       | add                 byte ptr [eax], al
            //   ba16000000           | test                eax, eax
            //   e8????????           |                     
            //   85c0                 | je                  0xc3
            //   750c                 | dec                 eax

        $sequence_5 = { 4c89742420 49be0000000000000080 8b450c 85c0 0f84bb000000 488b5638 }
            // n = 6, score = 500
            //   4c89742420           | dec                 eax
            //   49be0000000000000080     | lea    ecx, dword ptr [0xa175]
            //   8b450c               | nop                 
            //   85c0                 | dec                 esp
            //   0f84bb000000         | mov                 dword ptr [esp + 0x20], esi
            //   488b5638             | dec                 ecx

        $sequence_6 = { 488bf8 0f85d5000000 488d0d935f0000 ff15???????? 488bf0 4885c0 0f8493010000 }
            // n = 7, score = 500
            //   488bf8               | test                eax, eax
            //   0f85d5000000         | jne                 0x15
            //   488d0d935f0000       | dec                 eax
            //   ff15????????         |                     
            //   488bf0               | mov                 dword ptr [esp + 8], ebx
            //   4885c0               | push                edi
            //   0f8493010000         | dec                 eax

        $sequence_7 = { 488d0d68a10000 e8???????? 488d1584a10000 488d0d75a10000 e8???????? 90 }
            // n = 6, score = 500
            //   488d0d68a10000       | dec                 eax
            //   e8????????           |                     
            //   488d1584a10000       | lea                 ecx, dword ptr [0xa168]
            //   488d0d75a10000       | dec                 eax
            //   e8????????           |                     
            //   90                   | lea                 edx, dword ptr [0xa184]

        $sequence_8 = { 85c0 742a 53 e8???????? 8b03 }
            // n = 5, score = 100
            //   85c0                 | dec                 eax
            //   742a                 | lea                 edi, dword ptr [0xa2a8]
            //   53                   | dec                 eax
            //   e8????????           |                     
            //   8b03                 | and                 dword ptr [esp + 0x30], 0

        $sequence_9 = { a1???????? 83c41c 3bc3 740e 8d942488050000 }
            // n = 5, score = 100
            //   a1????????           |                     
            //   83c41c               | dec                 ecx
            //   3bc3                 | arpl                word ptr [esp + 0x3c], si
            //   740e                 | dec                 ecx
            //   8d942488050000       | add                 esi, esp

        $sequence_10 = { 59 8b0485204b0910 8d0cf6 8064880400 85ff 740c 57 }
            // n = 7, score = 100
            //   59                   | mov                 edx, 0x40000000
            //   8b0485204b0910       | push                edi
            //   8d0cf6               | dec                 eax
            //   8064880400           | sub                 esp, 0x20
            //   85ff                 | dec                 eax
            //   740c                 | lea                 ebx, dword ptr [0x9367]
            //   57                   | dec                 eax

        $sequence_11 = { 52 8d8424900d0000 57 50 56 895c2430 ff15???????? }
            // n = 7, score = 100
            //   52                   | dec                 eax
            //   8d8424900d0000       | mov                 esi, eax
            //   57                   | dec                 eax
            //   50                   | test                eax, eax
            //   56                   | je                  0x1a6
            //   895c2430             | mov                 ecx, 0xc1
            //   ff15????????         |                     

        $sequence_12 = { 8a448104 83e040 c3 8b542404 8b4c2408 }
            // n = 5, score = 100
            //   8a448104             | sub                 esp, 0x20
            //   83e040               | dec                 eax
            //   c3                   | mov                 edi, edx
            //   8b542404             | dec                 eax
            //   8b4c2408             | mov                 ebx, ecx

        $sequence_13 = { 8bc6 5e c9 c3 51 3d00100000 }
            // n = 6, score = 100
            //   8bc6                 | cmp                 dword ptr [esi], 0x4550
            //   5e                   | jne                 0x5c
            //   c9                   | dec                 eax
            //   c3                   | lea                 ecx, dword ptr [0x3313]
            //   51                   | dec                 eax
            //   3d00100000           | lea                 ebx, dword ptr [0xa2a7]

        $sequence_14 = { 66ab aa 8d842488050000 68ff070000 8d8c248c0d0000 50 51 }
            // n = 7, score = 100
            //   66ab                 | and                 dword ptr [esp + 0x28], 0
            //   aa                   | inc                 ecx
            //   8d842488050000       | mov                 eax, 3
            //   68ff070000           | dec                 eax
            //   8d8c248c0d0000       | lea                 ecx, dword ptr [0x3484]
            //   50                   | inc                 ebp
            //   51                   | xor                 ecx, ecx

        $sequence_15 = { 5b 81c47c150000 c3 5f 5e 33c0 5b }
            // n = 7, score = 100
            //   5b                   | dec                 eax
            //   81c47c150000         | lea                 eax, dword ptr [0x84b1]
            //   c3                   | dec                 eax
            //   5f                   | mov                 edi, eax
            //   5e                   | jne                 0xde
            //   33c0                 | dec                 eax
            //   5b                   | lea                 ecx, dword ptr [0x5f93]

    condition:
        7 of them and filesize < 1458176
}