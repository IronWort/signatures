rule win_bka_trojaner_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.bka_trojaner."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.bka_trojaner"
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
        $sequence_0 = { 56 ff15???????? 8b4c2454 8b5554 682000cc00 6a00 6a00 }
            // n = 7, score = 100
            //   56                   | push                esi
            //   ff15????????         |                     
            //   8b4c2454             | mov                 ecx, dword ptr [esp + 0x54]
            //   8b5554               | mov                 edx, dword ptr [ebp + 0x54]
            //   682000cc00           | push                0xcc0020
            //   6a00                 | push                0
            //   6a00                 | push                0

        $sequence_1 = { 8b520c c7440204???????? 8b5004 8b5210 c7440204???????? }
            // n = 5, score = 100
            //   8b520c               | mov                 edx, dword ptr [edx + 0xc]
            //   c7440204????????     |                     
            //   8b5004               | mov                 edx, dword ptr [eax + 4]
            //   8b5210               | mov                 edx, dword ptr [edx + 0x10]
            //   c7440204????????     |                     

        $sequence_2 = { 51 57 e8???????? 8bf0 ff15???????? 85f6 89442408 }
            // n = 7, score = 100
            //   51                   | push                ecx
            //   57                   | push                edi
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   ff15????????         |                     
            //   85f6                 | test                esi, esi
            //   89442408             | mov                 dword ptr [esp + 8], eax

        $sequence_3 = { ff15???????? 8b542414 56 52 ff15???????? 8b4570 }
            // n = 6, score = 100
            //   ff15????????         |                     
            //   8b542414             | mov                 edx, dword ptr [esp + 0x14]
            //   56                   | push                esi
            //   52                   | push                edx
            //   ff15????????         |                     
            //   8b4570               | mov                 eax, dword ptr [ebp + 0x70]

        $sequence_4 = { 85c0 742b 8b44240c 6a00 6a00 6a00 6a00 }
            // n = 7, score = 100
            //   85c0                 | test                eax, eax
            //   742b                 | je                  0x2d
            //   8b44240c             | mov                 eax, dword ptr [esp + 0xc]
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0

        $sequence_5 = { 3bc2 89442418 7c8e 8b442420 8b7c2428 40 }
            // n = 6, score = 100
            //   3bc2                 | cmp                 eax, edx
            //   89442418             | mov                 dword ptr [esp + 0x18], eax
            //   7c8e                 | jl                  0xffffff90
            //   8b442420             | mov                 eax, dword ptr [esp + 0x20]
            //   8b7c2428             | mov                 edi, dword ptr [esp + 0x28]
            //   40                   | inc                 eax

        $sequence_6 = { 0f8584000000 33d2 395604 8d4704 8955f0 }
            // n = 5, score = 100
            //   0f8584000000         | jne                 0x8a
            //   33d2                 | xor                 edx, edx
            //   395604               | cmp                 dword ptr [esi + 4], edx
            //   8d4704               | lea                 eax, dword ptr [edi + 4]
            //   8955f0               | mov                 dword ptr [ebp - 0x10], edx

        $sequence_7 = { 57 894e48 33c0 b90b000000 }
            // n = 4, score = 100
            //   57                   | push                edi
            //   894e48               | mov                 dword ptr [esi + 0x48], ecx
            //   33c0                 | xor                 eax, eax
            //   b90b000000           | mov                 ecx, 0xb

        $sequence_8 = { bf???????? c785d8fefffff8b74000 beb9000000 884de0 6804010000 }
            // n = 5, score = 100
            //   bf????????           |                     
            //   c785d8fefffff8b74000     | mov    dword ptr [ebp - 0x128], 0x40b7f8
            //   beb9000000           | mov                 esi, 0xb9
            //   884de0               | mov                 byte ptr [ebp - 0x20], cl
            //   6804010000           | push                0x104

        $sequence_9 = { f3a5 ff2495cc774000 8bc7 ba03000000 }
            // n = 4, score = 100
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   ff2495cc774000       | jmp                 dword ptr [edx*4 + 0x4077cc]
            //   8bc7                 | mov                 eax, edi
            //   ba03000000           | mov                 edx, 3

    condition:
        7 of them and filesize < 221184
}