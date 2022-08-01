rule win_hunter_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.hunter."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.hunter"
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
        $sequence_0 = { 0000 9c 35a035a435 a835 }
            // n = 4, score = 100
            //   0000                 | add                 byte ptr [eax], al
            //   9c                   | pushfd              
            //   35a035a435           | xor                 eax, 0x35a435a0
            //   a835                 | test                al, 0x35

        $sequence_1 = { 0145f4 8d45b4 8b55f0 8b4de4 }
            // n = 4, score = 100
            //   0145f4               | add                 dword ptr [ebp - 0xc], eax
            //   8d45b4               | lea                 eax, dword ptr [ebp - 0x4c]
            //   8b55f0               | mov                 edx, dword ptr [ebp - 0x10]
            //   8b4de4               | mov                 ecx, dword ptr [ebp - 0x1c]

        $sequence_2 = { 01442428 59 11742428 85db }
            // n = 4, score = 100
            //   01442428             | add                 dword ptr [esp + 0x28], eax
            //   59                   | pop                 ecx
            //   11742428             | adc                 dword ptr [esp + 0x28], esi
            //   85db                 | test                ebx, ebx

        $sequence_3 = { 0145e8 8d838e000000 3bc2 8b45e8 }
            // n = 4, score = 100
            //   0145e8               | add                 dword ptr [ebp - 0x18], eax
            //   8d838e000000         | lea                 eax, dword ptr [ebx + 0x8e]
            //   3bc2                 | cmp                 eax, edx
            //   8b45e8               | mov                 eax, dword ptr [ebp - 0x18]

        $sequence_4 = { 01442444 53 11542444 51 }
            // n = 4, score = 100
            //   01442444             | add                 dword ptr [esp + 0x44], eax
            //   53                   | push                ebx
            //   11542444             | adc                 dword ptr [esp + 0x44], edx
            //   51                   | push                ecx

        $sequence_5 = { 0103 115304 e9???????? 8b4c241c }
            // n = 4, score = 100
            //   0103                 | add                 dword ptr [ebx], eax
            //   115304               | adc                 dword ptr [ebx + 4], edx
            //   e9????????           |                     
            //   8b4c241c             | mov                 ecx, dword ptr [esp + 0x1c]

        $sequence_6 = { 014140 89413c 899604010000 e9???????? }
            // n = 4, score = 100
            //   014140               | add                 dword ptr [ecx + 0x40], eax
            //   89413c               | mov                 dword ptr [ecx + 0x3c], eax
            //   899604010000         | mov                 dword ptr [esi + 0x104], edx
            //   e9????????           |                     

        $sequence_7 = { 00443907 8a043a 88043b 8a443a01 }
            // n = 4, score = 100
            //   00443907             | add                 byte ptr [ecx + edi + 7], al
            //   8a043a               | mov                 al, byte ptr [edx + edi]
            //   88043b               | mov                 byte ptr [ebx + edi], al
            //   8a443a01             | mov                 al, byte ptr [edx + edi + 1]

    condition:
        7 of them and filesize < 1056768
}