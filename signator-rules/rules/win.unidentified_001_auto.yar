rule win_unidentified_001_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.unidentified_001."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.unidentified_001"
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
        $sequence_0 = { 7c45 ff7510 ff15???????? 8bf0 85f6 }
            // n = 5, score = 100
            //   7c45                 | jl                  0x47
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   85f6                 | test                esi, esi

        $sequence_1 = { 8b75f8 59 85f6 0f841efdffff }
            // n = 4, score = 100
            //   8b75f8               | mov                 esi, dword ptr [ebp - 8]
            //   59                   | pop                 ecx
            //   85f6                 | test                esi, esi
            //   0f841efdffff         | je                  0xfffffd24

        $sequence_2 = { 8b06 8d4dfc 51 56 ff501c }
            // n = 5, score = 100
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   8d4dfc               | lea                 ecx, dword ptr [ebp - 4]
            //   51                   | push                ecx
            //   56                   | push                esi
            //   ff501c               | call                dword ptr [eax + 0x1c]

        $sequence_3 = { 7ca9 837dfc00 746a 6a01 57 ff15???????? }
            // n = 6, score = 100
            //   7ca9                 | jl                  0xffffffab
            //   837dfc00             | cmp                 dword ptr [ebp - 4], 0
            //   746a                 | je                  0x6c
            //   6a01                 | push                1
            //   57                   | push                edi
            //   ff15????????         |                     

        $sequence_4 = { 6a32 ffd6 6a02 6a10 e8???????? 59 59 }
            // n = 7, score = 100
            //   6a32                 | push                0x32
            //   ffd6                 | call                esi
            //   6a02                 | push                2
            //   6a10                 | push                0x10
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx

        $sequence_5 = { e8???????? ff30 8d4df0 e8???????? 8b45fc 85c0 7406 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   ff30                 | push                dword ptr [eax]
            //   8d4df0               | lea                 ecx, dword ptr [ebp - 0x10]
            //   e8????????           |                     
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   85c0                 | test                eax, eax
            //   7406                 | je                  8

        $sequence_6 = { e9???????? b955414500 3bc1 775d 7443 }
            // n = 5, score = 100
            //   e9????????           |                     
            //   b955414500           | mov                 ecx, 0x454155
            //   3bc1                 | cmp                 eax, ecx
            //   775d                 | ja                  0x5f
            //   7443                 | je                  0x45

        $sequence_7 = { e8???????? 59 59 6a32 ffd6 6a00 6a09 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   6a32                 | push                0x32
            //   ffd6                 | call                esi
            //   6a00                 | push                0
            //   6a09                 | push                9

        $sequence_8 = { 56 ff15???????? 8b4df8 85c9 0f84b8fdffff 8d45fc 50 }
            // n = 7, score = 100
            //   56                   | push                esi
            //   ff15????????         |                     
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   85c9                 | test                ecx, ecx
            //   0f84b8fdffff         | je                  0xfffffdbe
            //   8d45fc               | lea                 eax, dword ptr [ebp - 4]
            //   50                   | push                eax

        $sequence_9 = { 668b4702 03fe 6685c0 75f5 }
            // n = 4, score = 100
            //   668b4702             | mov                 ax, word ptr [edi + 2]
            //   03fe                 | add                 edi, esi
            //   6685c0               | test                ax, ax
            //   75f5                 | jne                 0xfffffff7

    condition:
        7 of them and filesize < 65536
}