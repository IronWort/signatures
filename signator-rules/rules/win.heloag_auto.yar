rule win_heloag_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.heloag."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.heloag"
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
        $sequence_0 = { 43 3bd8 7ce6 a0???????? 84c0 7425 }
            // n = 6, score = 300
            //   43                   | inc                 ebx
            //   3bd8                 | cmp                 ebx, eax
            //   7ce6                 | jl                  0xffffffe8
            //   a0????????           |                     
            //   84c0                 | test                al, al
            //   7425                 | je                  0x27

        $sequence_1 = { 8b55dc 8b75d4 8b45e0 8b4dd8 2bd6 1bc1 8955e4 }
            // n = 7, score = 300
            //   8b55dc               | mov                 edx, dword ptr [ebp - 0x24]
            //   8b75d4               | mov                 esi, dword ptr [ebp - 0x2c]
            //   8b45e0               | mov                 eax, dword ptr [ebp - 0x20]
            //   8b4dd8               | mov                 ecx, dword ptr [ebp - 0x28]
            //   2bd6                 | sub                 edx, esi
            //   1bc1                 | sbb                 eax, ecx
            //   8955e4               | mov                 dword ptr [ebp - 0x1c], edx

        $sequence_2 = { 59 0bc9 8985a8030000 61 }
            // n = 4, score = 300
            //   59                   | pop                 ecx
            //   0bc9                 | or                  ecx, ecx
            //   8985a8030000         | mov                 dword ptr [ebp + 0x3a8], eax
            //   61                   | popal               

        $sequence_3 = { 6a00 ffd7 a1???????? 43 3bd8 7ce6 68d0070000 }
            // n = 7, score = 300
            //   6a00                 | push                0
            //   ffd7                 | call                edi
            //   a1????????           |                     
            //   43                   | inc                 ebx
            //   3bd8                 | cmp                 ebx, eax
            //   7ce6                 | jl                  0xffffffe8
            //   68d0070000           | push                0x7d0

        $sequence_4 = { ff15???????? 83f8ff 750b 6888130000 ff15???????? }
            // n = 5, score = 300
            //   ff15????????         |                     
            //   83f8ff               | cmp                 eax, -1
            //   750b                 | jne                 0xd
            //   6888130000           | push                0x1388
            //   ff15????????         |                     

        $sequence_5 = { 8bf7 8bfa c7450800000000 c1e902 f3a5 8bc8 }
            // n = 6, score = 300
            //   8bf7                 | mov                 esi, edi
            //   8bfa                 | mov                 edi, edx
            //   c7450800000000       | mov                 dword ptr [ebp + 8], 0
            //   c1e902               | shr                 ecx, 2
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   8bc8                 | mov                 ecx, eax

        $sequence_6 = { 25ffff0000 99 f7f9 8b45c6 25ffff0000 }
            // n = 5, score = 300
            //   25ffff0000           | and                 eax, 0xffff
            //   99                   | cdq                 
            //   f7f9                 | idiv                ecx
            //   8b45c6               | mov                 eax, dword ptr [ebp - 0x3a]
            //   25ffff0000           | and                 eax, 0xffff

        $sequence_7 = { 742d 8b7604 85f6 7506 8b35???????? 8b7b04 8bcd }
            // n = 7, score = 200
            //   742d                 | je                  0x2f
            //   8b7604               | mov                 esi, dword ptr [esi + 4]
            //   85f6                 | test                esi, esi
            //   7506                 | jne                 8
            //   8b35????????         |                     
            //   8b7b04               | mov                 edi, dword ptr [ebx + 4]
            //   8bcd                 | mov                 ecx, ebp

        $sequence_8 = { 88542418 ff15???????? bf???????? 83c9ff }
            // n = 4, score = 200
            //   88542418             | mov                 byte ptr [esp + 0x18], dl
            //   ff15????????         |                     
            //   bf????????           |                     
            //   83c9ff               | or                  ecx, 0xffffffff

        $sequence_9 = { 49 51 56 68???????? }
            // n = 4, score = 200
            //   49                   | dec                 ecx
            //   51                   | push                ecx
            //   56                   | push                esi
            //   68????????           |                     

        $sequence_10 = { 741f 8b7c2418 8bcb 8bd1 53 c1e902 }
            // n = 6, score = 200
            //   741f                 | je                  0x21
            //   8b7c2418             | mov                 edi, dword ptr [esp + 0x18]
            //   8bcb                 | mov                 ecx, ebx
            //   8bd1                 | mov                 edx, ecx
            //   53                   | push                ebx
            //   c1e902               | shr                 ecx, 2

        $sequence_11 = { 8b11 8bcf 52 6a00 50 }
            // n = 5, score = 200
            //   8b11                 | mov                 edx, dword ptr [ecx]
            //   8bcf                 | mov                 ecx, edi
            //   52                   | push                edx
            //   6a00                 | push                0
            //   50                   | push                eax

        $sequence_12 = { 894b0c 8a48ff fec1 8848ff eb3c 6a01 }
            // n = 6, score = 200
            //   894b0c               | mov                 dword ptr [ebx + 0xc], ecx
            //   8a48ff               | mov                 cl, byte ptr [eax - 1]
            //   fec1                 | inc                 cl
            //   8848ff               | mov                 byte ptr [eax - 1], cl
            //   eb3c                 | jmp                 0x3e
            //   6a01                 | push                1

        $sequence_13 = { 55 8d4c2428 88542428 ff15???????? }
            // n = 4, score = 200
            //   55                   | push                ebp
            //   8d4c2428             | lea                 ecx, dword ptr [esp + 0x28]
            //   88542428             | mov                 byte ptr [esp + 0x28], dl
            //   ff15????????         |                     

        $sequence_14 = { 8bf5 c1e902 f3a5 8bca 53 }
            // n = 5, score = 200
            //   8bf5                 | mov                 esi, ebp
            //   c1e902               | shr                 ecx, 2
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   8bca                 | mov                 ecx, edx
            //   53                   | push                ebx

    condition:
        7 of them and filesize < 401408
}