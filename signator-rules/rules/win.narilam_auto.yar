rule win_narilam_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.narilam."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.narilam"
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
        $sequence_0 = { ff36 8b45fc 8b10 ff9288000000 8bc8 8b450c ba20000000 }
            // n = 7, score = 100
            //   ff36                 | push                dword ptr [esi]
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   8b10                 | mov                 edx, dword ptr [eax]
            //   ff9288000000         | call                dword ptr [edx + 0x88]
            //   8bc8                 | mov                 ecx, eax
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   ba20000000           | mov                 edx, 0x20

        $sequence_1 = { e8???????? 8b45fc 8bd6 e8???????? 7424 8d4378 8bd6 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   8bd6                 | mov                 edx, esi
            //   e8????????           |                     
            //   7424                 | je                  0x26
            //   8d4378               | lea                 eax, dword ptr [ebx + 0x78]
            //   8bd6                 | mov                 edx, esi

        $sequence_2 = { 8d855cffffff e8???????? ff852cffffff 8d955cffffff 8d45fc e8???????? ff8d2cffffff }
            // n = 7, score = 100
            //   8d855cffffff         | lea                 eax, dword ptr [ebp - 0xa4]
            //   e8????????           |                     
            //   ff852cffffff         | inc                 dword ptr [ebp - 0xd4]
            //   8d955cffffff         | lea                 edx, dword ptr [ebp - 0xa4]
            //   8d45fc               | lea                 eax, dword ptr [ebp - 4]
            //   e8????????           |                     
            //   ff8d2cffffff         | dec                 dword ptr [ebp - 0xd4]

        $sequence_3 = { 8bc3 e8???????? 8d7403ff eb04 c60600 4e 8a06 }
            // n = 7, score = 100
            //   8bc3                 | mov                 eax, ebx
            //   e8????????           |                     
            //   8d7403ff             | lea                 esi, dword ptr [ebx + eax - 1]
            //   eb04                 | jmp                 6
            //   c60600               | mov                 byte ptr [esi], 0
            //   4e                   | dec                 esi
            //   8a06                 | mov                 al, byte ptr [esi]

        $sequence_4 = { e8???????? f6402404 0f84aa000000 8b45f8 8b00 8b00 8945f4 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   f6402404             | test                byte ptr [eax + 0x24], 4
            //   0f84aa000000         | je                  0xb0
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax

        $sequence_5 = { e8???????? 837dd000 741f 8d55cc 8bc3 e8???????? 8b55cc }
            // n = 7, score = 100
            //   e8????????           |                     
            //   837dd000             | cmp                 dword ptr [ebp - 0x30], 0
            //   741f                 | je                  0x21
            //   8d55cc               | lea                 edx, dword ptr [ebp - 0x34]
            //   8bc3                 | mov                 eax, ebx
            //   e8????????           |                     
            //   8b55cc               | mov                 edx, dword ptr [ebp - 0x34]

        $sequence_6 = { ffb548feffff ffb544feffff 8d8540feffff e8???????? 50 8b45f8 50 }
            // n = 7, score = 100
            //   ffb548feffff         | push                dword ptr [ebp - 0x1b8]
            //   ffb544feffff         | push                dword ptr [ebp - 0x1bc]
            //   8d8540feffff         | lea                 eax, dword ptr [ebp - 0x1c0]
            //   e8????????           |                     
            //   50                   | push                eax
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   50                   | push                eax

        $sequence_7 = { e8???????? 66c745ec0800 6a00 ff750c ff7508 e8???????? 83c40c }
            // n = 7, score = 100
            //   e8????????           |                     
            //   66c745ec0800         | mov                 word ptr [ebp - 0x14], 8
            //   6a00                 | push                0
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc

        $sequence_8 = { ff8de8feffff 8d459c ba02000000 e8???????? 66c785dcfeffff0401 ba???????? 8d4598 }
            // n = 7, score = 100
            //   ff8de8feffff         | dec                 dword ptr [ebp - 0x118]
            //   8d459c               | lea                 eax, dword ptr [ebp - 0x64]
            //   ba02000000           | mov                 edx, 2
            //   e8????????           |                     
            //   66c785dcfeffff0401     | mov    word ptr [ebp - 0x124], 0x104
            //   ba????????           |                     
            //   8d4598               | lea                 eax, dword ptr [ebp - 0x68]

        $sequence_9 = { b8000000c0 ba01000000 b903000000 c7461c80054800 c74624cc054800 c746207c054800 807e4800 }
            // n = 7, score = 100
            //   b8000000c0           | mov                 eax, 0xc0000000
            //   ba01000000           | mov                 edx, 1
            //   b903000000           | mov                 ecx, 3
            //   c7461c80054800       | mov                 dword ptr [esi + 0x1c], 0x480580
            //   c74624cc054800       | mov                 dword ptr [esi + 0x24], 0x4805cc
            //   c746207c054800       | mov                 dword ptr [esi + 0x20], 0x48057c
            //   807e4800             | cmp                 byte ptr [esi + 0x48], 0

    condition:
        7 of them and filesize < 3325952
}