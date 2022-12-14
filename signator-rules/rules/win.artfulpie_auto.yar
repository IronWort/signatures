rule win_artfulpie_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.artfulpie."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.artfulpie"
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
        $sequence_0 = { 8b7dfc 47 897dfc 8b00 0fb74006 3bf8 7d19 }
            // n = 7, score = 100
            //   8b7dfc               | mov                 edi, dword ptr [ebp - 4]
            //   47                   | inc                 edi
            //   897dfc               | mov                 dword ptr [ebp - 4], edi
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   0fb74006             | movzx               eax, word ptr [eax + 6]
            //   3bf8                 | cmp                 edi, eax
            //   7d19                 | jge                 0x1b

        $sequence_1 = { 6bc930 8b0485984e4100 f644082801 7406 8b440818 5d }
            // n = 6, score = 100
            //   6bc930               | imul                ecx, ecx, 0x30
            //   8b0485984e4100       | mov                 eax, dword ptr [eax*4 + 0x414e98]
            //   f644082801           | test                byte ptr [eax + ecx + 0x28], 1
            //   7406                 | je                  8
            //   8b440818             | mov                 eax, dword ptr [eax + ecx + 0x18]
            //   5d                   | pop                 ebp

        $sequence_2 = { 85c0 7447 ff36 8b4604 8b7efc 0345f8 03fb }
            // n = 7, score = 100
            //   85c0                 | test                eax, eax
            //   7447                 | je                  0x49
            //   ff36                 | push                dword ptr [esi]
            //   8b4604               | mov                 eax, dword ptr [esi + 4]
            //   8b7efc               | mov                 edi, dword ptr [esi - 4]
            //   0345f8               | add                 eax, dword ptr [ebp - 8]
            //   03fb                 | add                 edi, ebx

        $sequence_3 = { 2b5634 740c 8bcb e8???????? 894318 eb07 }
            // n = 6, score = 100
            //   2b5634               | sub                 edx, dword ptr [esi + 0x34]
            //   740c                 | je                  0xe
            //   8bcb                 | mov                 ecx, ebx
            //   e8????????           |                     
            //   894318               | mov                 dword ptr [ebx + 0x18], eax
            //   eb07                 | jmp                 9

        $sequence_4 = { 8b4508 53 56 57 8d1c8568524100 8b03 }
            // n = 6, score = 100
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   8d1c8568524100       | lea                 ebx, dword ptr [eax*4 + 0x415268]
            //   8b03                 | mov                 eax, dword ptr [ebx]

        $sequence_5 = { 8bc7 83e03f 6bc830 8b0495984e4100 f644082801 }
            // n = 5, score = 100
            //   8bc7                 | mov                 eax, edi
            //   83e03f               | and                 eax, 0x3f
            //   6bc830               | imul                ecx, eax, 0x30
            //   8b0495984e4100       | mov                 eax, dword ptr [edx*4 + 0x414e98]
            //   f644082801           | test                byte ptr [eax + ecx + 0x28], 1

        $sequence_6 = { 83e03f c1f906 6bf030 03348d984e4100 837e18ff 740c 837e18fe }
            // n = 7, score = 100
            //   83e03f               | and                 eax, 0x3f
            //   c1f906               | sar                 ecx, 6
            //   6bf030               | imul                esi, eax, 0x30
            //   03348d984e4100       | add                 esi, dword ptr [ecx*4 + 0x414e98]
            //   837e18ff             | cmp                 dword ptr [esi + 0x18], -1
            //   740c                 | je                  0xe
            //   837e18fe             | cmp                 dword ptr [esi + 0x18], -2

        $sequence_7 = { 817decc8000000 75b9 6800280000 e8???????? 83c404 8945f0 8d45f4 }
            // n = 7, score = 100
            //   817decc8000000       | cmp                 dword ptr [ebp - 0x14], 0xc8
            //   75b9                 | jne                 0xffffffbb
            //   6800280000           | push                0x2800
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   8d45f4               | lea                 eax, dword ptr [ebp - 0xc]

        $sequence_8 = { 6a00 6a00 6a03 6a00 6a00 ff75b0 }
            // n = 6, score = 100
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a03                 | push                3
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   ff75b0               | push                dword ptr [ebp - 0x50]

        $sequence_9 = { 83e03f c1ff06 6bd830 8b04bd984e4100 }
            // n = 4, score = 100
            //   83e03f               | and                 eax, 0x3f
            //   c1ff06               | sar                 edi, 6
            //   6bd830               | imul                ebx, eax, 0x30
            //   8b04bd984e4100       | mov                 eax, dword ptr [edi*4 + 0x414e98]

    condition:
        7 of them and filesize < 204800
}