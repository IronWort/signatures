rule win_webc2_kt3_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.webc2_kt3."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.webc2_kt3"
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
        $sequence_0 = { 51 e8???????? 83c40c eb0d 6a32 ff15???????? e9???????? }
            // n = 7, score = 100
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   eb0d                 | jmp                 0xf
            //   6a32                 | push                0x32
            //   ff15????????         |                     
            //   e9????????           |                     

        $sequence_1 = { 8b85ecfeffff 50 6801000080 ff15???????? }
            // n = 4, score = 100
            //   8b85ecfeffff         | mov                 eax, dword ptr [ebp - 0x114]
            //   50                   | push                eax
            //   6801000080           | push                0x80000001
            //   ff15????????         |                     

        $sequence_2 = { 8d95ecfeffff 83c9ff 33c0 f2ae }
            // n = 4, score = 100
            //   8d95ecfeffff         | lea                 edx, dword ptr [ebp - 0x114]
            //   83c9ff               | or                  ecx, 0xffffffff
            //   33c0                 | xor                 eax, eax
            //   f2ae                 | repne scasb         al, byte ptr es:[edi]

        $sequence_3 = { e9???????? 8b55ec 8955dc 8b45dc 50 e8???????? }
            // n = 6, score = 100
            //   e9????????           |                     
            //   8b55ec               | mov                 edx, dword ptr [ebp - 0x14]
            //   8955dc               | mov                 dword ptr [ebp - 0x24], edx
            //   8b45dc               | mov                 eax, dword ptr [ebp - 0x24]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_4 = { 6a00 8b4ddc 8b5110 52 ff15???????? 6a01 }
            // n = 6, score = 100
            //   6a00                 | push                0
            //   8b4ddc               | mov                 ecx, dword ptr [ebp - 0x24]
            //   8b5110               | mov                 edx, dword ptr [ecx + 0x10]
            //   52                   | push                edx
            //   ff15????????         |                     
            //   6a01                 | push                1

        $sequence_5 = { c745dc00000000 c7459844000000 c7459c00000000 c745a400000000 c745a000000000 c745b400000000 8b45b4 }
            // n = 7, score = 100
            //   c745dc00000000       | mov                 dword ptr [ebp - 0x24], 0
            //   c7459844000000       | mov                 dword ptr [ebp - 0x68], 0x44
            //   c7459c00000000       | mov                 dword ptr [ebp - 0x64], 0
            //   c745a400000000       | mov                 dword ptr [ebp - 0x5c], 0
            //   c745a000000000       | mov                 dword ptr [ebp - 0x60], 0
            //   c745b400000000       | mov                 dword ptr [ebp - 0x4c], 0
            //   8b45b4               | mov                 eax, dword ptr [ebp - 0x4c]

        $sequence_6 = { 0fbe11 83fa64 7536 8b4508 c70002000000 8b4de8 }
            // n = 6, score = 100
            //   0fbe11               | movsx               edx, byte ptr [ecx]
            //   83fa64               | cmp                 edx, 0x64
            //   7536                 | jne                 0x38
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   c70002000000         | mov                 dword ptr [eax], 2
            //   8b4de8               | mov                 ecx, dword ptr [ebp - 0x18]

        $sequence_7 = { 8dbdf0feffff f3ab c785ecfeffff00000000 f8 }
            // n = 4, score = 100
            //   8dbdf0feffff         | lea                 edi, dword ptr [ebp - 0x110]
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   c785ecfeffff00000000     | mov    dword ptr [ebp - 0x114], 0
            //   f8                   | clc                 

        $sequence_8 = { b940000000 33c0 8dbdf0feffff f3ab }
            // n = 4, score = 100
            //   b940000000           | mov                 ecx, 0x40
            //   33c0                 | xor                 eax, eax
            //   8dbdf0feffff         | lea                 edi, dword ptr [ebp - 0x110]
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax

        $sequence_9 = { 51 e8???????? 83c40c 0f8e07000000 }
            // n = 4, score = 100
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   0f8e07000000         | jle                 0xd

    condition:
        7 of them and filesize < 114688
}