rule win_andromut_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.andromut."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.andromut"
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
        $sequence_0 = { 8d3c30 3bf7 7d1e 2bd6 397110 7666 83791410 }
            // n = 7, score = 200
            //   8d3c30               | lea                 edi, dword ptr [eax + esi]
            //   3bf7                 | cmp                 esi, edi
            //   7d1e                 | jge                 0x20
            //   2bd6                 | sub                 edx, esi
            //   397110               | cmp                 dword ptr [ecx + 0x10], esi
            //   7666                 | jbe                 0x68
            //   83791410             | cmp                 dword ptr [ecx + 0x14], 0x10

        $sequence_1 = { c1ea09 83e27f 0bd0 23d3 2bd6 42 81f235ad0000 }
            // n = 7, score = 200
            //   c1ea09               | shr                 edx, 9
            //   83e27f               | and                 edx, 0x7f
            //   0bd0                 | or                  edx, eax
            //   23d3                 | and                 edx, ebx
            //   2bd6                 | sub                 edx, esi
            //   42                   | inc                 edx
            //   81f235ad0000         | xor                 edx, 0xad35

        $sequence_2 = { 57 56 e8???????? e9???????? 33f6 8d8d80f3ffff 57 }
            // n = 7, score = 200
            //   57                   | push                edi
            //   56                   | push                esi
            //   e8????????           |                     
            //   e9????????           |                     
            //   33f6                 | xor                 esi, esi
            //   8d8d80f3ffff         | lea                 ecx, dword ptr [ebp - 0xc80]
            //   57                   | push                edi

        $sequence_3 = { 72db 68???????? 53 b9b4733de3 e8???????? ffd0 8bc6 }
            // n = 7, score = 200
            //   72db                 | jb                  0xffffffdd
            //   68????????           |                     
            //   53                   | push                ebx
            //   b9b4733de3           | mov                 ecx, 0xe33d73b4
            //   e8????????           |                     
            //   ffd0                 | call                eax
            //   8bc6                 | mov                 eax, esi

        $sequence_4 = { 8d4d18 e8???????? 8b45f0 e8???????? c3 55 8bec }
            // n = 7, score = 200
            //   8d4d18               | lea                 ecx, dword ptr [ebp + 0x18]
            //   e8????????           |                     
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   e8????????           |                     
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp

        $sequence_5 = { 895dac 660f6f05???????? f30f7f45c8 68???????? 660f6f05???????? 8975a8 }
            // n = 6, score = 200
            //   895dac               | mov                 dword ptr [ebp - 0x54], ebx
            //   660f6f05????????     |                     
            //   f30f7f45c8           | movdqu              xmmword ptr [ebp - 0x38], xmm0
            //   68????????           |                     
            //   660f6f05????????     |                     
            //   8975a8               | mov                 dword ptr [ebp - 0x58], esi

        $sequence_6 = { 6bc828 8b441914 03441910 b9aacd12d8 50 56 e8???????? }
            // n = 7, score = 200
            //   6bc828               | imul                ecx, eax, 0x28
            //   8b441914             | mov                 eax, dword ptr [ecx + ebx + 0x14]
            //   03441910             | add                 eax, dword ptr [ecx + ebx + 0x10]
            //   b9aacd12d8           | mov                 ecx, 0xd812cdaa
            //   50                   | push                eax
            //   56                   | push                esi
            //   e8????????           |                     

        $sequence_7 = { 50 8bcf c747140f000000 895f10 881f e8???????? 53 }
            // n = 7, score = 200
            //   50                   | push                eax
            //   8bcf                 | mov                 ecx, edi
            //   c747140f000000       | mov                 dword ptr [edi + 0x14], 0xf
            //   895f10               | mov                 dword ptr [edi + 0x10], ebx
            //   881f                 | mov                 byte ptr [edi], bl
            //   e8????????           |                     
            //   53                   | push                ebx

        $sequence_8 = { 83e101 0bc1 25ffff0000 48 357ee00000 05d26fffff 03c2 }
            // n = 7, score = 200
            //   83e101               | and                 ecx, 1
            //   0bc1                 | or                  eax, ecx
            //   25ffff0000           | and                 eax, 0xffff
            //   48                   | dec                 eax
            //   357ee00000           | xor                 eax, 0xe07e
            //   05d26fffff           | add                 eax, 0xffff6fd2
            //   03c2                 | add                 eax, edx

        $sequence_9 = { 2bca 8d8504ffffff d1f9 51 53 50 e8???????? }
            // n = 7, score = 200
            //   2bca                 | sub                 ecx, edx
            //   8d8504ffffff         | lea                 eax, dword ptr [ebp - 0xfc]
            //   d1f9                 | sar                 ecx, 1
            //   51                   | push                ecx
            //   53                   | push                ebx
            //   50                   | push                eax
            //   e8????????           |                     

    condition:
        7 of them and filesize < 368640
}