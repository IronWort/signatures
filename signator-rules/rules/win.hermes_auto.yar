rule win_hermes_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.hermes."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.hermes"
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
        $sequence_0 = { 56 e8???????? 59 59 8d45fc c745fc32000000 50 }
            // n = 7, score = 100
            //   56                   | push                esi
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   8d45fc               | lea                 eax, dword ptr [ebp - 4]
            //   c745fc32000000       | mov                 dword ptr [ebp - 4], 0x32
            //   50                   | push                eax

        $sequence_1 = { 6a28 56 68???????? eb29 68???????? 57 53 }
            // n = 7, score = 100
            //   6a28                 | push                0x28
            //   56                   | push                esi
            //   68????????           |                     
            //   eb29                 | jmp                 0x2b
            //   68????????           |                     
            //   57                   | push                edi
            //   53                   | push                ebx

        $sequence_2 = { 894dd8 83f803 7d2d 51 6880000000 6a02 51 }
            // n = 7, score = 100
            //   894dd8               | mov                 dword ptr [ebp - 0x28], ecx
            //   83f803               | cmp                 eax, 3
            //   7d2d                 | jge                 0x2f
            //   51                   | push                ecx
            //   6880000000           | push                0x80
            //   6a02                 | push                2
            //   51                   | push                ecx

        $sequence_3 = { 83c732 81fe10010000 72d2 68???????? }
            // n = 4, score = 100
            //   83c732               | add                 edi, 0x32
            //   81fe10010000         | cmp                 esi, 0x110
            //   72d2                 | jb                  0xffffffd4
            //   68????????           |                     

        $sequence_4 = { 6a02 895df4 ff15???????? 85c0 }
            // n = 4, score = 100
            //   6a02                 | push                2
            //   895df4               | mov                 dword ptr [ebp - 0xc], ebx
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_5 = { 83c410 8d859cfdffff 50 57 ff15???????? 85c0 }
            // n = 6, score = 100
            //   83c410               | add                 esp, 0x10
            //   8d859cfdffff         | lea                 eax, dword ptr [ebp - 0x264]
            //   50                   | push                eax
            //   57                   | push                edi
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_6 = { eb05 2bf0 8d1c72 5f 5e }
            // n = 5, score = 100
            //   eb05                 | jmp                 7
            //   2bf0                 | sub                 esi, eax
            //   8d1c72               | lea                 ebx, dword ptr [edx + esi*2]
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_7 = { 33f6 8b473c 8b443878 03c7 8b4824 8b501c 03cf }
            // n = 7, score = 100
            //   33f6                 | xor                 esi, esi
            //   8b473c               | mov                 eax, dword ptr [edi + 0x3c]
            //   8b443878             | mov                 eax, dword ptr [eax + edi + 0x78]
            //   03c7                 | add                 eax, edi
            //   8b4824               | mov                 ecx, dword ptr [eax + 0x24]
            //   8b501c               | mov                 edx, dword ptr [eax + 0x1c]
            //   03cf                 | add                 ecx, edi

        $sequence_8 = { 56 e8???????? 59 59 bef4010000 }
            // n = 5, score = 100
            //   56                   | push                esi
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   bef4010000           | mov                 esi, 0x1f4

        $sequence_9 = { 0f8585000000 6a10 56 68???????? 8d45c4 }
            // n = 5, score = 100
            //   0f8585000000         | jne                 0x8b
            //   6a10                 | push                0x10
            //   56                   | push                esi
            //   68????????           |                     
            //   8d45c4               | lea                 eax, dword ptr [ebp - 0x3c]

    condition:
        7 of them and filesize < 2113536
}