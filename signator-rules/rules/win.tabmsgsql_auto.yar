rule win_tabmsgsql_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.tabmsgsql."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.tabmsgsql"
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
        $sequence_0 = { 0f84e9feffff be???????? 8d7dc8 8a17 }
            // n = 4, score = 100
            //   0f84e9feffff         | je                  0xfffffeef
            //   be????????           |                     
            //   8d7dc8               | lea                 edi, dword ptr [ebp - 0x38]
            //   8a17                 | mov                 dl, byte ptr [edi]

        $sequence_1 = { 8d50fd 33c9 33f6 57 8b7c2414 85d2 7c67 }
            // n = 7, score = 100
            //   8d50fd               | lea                 edx, dword ptr [eax - 3]
            //   33c9                 | xor                 ecx, ecx
            //   33f6                 | xor                 esi, esi
            //   57                   | push                edi
            //   8b7c2414             | mov                 edi, dword ptr [esp + 0x14]
            //   85d2                 | test                edx, edx
            //   7c67                 | jl                  0x69

        $sequence_2 = { aa 8b842488040000 ba32000000 50 6a00 6800040000 }
            // n = 6, score = 100
            //   aa                   | stosb               byte ptr es:[edi], al
            //   8b842488040000       | mov                 eax, dword ptr [esp + 0x488]
            //   ba32000000           | mov                 edx, 0x32
            //   50                   | push                eax
            //   6a00                 | push                0
            //   6800040000           | push                0x400

        $sequence_3 = { 8d45e4 6a00 50 be01000000 68???????? 68???????? }
            // n = 6, score = 100
            //   8d45e4               | lea                 eax, dword ptr [ebp - 0x1c]
            //   6a00                 | push                0
            //   50                   | push                eax
            //   be01000000           | mov                 esi, 1
            //   68????????           |                     
            //   68????????           |                     

        $sequence_4 = { 8d4c2408 8be8 51 6808000200 55 ff15???????? }
            // n = 6, score = 100
            //   8d4c2408             | lea                 ecx, dword ptr [esp + 8]
            //   8be8                 | mov                 ebp, eax
            //   51                   | push                ecx
            //   6808000200           | push                0x20008
            //   55                   | push                ebp
            //   ff15????????         |                     

        $sequence_5 = { 81c424060000 c3 8d4c2408 c744240824020000 51 53 }
            // n = 6, score = 100
            //   81c424060000         | add                 esp, 0x624
            //   c3                   | ret                 
            //   8d4c2408             | lea                 ecx, dword ptr [esp + 8]
            //   c744240824020000     | mov                 dword ptr [esp + 8], 0x224
            //   51                   | push                ecx
            //   53                   | push                ebx

        $sequence_6 = { 885ddc 8945e5 8945e9 668945ed 8845ef }
            // n = 5, score = 100
            //   885ddc               | mov                 byte ptr [ebp - 0x24], bl
            //   8945e5               | mov                 dword ptr [ebp - 0x1b], eax
            //   8945e9               | mov                 dword ptr [ebp - 0x17], eax
            //   668945ed             | mov                 word ptr [ebp - 0x13], ax
            //   8845ef               | mov                 byte ptr [ebp - 0x11], al

        $sequence_7 = { 50 ff15???????? 50 e8???????? b900f40100 33c0 8bfe }
            // n = 7, score = 100
            //   50                   | push                eax
            //   ff15????????         |                     
            //   50                   | push                eax
            //   e8????????           |                     
            //   b900f40100           | mov                 ecx, 0x1f400
            //   33c0                 | xor                 eax, eax
            //   8bfe                 | mov                 edi, esi

        $sequence_8 = { 68???????? ff15???????? 83c404 a1???????? 50 ff15???????? b940000000 }
            // n = 7, score = 100
            //   68????????           |                     
            //   ff15????????         |                     
            //   83c404               | add                 esp, 4
            //   a1????????           |                     
            //   50                   | push                eax
            //   ff15????????         |                     
            //   b940000000           | mov                 ecx, 0x40

        $sequence_9 = { 8d85a8feffff 8d8d9cfbffff 8945b0 b804010000 8945b4 894dbc 8945c0 }
            // n = 7, score = 100
            //   8d85a8feffff         | lea                 eax, dword ptr [ebp - 0x158]
            //   8d8d9cfbffff         | lea                 ecx, dword ptr [ebp - 0x464]
            //   8945b0               | mov                 dword ptr [ebp - 0x50], eax
            //   b804010000           | mov                 eax, 0x104
            //   8945b4               | mov                 dword ptr [ebp - 0x4c], eax
            //   894dbc               | mov                 dword ptr [ebp - 0x44], ecx
            //   8945c0               | mov                 dword ptr [ebp - 0x40], eax

    condition:
        7 of them and filesize < 163840
}