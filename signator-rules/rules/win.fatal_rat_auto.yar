rule win_fatal_rat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.fatal_rat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.fatal_rat"
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
        $sequence_0 = { 740d 837d1404 7407 c745e00c000000 ff7508 8d8564fbffff 50 }
            // n = 7, score = 100
            //   740d                 | je                  0xf
            //   837d1404             | cmp                 dword ptr [ebp + 0x14], 4
            //   7407                 | je                  9
            //   c745e00c000000       | mov                 dword ptr [ebp - 0x20], 0xc
            //   ff7508               | push                dword ptr [ebp + 8]
            //   8d8564fbffff         | lea                 eax, dword ptr [ebp - 0x49c]
            //   50                   | push                eax

        $sequence_1 = { 83c41c 8bf8 6a64 ff15???????? a1???????? 83f803 7405 }
            // n = 7, score = 100
            //   83c41c               | add                 esp, 0x1c
            //   8bf8                 | mov                 edi, eax
            //   6a64                 | push                0x64
            //   ff15????????         |                     
            //   a1????????           |                     
            //   83f803               | cmp                 eax, 3
            //   7405                 | je                  7

        $sequence_2 = { 56 ff15???????? 8d8598feffff 50 e8???????? 85c0 59 }
            // n = 7, score = 100
            //   56                   | push                esi
            //   ff15????????         |                     
            //   8d8598feffff         | lea                 eax, dword ptr [ebp - 0x168]
            //   50                   | push                eax
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   59                   | pop                 ecx

        $sequence_3 = { 85c0 0f84b1000000 68???????? 50 ff15???????? 8945e8 }
            // n = 6, score = 100
            //   85c0                 | test                eax, eax
            //   0f84b1000000         | je                  0xb7
            //   68????????           |                     
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8945e8               | mov                 dword ptr [ebp - 0x18], eax

        $sequence_4 = { 8d85c0feffff 68???????? 50 ff15???????? 83c40c 8d45fc }
            // n = 6, score = 100
            //   8d85c0feffff         | lea                 eax, dword ptr [ebp - 0x140]
            //   68????????           |                     
            //   50                   | push                eax
            //   ff15????????         |                     
            //   83c40c               | add                 esp, 0xc
            //   8d45fc               | lea                 eax, dword ptr [ebp - 4]

        $sequence_5 = { c645e378 c645e474 c645e520 c645e63e 885de7 ff15???????? 3bc3 }
            // n = 7, score = 100
            //   c645e378             | mov                 byte ptr [ebp - 0x1d], 0x78
            //   c645e474             | mov                 byte ptr [ebp - 0x1c], 0x74
            //   c645e520             | mov                 byte ptr [ebp - 0x1b], 0x20
            //   c645e63e             | mov                 byte ptr [ebp - 0x1a], 0x3e
            //   885de7               | mov                 byte ptr [ebp - 0x19], bl
            //   ff15????????         |                     
            //   3bc3                 | cmp                 eax, ebx

        $sequence_6 = { 68???????? 56 ff15???????? 8d45ac 50 e8???????? }
            // n = 6, score = 100
            //   68????????           |                     
            //   56                   | push                esi
            //   ff15????????         |                     
            //   8d45ac               | lea                 eax, dword ptr [ebp - 0x54]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_7 = { 85f6 759a 8d4dcc e8???????? 8d4d08 e8???????? 50 }
            // n = 7, score = 100
            //   85f6                 | test                esi, esi
            //   759a                 | jne                 0xffffff9c
            //   8d4dcc               | lea                 ecx, dword ptr [ebp - 0x34]
            //   e8????????           |                     
            //   8d4d08               | lea                 ecx, dword ptr [ebp + 8]
            //   e8????????           |                     
            //   50                   | push                eax

        $sequence_8 = { 33db a5 a5 53 8d8520feffff 6a2e 50 }
            // n = 7, score = 100
            //   33db                 | xor                 ebx, ebx
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]
            //   53                   | push                ebx
            //   8d8520feffff         | lea                 eax, dword ptr [ebp - 0x1e0]
            //   6a2e                 | push                0x2e
            //   50                   | push                eax

        $sequence_9 = { 57 e8???????? 59 8bf0 56 53 893e }
            // n = 7, score = 100
            //   57                   | push                edi
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   8bf0                 | mov                 esi, eax
            //   56                   | push                esi
            //   53                   | push                ebx
            //   893e                 | mov                 dword ptr [esi], edi

    condition:
        7 of them and filesize < 344064
}