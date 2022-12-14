rule win_cheesetray_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.cheesetray."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.cheesetray"
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
        $sequence_0 = { 8b3c24 83c404 57 bf8f453f4f 81e7e24be47e e9???????? 8b1c24 }
            // n = 7, score = 100
            //   8b3c24               | mov                 edi, dword ptr [esp]
            //   83c404               | add                 esp, 4
            //   57                   | push                edi
            //   bf8f453f4f           | mov                 edi, 0x4f3f458f
            //   81e7e24be47e         | and                 edi, 0x7ee44be2
            //   e9????????           |                     
            //   8b1c24               | mov                 ebx, dword ptr [esp]

        $sequence_1 = { bf00020000 81cf28000000 81f728000000 29c7 01e8 bf00040000 81e700040000 }
            // n = 7, score = 100
            //   bf00020000           | mov                 edi, 0x200
            //   81cf28000000         | or                  edi, 0x28
            //   81f728000000         | xor                 edi, 0x28
            //   29c7                 | sub                 edi, eax
            //   01e8                 | add                 eax, ebp
            //   bf00040000           | mov                 edi, 0x400
            //   81e700040000         | and                 edi, 0x400

        $sequence_2 = { e9???????? 81c36f58ef37 58 83ec04 890c24 c7042421cb6907 891c24 }
            // n = 7, score = 100
            //   e9????????           |                     
            //   81c36f58ef37         | add                 ebx, 0x37ef586f
            //   58                   | pop                 eax
            //   83ec04               | sub                 esp, 4
            //   890c24               | mov                 dword ptr [esp], ecx
            //   c7042421cb6907       | mov                 dword ptr [esp], 0x769cb21
            //   891c24               | mov                 dword ptr [esp], ebx

        $sequence_3 = { e9???????? 29fe 81ee5bfbef7c 5f 873424 8b2424 890c24 }
            // n = 7, score = 100
            //   e9????????           |                     
            //   29fe                 | sub                 esi, edi
            //   81ee5bfbef7c         | sub                 esi, 0x7ceffb5b
            //   5f                   | pop                 edi
            //   873424               | xchg                dword ptr [esp], esi
            //   8b2424               | mov                 esp, dword ptr [esp]
            //   890c24               | mov                 dword ptr [esp], ecx

        $sequence_4 = { bf00000000 81c600040000 21c6 89ee b801000000 09f8 2dffff0000 }
            // n = 7, score = 100
            //   bf00000000           | mov                 edi, 0
            //   81c600040000         | add                 esi, 0x400
            //   21c6                 | and                 esi, eax
            //   89ee                 | mov                 esi, ebp
            //   b801000000           | mov                 eax, 1
            //   09f8                 | or                  eax, edi
            //   2dffff0000           | sub                 eax, 0xffff

        $sequence_5 = { be5e14e256 09f0 5e e9???????? 35218bf33f e9???????? 8b1c24 }
            // n = 7, score = 100
            //   be5e14e256           | mov                 esi, 0x56e2145e
            //   09f0                 | or                  eax, esi
            //   5e                   | pop                 esi
            //   e9????????           |                     
            //   35218bf33f           | xor                 eax, 0x3ff38b21
            //   e9????????           |                     
            //   8b1c24               | mov                 ebx, dword ptr [esp]

        $sequence_6 = { f7d5 81ed37513e6f 81c54d0a5c47 81ed1808bc1b 81ed1af5617c 01ef 5d }
            // n = 7, score = 100
            //   f7d5                 | not                 ebp
            //   81ed37513e6f         | sub                 ebp, 0x6f3e5137
            //   81c54d0a5c47         | add                 ebp, 0x475c0a4d
            //   81ed1808bc1b         | sub                 ebp, 0x1bbc0818
            //   81ed1af5617c         | sub                 ebp, 0x7c61f51a
            //   01ef                 | add                 edi, ebp
            //   5d                   | pop                 ebp

        $sequence_7 = { e9???????? f7d6 313424 e9???????? 5a 81c2f0512a4f 89d6 }
            // n = 7, score = 100
            //   e9????????           |                     
            //   f7d6                 | not                 esi
            //   313424               | xor                 dword ptr [esp], esi
            //   e9????????           |                     
            //   5a                   | pop                 edx
            //   81c2f0512a4f         | add                 edx, 0x4f2a51f0
            //   89d6                 | mov                 esi, edx

        $sequence_8 = { bf0a000000 be00040000 89ee 81c780000000 81e7ffff0000 ba00020000 81e728000000 }
            // n = 7, score = 100
            //   bf0a000000           | mov                 edi, 0xa
            //   be00040000           | mov                 esi, 0x400
            //   89ee                 | mov                 esi, ebp
            //   81c780000000         | add                 edi, 0x80
            //   81e7ffff0000         | and                 edi, 0xffff
            //   ba00020000           | mov                 edx, 0x200
            //   81e728000000         | and                 edi, 0x28

        $sequence_9 = { c745d052004e00 c745d445004c00 c745d833003200 c745dc2e004400 c745e04c004c00 66894de4 e8???????? }
            // n = 7, score = 100
            //   c745d052004e00       | mov                 dword ptr [ebp - 0x30], 0x4e0052
            //   c745d445004c00       | mov                 dword ptr [ebp - 0x2c], 0x4c0045
            //   c745d833003200       | mov                 dword ptr [ebp - 0x28], 0x320033
            //   c745dc2e004400       | mov                 dword ptr [ebp - 0x24], 0x44002e
            //   c745e04c004c00       | mov                 dword ptr [ebp - 0x20], 0x4c004c
            //   66894de4             | mov                 word ptr [ebp - 0x1c], cx
            //   e8????????           |                     

    condition:
        7 of them and filesize < 8626176
}