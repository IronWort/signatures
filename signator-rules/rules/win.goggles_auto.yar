rule win_goggles_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.goggles."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.goggles"
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
        $sequence_0 = { 4f 8bcd c1e902 f3a5 8bcd 8d94247c010000 83e103 }
            // n = 7, score = 100
            //   4f                   | dec                 edi
            //   8bcd                 | mov                 ecx, ebp
            //   c1e902               | shr                 ecx, 2
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   8bcd                 | mov                 ecx, ebp
            //   8d94247c010000       | lea                 edx, dword ptr [esp + 0x17c]
            //   83e103               | and                 ecx, 3

        $sequence_1 = { 8d84242c010000 83e103 68???????? f3a4 50 ff15???????? }
            // n = 6, score = 100
            //   8d84242c010000       | lea                 eax, dword ptr [esp + 0x12c]
            //   83e103               | and                 ecx, 3
            //   68????????           |                     
            //   f3a4                 | rep movsb           byte ptr es:[edi], byte ptr [esi]
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_2 = { 57 8bfa f2ae 8b442418 }
            // n = 4, score = 100
            //   57                   | push                edi
            //   8bfa                 | mov                 edi, edx
            //   f2ae                 | repne scasb         al, byte ptr es:[edi]
            //   8b442418             | mov                 eax, dword ptr [esp + 0x18]

        $sequence_3 = { 8a8910400010 884c1efd 8a442fff 8a4c2ffe c1f806 83e10f 83e003 }
            // n = 7, score = 100
            //   8a8910400010         | mov                 cl, byte ptr [ecx + 0x10004010]
            //   884c1efd             | mov                 byte ptr [esi + ebx - 3], cl
            //   8a442fff             | mov                 al, byte ptr [edi + ebp - 1]
            //   8a4c2ffe             | mov                 cl, byte ptr [edi + ebp - 2]
            //   c1f806               | sar                 eax, 6
            //   83e10f               | and                 ecx, 0xf
            //   83e003               | and                 eax, 3

        $sequence_4 = { ffd6 6801000080 ffd6 8a442478 84c0 }
            // n = 5, score = 100
            //   ffd6                 | call                esi
            //   6801000080           | push                0x80000001
            //   ffd6                 | call                esi
            //   8a442478             | mov                 al, byte ptr [esp + 0x78]
            //   84c0                 | test                al, al

        $sequence_5 = { 8bb4242c060000 6a00 6800000080 6a00 6a00 56 55 }
            // n = 7, score = 100
            //   8bb4242c060000       | mov                 esi, dword ptr [esp + 0x62c]
            //   6a00                 | push                0
            //   6800000080           | push                0x80000000
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   56                   | push                esi
            //   55                   | push                ebp

        $sequence_6 = { 50 51 ff15???????? 8d54240c 52 ff15???????? 8b2d???????? }
            // n = 7, score = 100
            //   50                   | push                eax
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   8d54240c             | lea                 edx, dword ptr [esp + 0xc]
            //   52                   | push                edx
            //   ff15????????         |                     
            //   8b2d????????         |                     

        $sequence_7 = { 8d842488010000 68???????? 50 ff15???????? 83c414 e9???????? 8d4c2478 }
            // n = 7, score = 100
            //   8d842488010000       | lea                 eax, dword ptr [esp + 0x188]
            //   68????????           |                     
            //   50                   | push                eax
            //   ff15????????         |                     
            //   83c414               | add                 esp, 0x14
            //   e9????????           |                     
            //   8d4c2478             | lea                 ecx, dword ptr [esp + 0x78]

        $sequence_8 = { 68???????? ff15???????? 8a4c2b02 2d???????? 0ac8 }
            // n = 5, score = 100
            //   68????????           |                     
            //   ff15????????         |                     
            //   8a4c2b02             | mov                 cl, byte ptr [ebx + ebp + 2]
            //   2d????????           |                     
            //   0ac8                 | or                  cl, al

        $sequence_9 = { ff15???????? 8bcb 8bf0 8bd1 33c0 8bfe 53 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   8bcb                 | mov                 ecx, ebx
            //   8bf0                 | mov                 esi, eax
            //   8bd1                 | mov                 edx, ecx
            //   33c0                 | xor                 eax, eax
            //   8bfe                 | mov                 edi, esi
            //   53                   | push                ebx

    condition:
        7 of them and filesize < 57344
}