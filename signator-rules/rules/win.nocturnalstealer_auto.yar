rule win_nocturnalstealer_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.nocturnalstealer."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.nocturnalstealer"
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
        $sequence_0 = { f7d7 e9???????? 81ec04000000 893c24 bf21c97b4b 81f791eedf7f e9???????? }
            // n = 7, score = 100
            //   f7d7                 | not                 edi
            //   e9????????           |                     
            //   81ec04000000         | sub                 esp, 4
            //   893c24               | mov                 dword ptr [esp], edi
            //   bf21c97b4b           | mov                 edi, 0x4b7bc921
            //   81f791eedf7f         | xor                 edi, 0x7fdfee91
            //   e9????????           |                     

        $sequence_1 = { 89ef 81c7a2000000 81f604000000 81f680000000 ba01000000 81c1ae000000 81ea01000000 }
            // n = 7, score = 100
            //   89ef                 | mov                 edi, ebp
            //   81c7a2000000         | add                 edi, 0xa2
            //   81f604000000         | xor                 esi, 4
            //   81f680000000         | xor                 esi, 0x80
            //   ba01000000           | mov                 edx, 1
            //   81c1ae000000         | add                 ecx, 0xae
            //   81ea01000000         | sub                 edx, 1

        $sequence_2 = { c1ef07 81ef3b9afb6f c1e701 81ef95fceac2 31f9 5f 89ca }
            // n = 7, score = 100
            //   c1ef07               | shr                 edi, 7
            //   81ef3b9afb6f         | sub                 edi, 0x6ffb9a3b
            //   c1e701               | shl                 edi, 1
            //   81ef95fceac2         | sub                 edi, 0xc2eafc95
            //   31f9                 | xor                 ecx, edi
            //   5f                   | pop                 edi
            //   89ca                 | mov                 edx, ecx

        $sequence_3 = { f8 0385bf39a418 60 89957a22a418 fc 61 96 }
            // n = 7, score = 100
            //   f8                   | clc                 
            //   0385bf39a418         | add                 eax, dword ptr [ebp + 0x18a439bf]
            //   60                   | pushal              
            //   89957a22a418         | mov                 dword ptr [ebp + 0x18a4227a], edx
            //   fc                   | cld                 
            //   61                   | popal               
            //   96                   | xchg                eax, esi

        $sequence_4 = { f7df 81f75e2b7df6 29f8 e9???????? 891c24 893c24 890c24 }
            // n = 7, score = 100
            //   f7df                 | neg                 edi
            //   81f75e2b7df6         | xor                 edi, 0xf67d2b5e
            //   29f8                 | sub                 eax, edi
            //   e9????????           |                     
            //   891c24               | mov                 dword ptr [esp], ebx
            //   893c24               | mov                 dword ptr [esp], edi
            //   890c24               | mov                 dword ptr [esp], ecx

        $sequence_5 = { e9???????? 59 81c7aa000000 0137 21f7 81cf00080000 21c3 }
            // n = 7, score = 100
            //   e9????????           |                     
            //   59                   | pop                 ecx
            //   81c7aa000000         | add                 edi, 0xaa
            //   0137                 | add                 dword ptr [edi], esi
            //   21f7                 | and                 edi, esi
            //   81cf00080000         | or                  edi, 0x800
            //   21c3                 | and                 ebx, eax

        $sequence_6 = { 81efa3a5f715 81ef9e7db7b9 81c797a1000a 81c2dbc57b4f 81ea666dec6b 01fa 83ec04 }
            // n = 7, score = 100
            //   81efa3a5f715         | sub                 edi, 0x15f7a5a3
            //   81ef9e7db7b9         | sub                 edi, 0xb9b77d9e
            //   81c797a1000a         | add                 edi, 0xa00a197
            //   81c2dbc57b4f         | add                 edx, 0x4f7bc5db
            //   81ea666dec6b         | sub                 edx, 0x6bec6d66
            //   01fa                 | add                 edx, edi
            //   83ec04               | sub                 esp, 4

        $sequence_7 = { e9???????? 893c24 812c249cc1c72d 5b e9???????? 51 893424 }
            // n = 7, score = 100
            //   e9????????           |                     
            //   893c24               | mov                 dword ptr [esp], edi
            //   812c249cc1c72d       | sub                 dword ptr [esp], 0x2dc7c19c
            //   5b                   | pop                 ebx
            //   e9????????           |                     
            //   51                   | push                ecx
            //   893424               | mov                 dword ptr [esp], esi

        $sequence_8 = { c7430c02000000 8b9d0f2ca418 c785ab38a41800000000 6a00 6a00 6a00 8b9d7131bc18 }
            // n = 7, score = 100
            //   c7430c02000000       | mov                 dword ptr [ebx + 0xc], 2
            //   8b9d0f2ca418         | mov                 ebx, dword ptr [ebp + 0x18a42c0f]
            //   c785ab38a41800000000     | mov    dword ptr [ebp + 0x18a438ab], 0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   8b9d7131bc18         | mov                 ebx, dword ptr [ebp + 0x18bc3171]

        $sequence_9 = { f71c24 f71424 ff0424 ff0c24 e9???????? 81c6ed6a7f75 81f6d819aee2 }
            // n = 7, score = 100
            //   f71c24               | neg                 dword ptr [esp]
            //   f71424               | not                 dword ptr [esp]
            //   ff0424               | inc                 dword ptr [esp]
            //   ff0c24               | dec                 dword ptr [esp]
            //   e9????????           |                     
            //   81c6ed6a7f75         | add                 esi, 0x757f6aed
            //   81f6d819aee2         | xor                 esi, 0xe2ae19d8

    condition:
        7 of them and filesize < 10739712
}