rule win_backbend_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.backbend."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.backbend"
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
        $sequence_0 = { ffd3 8d8500feffff 6800010000 50 }
            // n = 4, score = 100
            //   ffd3                 | call                ebx
            //   8d8500feffff         | lea                 eax, dword ptr [ebp - 0x200]
            //   6800010000           | push                0x100
            //   50                   | push                eax

        $sequence_1 = { 8d8500ffffff 50 ff15???????? 85c0 7416 8d8500fbffff }
            // n = 6, score = 100
            //   8d8500ffffff         | lea                 eax, dword ptr [ebp - 0x100]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7416                 | je                  0x18
            //   8d8500fbffff         | lea                 eax, dword ptr [ebp - 0x500]

        $sequence_2 = { 50 e8???????? 8d8500ffffff 50 8d8500f9ffff }
            // n = 5, score = 100
            //   50                   | push                eax
            //   e8????????           |                     
            //   8d8500ffffff         | lea                 eax, dword ptr [ebp - 0x100]
            //   50                   | push                eax
            //   8d8500f9ffff         | lea                 eax, dword ptr [ebp - 0x700]

        $sequence_3 = { 8d45f0 c745d801000000 66c745dc0500 50 8d45ac }
            // n = 5, score = 100
            //   8d45f0               | lea                 eax, dword ptr [ebp - 0x10]
            //   c745d801000000       | mov                 dword ptr [ebp - 0x28], 1
            //   66c745dc0500         | mov                 word ptr [ebp - 0x24], 5
            //   50                   | push                eax
            //   8d45ac               | lea                 eax, dword ptr [ebp - 0x54]

        $sequence_4 = { 85c0 751d 6830750000 ffd6 8d8500feffff 50 }
            // n = 6, score = 100
            //   85c0                 | test                eax, eax
            //   751d                 | jne                 0x1f
            //   6830750000           | push                0x7530
            //   ffd6                 | call                esi
            //   8d8500feffff         | lea                 eax, dword ptr [ebp - 0x200]
            //   50                   | push                eax

        $sequence_5 = { 51 57 50 e8???????? 85c0 751d 6830750000 }
            // n = 7, score = 100
            //   51                   | push                ecx
            //   57                   | push                edi
            //   50                   | push                eax
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   751d                 | jne                 0x1f
            //   6830750000           | push                0x7530

        $sequence_6 = { 50 e8???????? 85c0 751d 6830750000 ffd6 }
            // n = 6, score = 100
            //   50                   | push                eax
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   751d                 | jne                 0x1f
            //   6830750000           | push                0x7530
            //   ffd6                 | call                esi

        $sequence_7 = { c605????????4b c605????????43 ff15???????? 8bf0 68???????? }
            // n = 5, score = 100
            //   c605????????4b       |                     
            //   c605????????43       |                     
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   68????????           |                     

        $sequence_8 = { c605????????4b c605????????43 ff15???????? 8bf0 }
            // n = 4, score = 100
            //   c605????????4b       |                     
            //   c605????????43       |                     
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax

        $sequence_9 = { 8d8500fdffff 50 e8???????? 59 6a00 56 }
            // n = 6, score = 100
            //   8d8500fdffff         | lea                 eax, dword ptr [ebp - 0x300]
            //   50                   | push                eax
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   6a00                 | push                0
            //   56                   | push                esi

    condition:
        7 of them and filesize < 49152
}