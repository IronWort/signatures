rule win_httpbrowser_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.httpbrowser."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.httpbrowser"
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
        $sequence_0 = { 8945fc 57 8d8558fdffff 50 6802020000 ff15???????? 85c0 }
            // n = 7, score = 200
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   57                   | push                edi
            //   8d8558fdffff         | lea                 eax, dword ptr [ebp - 0x2a8]
            //   50                   | push                eax
            //   6802020000           | push                0x202
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_1 = { 895df0 3bf3 7411 68???????? }
            // n = 4, score = 200
            //   895df0               | mov                 dword ptr [ebp - 0x10], ebx
            //   3bf3                 | cmp                 esi, ebx
            //   7411                 | je                  0x13
            //   68????????           |                     

        $sequence_2 = { 8d9dd8f7ffff e8???????? 8bc3 50 }
            // n = 4, score = 200
            //   8d9dd8f7ffff         | lea                 ebx, dword ptr [ebp - 0x828]
            //   e8????????           |                     
            //   8bc3                 | mov                 eax, ebx
            //   50                   | push                eax

        $sequence_3 = { 833800 7444 8b00 8b08 33c0 8dbdeafeffff }
            // n = 6, score = 200
            //   833800               | cmp                 dword ptr [eax], 0
            //   7444                 | je                  0x46
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   33c0                 | xor                 eax, eax
            //   8dbdeafeffff         | lea                 edi, dword ptr [ebp - 0x116]

        $sequence_4 = { 56 53 56 56 ffb5bcfbffff }
            // n = 5, score = 200
            //   56                   | push                esi
            //   53                   | push                ebx
            //   56                   | push                esi
            //   56                   | push                esi
            //   ffb5bcfbffff         | push                dword ptr [ebp - 0x444]

        $sequence_5 = { 50 ffd7 e8???????? 85c0 0f84e4000000 e8???????? }
            // n = 6, score = 200
            //   50                   | push                eax
            //   ffd7                 | call                edi
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   0f84e4000000         | je                  0xea
            //   e8????????           |                     

        $sequence_6 = { ff55f4 85c0 754d 395df8 7448 8d45fc 50 }
            // n = 7, score = 200
            //   ff55f4               | call                dword ptr [ebp - 0xc]
            //   85c0                 | test                eax, eax
            //   754d                 | jne                 0x4f
            //   395df8               | cmp                 dword ptr [ebp - 8], ebx
            //   7448                 | je                  0x4a
            //   8d45fc               | lea                 eax, dword ptr [ebp - 4]
            //   50                   | push                eax

        $sequence_7 = { 8985b8fcffff 8b450c 83c420 48 48 0f841e030000 }
            // n = 6, score = 200
            //   8985b8fcffff         | mov                 dword ptr [ebp - 0x348], eax
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   83c420               | add                 esp, 0x20
            //   48                   | dec                 eax
            //   48                   | dec                 eax
            //   0f841e030000         | je                  0x324

        $sequence_8 = { 56 b8???????? 7415 8d3449 8d34b5f8254100 83c00c 3bc6 }
            // n = 7, score = 100
            //   56                   | push                esi
            //   b8????????           |                     
            //   7415                 | je                  0x17
            //   8d3449               | lea                 esi, dword ptr [ecx + ecx*2]
            //   8d34b5f8254100       | lea                 esi, dword ptr [esi*4 + 0x4125f8]
            //   83c00c               | add                 eax, 0xc
            //   3bc6                 | cmp                 eax, esi

        $sequence_9 = { 897508 ff15???????? 85c0 7464 68???????? 50 }
            // n = 6, score = 100
            //   897508               | mov                 dword ptr [ebp + 8], esi
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7464                 | je                  0x66
            //   68????????           |                     
            //   50                   | push                eax

        $sequence_10 = { 5d 58 ff15???????? 8b55f8 6a00 }
            // n = 5, score = 100
            //   5d                   | pop                 ebp
            //   58                   | pop                 eax
            //   ff15????????         |                     
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]
            //   6a00                 | push                0

        $sequence_11 = { c745cc2c010000 66ab 50 55 8bec 9c 6841061504 }
            // n = 7, score = 100
            //   c745cc2c010000       | mov                 dword ptr [ebp - 0x34], 0x12c
            //   66ab                 | stosw               word ptr es:[edi], ax
            //   50                   | push                eax
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   9c                   | pushfd              
            //   6841061504           | push                0x4150641

        $sequence_12 = { 68000000a0 8d9514f5ffff 50 52 56 ff15???????? }
            // n = 6, score = 100
            //   68000000a0           | push                0xa0000000
            //   8d9514f5ffff         | lea                 edx, dword ptr [ebp - 0xaec]
            //   50                   | push                eax
            //   52                   | push                edx
            //   56                   | push                esi
            //   ff15????????         |                     

        $sequence_13 = { 0f84d2030000 50 50 9c b80a000000 }
            // n = 5, score = 100
            //   0f84d2030000         | je                  0x3d8
            //   50                   | push                eax
            //   50                   | push                eax
            //   9c                   | pushfd              
            //   b80a000000           | mov                 eax, 0xa

        $sequence_14 = { 3d00280000 7303 8945f0 8b4d0c 8b55f0 51 }
            // n = 6, score = 100
            //   3d00280000           | cmp                 eax, 0x2800
            //   7303                 | jae                 5
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   8b55f0               | mov                 edx, dword ptr [ebp - 0x10]
            //   51                   | push                ecx

        $sequence_15 = { 23c1 c3 a1???????? 85c0 7402 ffd0 68???????? }
            // n = 7, score = 100
            //   23c1                 | and                 eax, ecx
            //   c3                   | ret                 
            //   a1????????           |                     
            //   85c0                 | test                eax, eax
            //   7402                 | je                  4
            //   ffd0                 | call                eax
            //   68????????           |                     

    condition:
        7 of them and filesize < 188416
}