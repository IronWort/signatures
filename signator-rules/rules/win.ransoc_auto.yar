rule win_ransoc_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.ransoc."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ransoc"
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
        $sequence_0 = { 8b5044 895144 897844 8b493c 3bcf 7403 897944 }
            // n = 7, score = 300
            //   8b5044               | mov                 edx, dword ptr [eax + 0x44]
            //   895144               | mov                 dword ptr [ecx + 0x44], edx
            //   897844               | mov                 dword ptr [eax + 0x44], edi
            //   8b493c               | mov                 ecx, dword ptr [ecx + 0x3c]
            //   3bcf                 | cmp                 ecx, edi
            //   7403                 | je                  5
            //   897944               | mov                 dword ptr [ecx + 0x44], edi

        $sequence_1 = { 7425 25fff7ffff 014e40 89462c 7518 }
            // n = 5, score = 300
            //   7425                 | je                  0x27
            //   25fff7ffff           | and                 eax, 0xfffff7ff
            //   014e40               | add                 dword ptr [esi + 0x40], ecx
            //   89462c               | mov                 dword ptr [esi + 0x2c], eax
            //   7518                 | jne                 0x1a

        $sequence_2 = { 8d442430 3bf0 771e 8b4c241c 57 }
            // n = 5, score = 300
            //   8d442430             | lea                 eax, dword ptr [esp + 0x30]
            //   3bf0                 | cmp                 esi, eax
            //   771e                 | ja                  0x20
            //   8b4c241c             | mov                 ecx, dword ptr [esp + 0x1c]
            //   57                   | push                edi

        $sequence_3 = { 7428 8b4604 83c030 50 }
            // n = 4, score = 300
            //   7428                 | je                  0x2a
            //   8b4604               | mov                 eax, dword ptr [esi + 4]
            //   83c030               | add                 eax, 0x30
            //   50                   | push                eax

        $sequence_4 = { 8b5038 895138 3bd7 7412 8b5038 3b4230 7505 }
            // n = 7, score = 300
            //   8b5038               | mov                 edx, dword ptr [eax + 0x38]
            //   895138               | mov                 dword ptr [ecx + 0x38], edx
            //   3bd7                 | cmp                 edx, edi
            //   7412                 | je                  0x14
            //   8b5038               | mov                 edx, dword ptr [eax + 0x38]
            //   3b4230               | cmp                 eax, dword ptr [edx + 0x30]
            //   7505                 | jne                 7

        $sequence_5 = { 85c0 7419 8b5038 895738 }
            // n = 4, score = 300
            //   85c0                 | test                eax, eax
            //   7419                 | je                  0x1b
            //   8b5038               | mov                 edx, dword ptr [eax + 0x38]
            //   895738               | mov                 dword ptr [edi + 0x38], edx

        $sequence_6 = { eb08 8b16 8bba88000000 8b5618 85d2 }
            // n = 5, score = 300
            //   eb08                 | jmp                 0xa
            //   8b16                 | mov                 edx, dword ptr [esi]
            //   8bba88000000         | mov                 edi, dword ptr [edx + 0x88]
            //   8b5618               | mov                 edx, dword ptr [esi + 0x18]
            //   85d2                 | test                edx, edx

        $sequence_7 = { 56 8bf0 8b5630 57 8d7e30 8bee 85d2 }
            // n = 7, score = 300
            //   56                   | push                esi
            //   8bf0                 | mov                 esi, eax
            //   8b5630               | mov                 edx, dword ptr [esi + 0x30]
            //   57                   | push                edi
            //   8d7e30               | lea                 edi, dword ptr [esi + 0x30]
            //   8bee                 | mov                 ebp, esi
            //   85d2                 | test                edx, edx

        $sequence_8 = { 897a44 8b5138 897144 8b723c }
            // n = 4, score = 300
            //   897a44               | mov                 dword ptr [edx + 0x44], edi
            //   8b5138               | mov                 edx, dword ptr [ecx + 0x38]
            //   897144               | mov                 dword ptr [ecx + 0x44], esi
            //   8b723c               | mov                 esi, dword ptr [edx + 0x3c]

        $sequence_9 = { c7869400000000000000 a840 7404 a820 7509 }
            // n = 5, score = 300
            //   c7869400000000000000     | mov    dword ptr [esi + 0x94], 0
            //   a840                 | test                al, 0x40
            //   7404                 | je                  6
            //   a820                 | test                al, 0x20
            //   7509                 | jne                 0xb

    condition:
        7 of them and filesize < 958464
}