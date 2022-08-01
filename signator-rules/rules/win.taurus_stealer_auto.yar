rule win_taurus_stealer_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.taurus_stealer."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.taurus_stealer"
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
        $sequence_0 = { 0fb600 50 e8???????? 56 8d4de1 8ad8 e8???????? }
            // n = 7, score = 200
            //   0fb600               | movzx               eax, byte ptr [eax]
            //   50                   | push                eax
            //   e8????????           |                     
            //   56                   | push                esi
            //   8d4de1               | lea                 ecx, dword ptr [ebp - 0x1f]
            //   8ad8                 | mov                 bl, al
            //   e8????????           |                     

        $sequence_1 = { 8b048d14784200 ffe0 f7c703000000 7413 8a06 8807 }
            // n = 6, score = 200
            //   8b048d14784200       | mov                 eax, dword ptr [ecx*4 + 0x427814]
            //   ffe0                 | jmp                 eax
            //   f7c703000000         | test                edi, 3
            //   7413                 | je                  0x15
            //   8a06                 | mov                 al, byte ptr [esi]
            //   8807                 | mov                 byte ptr [edi], al

        $sequence_2 = { 83c8f0 40 28440df1 41 83f90a 7305 8a45f0 }
            // n = 7, score = 200
            //   83c8f0               | or                  eax, 0xfffffff0
            //   40                   | inc                 eax
            //   28440df1             | sub                 byte ptr [ebp + ecx - 0xf], al
            //   41                   | inc                 ecx
            //   83f90a               | cmp                 ecx, 0xa
            //   7305                 | jae                 7
            //   8a45f0               | mov                 al, byte ptr [ebp - 0x10]

        $sequence_3 = { 8855e0 0fbec0 250f000080 7905 48 83c8f0 }
            // n = 6, score = 200
            //   8855e0               | mov                 byte ptr [ebp - 0x20], dl
            //   0fbec0               | movsx               eax, al
            //   250f000080           | and                 eax, 0x8000000f
            //   7905                 | jns                 7
            //   48                   | dec                 eax
            //   83c8f0               | or                  eax, 0xfffffff0

        $sequence_4 = { c645f500 f6c301 740b 8d8df0feffff e8???????? 807df500 0f846a060000 }
            // n = 7, score = 200
            //   c645f500             | mov                 byte ptr [ebp - 0xb], 0
            //   f6c301               | test                bl, 1
            //   740b                 | je                  0xd
            //   8d8df0feffff         | lea                 ecx, dword ptr [ebp - 0x110]
            //   e8????????           |                     
            //   807df500             | cmp                 byte ptr [ebp - 0xb], 0
            //   0f846a060000         | je                  0x670

        $sequence_5 = { 59 8bf0 6a5f 8bce e8???????? 56 8d8d70ffffff }
            // n = 7, score = 200
            //   59                   | pop                 ecx
            //   8bf0                 | mov                 esi, eax
            //   6a5f                 | push                0x5f
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   56                   | push                esi
            //   8d8d70ffffff         | lea                 ecx, dword ptr [ebp - 0x90]

        $sequence_6 = { e8???????? 8d4df8 8bd0 51 8b4d08 e8???????? }
            // n = 6, score = 200
            //   e8????????           |                     
            //   8d4df8               | lea                 ecx, dword ptr [ebp - 8]
            //   8bd0                 | mov                 edx, eax
            //   51                   | push                ecx
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   e8????????           |                     

        $sequence_7 = { 75f2 8b45e0 8d4df0 2bc3 895dec 40 }
            // n = 6, score = 200
            //   75f2                 | jne                 0xfffffff4
            //   8b45e0               | mov                 eax, dword ptr [ebp - 0x20]
            //   8d4df0               | lea                 ecx, dword ptr [ebp - 0x10]
            //   2bc3                 | sub                 eax, ebx
            //   895dec               | mov                 dword ptr [ebp - 0x14], ebx
            //   40                   | inc                 eax

        $sequence_8 = { 6a61 8d4dda 8845e3 e8???????? 6a6c 8d4dda }
            // n = 6, score = 200
            //   6a61                 | push                0x61
            //   8d4dda               | lea                 ecx, dword ptr [ebp - 0x26]
            //   8845e3               | mov                 byte ptr [ebp - 0x1d], al
            //   e8????????           |                     
            //   6a6c                 | push                0x6c
            //   8d4dda               | lea                 ecx, dword ptr [ebp - 0x26]

        $sequence_9 = { 8b8778020000 8d4de4 3b877c020000 0f95c3 e8???????? 8d8d4cffffff e8???????? }
            // n = 7, score = 200
            //   8b8778020000         | mov                 eax, dword ptr [edi + 0x278]
            //   8d4de4               | lea                 ecx, dword ptr [ebp - 0x1c]
            //   3b877c020000         | cmp                 eax, dword ptr [edi + 0x27c]
            //   0f95c3               | setne               bl
            //   e8????????           |                     
            //   8d8d4cffffff         | lea                 ecx, dword ptr [ebp - 0xb4]
            //   e8????????           |                     

    condition:
        7 of them and filesize < 524288
}