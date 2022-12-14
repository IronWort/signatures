rule win_sality_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.sality."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.sality"
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
        $sequence_0 = { 6884000000 6a00 8d8570feffff 50 e8???????? 83c40c 6884000000 }
            // n = 7, score = 300
            //   6884000000           | push                0x84
            //   6a00                 | push                0
            //   8d8570feffff         | lea                 eax, dword ptr [ebp - 0x190]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   6884000000           | push                0x84

        $sequence_1 = { 6884000000 6a00 8d8decfdffff 51 }
            // n = 4, score = 300
            //   6884000000           | push                0x84
            //   6a00                 | push                0
            //   8d8decfdffff         | lea                 ecx, dword ptr [ebp - 0x214]
            //   51                   | push                ecx

        $sequence_2 = { 6884000000 6a00 8d85d8fbffff 50 }
            // n = 4, score = 300
            //   6884000000           | push                0x84
            //   6a00                 | push                0
            //   8d85d8fbffff         | lea                 eax, dword ptr [ebp - 0x428]
            //   50                   | push                eax

        $sequence_3 = { 6a06 e8???????? 83c41c 8b4dfc 03c8 }
            // n = 5, score = 300
            //   6a06                 | push                6
            //   e8????????           |                     
            //   83c41c               | add                 esp, 0x1c
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   03c8                 | add                 ecx, eax

        $sequence_4 = { 6884000000 6a00 8d8d54fbffff 51 }
            // n = 4, score = 300
            //   6884000000           | push                0x84
            //   6a00                 | push                0
            //   8d8d54fbffff         | lea                 ecx, dword ptr [ebp - 0x4ac]
            //   51                   | push                ecx

        $sequence_5 = { 6884000000 6a00 8d8df4feffff 51 }
            // n = 4, score = 300
            //   6884000000           | push                0x84
            //   6a00                 | push                0
            //   8d8df4feffff         | lea                 ecx, dword ptr [ebp - 0x10c]
            //   51                   | push                ecx

        $sequence_6 = { 6884000000 6a00 8d857cffffff 50 }
            // n = 4, score = 300
            //   6884000000           | push                0x84
            //   6a00                 | push                0
            //   8d857cffffff         | lea                 eax, dword ptr [ebp - 0x84]
            //   50                   | push                eax

        $sequence_7 = { 6884000000 6a00 8d85e4fcffff 50 }
            // n = 4, score = 300
            //   6884000000           | push                0x84
            //   6a00                 | push                0
            //   8d85e4fcffff         | lea                 eax, dword ptr [ebp - 0x31c]
            //   50                   | push                eax

        $sequence_8 = { 6a00 50 ff954d144000 8d9533164000 52 50 ff953a144000 }
            // n = 7, score = 100
            //   6a00                 | push                0
            //   50                   | push                eax
            //   ff954d144000         | call                dword ptr [ebp + 0x40144d]
            //   8d9533164000         | lea                 edx, dword ptr [ebp + 0x401633]
            //   52                   | push                edx
            //   50                   | push                eax
            //   ff953a144000         | call                dword ptr [ebp + 0x40143a]

        $sequence_9 = { 8d9dba114000 895808 646789260000 8b74240c 66813e4d5a 0f858c000000 }
            // n = 6, score = 100
            //   8d9dba114000         | lea                 ebx, dword ptr [ebp + 0x4011ba]
            //   895808               | mov                 dword ptr [eax + 8], ebx
            //   646789260000         | mov                 dword ptr fs:[0], esp
            //   8b74240c             | mov                 esi, dword ptr [esp + 0xc]
            //   66813e4d5a           | cmp                 word ptr [esi], 0x5a4d
            //   0f858c000000         | jne                 0x92

        $sequence_10 = { 0306 50 8b4e04 8d5608 }
            // n = 4, score = 100
            //   0306                 | add                 eax, dword ptr [esi]
            //   50                   | push                eax
            //   8b4e04               | mov                 ecx, dword ptr [esi + 4]
            //   8d5608               | lea                 edx, dword ptr [esi + 8]

        $sequence_11 = { 8b7c2410 b996000000 32c0 f2ae }
            // n = 4, score = 100
            //   8b7c2410             | mov                 edi, dword ptr [esp + 0x10]
            //   b996000000           | mov                 ecx, 0x96
            //   32c0                 | xor                 al, al
            //   f2ae                 | repne scasb         al, byte ptr es:[edi]

        $sequence_12 = { 010d???????? 83c004 5f 5e }
            // n = 4, score = 100
            //   010d????????         |                     
            //   83c004               | add                 eax, 4
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_13 = { 00fb fb 804880bc 280d???????? }
            // n = 4, score = 100
            //   00fb                 | add                 bl, bh
            //   fb                   | sti                 
            //   804880bc             | or                  byte ptr [eax - 0x80], 0xbc
            //   280d????????         |                     

        $sequence_14 = { b8c9d44600 ffe0 58 e9???????? }
            // n = 4, score = 100
            //   b8c9d44600           | mov                 eax, 0x46d4c9
            //   ffe0                 | jmp                 eax
            //   58                   | pop                 eax
            //   e9????????           |                     

        $sequence_15 = { 33c0 c3 9c 60 bd11111111 8b74242c 81feffff0000 }
            // n = 7, score = 100
            //   33c0                 | xor                 eax, eax
            //   c3                   | ret                 
            //   9c                   | pushfd              
            //   60                   | pushal              
            //   bd11111111           | mov                 ebp, 0x11111111
            //   8b74242c             | mov                 esi, dword ptr [esp + 0x2c]
            //   81feffff0000         | cmp                 esi, 0xffff

        $sequence_16 = { 0306 50 8d5604 e8???????? }
            // n = 4, score = 100
            //   0306                 | add                 eax, dword ptr [esi]
            //   50                   | push                eax
            //   8d5604               | lea                 edx, dword ptr [esi + 4]
            //   e8????????           |                     

        $sequence_17 = { 8bcf 2b4c2410 8b5678 0354240c }
            // n = 4, score = 100
            //   8bcf                 | mov                 ecx, edi
            //   2b4c2410             | sub                 ecx, dword ptr [esp + 0x10]
            //   8b5678               | mov                 edx, dword ptr [esi + 0x78]
            //   0354240c             | add                 edx, dword ptr [esp + 0xc]

        $sequence_18 = { 0007 7307 c607ff 8ac1 }
            // n = 4, score = 100
            //   0007                 | add                 byte ptr [edi], al
            //   7307                 | jae                 9
            //   c607ff               | mov                 byte ptr [edi], 0xff
            //   8ac1                 | mov                 al, cl

        $sequence_19 = { 014304 c3 53 56 }
            // n = 4, score = 100
            //   014304               | add                 dword ptr [ebx + 4], eax
            //   c3                   | ret                 
            //   53                   | push                ebx
            //   56                   | push                esi

        $sequence_20 = { 6a00 ffb5c2164000 ff9574144000 8985cf1e4000 85c0 0f84b9000000 }
            // n = 6, score = 100
            //   6a00                 | push                0
            //   ffb5c2164000         | push                dword ptr [ebp + 0x4016c2]
            //   ff9574144000         | call                dword ptr [ebp + 0x401474]
            //   8985cf1e4000         | mov                 dword ptr [ebp + 0x401ecf], eax
            //   85c0                 | test                eax, eax
            //   0f84b9000000         | je                  0xbf

        $sequence_21 = { 031e ff7608 ff7604 e8???????? }
            // n = 4, score = 100
            //   031e                 | add                 ebx, dword ptr [esi]
            //   ff7608               | push                dword ptr [esi + 8]
            //   ff7604               | push                dword ptr [esi + 4]
            //   e8????????           |                     

        $sequence_22 = { 810424661a4000 c3 c8000000 33c9 8b5d0c b11c }
            // n = 6, score = 100
            //   810424661a4000       | add                 dword ptr [esp], 0x401a66
            //   c3                   | ret                 
            //   c8000000             | enter               0, 0
            //   33c9                 | xor                 ecx, ecx
            //   8b5d0c               | mov                 ebx, dword ptr [ebp + 0xc]
            //   b11c                 | mov                 cl, 0x1c

        $sequence_23 = { 0202 7466 0fb77202 8b7a04 }
            // n = 4, score = 100
            //   0202                 | add                 al, byte ptr [edx]
            //   7466                 | je                  0x68
            //   0fb77202             | movzx               esi, word ptr [edx + 2]
            //   8b7a04               | mov                 edi, dword ptr [edx + 4]

    condition:
        7 of them and filesize < 1122304
}