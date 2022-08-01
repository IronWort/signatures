rule win_rarstar_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.rarstar."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.rarstar"
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
        $sequence_0 = { 8365f400 8365f800 8365fc00 c745f066254000 8965f4 896df8 64a100000000 }
            // n = 7, score = 100
            //   8365f400             | and                 dword ptr [ebp - 0xc], 0
            //   8365f800             | and                 dword ptr [ebp - 8], 0
            //   8365fc00             | and                 dword ptr [ebp - 4], 0
            //   c745f066254000       | mov                 dword ptr [ebp - 0x10], 0x402566
            //   8965f4               | mov                 dword ptr [ebp - 0xc], esp
            //   896df8               | mov                 dword ptr [ebp - 8], ebp
            //   64a100000000         | mov                 eax, dword ptr fs:[0]

        $sequence_1 = { 7429 84d2 7425 0fb6d2 f682a1d8400004 740c }
            // n = 6, score = 100
            //   7429                 | je                  0x2b
            //   84d2                 | test                dl, dl
            //   7425                 | je                  0x27
            //   0fb6d2               | movzx               edx, dl
            //   f682a1d8400004       | test                byte ptr [edx + 0x40d8a1], 4
            //   740c                 | je                  0xe

        $sequence_2 = { 8b542414 56 52 6a01 53 }
            // n = 5, score = 100
            //   8b542414             | mov                 edx, dword ptr [esp + 0x14]
            //   56                   | push                esi
            //   52                   | push                edx
            //   6a01                 | push                1
            //   53                   | push                ebx

        $sequence_3 = { f3a5 8b442418 8bca 83c404 }
            // n = 4, score = 100
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   8b442418             | mov                 eax, dword ptr [esp + 0x18]
            //   8bca                 | mov                 ecx, edx
            //   83c404               | add                 esp, 4

        $sequence_4 = { b941000000 33c0 8d7c2414 8d942418010000 }
            // n = 4, score = 100
            //   b941000000           | mov                 ecx, 0x41
            //   33c0                 | xor                 eax, eax
            //   8d7c2414             | lea                 edi, dword ptr [esp + 0x14]
            //   8d942418010000       | lea                 edx, dword ptr [esp + 0x118]

        $sequence_5 = { 81ce00ffffff 46 89b42424030000 8a10 8d743420 }
            // n = 5, score = 100
            //   81ce00ffffff         | or                  esi, 0xffffff00
            //   46                   | inc                 esi
            //   89b42424030000       | mov                 dword ptr [esp + 0x324], esi
            //   8a10                 | mov                 dl, byte ptr [eax]
            //   8d743420             | lea                 esi, dword ptr [esp + esi + 0x20]

        $sequence_6 = { 50 68???????? 57 895c241c }
            // n = 4, score = 100
            //   50                   | push                eax
            //   68????????           |                     
            //   57                   | push                edi
            //   895c241c             | mov                 dword ptr [esp + 0x1c], ebx

        $sequence_7 = { 8d942420030000 53 52 f3ab ffd5 }
            // n = 5, score = 100
            //   8d942420030000       | lea                 edx, dword ptr [esp + 0x320]
            //   53                   | push                ebx
            //   52                   | push                edx
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   ffd5                 | call                ebp

        $sequence_8 = { 8b842438030000 68???????? 50 e8???????? 8b8c2444030000 }
            // n = 5, score = 100
            //   8b842438030000       | mov                 eax, dword ptr [esp + 0x338]
            //   68????????           |                     
            //   50                   | push                eax
            //   e8????????           |                     
            //   8b8c2444030000       | mov                 ecx, dword ptr [esp + 0x344]

        $sequence_9 = { 8d4c2424 51 8d942484000000 6800100000 52 50 ffd5 }
            // n = 7, score = 100
            //   8d4c2424             | lea                 ecx, dword ptr [esp + 0x24]
            //   51                   | push                ecx
            //   8d942484000000       | lea                 edx, dword ptr [esp + 0x84]
            //   6800100000           | push                0x1000
            //   52                   | push                edx
            //   50                   | push                eax
            //   ffd5                 | call                ebp

    condition:
        7 of them and filesize < 122880
}