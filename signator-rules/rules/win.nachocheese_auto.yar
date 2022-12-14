rule win_nachocheese_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.nachocheese."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.nachocheese"
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
        $sequence_0 = { 8b0d???????? 8b5104 52 8d8424b0110000 }
            // n = 4, score = 300
            //   8b0d????????         |                     
            //   8b5104               | mov                 edx, dword ptr [ecx + 4]
            //   52                   | push                edx
            //   8d8424b0110000       | lea                 eax, dword ptr [esp + 0x11b0]

        $sequence_1 = { 3d2bc00000 7d1b 3d9c000000 7c07 }
            // n = 4, score = 300
            //   3d2bc00000           | cmp                 eax, 0xc02b
            //   7d1b                 | jge                 0x1d
            //   3d9c000000           | cmp                 eax, 0x9c
            //   7c07                 | jl                  9

        $sequence_2 = { 2bfa 8d47fd 3901 8901 }
            // n = 4, score = 300
            //   2bfa                 | sub                 edi, edx
            //   8d47fd               | lea                 eax, dword ptr [edi - 3]
            //   3901                 | cmp                 dword ptr [ecx], eax
            //   8901                 | mov                 dword ptr [ecx], eax

        $sequence_3 = { 33c8 894710 8b4708 33c1 }
            // n = 4, score = 300
            //   33c8                 | xor                 ecx, eax
            //   894710               | mov                 dword ptr [edi + 0x10], eax
            //   8b4708               | mov                 eax, dword ptr [edi + 8]
            //   33c1                 | xor                 eax, ecx

        $sequence_4 = { ff15???????? 8b4de4 6a00 51 ff15???????? 8b4dfc }
            // n = 6, score = 300
            //   ff15????????         |                     
            //   8b4de4               | mov                 ecx, dword ptr [ebp - 0x1c]
            //   6a00                 | push                0
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]

        $sequence_5 = { ff15???????? 56 ff15???????? 8b4dfc 33cd 83c8ff 5e }
            // n = 7, score = 300
            //   ff15????????         |                     
            //   56                   | push                esi
            //   ff15????????         |                     
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   33cd                 | xor                 ecx, ebp
            //   83c8ff               | or                  eax, 0xffffffff
            //   5e                   | pop                 esi

        $sequence_6 = { 3d9f000000 7e0d 33c0 c3 }
            // n = 4, score = 300
            //   3d9f000000           | cmp                 eax, 0x9f
            //   7e0d                 | jle                 0xf
            //   33c0                 | xor                 eax, eax
            //   c3                   | ret                 

        $sequence_7 = { 83e830 eb03 83e837 8bd3 }
            // n = 4, score = 300
            //   83e830               | sub                 eax, 0x30
            //   eb03                 | jmp                 5
            //   83e837               | sub                 eax, 0x37
            //   8bd3                 | mov                 edx, ebx

        $sequence_8 = { 83c71e 52 89bddcf9ffff e8???????? 83c404 85c0 }
            // n = 6, score = 300
            //   83c71e               | add                 edi, 0x1e
            //   52                   | push                edx
            //   89bddcf9ffff         | mov                 dword ptr [ebp - 0x624], edi
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   85c0                 | test                eax, eax

        $sequence_9 = { 7532 8b7710 8b5f18 85f6 7504 33c0 }
            // n = 6, score = 300
            //   7532                 | jne                 0x34
            //   8b7710               | mov                 esi, dword ptr [edi + 0x10]
            //   8b5f18               | mov                 ebx, dword ptr [edi + 0x18]
            //   85f6                 | test                esi, esi
            //   7504                 | jne                 6
            //   33c0                 | xor                 eax, eax

        $sequence_10 = { 7305 83c302 eb29 81fb00010000 7305 83c303 eb1c }
            // n = 7, score = 300
            //   7305                 | jae                 7
            //   83c302               | add                 ebx, 2
            //   eb29                 | jmp                 0x2b
            //   81fb00010000         | cmp                 ebx, 0x100
            //   7305                 | jae                 7
            //   83c303               | add                 ebx, 3
            //   eb1c                 | jmp                 0x1e

        $sequence_11 = { 3d2cc00000 7f18 3d2bc00000 7d1b }
            // n = 4, score = 300
            //   3d2cc00000           | cmp                 eax, 0xc02c
            //   7f18                 | jg                  0x1a
            //   3d2bc00000           | cmp                 eax, 0xc02b
            //   7d1b                 | jge                 0x1d

        $sequence_12 = { 33c0 c3 05d13fffff 83f801 77f3 }
            // n = 5, score = 300
            //   33c0                 | xor                 eax, eax
            //   c3                   | ret                 
            //   05d13fffff           | add                 eax, 0xffff3fd1
            //   83f801               | cmp                 eax, 1
            //   77f3                 | ja                  0xfffffff5

        $sequence_13 = { 034608 6a00 57 50 53 ff15???????? }
            // n = 6, score = 300
            //   034608               | add                 eax, dword ptr [esi + 8]
            //   6a00                 | push                0
            //   57                   | push                edi
            //   50                   | push                eax
            //   53                   | push                ebx
            //   ff15????????         |                     

        $sequence_14 = { 8d4c2410 51 6802020000 ff15???????? 6a00 6800000800 6a00 }
            // n = 7, score = 300
            //   8d4c2410             | lea                 ecx, dword ptr [esp + 0x10]
            //   51                   | push                ecx
            //   6802020000           | push                0x202
            //   ff15????????         |                     
            //   6a00                 | push                0
            //   6800000800           | push                0x80000
            //   6a00                 | push                0

        $sequence_15 = { 3d9c000000 7c07 3d9f000000 7e0d }
            // n = 4, score = 300
            //   3d9c000000           | cmp                 eax, 0x9c
            //   7c07                 | jl                  9
            //   3d9f000000           | cmp                 eax, 0x9f
            //   7e0d                 | jle                 0xf

    condition:
        7 of them and filesize < 1064960
}