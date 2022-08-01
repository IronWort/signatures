rule win_badflick_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.badflick."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.badflick"
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
        $sequence_0 = { 59 59 8b4d08 894805 8b4d0c }
            // n = 5, score = 100
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   894805               | mov                 dword ptr [eax + 5], ecx
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]

        $sequence_1 = { 56 ff7508 e8???????? 59 59 6800800000 6a00 }
            // n = 7, score = 100
            //   56                   | push                esi
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   6800800000           | push                0x8000
            //   6a00                 | push                0

        $sequence_2 = { ff750c 8d4609 ff75f8 50 e8???????? 57 }
            // n = 6, score = 100
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   8d4609               | lea                 eax, dword ptr [esi + 9]
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   50                   | push                eax
            //   e8????????           |                     
            //   57                   | push                edi

        $sequence_3 = { 8bf0 8d4605 50 ff15???????? 83c414 }
            // n = 5, score = 100
            //   8bf0                 | mov                 esi, eax
            //   8d4605               | lea                 eax, dword ptr [esi + 5]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   83c414               | add                 esp, 0x14

        $sequence_4 = { 6a0c 8d45e4 50 6a0c 8d45f0 50 }
            // n = 6, score = 100
            //   6a0c                 | push                0xc
            //   8d45e4               | lea                 eax, dword ptr [ebp - 0x1c]
            //   50                   | push                eax
            //   6a0c                 | push                0xc
            //   8d45f0               | lea                 eax, dword ptr [ebp - 0x10]
            //   50                   | push                eax

        $sequence_5 = { 57 e8???????? 8bd8 59 59 85db 0f841b020000 }
            // n = 7, score = 100
            //   57                   | push                edi
            //   e8????????           |                     
            //   8bd8                 | mov                 ebx, eax
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   85db                 | test                ebx, ebx
            //   0f841b020000         | je                  0x221

        $sequence_6 = { 53 ffd6 59 59 eb03 83c702 66833f00 }
            // n = 7, score = 100
            //   53                   | push                ebx
            //   ffd6                 | call                esi
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   eb03                 | jmp                 5
            //   83c702               | add                 edi, 2
            //   66833f00             | cmp                 word ptr [edi], 0

        $sequence_7 = { 6a20 8945ec e8???????? 83c40c 85c0 740c }
            // n = 6, score = 100
            //   6a20                 | push                0x20
            //   8945ec               | mov                 dword ptr [ebp - 0x14], eax
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   85c0                 | test                eax, eax
            //   740c                 | je                  0xe

        $sequence_8 = { 50 ffd6 8d8578fbffff 50 57 ff15???????? }
            // n = 6, score = 100
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   8d8578fbffff         | lea                 eax, dword ptr [ebp - 0x488]
            //   50                   | push                eax
            //   57                   | push                edi
            //   ff15????????         |                     

        $sequence_9 = { a5 a5 e8???????? 59 6a00 }
            // n = 5, score = 100
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   6a00                 | push                0

    condition:
        7 of them and filesize < 81920
}