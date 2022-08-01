rule win_dmsniff_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.dmsniff."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.dmsniff"
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
        $sequence_0 = { 83c410 3dffff0000 0f859a050000 68???????? e8???????? }
            // n = 5, score = 400
            //   83c410               | add                 esp, 0x10
            //   3dffff0000           | cmp                 eax, 0xffff
            //   0f859a050000         | jne                 0x5a0
            //   68????????           |                     
            //   e8????????           |                     

        $sequence_1 = { 8d85f0feffff 50 6a00 6a00 8d85fcfeffff }
            // n = 5, score = 400
            //   8d85f0feffff         | lea                 eax, dword ptr [ebp - 0x110]
            //   50                   | push                eax
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   8d85fcfeffff         | lea                 eax, dword ptr [ebp - 0x104]

        $sequence_2 = { 8b55c0 807c100330 750b 807c100430 }
            // n = 4, score = 400
            //   8b55c0               | mov                 edx, dword ptr [ebp - 0x40]
            //   807c100330           | cmp                 byte ptr [eax + edx + 3], 0x30
            //   750b                 | jne                 0xd
            //   807c100430           | cmp                 byte ptr [eax + edx + 4], 0x30

        $sequence_3 = { 8b7510 ff7508 e8???????? 89c7 }
            // n = 4, score = 400
            //   8b7510               | mov                 esi, dword ptr [ebp + 0x10]
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     
            //   89c7                 | mov                 edi, eax

        $sequence_4 = { 50 8b10 ff5224 89c7 09ff }
            // n = 5, score = 400
            //   50                   | push                eax
            //   8b10                 | mov                 edx, dword ptr [eax]
            //   ff5224               | call                dword ptr [edx + 0x24]
            //   89c7                 | mov                 edi, eax
            //   09ff                 | or                  edi, edi

        $sequence_5 = { 6a40 ff15???????? a3???????? 85c0 7507 }
            // n = 5, score = 400
            //   6a40                 | push                0x40
            //   ff15????????         |                     
            //   a3????????           |                     
            //   85c0                 | test                eax, eax
            //   7507                 | jne                 9

        $sequence_6 = { 52 e8???????? 83c410 3dffff0000 0f8597020000 68???????? }
            // n = 6, score = 400
            //   52                   | push                edx
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   3dffff0000           | cmp                 eax, 0xffff
            //   0f8597020000         | jne                 0x29d
            //   68????????           |                     

        $sequence_7 = { 56 57 8b5d14 6a00 6880000000 }
            // n = 5, score = 400
            //   56                   | push                esi
            //   57                   | push                edi
            //   8b5d14               | mov                 ebx, dword ptr [ebp + 0x14]
            //   6a00                 | push                0
            //   6880000000           | push                0x80

        $sequence_8 = { 46 89b5fcfeffff 899cbd00ffffff 8d85f0feffff 50 6a00 }
            // n = 6, score = 400
            //   46                   | inc                 esi
            //   89b5fcfeffff         | mov                 dword ptr [ebp - 0x104], esi
            //   899cbd00ffffff       | mov                 dword ptr [ebp + edi*4 - 0x100], ebx
            //   8d85f0feffff         | lea                 eax, dword ptr [ebp - 0x110]
            //   50                   | push                eax
            //   6a00                 | push                0

        $sequence_9 = { 89d9 83c8ff 40 803c0100 75f9 6a01 }
            // n = 6, score = 400
            //   89d9                 | mov                 ecx, ebx
            //   83c8ff               | or                  eax, 0xffffffff
            //   40                   | inc                 eax
            //   803c0100             | cmp                 byte ptr [ecx + eax], 0
            //   75f9                 | jne                 0xfffffffb
            //   6a01                 | push                1

    condition:
        7 of them and filesize < 131072
}