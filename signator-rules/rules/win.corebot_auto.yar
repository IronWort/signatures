rule win_corebot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.corebot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.corebot"
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
        $sequence_0 = { 0fb600 8945e8 c745ec07000000 8d1c00 84c0 }
            // n = 5, score = 1100
            //   0fb600               | movzx               eax, byte ptr [eax]
            //   8945e8               | mov                 dword ptr [ebp - 0x18], eax
            //   c745ec07000000       | mov                 dword ptr [ebp - 0x14], 7
            //   8d1c00               | lea                 ebx, dword ptr [eax + eax]
            //   84c0                 | test                al, al

        $sequence_1 = { 51 ff15???????? 85c0 0f95c0 eb08 }
            // n = 5, score = 1100
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   0f95c0               | setne               al
            //   eb08                 | jmp                 0xa

        $sequence_2 = { 39fe 73ea 8b4310 8945ec 50 e8???????? 83c404 }
            // n = 7, score = 1100
            //   39fe                 | cmp                 esi, edi
            //   73ea                 | jae                 0xffffffec
            //   8b4310               | mov                 eax, dword ptr [ebx + 0x10]
            //   8945ec               | mov                 dword ptr [ebp - 0x14], eax
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c404               | add                 esp, 4

        $sequence_3 = { 0fb618 895de8 c745ec07000000 8d141b }
            // n = 4, score = 1100
            //   0fb618               | movzx               ebx, byte ptr [eax]
            //   895de8               | mov                 dword ptr [ebp - 0x18], ebx
            //   c745ec07000000       | mov                 dword ptr [ebp - 0x14], 7
            //   8d141b               | lea                 edx, dword ptr [ebx + ebx]

        $sequence_4 = { 50 ff15???????? 85c0 7418 8b0e }
            // n = 5, score = 1100
            //   50                   | push                eax
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7418                 | je                  0x1a
            //   8b0e                 | mov                 ecx, dword ptr [esi]

        $sequence_5 = { 31c9 56 51 51 6804800000 50 }
            // n = 6, score = 1100
            //   31c9                 | xor                 ecx, ecx
            //   56                   | push                esi
            //   51                   | push                ecx
            //   51                   | push                ecx
            //   6804800000           | push                0x8004
            //   50                   | push                eax

        $sequence_6 = { 0fb610 8955e8 c745ec07000000 8d0412 }
            // n = 4, score = 1100
            //   0fb610               | movzx               edx, byte ptr [eax]
            //   8955e8               | mov                 dword ptr [ebp - 0x18], edx
            //   c745ec07000000       | mov                 dword ptr [ebp - 0x14], 7
            //   8d0412               | lea                 eax, dword ptr [edx + edx]

        $sequence_7 = { 43 8b4dec 8d55f0 e8???????? }
            // n = 4, score = 1100
            //   43                   | inc                 ebx
            //   8b4dec               | mov                 ecx, dword ptr [ebp - 0x14]
            //   8d55f0               | lea                 edx, dword ptr [ebp - 0x10]
            //   e8????????           |                     

        $sequence_8 = { ff15???????? 807e5000 7509 ff764c ff15???????? 8d4634 50 }
            // n = 7, score = 1000
            //   ff15????????         |                     
            //   807e5000             | cmp                 byte ptr [esi + 0x50], 0
            //   7509                 | jne                 0xb
            //   ff764c               | push                dword ptr [esi + 0x4c]
            //   ff15????????         |                     
            //   8d4634               | lea                 eax, dword ptr [esi + 0x34]
            //   50                   | push                eax

        $sequence_9 = { ff15???????? 8d4634 50 ff15???????? 8d4e0c e8???????? }
            // n = 6, score = 1000
            //   ff15????????         |                     
            //   8d4634               | lea                 eax, dword ptr [esi + 0x34]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8d4e0c               | lea                 ecx, dword ptr [esi + 0xc]
            //   e8????????           |                     

        $sequence_10 = { eb10 6800800000 6a00 56 }
            // n = 4, score = 1000
            //   eb10                 | jmp                 0x12
            //   6800800000           | push                0x8000
            //   6a00                 | push                0
            //   56                   | push                esi

        $sequence_11 = { ff742428 e8???????? 8b442424 8d4c2410 }
            // n = 4, score = 1000
            //   ff742428             | push                dword ptr [esp + 0x28]
            //   e8????????           |                     
            //   8b442424             | mov                 eax, dword ptr [esp + 0x24]
            //   8d4c2410             | lea                 ecx, dword ptr [esp + 0x10]

        $sequence_12 = { ff7750 6a00 ff15???????? ff7754 }
            // n = 4, score = 1000
            //   ff7750               | push                dword ptr [edi + 0x50]
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   ff7754               | push                dword ptr [edi + 0x54]

        $sequence_13 = { ff7010 ff7014 e8???????? 8b45e0 }
            // n = 4, score = 1000
            //   ff7010               | push                dword ptr [eax + 0x10]
            //   ff7014               | push                dword ptr [eax + 0x14]
            //   e8????????           |                     
            //   8b45e0               | mov                 eax, dword ptr [ebp - 0x20]

        $sequence_14 = { 807e5800 7509 ff7654 ff15???????? 807e5000 7509 }
            // n = 6, score = 1000
            //   807e5800             | cmp                 byte ptr [esi + 0x58], 0
            //   7509                 | jne                 0xb
            //   ff7654               | push                dword ptr [esi + 0x54]
            //   ff15????????         |                     
            //   807e5000             | cmp                 byte ptr [esi + 0x50], 0
            //   7509                 | jne                 0xb

        $sequence_15 = { 85ff 740f 57 ff7508 }
            // n = 4, score = 1000
            //   85ff                 | test                edi, edi
            //   740f                 | je                  0x11
            //   57                   | push                edi
            //   ff7508               | push                dword ptr [ebp + 8]

    condition:
        7 of them and filesize < 1302528
}