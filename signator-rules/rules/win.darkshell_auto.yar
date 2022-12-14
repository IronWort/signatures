rule win_darkshell_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.darkshell."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.darkshell"
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
        $sequence_0 = { 85c0 7410 ff15???????? 85c0 }
            // n = 4, score = 300
            //   85c0                 | test                eax, eax
            //   7410                 | je                  0x12
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_1 = { 7526 8b54240c 83c004 8901 83c014 }
            // n = 5, score = 300
            //   7526                 | jne                 0x28
            //   8b54240c             | mov                 edx, dword ptr [esp + 0xc]
            //   83c004               | add                 eax, 4
            //   8901                 | mov                 dword ptr [ecx], eax
            //   83c014               | add                 eax, 0x14

        $sequence_2 = { 8bf9 8b4638 8b4e54 50 51 8bcf }
            // n = 6, score = 300
            //   8bf9                 | mov                 edi, ecx
            //   8b4638               | mov                 eax, dword ptr [esi + 0x38]
            //   8b4e54               | mov                 ecx, dword ptr [esi + 0x54]
            //   50                   | push                eax
            //   51                   | push                ecx
            //   8bcf                 | mov                 ecx, edi

        $sequence_3 = { 85f6 0f84a7000000 53 55 }
            // n = 4, score = 300
            //   85f6                 | test                esi, esi
            //   0f84a7000000         | je                  0xad
            //   53                   | push                ebx
            //   55                   | push                ebp

        $sequence_4 = { 894c2420 50 c744242000000000 ff15???????? }
            // n = 4, score = 300
            //   894c2420             | mov                 dword ptr [esp + 0x20], ecx
            //   50                   | push                eax
            //   c744242000000000     | mov                 dword ptr [esp + 0x20], 0
            //   ff15????????         |                     

        $sequence_5 = { 68???????? 89442428 ffd3 8bd8 85db }
            // n = 5, score = 300
            //   68????????           |                     
            //   89442428             | mov                 dword ptr [esp + 0x28], eax
            //   ffd3                 | call                ebx
            //   8bd8                 | mov                 ebx, eax
            //   85db                 | test                ebx, ebx

        $sequence_6 = { 7447 8b842408040000 6a00 6800000004 6a00 }
            // n = 5, score = 300
            //   7447                 | je                  0x49
            //   8b842408040000       | mov                 eax, dword ptr [esp + 0x408]
            //   6a00                 | push                0
            //   6800000004           | push                0x4000000
            //   6a00                 | push                0

        $sequence_7 = { f7d1 49 51 68???????? e8???????? 8b0d???????? 83c408 }
            // n = 7, score = 300
            //   f7d1                 | not                 ecx
            //   49                   | dec                 ecx
            //   51                   | push                ecx
            //   68????????           |                     
            //   e8????????           |                     
            //   8b0d????????         |                     
            //   83c408               | add                 esp, 8

        $sequence_8 = { 8b542428 3bca 7534 66817c28fec705 7449 eb29 }
            // n = 6, score = 300
            //   8b542428             | mov                 edx, dword ptr [esp + 0x28]
            //   3bca                 | cmp                 ecx, edx
            //   7534                 | jne                 0x36
            //   66817c28fec705       | cmp                 word ptr [eax + ebp - 2], 0x5c7
            //   7449                 | je                  0x4b
            //   eb29                 | jmp                 0x2b

        $sequence_9 = { 6a00 68ff000000 6a03 6a02 }
            // n = 4, score = 300
            //   6a00                 | push                0
            //   68ff000000           | push                0xff
            //   6a03                 | push                3
            //   6a02                 | push                2

    condition:
        7 of them and filesize < 344064
}