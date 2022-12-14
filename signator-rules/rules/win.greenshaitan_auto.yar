rule win_greenshaitan_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.greenshaitan."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.greenshaitan"
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
        $sequence_0 = { e8???????? 83c404 6a25 57 8d742414 e8???????? }
            // n = 6, score = 100
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   6a25                 | push                0x25
            //   57                   | push                edi
            //   8d742414             | lea                 esi, dword ptr [esp + 0x14]
            //   e8????????           |                     

        $sequence_1 = { 8b4608 8b4e0c 57 50 51 c706???????? ff15???????? }
            // n = 7, score = 100
            //   8b4608               | mov                 eax, dword ptr [esi + 8]
            //   8b4e0c               | mov                 ecx, dword ptr [esi + 0xc]
            //   57                   | push                edi
            //   50                   | push                eax
            //   51                   | push                ecx
            //   c706????????         |                     
            //   ff15????????         |                     

        $sequence_2 = { bf0f000000 897c242c 896c2428 c644241800 395c2448 720d 8b542434 }
            // n = 7, score = 100
            //   bf0f000000           | mov                 edi, 0xf
            //   897c242c             | mov                 dword ptr [esp + 0x2c], edi
            //   896c2428             | mov                 dword ptr [esp + 0x28], ebp
            //   c644241800           | mov                 byte ptr [esp + 0x18], 0
            //   395c2448             | cmp                 dword ptr [esp + 0x48], ebx
            //   720d                 | jb                  0xf
            //   8b542434             | mov                 edx, dword ptr [esp + 0x34]

        $sequence_3 = { c684244801000003 e8???????? 68d8010000 e8???????? 8bf0 83c404 }
            // n = 6, score = 100
            //   c684244801000003     | mov                 byte ptr [esp + 0x148], 3
            //   e8????????           |                     
            //   68d8010000           | push                0x1d8
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   83c404               | add                 esp, 4

        $sequence_4 = { 8b471c 51 8b4f20 52 8b17 50 }
            // n = 6, score = 100
            //   8b471c               | mov                 eax, dword ptr [edi + 0x1c]
            //   51                   | push                ecx
            //   8b4f20               | mov                 ecx, dword ptr [edi + 0x20]
            //   52                   | push                edx
            //   8b17                 | mov                 edx, dword ptr [edi]
            //   50                   | push                eax

        $sequence_5 = { 50 8d442430 64a300000000 e8???????? 6a4c e8???????? 83c404 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   8d442430             | lea                 eax, dword ptr [esp + 0x30]
            //   64a300000000         | mov                 dword ptr fs:[0], eax
            //   e8????????           |                     
            //   6a4c                 | push                0x4c
            //   e8????????           |                     
            //   83c404               | add                 esp, 4

        $sequence_6 = { c7442450ffffffff 837c242810 720d 8b442414 50 }
            // n = 5, score = 100
            //   c7442450ffffffff     | mov                 dword ptr [esp + 0x50], 0xffffffff
            //   837c242810           | cmp                 dword ptr [esp + 0x28], 0x10
            //   720d                 | jb                  0xf
            //   8b442414             | mov                 eax, dword ptr [esp + 0x14]
            //   50                   | push                eax

        $sequence_7 = { 8bc7 c744244000000000 e8???????? 83781810 }
            // n = 4, score = 100
            //   8bc7                 | mov                 eax, edi
            //   c744244000000000     | mov                 dword ptr [esp + 0x40], 0
            //   e8????????           |                     
            //   83781810             | cmp                 dword ptr [eax + 0x18], 0x10

        $sequence_8 = { 897774 8b16 8b420c 8bce }
            // n = 4, score = 100
            //   897774               | mov                 dword ptr [edi + 0x74], esi
            //   8b16                 | mov                 edx, dword ptr [esi]
            //   8b420c               | mov                 eax, dword ptr [edx + 0xc]
            //   8bce                 | mov                 ecx, esi

        $sequence_9 = { e8???????? c684247802000004 83bc248000000010 8b4c246c 7304 }
            // n = 5, score = 100
            //   e8????????           |                     
            //   c684247802000004     | mov                 byte ptr [esp + 0x278], 4
            //   83bc248000000010     | cmp                 dword ptr [esp + 0x80], 0x10
            //   8b4c246c             | mov                 ecx, dword ptr [esp + 0x6c]
            //   7304                 | jae                 6

    condition:
        7 of them and filesize < 253952
}