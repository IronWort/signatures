rule win_icefog_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.icefog."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.icefog"
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
        $sequence_0 = { 8b5508 0f94c1 8d0c8d0a000000 51 8b4b18 56 50 }
            // n = 7, score = 200
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   0f94c1               | sete                cl
            //   8d0c8d0a000000       | lea                 ecx, dword ptr [ecx*4 + 0xa]
            //   51                   | push                ecx
            //   8b4b18               | mov                 ecx, dword ptr [ebx + 0x18]
            //   56                   | push                esi
            //   50                   | push                eax

        $sequence_1 = { eb2b 8b4508 6a00 8d55f8 52 50 57 }
            // n = 7, score = 200
            //   eb2b                 | jmp                 0x2d
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   6a00                 | push                0
            //   8d55f8               | lea                 edx, dword ptr [ebp - 8]
            //   52                   | push                edx
            //   50                   | push                eax
            //   57                   | push                edi

        $sequence_2 = { e8???????? 83c410 5f 33c0 5b 5d c3 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   5f                   | pop                 edi
            //   33c0                 | xor                 eax, eax
            //   5b                   | pop                 ebx
            //   5d                   | pop                 ebp
            //   c3                   | ret                 

        $sequence_3 = { e9???????? 6a01 56 e8???????? 83c408 898538ffffff 85c0 }
            // n = 7, score = 200
            //   e9????????           |                     
            //   6a01                 | push                1
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   898538ffffff         | mov                 dword ptr [ebp - 0xc8], eax
            //   85c0                 | test                eax, eax

        $sequence_4 = { e8???????? 894370 39bea4af0600 7407 c745f000000005 56 e8???????? }
            // n = 7, score = 200
            //   e8????????           |                     
            //   894370               | mov                 dword ptr [ebx + 0x70], eax
            //   39bea4af0600         | cmp                 dword ptr [esi + 0x6afa4], edi
            //   7407                 | je                  9
            //   c745f000000005       | mov                 dword ptr [ebp - 0x10], 0x5000000
            //   56                   | push                esi
            //   e8????????           |                     

        $sequence_5 = { eb02 33f6 391e 754d 395e04 7548 395e18 }
            // n = 7, score = 200
            //   eb02                 | jmp                 4
            //   33f6                 | xor                 esi, esi
            //   391e                 | cmp                 dword ptr [esi], ebx
            //   754d                 | jne                 0x4f
            //   395e04               | cmp                 dword ptr [esi + 4], ebx
            //   7548                 | jne                 0x4a
            //   395e18               | cmp                 dword ptr [esi + 0x18], ebx

        $sequence_6 = { 8b4e38 833900 8945fc 7519 8b467c 8b0b 50 }
            // n = 7, score = 200
            //   8b4e38               | mov                 ecx, dword ptr [esi + 0x38]
            //   833900               | cmp                 dword ptr [ecx], 0
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   7519                 | jne                 0x1b
            //   8b467c               | mov                 eax, dword ptr [esi + 0x7c]
            //   8b0b                 | mov                 ecx, dword ptr [ebx]
            //   50                   | push                eax

        $sequence_7 = { ba01000000 6689500c 8b0e 4f 8908 83c028 85ff }
            // n = 7, score = 200
            //   ba01000000           | mov                 edx, 1
            //   6689500c             | mov                 word ptr [eax + 0xc], dx
            //   8b0e                 | mov                 ecx, dword ptr [esi]
            //   4f                   | dec                 edi
            //   8908                 | mov                 dword ptr [eax], ecx
            //   83c028               | add                 eax, 0x28
            //   85ff                 | test                edi, edi

        $sequence_8 = { 8b5720 51 0fb6c0 52 50 53 e8???????? }
            // n = 7, score = 200
            //   8b5720               | mov                 edx, dword ptr [edi + 0x20]
            //   51                   | push                ecx
            //   0fb6c0               | movzx               eax, al
            //   52                   | push                edx
            //   50                   | push                eax
            //   53                   | push                ebx
            //   e8????????           |                     

        $sequence_9 = { 8b4604 0fbe4e01 d1ea 52 50 6a00 51 }
            // n = 7, score = 200
            //   8b4604               | mov                 eax, dword ptr [esi + 4]
            //   0fbe4e01             | movsx               ecx, byte ptr [esi + 1]
            //   d1ea                 | shr                 edx, 1
            //   52                   | push                edx
            //   50                   | push                eax
            //   6a00                 | push                0
            //   51                   | push                ecx

    condition:
        7 of them and filesize < 1187840
}