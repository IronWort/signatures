rule win_bankshot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.bankshot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.bankshot"
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
        $sequence_0 = { 8bf8 8d5101 8a01 41 84c0 75f9 57 }
            // n = 7, score = 300
            //   8bf8                 | mov                 edi, eax
            //   8d5101               | lea                 edx, dword ptr [ecx + 1]
            //   8a01                 | mov                 al, byte ptr [ecx]
            //   41                   | inc                 ecx
            //   84c0                 | test                al, al
            //   75f9                 | jne                 0xfffffffb
            //   57                   | push                edi

        $sequence_1 = { 55 8bec 81ec48040000 a1???????? 33c5 8945f8 53 }
            // n = 7, score = 300
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   81ec48040000         | sub                 esp, 0x448
            //   a1????????           |                     
            //   33c5                 | xor                 eax, ebp
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   53                   | push                ebx

        $sequence_2 = { 51 50 6a00 68e9fd0000 ffd3 }
            // n = 5, score = 300
            //   51                   | push                ecx
            //   50                   | push                eax
            //   6a00                 | push                0
            //   68e9fd0000           | push                0xfde9
            //   ffd3                 | call                ebx

        $sequence_3 = { 74a6 83fe04 7c13 33c0 5f 5e 5b }
            // n = 7, score = 200
            //   74a6                 | xor                 eax, ebp
            //   83fe04               | mov                 dword ptr [ebp - 8], eax
            //   7c13                 | push                ebx
            //   33c0                 | mov                 ebp, esp
            //   5f                   | sub                 esp, 0x448
            //   5e                   | xor                 eax, ebp
            //   5b                   | mov                 dword ptr [ebp - 8], eax

        $sequence_4 = { 8b4508 c700???????? 8b4508 898850030000 8b4508 59 c74048b8e40110 }
            // n = 7, score = 200
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   c700????????         |                     
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   898850030000         | mov                 dword ptr [eax + 0x350], ecx
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   59                   | pop                 ecx
            //   c74048b8e40110       | mov                 dword ptr [eax + 0x48], 0x1001e4b8

        $sequence_5 = { 83c40c e8???????? 99 b907000000 }
            // n = 4, score = 200
            //   83c40c               | dec                 esp
            //   e8????????           |                     
            //   99                   | mov                 ebx, dword ptr [esp + 0x4c]
            //   b907000000           | dec                 eax

        $sequence_6 = { 894de4 3998c0e10110 0f84ea000000 41 83c030 894de4 3df0000000 }
            // n = 7, score = 200
            //   894de4               | mov                 dword ptr [ebp - 0x1c], ecx
            //   3998c0e10110         | cmp                 dword ptr [eax + 0x1001e1c0], ebx
            //   0f84ea000000         | je                  0xf0
            //   41                   | inc                 ecx
            //   83c030               | add                 eax, 0x30
            //   894de4               | mov                 dword ptr [ebp - 0x1c], ecx
            //   3df0000000           | cmp                 eax, 0xf0

        $sequence_7 = { 8b45fc 817848b8e40110 7409 ff7048 e8???????? }
            // n = 5, score = 200
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   817848b8e40110       | cmp                 dword ptr [eax + 0x48], 0x1001e4b8
            //   7409                 | je                  0xb
            //   ff7048               | push                dword ptr [eax + 0x48]
            //   e8????????           |                     

        $sequence_8 = { 83faff 7474 33c0 85d2 7e6e }
            // n = 5, score = 200
            //   83faff               | mov                 dword ptr [ebp - 8], eax
            //   7474                 | push                ebx
            //   33c0                 | mov                 edi, eax
            //   85d2                 | lea                 edx, dword ptr [ecx + 1]
            //   7e6e                 | mov                 al, byte ptr [ecx]

        $sequence_9 = { 50 e8???????? 83c40c 8d8500b9ffff 33ff 6828050000 }
            // n = 6, score = 200
            //   50                   | push                ebx
            //   e8????????           |                     
            //   83c40c               | je                  0xf
            //   8d8500b9ffff         | push                eax
            //   33ff                 | call                edi
            //   6828050000           | mov                 dword ptr [ebp - 0x4540], 0

        $sequence_10 = { 8b7510 8bda 894dfc 57 8b7d0c 85f6 785b }
            // n = 7, score = 200
            //   8b7510               | push                eax
            //   8bda                 | push                0
            //   894dfc               | push                0xfde9
            //   57                   | call                ebx
            //   8b7d0c               | push                ebp
            //   85f6                 | mov                 ebp, esp
            //   785b                 | sub                 esp, 0x448

        $sequence_11 = { 740d 50 ffd7 c785c0baffff00000000 8b85bcbaffff 85c0 7403 }
            // n = 7, score = 200
            //   740d                 | lea                 edx, dword ptr [esp + 0x10]
            //   50                   | mov                 esi, eax
            //   ffd7                 | push                ecx
            //   c785c0baffff00000000     | lea    edx, dword ptr [esp + 0x28c]
            //   8b85bcbaffff         | add                 esi, eax
            //   85c0                 | sub                 esp, 0x448
            //   7403                 | xor                 eax, ebp

        $sequence_12 = { c74048b8e40110 8b4508 6689486c 8b4508 66898872010000 8b4508 83a04c03000000 }
            // n = 7, score = 200
            //   c74048b8e40110       | mov                 dword ptr [eax + 0x48], 0x1001e4b8
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   6689486c             | mov                 word ptr [eax + 0x6c], cx
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   66898872010000       | mov                 word ptr [eax + 0x172], cx
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   83a04c03000000       | and                 dword ptr [eax + 0x34c], 0

        $sequence_13 = { 50 e8???????? 83c40c 6b45e430 8945e0 8d80d0e10110 }
            // n = 6, score = 200
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   6b45e430             | imul                eax, dword ptr [ebp - 0x1c], 0x30
            //   8945e0               | mov                 dword ptr [ebp - 0x20], eax
            //   8d80d0e10110         | lea                 eax, dword ptr [eax + 0x1001e1d0]

        $sequence_14 = { e8???????? 83c404 89861c020000 8b45e0 8d4e0c 6a06 8d90c4e10110 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   89861c020000         | mov                 dword ptr [esi + 0x21c], eax
            //   8b45e0               | mov                 eax, dword ptr [ebp - 0x20]
            //   8d4e0c               | lea                 ecx, dword ptr [esi + 0xc]
            //   6a06                 | push                6
            //   8d90c4e10110         | lea                 edx, dword ptr [eax + 0x1001e1c4]

        $sequence_15 = { 81fa00010000 7313 8a87bce10110 08441619 42 }
            // n = 5, score = 200
            //   81fa00010000         | cmp                 edx, 0x100
            //   7313                 | jae                 0x15
            //   8a87bce10110         | mov                 al, byte ptr [edi + 0x1001e1bc]
            //   08441619             | or                  byte ptr [esi + edx + 0x19], al
            //   42                   | inc                 edx

        $sequence_16 = { 57 33ff 8bcf 8bc7 894de4 3998c0e10110 }
            // n = 6, score = 200
            //   57                   | push                edi
            //   33ff                 | xor                 edi, edi
            //   8bcf                 | mov                 ecx, edi
            //   8bc7                 | mov                 eax, edi
            //   894de4               | mov                 dword ptr [ebp - 0x1c], ecx
            //   3998c0e10110         | cmp                 dword ptr [eax + 0x1001e1c0], ebx

        $sequence_17 = { 6800020000 6a40 ff15???????? 8bbc2478020000 8bac2474020000 8bb42470020000 }
            // n = 6, score = 100
            //   6800020000           | nop                 dword ptr [eax + eax]
            //   6a40                 | inc                 ecx
            //   ff15????????         |                     
            //   8bbc2478020000       | mov                 eax, dword ptr [ecx]
            //   8bac2474020000       | inc                 ecx
            //   8bb42470020000       | mov                 ecx, dword ptr [ecx - 8]

        $sequence_18 = { 33c0 488b8d70440000 4833cc e8???????? 4881c488450000 415f 415c }
            // n = 7, score = 100
            //   33c0                 | cmp                 eax, -1
            //   488b8d70440000       | mov                 ecx, 0x40
            //   4833cc               | dec                 ebp
            //   e8????????           |                     
            //   4881c488450000       | mov                 esi, eax
            //   415f                 | dec                 eax
            //   415c                 | lea                 edx, dword ptr [esp + 0x30]

        $sequence_19 = { ba00000080 458d4103 488d0da9970000 ff15???????? 488bf8 4883f8ff }
            // n = 6, score = 100
            //   ba00000080           | mov                 ecx, ebx
            //   458d4103             | dec                 eax
            //   488d0da9970000       | lea                 edx, dword ptr [0xfb72]
            //   ff15????????         |                     
            //   488bf8               | mov                 edx, 0x80000000
            //   4883f8ff             | inc                 ebp

        $sequence_20 = { c644243229 c644243376 c644243470 c6442435a9 }
            // n = 4, score = 100
            //   c644243229           | dec                 eax
            //   c644243376           | lea                 esi, dword ptr [esp + 0x5c]
            //   c644243470           | dec                 eax
            //   c6442435a9           | lea                 edi, dword ptr [0xdc61]

        $sequence_21 = { 4983c110 0f1f440000 418b01 418b49f8 3bc1 0f4fc8 41030a }
            // n = 7, score = 100
            //   4983c110             | inc                 ecx
            //   0f1f440000           | pop                 edi
            //   418b01               | inc                 ecx
            //   418b49f8             | pop                 esp
            //   3bc1                 | dec                 eax
            //   0f4fc8               | lea                 edx, dword ptr [0x893f]
            //   41030a               | dec                 eax

        $sequence_22 = { 50 ff730c ff55d4 85c0 0f8419010000 }
            // n = 5, score = 100
            //   50                   | push                eax
            //   ff730c               | push                dword ptr [ebx + 0xc]
            //   ff55d4               | call                dword ptr [ebp - 0x2c]
            //   85c0                 | test                eax, eax
            //   0f8419010000         | je                  0x11f

        $sequence_23 = { 488d153f890000 488bc8 891d???????? c705????????01000000 48893d???????? ff15???????? b9d0070000 }
            // n = 7, score = 100
            //   488d153f890000       | dec                 eax
            //   488bc8               | mov                 ecx, edi
            //   891d????????         |                     
            //   c705????????01000000     |     
            //   48893d????????       |                     
            //   ff15????????         |                     
            //   b9d0070000           | dec                 eax

        $sequence_24 = { eb23 6a00 6a00 6a00 6a01 8b85f8f3ffff }
            // n = 6, score = 100
            //   eb23                 | movzx               eax, byte ptr [ebp - 0x437]
            //   6a00                 | push                eax
            //   6a00                 | movzx               eax, byte ptr [ebp - 0x438]
            //   6a00                 | push                eax
            //   6a01                 | add                 esp, 0xc
            //   8b85f8f3ffff         | cdq                 

        $sequence_25 = { c685f8fcffff00 68ff010000 6a00 8d95f9fcffff }
            // n = 4, score = 100
            //   c685f8fcffff00       | cdq                 
            //   68ff010000           | mov                 ecx, 7
            //   6a00                 | add                 esp, 0xc
            //   8d95f9fcffff         | cdq                 

        $sequence_26 = { 48897c2420 4154 4883ec20 4c8b511c 4d8be0 }
            // n = 5, score = 100
            //   48897c2420           | mov                 ecx, dword ptr [ebp + 0x4470]
            //   4154                 | dec                 eax
            //   4883ec20             | xor                 ecx, esp
            //   4c8b511c             | dec                 eax
            //   4d8be0               | add                 esp, 0x4588

        $sequence_27 = { 2bf2 8b4dd8 8910 b800000000 0f4485bcfbffff }
            // n = 5, score = 100
            //   2bf2                 | sub                 esi, edx
            //   8b4dd8               | mov                 ecx, dword ptr [ebp - 0x28]
            //   8910                 | mov                 dword ptr [eax], edx
            //   b800000000           | mov                 eax, 0
            //   0f4485bcfbffff       | cmove               eax, dword ptr [ebp - 0x444]

        $sequence_28 = { 0f849e000000 8b6c2428 8b15???????? a1???????? 6a01 }
            // n = 5, score = 100
            //   0f849e000000         | cdq                 
            //   8b6c2428             | mov                 ecx, 7
            //   8b15????????         |                     
            //   a1????????           |                     
            //   6a01                 | idiv                ecx

        $sequence_29 = { 89542424 8d4641 8d4c2408 50 51 8d942478020000 68???????? }
            // n = 7, score = 100
            //   89542424             | cmp                 eax, ecx
            //   8d4641               | cmovg               ecx, eax
            //   8d4c2408             | inc                 ecx
            //   50                   | add                 ecx, dword ptr [edx]
            //   51                   | test                byte ptr [esp + 0x30], 0x10
            //   8d942478020000       | je                  0xa9
            //   68????????           |                     

        $sequence_30 = { 488d542420 488bcb ff15???????? 488d1572fb0000 }
            // n = 4, score = 100
            //   488d542420           | dec                 eax
            //   488bcb               | lea                 edx, dword ptr [esp + 0x20]
            //   ff15????????         |                     
            //   488d1572fb0000       | dec                 eax

        $sequence_31 = { 50 8b4d0c 83c101 51 e8???????? 83c408 }
            // n = 6, score = 100
            //   50                   | add                 esp, 0xc
            //   8b4d0c               | lea                 eax, dword ptr [ebp - 0x4700]
            //   83c101               | xor                 edi, edi
            //   51                   | push                0x528
            //   e8????????           |                     
            //   83c408               | push                eax

        $sequence_32 = { 51 ff15???????? 6a01 6a06 }
            // n = 4, score = 100
            //   51                   | mov                 ecx, 7
            //   ff15????????         |                     
            //   6a01                 | idiv                ecx
            //   6a06                 | add                 ecx, 0x580

        $sequence_33 = { b940000000 4d8bf0 ff15???????? 488d542430 488bcf 488be8 33db }
            // n = 7, score = 100
            //   b940000000           | lea                 eax, dword ptr [ecx + 3]
            //   4d8bf0               | dec                 eax
            //   ff15????????         |                     
            //   488d542430           | lea                 ecx, dword ptr [0x97a9]
            //   488bcf               | dec                 eax
            //   488be8               | mov                 edi, eax
            //   33db                 | dec                 eax

        $sequence_34 = { e9???????? 33d2 41b800010000 488d0d69980000 e8???????? 4c8b5c244c 4c891d???????? }
            // n = 7, score = 100
            //   e9????????           |                     
            //   33d2                 | mov                 ebp, eax
            //   41b800010000         | xor                 ebx, ebx
            //   488d0d69980000       | xor                 eax, eax
            //   e8????????           |                     
            //   4c8b5c244c           | dec                 eax
            //   4c891d????????       |                     

        $sequence_35 = { 81c180050000 51 ff15???????? 8b95f8f3ffff 894204 eb23 }
            // n = 6, score = 100
            //   81c180050000         | js                  0x68
            //   51                   | je                  0xffffffa8
            //   ff15????????         |                     
            //   8b95f8f3ffff         | cmp                 esi, 4
            //   894204               | jl                  0x18
            //   eb23                 | xor                 eax, eax

        $sequence_36 = { 8b95acf7ffff 52 ff15???????? 89859cf7ffff c78574f7ffff00000000 }
            // n = 5, score = 100
            //   8b95acf7ffff         | pop                 edi
            //   52                   | pop                 esi
            //   ff15????????         |                     
            //   89859cf7ffff         | pop                 ebx
            //   c78574f7ffff00000000     | push    eax

        $sequence_37 = { e8???????? e9???????? 8b542408 8d8424a0000000 50 8bcf e8???????? }
            // n = 7, score = 100
            //   e8????????           |                     
            //   e9????????           |                     
            //   8b542408             | mov                 edx, dword ptr [esp + 8]
            //   8d8424a0000000       | lea                 eax, dword ptr [esp + 0xa0]
            //   50                   | push                eax
            //   8bcf                 | mov                 ecx, edi
            //   e8????????           |                     

        $sequence_38 = { c745dce3ce4000 8b4518 8945e0 8b450c }
            // n = 4, score = 100
            //   c745dce3ce4000       | add                 esp, 0xc
            //   8b4518               | cdq                 
            //   8945e0               | mov                 ecx, 7
            //   8b450c               | idiv                ecx

        $sequence_39 = { 43 eb0a 3c08 0f8480000000 33db 3bfe 7535 }
            // n = 7, score = 100
            //   43                   | mov                 ecx, 2
            //   eb0a                 | repe cmpsb          byte ptr [esi], byte ptr es:[edi]
            //   3c08                 | je                  0xc9
            //   0f8480000000         | add                 esp, 0xc
            //   33db                 | cdq                 
            //   3bfe                 | mov                 ecx, 7
            //   7535                 | add                 esp, 0xc

        $sequence_40 = { 80bdabfbffff00 75e2 8b8da0fbffff 2b8d7cfbffff 8b957cfbffff 899570fbffff }
            // n = 6, score = 100
            //   80bdabfbffff00       | mov                 ecx, 7
            //   75e2                 | add                 esp, 0xc
            //   8b8da0fbffff         | cdq                 
            //   2b8d7cfbffff         | mov                 ecx, 7
            //   8b957cfbffff         | idiv                ecx
            //   899570fbffff         | add                 esp, 0xc

        $sequence_41 = { 744e 6a64 c785b8fbffff01000000 ff9550f7ffff }
            // n = 4, score = 100
            //   744e                 | je                  0x50
            //   6a64                 | push                0x64
            //   c785b8fbffff01000000     | mov    dword ptr [ebp - 0x448], 1
            //   ff9550f7ffff         | call                dword ptr [ebp - 0x8b0]

        $sequence_42 = { 6a00 e8???????? 83c404 8d4c2420 51 ff15???????? 8d542410 }
            // n = 7, score = 100
            //   6a00                 | add                 esp, 0xc
            //   e8????????           |                     
            //   83c404               | cdq                 
            //   8d4c2420             | mov                 ecx, 7
            //   51                   | push                0x200
            //   ff15????????         |                     
            //   8d542410             | push                0x40

        $sequence_43 = { ff15???????? 68???????? 53 8945dc ff15???????? 68???????? 53 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   68????????           |                     
            //   53                   | push                ebx
            //   8945dc               | mov                 dword ptr [ebp - 0x24], eax
            //   ff15????????         |                     
            //   68????????           |                     
            //   53                   | push                ebx

    condition:
        7 of them and filesize < 860160
}