rule win_mykings_spreader_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.mykings_spreader."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.mykings_spreader"
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
        $sequence_0 = { 83c404 8b4d94 8975c4 8975c8 8975cc 5f 3bce }
            // n = 7, score = 100
            //   83c404               | add                 esp, 4
            //   8b4d94               | mov                 ecx, dword ptr [ebp - 0x6c]
            //   8975c4               | mov                 dword ptr [ebp - 0x3c], esi
            //   8975c8               | mov                 dword ptr [ebp - 0x38], esi
            //   8975cc               | mov                 dword ptr [ebp - 0x34], esi
            //   5f                   | pop                 edi
            //   3bce                 | cmp                 ecx, esi

        $sequence_1 = { e8???????? 84c0 7416 8b45f8 8b55fc 85d2 7c0c }
            // n = 7, score = 100
            //   e8????????           |                     
            //   84c0                 | test                al, al
            //   7416                 | je                  0x18
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   85d2                 | test                edx, edx
            //   7c0c                 | jl                  0xe

        $sequence_2 = { 8088612d410004 40 ebee 6a40 33c0 59 bf???????? }
            // n = 7, score = 100
            //   8088612d410004       | or                  byte ptr [eax + 0x412d61], 4
            //   40                   | inc                 eax
            //   ebee                 | jmp                 0xfffffff0
            //   6a40                 | push                0x40
            //   33c0                 | xor                 eax, eax
            //   59                   | pop                 ecx
            //   bf????????           |                     

        $sequence_3 = { 8b45fc 8d7040 fc a5 8b45fc 8db88c000000 }
            // n = 6, score = 100
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   8d7040               | lea                 esi, dword ptr [eax + 0x40]
            //   fc                   | cld                 
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   8db88c000000         | lea                 edi, dword ptr [eax + 0x8c]

        $sequence_4 = { 81ec94000000 899d6cffffff 89b570ffffff 89bd74ffffff 8945f8 8955fc c745d800000000 }
            // n = 7, score = 100
            //   81ec94000000         | sub                 esp, 0x94
            //   899d6cffffff         | mov                 dword ptr [ebp - 0x94], ebx
            //   89b570ffffff         | mov                 dword ptr [ebp - 0x90], esi
            //   89bd74ffffff         | mov                 dword ptr [ebp - 0x8c], edi
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   8955fc               | mov                 dword ptr [ebp - 4], edx
            //   c745d800000000       | mov                 dword ptr [ebp - 0x28], 0

        $sequence_5 = { 50 56 68???????? 68???????? e8???????? 8b4dec 83c410 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   56                   | push                esi
            //   68????????           |                     
            //   68????????           |                     
            //   e8????????           |                     
            //   8b4dec               | mov                 ecx, dword ptr [ebp - 0x14]
            //   83c410               | add                 esp, 0x10

        $sequence_6 = { eb63 8b45bc 8a501a 80e203 81e2ff000000 83fa01 750b }
            // n = 7, score = 100
            //   eb63                 | jmp                 0x65
            //   8b45bc               | mov                 eax, dword ptr [ebp - 0x44]
            //   8a501a               | mov                 dl, byte ptr [eax + 0x1a]
            //   80e203               | and                 dl, 3
            //   81e2ff000000         | and                 edx, 0xff
            //   83fa01               | cmp                 edx, 1
            //   750b                 | jne                 0xd

        $sequence_7 = { 74ca 8b1424 89f0 e8???????? 83f8ff 75bb 89f0 }
            // n = 7, score = 100
            //   74ca                 | je                  0xffffffcc
            //   8b1424               | mov                 edx, dword ptr [esp]
            //   89f0                 | mov                 eax, esi
            //   e8????????           |                     
            //   83f8ff               | cmp                 eax, -1
            //   75bb                 | jne                 0xffffffbd
            //   89f0                 | mov                 eax, esi

        $sequence_8 = { db0d???????? 2f b5f9 b024 b446 96 e751 }
            // n = 7, score = 100
            //   db0d????????         |                     
            //   2f                   | das                 
            //   b5f9                 | mov                 ch, 0xf9
            //   b024                 | mov                 al, 0x24
            //   b446                 | mov                 ah, 0x46
            //   96                   | xchg                eax, esi
            //   e751                 | out                 0x51, eax

        $sequence_9 = { 8b4dc8 890f 8b5dcc 895f04 8b45d0 894638 }
            // n = 6, score = 100
            //   8b4dc8               | mov                 ecx, dword ptr [ebp - 0x38]
            //   890f                 | mov                 dword ptr [edi], ecx
            //   8b5dcc               | mov                 ebx, dword ptr [ebp - 0x34]
            //   895f04               | mov                 dword ptr [edi + 4], ebx
            //   8b45d0               | mov                 eax, dword ptr [ebp - 0x30]
            //   894638               | mov                 dword ptr [esi + 0x38], eax

    condition:
        7 of them and filesize < 1581056
}