rule win_winsloader_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.winsloader."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.winsloader"
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
        $sequence_0 = { be???????? f3a5 66a5 8b15???????? }
            // n = 4, score = 200
            //   be????????           |                     
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   66a5                 | movsw               word ptr es:[edi], word ptr [esi]
            //   8b15????????         |                     

        $sequence_1 = { 84d2 75f9 2bc1 0fb6f8 888435fefbffff 8d4701 }
            // n = 6, score = 200
            //   84d2                 | test                dl, dl
            //   75f9                 | jne                 0xfffffffb
            //   2bc1                 | sub                 eax, ecx
            //   0fb6f8               | movzx               edi, al
            //   888435fefbffff       | mov                 byte ptr [ebp + esi - 0x402], al
            //   8d4701               | lea                 eax, dword ptr [edi + 1]

        $sequence_2 = { 83c410 66c7841d0efcffff4501 8d7001 8a08 40 84c9 }
            // n = 6, score = 200
            //   83c410               | add                 esp, 0x10
            //   66c7841d0efcffff4501     | mov    word ptr [ebp + ebx - 0x3f2], 0x145
            //   8d7001               | lea                 esi, dword ptr [eax + 1]
            //   8a08                 | mov                 cl, byte ptr [eax]
            //   40                   | inc                 eax
            //   84c9                 | test                cl, cl

        $sequence_3 = { 6800100000 56 8d8375050000 6a00 a3???????? ff15???????? 8bf8 }
            // n = 7, score = 200
            //   6800100000           | push                0x1000
            //   56                   | push                esi
            //   8d8375050000         | lea                 eax, dword ptr [ebx + 0x575]
            //   6a00                 | push                0
            //   a3????????           |                     
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax

        $sequence_4 = { 83c40c 66c7843500fcfffff90b 8d4801 8d4900 8a10 }
            // n = 5, score = 200
            //   83c40c               | add                 esp, 0xc
            //   66c7843500fcfffff90b     | mov    word ptr [ebp + esi - 0x400], 0xbf9
            //   8d4801               | lea                 ecx, dword ptr [eax + 1]
            //   8d4900               | lea                 ecx, dword ptr [ecx]
            //   8a10                 | mov                 dl, byte ptr [eax]

        $sequence_5 = { 33c9 8d9b00000000 891cc8 895cc804 41 }
            // n = 5, score = 200
            //   33c9                 | xor                 ecx, ecx
            //   8d9b00000000         | lea                 ebx, dword ptr [ebx]
            //   891cc8               | mov                 dword ptr [eax + ecx*8], ebx
            //   895cc804             | mov                 dword ptr [eax + ecx*8 + 4], ebx
            //   41                   | inc                 ecx

        $sequence_6 = { 40 84db 75f9 2bc2 8d1439 8d44020c }
            // n = 6, score = 200
            //   40                   | inc                 eax
            //   84db                 | test                bl, bl
            //   75f9                 | jne                 0xfffffffb
            //   2bc2                 | sub                 eax, edx
            //   8d1439               | lea                 edx, dword ptr [ecx + edi]
            //   8d44020c             | lea                 eax, dword ptr [edx + eax + 0xc]

        $sequence_7 = { 8d743e06 e8???????? 66898435fcfbffff b8???????? 83c410 8d4801 8da42400000000 }
            // n = 7, score = 200
            //   8d743e06             | lea                 esi, dword ptr [esi + edi + 6]
            //   e8????????           |                     
            //   66898435fcfbffff     | mov                 word ptr [ebp + esi - 0x404], ax
            //   b8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   8d4801               | lea                 ecx, dword ptr [eax + 1]
            //   8da42400000000       | lea                 esp, dword ptr [esp]

        $sequence_8 = { 83c40c 6800040000 8d8dfcf7ffff 51 }
            // n = 4, score = 200
            //   83c40c               | add                 esp, 0xc
            //   6800040000           | push                0x400
            //   8d8dfcf7ffff         | lea                 ecx, dword ptr [ebp - 0x804]
            //   51                   | push                ecx

        $sequence_9 = { 51 68???????? 68???????? 894dcc }
            // n = 4, score = 100
            //   51                   | push                ecx
            //   68????????           |                     
            //   68????????           |                     
            //   894dcc               | mov                 dword ptr [ebp - 0x34], ecx

        $sequence_10 = { 66a5 8b85ecf3ffff 05fa0d0000 8985ecf3ffff 8b8de4f3ffff 038decf3ffff 8b15???????? }
            // n = 7, score = 100
            //   66a5                 | movsw               word ptr es:[edi], word ptr [esi]
            //   8b85ecf3ffff         | mov                 eax, dword ptr [ebp - 0xc14]
            //   05fa0d0000           | add                 eax, 0xdfa
            //   8985ecf3ffff         | mov                 dword ptr [ebp - 0xc14], eax
            //   8b8de4f3ffff         | mov                 ecx, dword ptr [ebp - 0xc1c]
            //   038decf3ffff         | add                 ecx, dword ptr [ebp - 0xc14]
            //   8b15????????         |                     

        $sequence_11 = { 8b04bdc0c00110 834c0318ff 33c0 eb16 e8???????? c70009000000 }
            // n = 6, score = 100
            //   8b04bdc0c00110       | mov                 eax, dword ptr [edi*4 + 0x1001c0c0]
            //   834c0318ff           | or                  dword ptr [ebx + eax + 0x18], 0xffffffff
            //   33c0                 | xor                 eax, eax
            //   eb16                 | jmp                 0x18
            //   e8????????           |                     
            //   c70009000000         | mov                 dword ptr [eax], 9

        $sequence_12 = { 3934bdc0c00110 7531 e8???????? 8904bdc0c00110 85c0 7514 }
            // n = 6, score = 100
            //   3934bdc0c00110       | cmp                 dword ptr [edi*4 + 0x1001c0c0], esi
            //   7531                 | jne                 0x33
            //   e8????????           |                     
            //   8904bdc0c00110       | mov                 dword ptr [edi*4 + 0x1001c0c0], eax
            //   85c0                 | test                eax, eax
            //   7514                 | jne                 0x16

        $sequence_13 = { 68???????? 8b85f8f3ffff 8d8c05fcfbffff 51 }
            // n = 4, score = 100
            //   68????????           |                     
            //   8b85f8f3ffff         | mov                 eax, dword ptr [ebp - 0xc08]
            //   8d8c05fcfbffff       | lea                 ecx, dword ptr [ebp + eax - 0x404]
            //   51                   | push                ecx

        $sequence_14 = { 8b4714 894514 e8???????? 8803 8a03 3a8698460110 }
            // n = 6, score = 100
            //   8b4714               | mov                 eax, dword ptr [edi + 0x14]
            //   894514               | mov                 dword ptr [ebp + 0x14], eax
            //   e8????????           |                     
            //   8803                 | mov                 byte ptr [ebx], al
            //   8a03                 | mov                 al, byte ptr [ebx]
            //   3a8698460110         | cmp                 al, byte ptr [esi + 0x10014698]

        $sequence_15 = { 8385d4f3ffff01 80bde0f3ffff00 75e2 8b8dd4f3ffff 2b8d98f3ffff 898d8cf3ffff }
            // n = 6, score = 100
            //   8385d4f3ffff01       | add                 dword ptr [ebp - 0xc2c], 1
            //   80bde0f3ffff00       | cmp                 byte ptr [ebp - 0xc20], 0
            //   75e2                 | jne                 0xffffffe4
            //   8b8dd4f3ffff         | mov                 ecx, dword ptr [ebp - 0xc2c]
            //   2b8d98f3ffff         | sub                 ecx, dword ptr [ebp - 0xc68]
            //   898d8cf3ffff         | mov                 dword ptr [ebp - 0xc74], ecx

    condition:
        7 of them and filesize < 270336
}