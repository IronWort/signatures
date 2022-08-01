rule win_lowball_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.lowball."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.lowball"
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
        $sequence_0 = { 7531 68b80b0000 ff15???????? 8d842428040000 8d8c241c010000 50 8d54241c }
            // n = 7, score = 100
            //   7531                 | jne                 0x33
            //   68b80b0000           | push                0xbb8
            //   ff15????????         |                     
            //   8d842428040000       | lea                 eax, dword ptr [esp + 0x428]
            //   8d8c241c010000       | lea                 ecx, dword ptr [esp + 0x11c]
            //   50                   | push                eax
            //   8d54241c             | lea                 edx, dword ptr [esp + 0x1c]

        $sequence_1 = { c1e902 f3a5 8bcb 8d94244c0d0000 83e103 f3a4 8dbc2424030000 }
            // n = 7, score = 100
            //   c1e902               | shr                 ecx, 2
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   8bcb                 | mov                 ecx, ebx
            //   8d94244c0d0000       | lea                 edx, dword ptr [esp + 0xd4c]
            //   83e103               | and                 ecx, 3
            //   f3a4                 | rep movsb           byte ptr es:[edi], byte ptr [esi]
            //   8dbc2424030000       | lea                 edi, dword ptr [esp + 0x324]

        $sequence_2 = { 52 50 68???????? e8???????? 8b1d???????? 83c410 85c0 }
            // n = 7, score = 100
            //   52                   | push                edx
            //   50                   | push                eax
            //   68????????           |                     
            //   e8????????           |                     
            //   8b1d????????         |                     
            //   83c410               | add                 esp, 0x10
            //   85c0                 | test                eax, eax

        $sequence_3 = { 74d3 a1???????? 8a0d???????? 89842420020000 888c2424020000 b93f000000 33c0 }
            // n = 7, score = 100
            //   74d3                 | je                  0xffffffd5
            //   a1????????           |                     
            //   8a0d????????         |                     
            //   89842420020000       | mov                 dword ptr [esp + 0x220], eax
            //   888c2424020000       | mov                 byte ptr [esp + 0x224], cl
            //   b93f000000           | mov                 ecx, 0x3f
            //   33c0                 | xor                 eax, eax

        $sequence_4 = { 8d54241c f2ae f7d1 2bf9 8bc1 8bf7 c1e902 }
            // n = 7, score = 100
            //   8d54241c             | lea                 edx, dword ptr [esp + 0x1c]
            //   f2ae                 | repne scasb         al, byte ptr es:[edi]
            //   f7d1                 | not                 ecx
            //   2bf9                 | sub                 edi, ecx
            //   8bc1                 | mov                 eax, ecx
            //   8bf7                 | mov                 esi, edi
            //   c1e902               | shr                 ecx, 2

        $sequence_5 = { aa e8???????? 55 55 55 8d44242c }
            // n = 6, score = 100
            //   aa                   | stosb               byte ptr es:[edi], al
            //   e8????????           |                     
            //   55                   | push                ebp
            //   55                   | push                ebp
            //   55                   | push                ebp
            //   8d44242c             | lea                 eax, dword ptr [esp + 0x2c]

        $sequence_6 = { 8b942428060000 55 6a00 6800058084 6a00 6a00 }
            // n = 6, score = 100
            //   8b942428060000       | mov                 edx, dword ptr [esp + 0x628]
            //   55                   | push                ebp
            //   6a00                 | push                0
            //   6800058084           | push                0x84800500
            //   6a00                 | push                0
            //   6a00                 | push                0

        $sequence_7 = { ff15???????? 83c408 85c0 0f84ec000000 }
            // n = 4, score = 100
            //   ff15????????         |                     
            //   83c408               | add                 esp, 8
            //   85c0                 | test                eax, eax
            //   0f84ec000000         | je                  0xf2

        $sequence_8 = { ffd5 56 ff15???????? 8bd8 8d4b01 51 }
            // n = 6, score = 100
            //   ffd5                 | call                ebp
            //   56                   | push                esi
            //   ff15????????         |                     
            //   8bd8                 | mov                 ebx, eax
            //   8d4b01               | lea                 ecx, dword ptr [ebx + 1]
            //   51                   | push                ecx

        $sequence_9 = { 55 ff15???????? 8b442410 85c0 75ae 8b5c2420 c744241801000000 }
            // n = 7, score = 100
            //   55                   | push                ebp
            //   ff15????????         |                     
            //   8b442410             | mov                 eax, dword ptr [esp + 0x10]
            //   85c0                 | test                eax, eax
            //   75ae                 | jne                 0xffffffb0
            //   8b5c2420             | mov                 ebx, dword ptr [esp + 0x20]
            //   c744241801000000     | mov                 dword ptr [esp + 0x18], 1

    condition:
        7 of them and filesize < 40960
}