rule win_xsplus_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.xsplus."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.xsplus"
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
        $sequence_0 = { 6a00 8d4df8 51 8b5508 52 8b450c 50 }
            // n = 7, score = 300
            //   6a00                 | push                0
            //   8d4df8               | lea                 ecx, dword ptr [ebp - 8]
            //   51                   | push                ecx
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   52                   | push                edx
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   50                   | push                eax

        $sequence_1 = { 50 ff95dcfeffff 837de417 7526 8d4dec 51 }
            // n = 6, score = 300
            //   50                   | push                eax
            //   ff95dcfeffff         | call                dword ptr [ebp - 0x124]
            //   837de417             | cmp                 dword ptr [ebp - 0x1c], 0x17
            //   7526                 | jne                 0x28
            //   8d4dec               | lea                 ecx, dword ptr [ebp - 0x14]
            //   51                   | push                ecx

        $sequence_2 = { 8b75e0 8bc6 c1f805 83e61f c1e606 033485c0d14000 8b45e4 }
            // n = 7, score = 300
            //   8b75e0               | mov                 esi, dword ptr [ebp - 0x20]
            //   8bc6                 | mov                 eax, esi
            //   c1f805               | sar                 eax, 5
            //   83e61f               | and                 esi, 0x1f
            //   c1e606               | shl                 esi, 6
            //   033485c0d14000       | add                 esi, dword ptr [eax*4 + 0x40d1c0]
            //   8b45e4               | mov                 eax, dword ptr [ebp - 0x1c]

        $sequence_3 = { 89450c 8b4df8 83791c00 7573 }
            // n = 4, score = 300
            //   89450c               | mov                 dword ptr [ebp + 0xc], eax
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   83791c00             | cmp                 dword ptr [ecx + 0x1c], 0
            //   7573                 | jne                 0x75

        $sequence_4 = { 0fb602 33c1 8b4d0c 034dfc 8801 eba7 }
            // n = 6, score = 300
            //   0fb602               | movzx               eax, byte ptr [edx]
            //   33c1                 | xor                 eax, ecx
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   034dfc               | add                 ecx, dword ptr [ebp - 4]
            //   8801                 | mov                 byte ptr [ecx], al
            //   eba7                 | jmp                 0xffffffa9

        $sequence_5 = { 6a00 ff15???????? 8985e8fdffff 83bde8fdffff00 0f8cd3000000 8d8dd8faffff }
            // n = 6, score = 300
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   8985e8fdffff         | mov                 dword ptr [ebp - 0x218], eax
            //   83bde8fdffff00       | cmp                 dword ptr [ebp - 0x218], 0
            //   0f8cd3000000         | jl                  0xd9
            //   8d8dd8faffff         | lea                 ecx, dword ptr [ebp - 0x528]

        $sequence_6 = { 6a03 6a00 6a00 6800000080 8d85fcfeffff }
            // n = 5, score = 300
            //   6a03                 | push                3
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6800000080           | push                0x80000000
            //   8d85fcfeffff         | lea                 eax, dword ptr [ebp - 0x104]

        $sequence_7 = { 83c408 8985ecfeffff 83bdecfeffff00 745b c785e8feffff00000000 }
            // n = 5, score = 300
            //   83c408               | add                 esp, 8
            //   8985ecfeffff         | mov                 dword ptr [ebp - 0x114], eax
            //   83bdecfeffff00       | cmp                 dword ptr [ebp - 0x114], 0
            //   745b                 | je                  0x5d
            //   c785e8feffff00000000     | mov    dword ptr [ebp - 0x118], 0

        $sequence_8 = { 3d01010000 7d0d 8a4c181c 888800a64000 }
            // n = 4, score = 300
            //   3d01010000           | cmp                 eax, 0x101
            //   7d0d                 | jge                 0xf
            //   8a4c181c             | mov                 cl, byte ptr [eax + ebx + 0x1c]
            //   888800a64000         | mov                 byte ptr [eax + 0x40a600], cl

        $sequence_9 = { 6a01 681c100000 8b4d08 51 }
            // n = 4, score = 300
            //   6a01                 | push                1
            //   681c100000           | push                0x101c
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   51                   | push                ecx

        $sequence_10 = { 8955f8 8b4514 8945f4 8b4df4 83c101 894df0 }
            // n = 6, score = 300
            //   8955f8               | mov                 dword ptr [ebp - 8], edx
            //   8b4514               | mov                 eax, dword ptr [ebp + 0x14]
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]
            //   83c101               | add                 ecx, 1
            //   894df0               | mov                 dword ptr [ebp - 0x10], ecx

        $sequence_11 = { 81bdb8fdffff11010000 744b 81bdb8fdffff33020000 740f e9???????? b801000000 }
            // n = 6, score = 300
            //   81bdb8fdffff11010000     | cmp    dword ptr [ebp - 0x248], 0x111
            //   744b                 | je                  0x4d
            //   81bdb8fdffff33020000     | cmp    dword ptr [ebp - 0x248], 0x233
            //   740f                 | je                  0x11
            //   e9????????           |                     
            //   b801000000           | mov                 eax, 1

        $sequence_12 = { 8945f0 8b4dec 8b5108 8b45ec }
            // n = 4, score = 300
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   8b4dec               | mov                 ecx, dword ptr [ebp - 0x14]
            //   8b5108               | mov                 edx, dword ptr [ecx + 8]
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]

        $sequence_13 = { 8b55f8 3b55e8 731e 8b4514 0345f8 0fbe08 }
            // n = 6, score = 300
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]
            //   3b55e8               | cmp                 edx, dword ptr [ebp - 0x18]
            //   731e                 | jae                 0x20
            //   8b4514               | mov                 eax, dword ptr [ebp + 0x14]
            //   0345f8               | add                 eax, dword ptr [ebp - 8]
            //   0fbe08               | movsx               ecx, byte ptr [eax]

        $sequence_14 = { 57 c785f0fdffff04010000 66a1???????? 668985e0faffff b981000000 }
            // n = 5, score = 300
            //   57                   | push                edi
            //   c785f0fdffff04010000     | mov    dword ptr [ebp - 0x210], 0x104
            //   66a1????????         |                     
            //   668985e0faffff       | mov                 word ptr [ebp - 0x520], ax
            //   b981000000           | mov                 ecx, 0x81

        $sequence_15 = { 6860100000 8b4508 50 ff15???????? }
            // n = 4, score = 300
            //   6860100000           | push                0x1060
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   50                   | push                eax
            //   ff15????????         |                     

    condition:
        7 of them and filesize < 597872
}