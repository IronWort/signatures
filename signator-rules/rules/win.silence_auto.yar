rule win_silence_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.silence."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.silence"
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
        $sequence_0 = { 740a 8a4801 40 84c9 75f4 eb05 }
            // n = 6, score = 1800
            //   740a                 | je                  0xc
            //   8a4801               | mov                 cl, byte ptr [eax + 1]
            //   40                   | inc                 eax
            //   84c9                 | test                cl, cl
            //   75f4                 | jne                 0xfffffff6
            //   eb05                 | jmp                 7

        $sequence_1 = { e8???????? cc 8325????????00 c3 6a08 }
            // n = 5, score = 1800
            //   e8????????           |                     
            //   cc                   | int3                
            //   8325????????00       |                     
            //   c3                   | ret                 
            //   6a08                 | push                8

        $sequence_2 = { 6a00 8d45fc 50 6a00 6a00 68???????? c745fc00000000 }
            // n = 7, score = 1800
            //   6a00                 | push                0
            //   8d45fc               | lea                 eax, dword ptr [ebp - 4]
            //   50                   | push                eax
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   68????????           |                     
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0

        $sequence_3 = { 683f020f00 6a00 68???????? 6801000080 ff15???????? 68???????? }
            // n = 6, score = 1700
            //   683f020f00           | push                0xf023f
            //   6a00                 | push                0
            //   68????????           |                     
            //   6801000080           | push                0x80000001
            //   ff15????????         |                     
            //   68????????           |                     

        $sequence_4 = { ff15???????? 6a00 6800000004 6a00 6a00 }
            // n = 5, score = 1600
            //   ff15????????         |                     
            //   6a00                 | push                0
            //   6800000004           | push                0x4000000
            //   6a00                 | push                0
            //   6a00                 | push                0

        $sequence_5 = { f3c3 e9???????? e8???????? e9???????? 6a14 }
            // n = 5, score = 1600
            //   f3c3                 | ret                 
            //   e9????????           |                     
            //   e8????????           |                     
            //   e9????????           |                     
            //   6a14                 | push                0x14

        $sequence_6 = { 6801000080 ff15???????? 56 8d85f8feffff }
            // n = 4, score = 1600
            //   6801000080           | push                0x80000001
            //   ff15????????         |                     
            //   56                   | push                esi
            //   8d85f8feffff         | lea                 eax, dword ptr [ebp - 0x108]

        $sequence_7 = { 68???????? ffd6 8b45fc 85c0 }
            // n = 4, score = 1600
            //   68????????           |                     
            //   ffd6                 | call                esi
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   85c0                 | test                eax, eax

        $sequence_8 = { 46 56 8d85f8feffff 50 6a01 }
            // n = 5, score = 1600
            //   46                   | inc                 esi
            //   56                   | push                esi
            //   8d85f8feffff         | lea                 eax, dword ptr [ebp - 0x108]
            //   50                   | push                eax
            //   6a01                 | push                1

        $sequence_9 = { ff30 c745fc00000000 57 ff15???????? }
            // n = 4, score = 1400
            //   ff30                 | push                dword ptr [eax]
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   57                   | push                edi
            //   ff15????????         |                     

        $sequence_10 = { 5e 5b 5d c3 c60200 }
            // n = 5, score = 1400
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   c60200               | mov                 byte ptr [edx], 0

        $sequence_11 = { 40 84c9 75f4 eb0d 803800 7408 }
            // n = 6, score = 1400
            //   40                   | inc                 eax
            //   84c9                 | test                cl, cl
            //   75f4                 | jne                 0xfffffff6
            //   eb0d                 | jmp                 0xf
            //   803800               | cmp                 byte ptr [eax], 0
            //   7408                 | je                  0xa

        $sequence_12 = { eb0d 803800 7408 8a5a01 42 84db }
            // n = 6, score = 1400
            //   eb0d                 | jmp                 0xf
            //   803800               | cmp                 byte ptr [eax], 0
            //   7408                 | je                  0xa
            //   8a5a01               | mov                 bl, byte ptr [edx + 1]
            //   42                   | inc                 edx
            //   84db                 | test                bl, bl

        $sequence_13 = { 6a00 6a00 8bf8 6a00 57 ff15???????? 8d45fc }
            // n = 7, score = 1400
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   8bf8                 | mov                 edi, eax
            //   6a00                 | push                0
            //   57                   | push                edi
            //   ff15????????         |                     
            //   8d45fc               | lea                 eax, dword ptr [ebp - 4]

        $sequence_14 = { 6800080000 8d85bcf7ffff 50 56 }
            // n = 4, score = 1200
            //   6800080000           | push                0x800
            //   8d85bcf7ffff         | lea                 eax, dword ptr [ebp - 0x844]
            //   50                   | push                eax
            //   56                   | push                esi

        $sequence_15 = { 8d85b8f7ffff 50 6800080000 8d85bcf7ffff }
            // n = 4, score = 1200
            //   8d85b8f7ffff         | lea                 eax, dword ptr [ebp - 0x848]
            //   50                   | push                eax
            //   6800080000           | push                0x800
            //   8d85bcf7ffff         | lea                 eax, dword ptr [ebp - 0x844]

        $sequence_16 = { 8d95f0fdffff 52 ff10 8b95ecfdffff 03fa 8bb5e8fdffff 3bf7 }
            // n = 7, score = 1100
            //   8d95f0fdffff         | lea                 edx, dword ptr [ebp - 0x210]
            //   52                   | push                edx
            //   ff10                 | call                dword ptr [eax]
            //   8b95ecfdffff         | mov                 edx, dword ptr [ebp - 0x214]
            //   03fa                 | add                 edi, edx
            //   8bb5e8fdffff         | mov                 esi, dword ptr [ebp - 0x218]
            //   3bf7                 | cmp                 esi, edi

        $sequence_17 = { 7412 8b01 52 8d95f0fdffff 52 }
            // n = 5, score = 1100
            //   7412                 | je                  0x14
            //   8b01                 | mov                 eax, dword ptr [ecx]
            //   52                   | push                edx
            //   8d95f0fdffff         | lea                 edx, dword ptr [ebp - 0x210]
            //   52                   | push                edx

        $sequence_18 = { 8bf9 e8???????? ff37 8b35???????? ffd6 ff7704 }
            // n = 6, score = 1100
            //   8bf9                 | mov                 edi, ecx
            //   e8????????           |                     
            //   ff37                 | push                dword ptr [edi]
            //   8b35????????         |                     
            //   ffd6                 | call                esi
            //   ff7704               | push                dword ptr [edi + 4]

        $sequence_19 = { ff7704 ffd6 ff770c ffd6 ff7708 ffd6 }
            // n = 6, score = 1100
            //   ff7704               | push                dword ptr [edi + 4]
            //   ffd6                 | call                esi
            //   ff770c               | push                dword ptr [edi + 0xc]
            //   ffd6                 | call                esi
            //   ff7708               | push                dword ptr [edi + 8]
            //   ffd6                 | call                esi

        $sequence_20 = { 8b17 8bcf ff5210 8b17 8bcf }
            // n = 5, score = 1100
            //   8b17                 | mov                 edx, dword ptr [edi]
            //   8bcf                 | mov                 ecx, edi
            //   ff5210               | call                dword ptr [edx + 0x10]
            //   8b17                 | mov                 edx, dword ptr [edi]
            //   8bcf                 | mov                 ecx, edi

        $sequence_21 = { 6a01 6a12 6a12 6a00 }
            // n = 4, score = 1100
            //   6a01                 | push                1
            //   6a12                 | push                0x12
            //   6a12                 | push                0x12
            //   6a00                 | push                0

        $sequence_22 = { ff5004 8b46f8 0346f4 57 ff7508 }
            // n = 5, score = 1100
            //   ff5004               | call                dword ptr [eax + 4]
            //   8b46f8               | mov                 eax, dword ptr [esi - 8]
            //   0346f4               | add                 eax, dword ptr [esi - 0xc]
            //   57                   | push                edi
            //   ff7508               | push                dword ptr [ebp + 8]

        $sequence_23 = { e8???????? 83c41c 895ef8 897ef0 5b 5f 5e }
            // n = 7, score = 1100
            //   e8????????           |                     
            //   83c41c               | add                 esp, 0x1c
            //   895ef8               | mov                 dword ptr [esi - 8], ebx
            //   897ef0               | mov                 dword ptr [esi - 0x10], edi
            //   5b                   | pop                 ebx
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_24 = { 660fd605???????? 660fd605???????? 50 c705????????00000000 c705????????10000000 }
            // n = 5, score = 1000
            //   660fd605????????     |                     
            //   660fd605????????     |                     
            //   50                   | push                eax
            //   c705????????00000000     |     
            //   c705????????10000000     |     

        $sequence_25 = { ffd7 6a00 6a00 6a01 6a00 ff15???????? }
            // n = 6, score = 1000
            //   ffd7                 | call                edi
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a01                 | push                1
            //   6a00                 | push                0
            //   ff15????????         |                     

        $sequence_26 = { c705????????03000000 ffd3 5e 85c0 7507 }
            // n = 5, score = 400
            //   c705????????03000000     |     
            //   ffd3                 | call                ebx
            //   5e                   | pop                 esi
            //   85c0                 | test                eax, eax
            //   7507                 | jne                 9

        $sequence_27 = { c705????????00000000 c705????????00000000 ffd3 85c0 7507 }
            // n = 5, score = 400
            //   c705????????00000000     |     
            //   c705????????00000000     |     
            //   ffd3                 | call                ebx
            //   85c0                 | test                eax, eax
            //   7507                 | jne                 9

        $sequence_28 = { ff15???????? 68c0d40100 ff15???????? e9???????? }
            // n = 4, score = 400
            //   ff15????????         |                     
            //   68c0d40100           | push                0x1d4c0
            //   ff15????????         |                     
            //   e9????????           |                     

        $sequence_29 = { 7507 68???????? ffd7 5f }
            // n = 4, score = 400
            //   7507                 | jne                 9
            //   68????????           |                     
            //   ffd7                 | call                edi
            //   5f                   | pop                 edi

        $sequence_30 = { a3???????? 85c0 7542 68???????? ffd7 }
            // n = 5, score = 400
            //   a3????????           |                     
            //   85c0                 | test                eax, eax
            //   7542                 | jne                 0x44
            //   68????????           |                     
            //   ffd7                 | call                edi

        $sequence_31 = { ffd7 56 6a00 6a00 6a00 68???????? }
            // n = 6, score = 400
            //   ffd7                 | call                edi
            //   56                   | push                esi
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   68????????           |                     

        $sequence_32 = { 68???????? ff15???????? c20800 53 8b1d???????? 57 0f57c0 }
            // n = 7, score = 400
            //   68????????           |                     
            //   ff15????????         |                     
            //   c20800               | ret                 8
            //   53                   | push                ebx
            //   8b1d????????         |                     
            //   57                   | push                edi
            //   0f57c0               | xorps               xmm0, xmm0

        $sequence_33 = { 50 6a00 ff15???????? 6a00 6a00 68???????? }
            // n = 6, score = 200
            //   50                   | push                eax
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   68????????           |                     

        $sequence_34 = { d3ea 0fb605???????? 23d0 8815???????? 0fbe4dfd 234dec }
            // n = 6, score = 100
            //   d3ea                 | shr                 edx, cl
            //   0fb605????????       |                     
            //   23d0                 | and                 edx, eax
            //   8815????????         |                     
            //   0fbe4dfd             | movsx               ecx, byte ptr [ebp - 3]
            //   234dec               | and                 ecx, dword ptr [ebp - 0x14]

        $sequence_35 = { 0fbf45f8 0fbf4df4 034de4 d3e0 2305???????? 0b05???????? 0b05???????? }
            // n = 7, score = 100
            //   0fbf45f8             | movsx               eax, word ptr [ebp - 8]
            //   0fbf4df4             | movsx               ecx, word ptr [ebp - 0xc]
            //   034de4               | add                 ecx, dword ptr [ebp - 0x1c]
            //   d3e0                 | shl                 eax, cl
            //   2305????????         |                     
            //   0b05????????         |                     
            //   0b05????????         |                     

        $sequence_36 = { 837de000 750c c78530ffffff00000000 eb0a c78530ffffff01000000 8b8d30ffffff 890d???????? }
            // n = 7, score = 100
            //   837de000             | cmp                 dword ptr [ebp - 0x20], 0
            //   750c                 | jne                 0xe
            //   c78530ffffff00000000     | mov    dword ptr [ebp - 0xd0], 0
            //   eb0a                 | jmp                 0xc
            //   c78530ffffff01000000     | mov    dword ptr [ebp - 0xd0], 1
            //   8b8d30ffffff         | mov                 ecx, dword ptr [ebp - 0xd0]
            //   890d????????         |                     

        $sequence_37 = { 8b15???????? 2bd1 8915???????? 0fb645ff 8b0d???????? 2bc8 0fbf15???????? }
            // n = 7, score = 100
            //   8b15????????         |                     
            //   2bd1                 | sub                 edx, ecx
            //   8915????????         |                     
            //   0fb645ff             | movzx               eax, byte ptr [ebp - 1]
            //   8b0d????????         |                     
            //   2bc8                 | sub                 ecx, eax
            //   0fbf15????????       |                     

    condition:
        7 of them and filesize < 70128640
}