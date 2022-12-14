rule win_makloader_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.makloader."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.makloader"
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
        $sequence_0 = { c78544ebffff00000000 c78548ebffff00000000 c7854cebffff01000000 c78550ebffff80000000 }
            // n = 4, score = 200
            //   c78544ebffff00000000     | mov    dword ptr [ebp - 0x14bc], 0
            //   c78548ebffff00000000     | mov    dword ptr [ebp - 0x14b8], 0
            //   c7854cebffff01000000     | mov    dword ptr [ebp - 0x14b4], 1
            //   c78550ebffff80000000     | mov    dword ptr [ebp - 0x14b0], 0x80

        $sequence_1 = { 59 6a05 c74048c0514200 8b4508 }
            // n = 4, score = 200
            //   59                   | pop                 ecx
            //   6a05                 | push                5
            //   c74048c0514200       | mov                 dword ptr [eax + 0x48], 0x4251c0
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]

        $sequence_2 = { 89856ce6ffff e9???????? b801000000 5f }
            // n = 4, score = 200
            //   89856ce6ffff         | mov                 dword ptr [ebp - 0x1994], eax
            //   e9????????           |                     
            //   b801000000           | mov                 eax, 1
            //   5f                   | pop                 edi

        $sequence_3 = { e8???????? 8bc8 e8???????? 50 68???????? ff15???????? 0fb69503e6ffff }
            // n = 7, score = 200
            //   e8????????           |                     
            //   8bc8                 | mov                 ecx, eax
            //   e8????????           |                     
            //   50                   | push                eax
            //   68????????           |                     
            //   ff15????????         |                     
            //   0fb69503e6ffff       | movzx               edx, byte ptr [ebp - 0x19fd]

        $sequence_4 = { 50 8d4db0 51 e8???????? 83c414 8d55b0 899550e6ffff }
            // n = 7, score = 200
            //   50                   | push                eax
            //   8d4db0               | lea                 ecx, dword ptr [ebp - 0x50]
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c414               | add                 esp, 0x14
            //   8d55b0               | lea                 edx, dword ptr [ebp - 0x50]
            //   899550e6ffff         | mov                 dword ptr [ebp - 0x19b0], edx

        $sequence_5 = { c705????????01000000 c78540e6ffff00000000 0fb685cae5ffff 50 }
            // n = 4, score = 200
            //   c705????????01000000     |     
            //   c78540e6ffff00000000     | mov    dword ptr [ebp - 0x19c0], 0
            //   0fb685cae5ffff       | movzx               eax, byte ptr [ebp - 0x1a36]
            //   50                   | push                eax

        $sequence_6 = { 50 e8???????? 83c410 89856ce6ffff 83bd6ce6ffff00 0f848f010000 8b8528e6ffff }
            // n = 7, score = 200
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   89856ce6ffff         | mov                 dword ptr [ebp - 0x1994], eax
            //   83bd6ce6ffff00       | cmp                 dword ptr [ebp - 0x1994], 0
            //   0f848f010000         | je                  0x195
            //   8b8528e6ffff         | mov                 eax, dword ptr [ebp - 0x19d8]

        $sequence_7 = { e8???????? 8b45f4 50 8b4de4 51 }
            // n = 5, score = 200
            //   e8????????           |                     
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   50                   | push                eax
            //   8b4de4               | mov                 ecx, dword ptr [ebp - 0x1c]
            //   51                   | push                ecx

        $sequence_8 = { 8b4c0dc0 234c1dc0 33d7 33c1 b908000000 c1e100 bf08000000 }
            // n = 7, score = 200
            //   8b4c0dc0             | mov                 ecx, dword ptr [ebp + ecx - 0x40]
            //   234c1dc0             | and                 ecx, dword ptr [ebp + ebx - 0x40]
            //   33d7                 | xor                 edx, edi
            //   33c1                 | xor                 eax, ecx
            //   b908000000           | mov                 ecx, 8
            //   c1e100               | shl                 ecx, 0
            //   bf08000000           | mov                 edi, 8

        $sequence_9 = { 40 83f81d 7cf1 eb07 8b0cc5ec244200 894de4 }
            // n = 6, score = 200
            //   40                   | inc                 eax
            //   83f81d               | cmp                 eax, 0x1d
            //   7cf1                 | jl                  0xfffffff3
            //   eb07                 | jmp                 9
            //   8b0cc5ec244200       | mov                 ecx, dword ptr [eax*8 + 0x4224ec]
            //   894de4               | mov                 dword ptr [ebp - 0x1c], ecx

    condition:
        7 of them and filesize < 335872
}