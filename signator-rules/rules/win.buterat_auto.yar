rule win_buterat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.buterat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.buterat"
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
        $sequence_0 = { 88576a 8b15???????? c647650f c6476605 c6476b0a c6476c05 c6476e34 }
            // n = 7, score = 100
            //   88576a               | mov                 byte ptr [edi + 0x6a], dl
            //   8b15????????         |                     
            //   c647650f             | mov                 byte ptr [edi + 0x65], 0xf
            //   c6476605             | mov                 byte ptr [edi + 0x66], 5
            //   c6476b0a             | mov                 byte ptr [edi + 0x6b], 0xa
            //   c6476c05             | mov                 byte ptr [edi + 0x6c], 5
            //   c6476e34             | mov                 byte ptr [edi + 0x6e], 0x34

        $sequence_1 = { 2b442404 d1f8 48 c3 56 57 8bf0 }
            // n = 7, score = 100
            //   2b442404             | sub                 eax, dword ptr [esp + 4]
            //   d1f8                 | sar                 eax, 1
            //   48                   | dec                 eax
            //   c3                   | ret                 
            //   56                   | push                esi
            //   57                   | push                edi
            //   8bf0                 | mov                 esi, eax

        $sequence_2 = { 6a05 5a 3bc2 7302 8bd0 }
            // n = 5, score = 100
            //   6a05                 | push                5
            //   5a                   | pop                 edx
            //   3bc2                 | cmp                 eax, edx
            //   7302                 | jae                 4
            //   8bd0                 | mov                 edx, eax

        $sequence_3 = { 8d85b8eaffff 50 e8???????? 8b5dfc 8b85b8faffff 83c414 4b }
            // n = 7, score = 100
            //   8d85b8eaffff         | lea                 eax, dword ptr [ebp - 0x1548]
            //   50                   | push                eax
            //   e8????????           |                     
            //   8b5dfc               | mov                 ebx, dword ptr [ebp - 4]
            //   8b85b8faffff         | mov                 eax, dword ptr [ebp - 0x548]
            //   83c414               | add                 esp, 0x14
            //   4b                   | dec                 ebx

        $sequence_4 = { 8b45f4 eb12 3bf3 740b 56 53 }
            // n = 6, score = 100
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   eb12                 | jmp                 0x14
            //   3bf3                 | cmp                 esi, ebx
            //   740b                 | je                  0xd
            //   56                   | push                esi
            //   53                   | push                ebx

        $sequence_5 = { 8b3d???????? 33db 85c0 be00040000 745e 6810270000 ff15???????? }
            // n = 7, score = 100
            //   8b3d????????         |                     
            //   33db                 | xor                 ebx, ebx
            //   85c0                 | test                eax, eax
            //   be00040000           | mov                 esi, 0x400
            //   745e                 | je                  0x60
            //   6810270000           | push                0x2710
            //   ff15????????         |                     

        $sequence_6 = { 59 33f6 8b452c 8b3cb0 8d9598feffff e8???????? 8d8598feffff }
            // n = 7, score = 100
            //   59                   | pop                 ecx
            //   33f6                 | xor                 esi, esi
            //   8b452c               | mov                 eax, dword ptr [ebp + 0x2c]
            //   8b3cb0               | mov                 edi, dword ptr [eax + esi*4]
            //   8d9598feffff         | lea                 edx, dword ptr [ebp - 0x168]
            //   e8????????           |                     
            //   8d8598feffff         | lea                 eax, dword ptr [ebp - 0x168]

        $sequence_7 = { 83c012 66bf2700 e8???????? 83c40c 85c0 5f }
            // n = 6, score = 100
            //   83c012               | add                 eax, 0x12
            //   66bf2700             | mov                 di, 0x27
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   85c0                 | test                eax, eax
            //   5f                   | pop                 edi

        $sequence_8 = { ff750c ff7508 e8???????? 83c414 85c0 740c }
            // n = 6, score = 100
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     
            //   83c414               | add                 esp, 0x14
            //   85c0                 | test                eax, eax
            //   740c                 | je                  0xe

        $sequence_9 = { 4a 3bc2 7513 49 394c2410 750c 8b8f68f24100 }
            // n = 7, score = 100
            //   4a                   | dec                 edx
            //   3bc2                 | cmp                 eax, edx
            //   7513                 | jne                 0x15
            //   49                   | dec                 ecx
            //   394c2410             | cmp                 dword ptr [esp + 0x10], ecx
            //   750c                 | jne                 0xe
            //   8b8f68f24100         | mov                 ecx, dword ptr [edi + 0x41f268]

    condition:
        7 of them and filesize < 278528
}