rule win_floki_bot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.floki_bot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.floki_bot"
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
        $sequence_0 = { 6a00 8d45f0 50 e8???????? 84db 742b 57 }
            // n = 7, score = 1100
            //   6a00                 | push                0
            //   8d45f0               | lea                 eax, dword ptr [ebp - 0x10]
            //   50                   | push                eax
            //   e8????????           |                     
            //   84db                 | test                bl, bl
            //   742b                 | je                  0x2d
            //   57                   | push                edi

        $sequence_1 = { ff15???????? e8???????? 8bf7 e8???????? 8b4508 8b00 ff7028 }
            // n = 7, score = 1100
            //   ff15????????         |                     
            //   e8????????           |                     
            //   8bf7                 | mov                 esi, edi
            //   e8????????           |                     
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   ff7028               | push                dword ptr [eax + 0x28]

        $sequence_2 = { 3bc1 7504 6a07 eb1a 3bc2 7504 6a09 }
            // n = 7, score = 1100
            //   3bc1                 | cmp                 eax, ecx
            //   7504                 | jne                 6
            //   6a07                 | push                7
            //   eb1a                 | jmp                 0x1c
            //   3bc2                 | cmp                 eax, edx
            //   7504                 | jne                 6
            //   6a09                 | push                9

        $sequence_3 = { 8b75f8 8b7dd0 8b45e4 ff45f8 8345fc04 e8???????? 8b55f0 }
            // n = 7, score = 1100
            //   8b75f8               | mov                 esi, dword ptr [ebp - 8]
            //   8b7dd0               | mov                 edi, dword ptr [ebp - 0x30]
            //   8b45e4               | mov                 eax, dword ptr [ebp - 0x1c]
            //   ff45f8               | inc                 dword ptr [ebp - 8]
            //   8345fc04             | add                 dword ptr [ebp - 4], 4
            //   e8????????           |                     
            //   8b55f0               | mov                 edx, dword ptr [ebp - 0x10]

        $sequence_4 = { 7502 32db 6a0c 6a00 8d45f0 50 e8???????? }
            // n = 7, score = 1100
            //   7502                 | jne                 4
            //   32db                 | xor                 bl, bl
            //   6a0c                 | push                0xc
            //   6a00                 | push                0
            //   8d45f0               | lea                 eax, dword ptr [ebp - 0x10]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_5 = { 807dec47 75aa 837df803 75a4 c6431800 }
            // n = 5, score = 1100
            //   807dec47             | cmp                 byte ptr [ebp - 0x14], 0x47
            //   75aa                 | jne                 0xffffffac
            //   837df803             | cmp                 dword ptr [ebp - 8], 3
            //   75a4                 | jne                 0xffffffa6
            //   c6431800             | mov                 byte ptr [ebx + 0x18], 0

        $sequence_6 = { 6a17 ff7508 e8???????? eb13 807dfb01 750d 8b7d08 }
            // n = 7, score = 1100
            //   6a17                 | push                0x17
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     
            //   eb13                 | jmp                 0x15
            //   807dfb01             | cmp                 byte ptr [ebp - 5], 1
            //   750d                 | jne                 0xf
            //   8b7d08               | mov                 edi, dword ptr [ebp + 8]

        $sequence_7 = { eb76 57 e8???????? eb6e 53 8d442413 }
            // n = 6, score = 1100
            //   eb76                 | jmp                 0x78
            //   57                   | push                edi
            //   e8????????           |                     
            //   eb6e                 | jmp                 0x70
            //   53                   | push                ebx
            //   8d442413             | lea                 eax, dword ptr [esp + 0x13]

        $sequence_8 = { 8b07 e8???????? a1???????? 85c0 7408 50 e8???????? }
            // n = 7, score = 1100
            //   8b07                 | mov                 eax, dword ptr [edi]
            //   e8????????           |                     
            //   a1????????           |                     
            //   85c0                 | test                eax, eax
            //   7408                 | je                  0xa
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_9 = { 84d2 7407 80f931 7c17 eb05 80f932 7f10 }
            // n = 7, score = 1100
            //   84d2                 | test                dl, dl
            //   7407                 | je                  9
            //   80f931               | cmp                 cl, 0x31
            //   7c17                 | jl                  0x19
            //   eb05                 | jmp                 7
            //   80f932               | cmp                 cl, 0x32
            //   7f10                 | jg                  0x12

    condition:
        7 of them and filesize < 286720
}