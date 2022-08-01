rule win_computrace_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.computrace."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.computrace"
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
        $sequence_0 = { 8b4618 57 0fb708 51 83c004 50 }
            // n = 6, score = 200
            //   8b4618               | mov                 eax, dword ptr [esi + 0x18]
            //   57                   | push                edi
            //   0fb708               | movzx               ecx, word ptr [eax]
            //   51                   | push                ecx
            //   83c004               | add                 eax, 4
            //   50                   | push                eax

        $sequence_1 = { ff5614 6a04 8d45fc 50 6a05 }
            // n = 5, score = 200
            //   ff5614               | call                dword ptr [esi + 0x14]
            //   6a04                 | push                4
            //   8d45fc               | lea                 eax, dword ptr [ebp - 4]
            //   50                   | push                eax
            //   6a05                 | push                5

        $sequence_2 = { 8b450c 03c7 53 51 50 56 e8???????? }
            // n = 7, score = 200
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   03c7                 | add                 eax, edi
            //   53                   | push                ebx
            //   51                   | push                ecx
            //   50                   | push                eax
            //   56                   | push                esi
            //   e8????????           |                     

        $sequence_3 = { 8986481b0000 57 8d86181b0000 50 898e141b0000 ff15???????? }
            // n = 6, score = 200
            //   8986481b0000         | mov                 dword ptr [esi + 0x1b48], eax
            //   57                   | push                edi
            //   8d86181b0000         | lea                 eax, dword ptr [esi + 0x1b18]
            //   50                   | push                eax
            //   898e141b0000         | mov                 dword ptr [esi + 0x1b14], ecx
            //   ff15????????         |                     

        $sequence_4 = { 85f6 7403 56 ffd3 55 ff15???????? 5f }
            // n = 7, score = 200
            //   85f6                 | test                esi, esi
            //   7403                 | je                  5
            //   56                   | push                esi
            //   ffd3                 | call                ebx
            //   55                   | push                ebp
            //   ff15????????         |                     
            //   5f                   | pop                 edi

        $sequence_5 = { 8945d8 837dd8ff 743e 837dd800 }
            // n = 4, score = 200
            //   8945d8               | mov                 dword ptr [ebp - 0x28], eax
            //   837dd8ff             | cmp                 dword ptr [ebp - 0x28], -1
            //   743e                 | je                  0x40
            //   837dd800             | cmp                 dword ptr [ebp - 0x28], 0

        $sequence_6 = { 56 57 8b7d08 48 48 }
            // n = 5, score = 200
            //   56                   | push                esi
            //   57                   | push                edi
            //   8b7d08               | mov                 edi, dword ptr [ebp + 8]
            //   48                   | dec                 eax
            //   48                   | dec                 eax

        $sequence_7 = { 0f84bd000000 68???????? 53 ffd6 8945d4 85c0 }
            // n = 6, score = 200
            //   0f84bd000000         | je                  0xc3
            //   68????????           |                     
            //   53                   | push                ebx
            //   ffd6                 | call                esi
            //   8945d4               | mov                 dword ptr [ebp - 0x2c], eax
            //   85c0                 | test                eax, eax

        $sequence_8 = { ff15???????? c20c00 6844020000 68???????? e8???????? 33ff 897de4 }
            // n = 7, score = 200
            //   ff15????????         |                     
            //   c20c00               | ret                 0xc
            //   6844020000           | push                0x244
            //   68????????           |                     
            //   e8????????           |                     
            //   33ff                 | xor                 edi, edi
            //   897de4               | mov                 dword ptr [ebp - 0x1c], edi

        $sequence_9 = { 50 53 6a28 e8???????? }
            // n = 4, score = 200
            //   50                   | push                eax
            //   53                   | push                ebx
            //   6a28                 | push                0x28
            //   e8????????           |                     

    condition:
        7 of them and filesize < 73728
}