rule win_asprox_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.asprox."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.asprox"
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
        $sequence_0 = { c645eb00 6800100000 6a00 a1???????? 50 ff15???????? }
            // n = 6, score = 1200
            //   c645eb00             | mov                 byte ptr [ebp - 0x15], 0
            //   6800100000           | push                0x1000
            //   6a00                 | push                0
            //   a1????????           |                     
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_1 = { 7407 33c0 e9???????? 3bd3 0f858d000000 }
            // n = 5, score = 1200
            //   7407                 | je                  9
            //   33c0                 | xor                 eax, eax
            //   e9????????           |                     
            //   3bd3                 | cmp                 edx, ebx
            //   0f858d000000         | jne                 0x93

        $sequence_2 = { c78508feffff00000000 c785b8fdffff00000000 c685abfdffff00 c68567fcffff00 0fb68566fcffff 85c0 7507 }
            // n = 7, score = 1200
            //   c78508feffff00000000     | mov    dword ptr [ebp - 0x1f8], 0
            //   c785b8fdffff00000000     | mov    dword ptr [ebp - 0x248], 0
            //   c685abfdffff00       | mov                 byte ptr [ebp - 0x255], 0
            //   c68567fcffff00       | mov                 byte ptr [ebp - 0x399], 0
            //   0fb68566fcffff       | movzx               eax, byte ptr [ebp - 0x39a]
            //   85c0                 | test                eax, eax
            //   7507                 | jne                 9

        $sequence_3 = { 52 e8???????? 83c404 8b859cfdffff 83c0ff 898564fbffff 8b8d64fbffff }
            // n = 7, score = 1200
            //   52                   | push                edx
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   8b859cfdffff         | mov                 eax, dword ptr [ebp - 0x264]
            //   83c0ff               | add                 eax, -1
            //   898564fbffff         | mov                 dword ptr [ebp - 0x49c], eax
            //   8b8d64fbffff         | mov                 ecx, dword ptr [ebp - 0x49c]

        $sequence_4 = { 8b03 83780400 0f8477120000 8b10 0fb612 }
            // n = 5, score = 1200
            //   8b03                 | mov                 eax, dword ptr [ebx]
            //   83780400             | cmp                 dword ptr [eax + 4], 0
            //   0f8477120000         | je                  0x127d
            //   8b10                 | mov                 edx, dword ptr [eax]
            //   0fb612               | movzx               edx, byte ptr [edx]

        $sequence_5 = { 79d7 ff450c 817d0cff000000 0f8ed3fdffff 5f 5b }
            // n = 6, score = 1200
            //   79d7                 | jns                 0xffffffd9
            //   ff450c               | inc                 dword ptr [ebp + 0xc]
            //   817d0cff000000       | cmp                 dword ptr [ebp + 0xc], 0xff
            //   0f8ed3fdffff         | jle                 0xfffffdd9
            //   5f                   | pop                 edi
            //   5b                   | pop                 ebx

        $sequence_6 = { 898b44fa0000 8b4db0 898b48fa0000 8b4de0 898b4cfa0000 8b4d88 898b50fa0000 }
            // n = 7, score = 1200
            //   898b44fa0000         | mov                 dword ptr [ebx + 0xfa44], ecx
            //   8b4db0               | mov                 ecx, dword ptr [ebp - 0x50]
            //   898b48fa0000         | mov                 dword ptr [ebx + 0xfa48], ecx
            //   8b4de0               | mov                 ecx, dword ptr [ebp - 0x20]
            //   898b4cfa0000         | mov                 dword ptr [ebx + 0xfa4c], ecx
            //   8b4d88               | mov                 ecx, dword ptr [ebp - 0x78]
            //   898b50fa0000         | mov                 dword ptr [ebx + 0xfa50], ecx

        $sequence_7 = { 51 e8???????? 83c408 0fb6d0 85d2 745b 8d8570ffffff }
            // n = 7, score = 1200
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   0fb6d0               | movzx               edx, al
            //   85d2                 | test                edx, edx
            //   745b                 | je                  0x5d
            //   8d8570ffffff         | lea                 eax, dword ptr [ebp - 0x90]

        $sequence_8 = { 8b7324 69f6a0860100 3bd6 0f8352ffffff 8b0c91 }
            // n = 5, score = 1200
            //   8b7324               | mov                 esi, dword ptr [ebx + 0x24]
            //   69f6a0860100         | imul                esi, esi, 0x186a0
            //   3bd6                 | cmp                 edx, esi
            //   0f8352ffffff         | jae                 0xffffff58
            //   8b0c91               | mov                 ecx, dword ptr [ecx + edx*4]

        $sequence_9 = { 8b08 8b55f4 52 8b4108 ffd0 8b4dfc 51 }
            // n = 7, score = 1200
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   8b55f4               | mov                 edx, dword ptr [ebp - 0xc]
            //   52                   | push                edx
            //   8b4108               | mov                 eax, dword ptr [ecx + 8]
            //   ffd0                 | call                eax
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   51                   | push                ecx

    condition:
        7 of them and filesize < 155648
}