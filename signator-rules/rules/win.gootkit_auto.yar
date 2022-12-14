rule win_gootkit_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.gootkit."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.gootkit"
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
        $sequence_0 = { 895df0 85db 7474 8b7ddc }
            // n = 4, score = 1700
            //   895df0               | mov                 dword ptr [ebp - 0x10], ebx
            //   85db                 | test                ebx, ebx
            //   7474                 | je                  0x76
            //   8b7ddc               | mov                 edi, dword ptr [ebp - 0x24]

        $sequence_1 = { 50 6a00 8bce e8???????? 8b7dfc 59 }
            // n = 6, score = 1700
            //   50                   | push                eax
            //   6a00                 | push                0
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   8b7dfc               | mov                 edi, dword ptr [ebp - 4]
            //   59                   | pop                 ecx

        $sequence_2 = { 85d2 740e 0fbe0431 c1cf0d }
            // n = 4, score = 1700
            //   85d2                 | test                edx, edx
            //   740e                 | je                  0x10
            //   0fbe0431             | movsx               eax, byte ptr [ecx + esi]
            //   c1cf0d               | ror                 edi, 0xd

        $sequence_3 = { 0fb75b06 03f8 33f6 3b570c }
            // n = 4, score = 1700
            //   0fb75b06             | movzx               ebx, word ptr [ebx + 6]
            //   03f8                 | add                 edi, eax
            //   33f6                 | xor                 esi, esi
            //   3b570c               | cmp                 edx, dword ptr [edi + 0xc]

        $sequence_4 = { 8bcf e8???????? 6806000200 8bd7 e8???????? }
            // n = 5, score = 1700
            //   8bcf                 | mov                 ecx, edi
            //   e8????????           |                     
            //   6806000200           | push                0x20006
            //   8bd7                 | mov                 edx, edi
            //   e8????????           |                     

        $sequence_5 = { ff75fc ffd7 33c9 c745f804000000 }
            // n = 4, score = 1700
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ffd7                 | call                edi
            //   33c9                 | xor                 ecx, ecx
            //   c745f804000000       | mov                 dword ptr [ebp - 8], 4

        $sequence_6 = { 8b5dec 115c1004 eb08 25ff0f0000 }
            // n = 4, score = 1700
            //   8b5dec               | mov                 ebx, dword ptr [ebp - 0x14]
            //   115c1004             | adc                 dword ptr [eax + edx + 4], ebx
            //   eb08                 | jmp                 0xa
            //   25ff0f0000           | and                 eax, 0xfff

        $sequence_7 = { 57 6a10 59 bf???????? c745b47272656e f3aa }
            // n = 6, score = 1700
            //   57                   | push                edi
            //   6a10                 | push                0x10
            //   59                   | pop                 ecx
            //   bf????????           |                     
            //   c745b47272656e       | mov                 dword ptr [ebp - 0x4c], 0x6e657272
            //   f3aa                 | rep stosb           byte ptr es:[edi], al

        $sequence_8 = { 52 50 8b4510 99 52 50 8b450c }
            // n = 7, score = 1400
            //   52                   | push                edx
            //   50                   | push                eax
            //   8b4510               | mov                 eax, dword ptr [ebp + 0x10]
            //   99                   | cdq                 
            //   52                   | push                edx
            //   50                   | push                eax
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]

        $sequence_9 = { f3aa 68???????? ff15???????? 50 }
            // n = 4, score = 1200
            //   f3aa                 | rep stosb           byte ptr es:[edi], al
            //   68????????           |                     
            //   ff15????????         |                     
            //   50                   | push                eax

        $sequence_10 = { 8b7df4 32c0 8b4de4 f3aa }
            // n = 4, score = 1200
            //   8b7df4               | mov                 edi, dword ptr [ebp - 0xc]
            //   32c0                 | xor                 al, al
            //   8b4de4               | mov                 ecx, dword ptr [ebp - 0x1c]
            //   f3aa                 | rep stosb           byte ptr es:[edi], al

        $sequence_11 = { 50 68???????? ff15???????? 85c0 7505 e8???????? }
            // n = 6, score = 1100
            //   50                   | push                eax
            //   68????????           |                     
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7505                 | jne                 7
            //   e8????????           |                     

        $sequence_12 = { 50 e8???????? 83c40c 68fd000000 }
            // n = 4, score = 1100
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   68fd000000           | push                0xfd

        $sequence_13 = { 8b4508 8b00 99 52 }
            // n = 4, score = 1000
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   99                   | cdq                 
            //   52                   | push                edx

        $sequence_14 = { c705????????01000000 c705????????02000000 8be5 5d c3 55 }
            // n = 6, score = 900
            //   c705????????01000000     |     
            //   c705????????02000000     |     
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   55                   | push                ebp

        $sequence_15 = { 833d????????00 750a 6a32 ff15???????? }
            // n = 4, score = 800
            //   833d????????00       |                     
            //   750a                 | jne                 0xc
            //   6a32                 | push                0x32
            //   ff15????????         |                     

        $sequence_16 = { 6808020000 6a00 ff15???????? 50 }
            // n = 4, score = 800
            //   6808020000           | push                0x208
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   50                   | push                eax

        $sequence_17 = { e8???????? 6a0c 6a08 ff15???????? 50 ff15???????? }
            // n = 6, score = 800
            //   e8????????           |                     
            //   6a0c                 | push                0xc
            //   6a08                 | push                8
            //   ff15????????         |                     
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_18 = { e8???????? 8d45fc 50 6a01 6a01 6a00 }
            // n = 6, score = 600
            //   e8????????           |                     
            //   8d45fc               | lea                 eax, dword ptr [ebp - 4]
            //   50                   | push                eax
            //   6a01                 | push                1
            //   6a01                 | push                1
            //   6a00                 | push                0

        $sequence_19 = { e8???????? 85c0 750c c705????????03000000 }
            // n = 4, score = 500
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   750c                 | jne                 0xe
            //   c705????????03000000     |     

        $sequence_20 = { 68???????? 51 51 ff15???????? 50 }
            // n = 5, score = 300
            //   68????????           |                     
            //   51                   | push                ecx
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   50                   | push                eax

        $sequence_21 = { 53 53 53 8901 }
            // n = 4, score = 300
            //   53                   | push                ebx
            //   53                   | push                ebx
            //   53                   | push                ebx
            //   8901                 | mov                 dword ptr [ecx], eax

        $sequence_22 = { 50 6a01 6a0b 56 ff15???????? }
            // n = 5, score = 200
            //   50                   | push                eax
            //   6a01                 | push                1
            //   6a0b                 | push                0xb
            //   56                   | push                esi
            //   ff15????????         |                     

        $sequence_23 = { 0f104840 0f114730 0f104050 0f114f40 0f104860 0f114750 0f114f60 }
            // n = 7, score = 200
            //   0f104840             | movups              xmm1, xmmword ptr [eax + 0x40]
            //   0f114730             | movups              xmmword ptr [edi + 0x30], xmm0
            //   0f104050             | movups              xmm0, xmmword ptr [eax + 0x50]
            //   0f114f40             | movups              xmmword ptr [edi + 0x40], xmm1
            //   0f104860             | movups              xmm1, xmmword ptr [eax + 0x60]
            //   0f114750             | movups              xmmword ptr [edi + 0x50], xmm0
            //   0f114f60             | movups              xmmword ptr [edi + 0x60], xmm1

        $sequence_24 = { 8b36 85f6 75a2 8b3f 85ff }
            // n = 5, score = 200
            //   8b36                 | mov                 esi, dword ptr [esi]
            //   85f6                 | test                esi, esi
            //   75a2                 | jne                 0xffffffa4
            //   8b3f                 | mov                 edi, dword ptr [edi]
            //   85ff                 | test                edi, edi

        $sequence_25 = { 8d4864 ff15???????? ffc3 83fb0a 7cd5 33c0 }
            // n = 6, score = 200
            //   8d4864               | lea                 ecx, dword ptr [eax + 0x64]
            //   ff15????????         |                     
            //   ffc3                 | inc                 ebx
            //   83fb0a               | cmp                 ebx, 0xa
            //   7cd5                 | jl                  0xffffffd7
            //   33c0                 | xor                 eax, eax

        $sequence_26 = { 7550 ff15???????? 8bf8 893d???????? }
            // n = 4, score = 200
            //   7550                 | jne                 0x52
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax
            //   893d????????         |                     

        $sequence_27 = { 0f104010 0f110f 0f104820 0f114710 0f104030 0f114f20 }
            // n = 6, score = 200
            //   0f104010             | movups              xmm0, xmmword ptr [eax + 0x10]
            //   0f110f               | movups              xmmword ptr [edi], xmm1
            //   0f104820             | movups              xmm1, xmmword ptr [eax + 0x20]
            //   0f114710             | movups              xmmword ptr [edi + 0x10], xmm0
            //   0f104030             | movups              xmm0, xmmword ptr [eax + 0x30]
            //   0f114f20             | movups              xmmword ptr [edi + 0x20], xmm1

        $sequence_28 = { 0f104060 0f114760 8b4070 894770 be01000000 }
            // n = 5, score = 200
            //   0f104060             | movups              xmm0, xmmword ptr [eax + 0x60]
            //   0f114760             | movups              xmmword ptr [edi + 0x60], xmm0
            //   8b4070               | mov                 eax, dword ptr [eax + 0x70]
            //   894770               | mov                 dword ptr [edi + 0x70], eax
            //   be01000000           | mov                 esi, 1

        $sequence_29 = { a3???????? 391d???????? 7428 85c0 7424 83ec0c ba???????? }
            // n = 7, score = 200
            //   a3????????           |                     
            //   391d????????         |                     
            //   7428                 | je                  0x2a
            //   85c0                 | test                eax, eax
            //   7424                 | je                  0x26
            //   83ec0c               | sub                 esp, 0xc
            //   ba????????           |                     

        $sequence_30 = { ff15???????? 85c0 7510 8d4864 ff15???????? ffc3 }
            // n = 6, score = 200
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7510                 | jne                 0x12
            //   8d4864               | lea                 ecx, dword ptr [eax + 0x64]
            //   ff15????????         |                     
            //   ffc3                 | inc                 ebx

        $sequence_31 = { 83faff 7508 ff15???????? 8bd0 }
            // n = 4, score = 200
            //   83faff               | cmp                 edx, -1
            //   7508                 | jne                 0xa
            //   ff15????????         |                     
            //   8bd0                 | mov                 edx, eax

        $sequence_32 = { ff15???????? 8b4de8 b84d5a0000 663901 754e 8b513c }
            // n = 6, score = 200
            //   ff15????????         |                     
            //   8b4de8               | mov                 ecx, dword ptr [ebp - 0x18]
            //   b84d5a0000           | mov                 eax, 0x5a4d
            //   663901               | cmp                 word ptr [ecx], ax
            //   754e                 | jne                 0x50
            //   8b513c               | mov                 edx, dword ptr [ecx + 0x3c]

        $sequence_33 = { ff15???????? 8bd0 83fa01 7e18 }
            // n = 4, score = 200
            //   ff15????????         |                     
            //   8bd0                 | mov                 edx, eax
            //   83fa01               | cmp                 edx, 1
            //   7e18                 | jle                 0x1a

        $sequence_34 = { 6a10 8d45e8 50 68060000c8 56 ff15???????? }
            // n = 6, score = 200
            //   6a10                 | push                0x10
            //   8d45e8               | lea                 eax, dword ptr [ebp - 0x18]
            //   50                   | push                eax
            //   68060000c8           | push                0xc8000006
            //   56                   | push                esi
            //   ff15????????         |                     

    condition:
        7 of them and filesize < 516096
}