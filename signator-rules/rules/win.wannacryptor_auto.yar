rule win_wannacryptor_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.wannacryptor."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.wannacryptor"
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
        $sequence_0 = { 8b7c241c c644241a00 8a443701 8a143e 88442419 88542418 b9???????? }
            // n = 7, score = 600
            //   8b7c241c             | mov                 edi, dword ptr [esp + 0x1c]
            //   c644241a00           | mov                 byte ptr [esp + 0x1a], 0
            //   8a443701             | mov                 al, byte ptr [edi + esi + 1]
            //   8a143e               | mov                 dl, byte ptr [esi + edi]
            //   88442419             | mov                 byte ptr [esp + 0x19], al
            //   88542418             | mov                 byte ptr [esp + 0x18], dl
            //   b9????????           |                     

        $sequence_1 = { 50 e8???????? 83c404 894500 f7d8 }
            // n = 5, score = 600
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   894500               | mov                 dword ptr [ebp], eax
            //   f7d8                 | neg                 eax

        $sequence_2 = { 8a02 84c0 7413 3c2f 7404 }
            // n = 5, score = 600
            //   8a02                 | mov                 al, byte ptr [edx]
            //   84c0                 | test                al, al
            //   7413                 | je                  0x15
            //   3c2f                 | cmp                 al, 0x2f
            //   7404                 | je                  6

        $sequence_3 = { 81fa00010000 7515 8b5008 83fa0d 7405 83fa1b }
            // n = 6, score = 600
            //   81fa00010000         | cmp                 edx, 0x100
            //   7515                 | jne                 0x17
            //   8b5008               | mov                 edx, dword ptr [eax + 8]
            //   83fa0d               | cmp                 edx, 0xd
            //   7405                 | je                  7
            //   83fa1b               | cmp                 edx, 0x1b

        $sequence_4 = { bf02000000 6a06 6a01 57 668944243a }
            // n = 5, score = 600
            //   bf02000000           | mov                 edi, 2
            //   6a06                 | push                6
            //   6a01                 | push                1
            //   57                   | push                edi
            //   668944243a           | mov                 word ptr [esp + 0x3a], ax

        $sequence_5 = { 8b7b04 03f8 8bc1 c1e902 f3a5 8bc8 }
            // n = 6, score = 600
            //   8b7b04               | mov                 edi, dword ptr [ebx + 4]
            //   03f8                 | add                 edi, eax
            //   8bc1                 | mov                 eax, ecx
            //   c1e902               | shr                 ecx, 2
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   8bc8                 | mov                 ecx, eax

        $sequence_6 = { f7f9 85c0 7443 3bf9 7c3f }
            // n = 5, score = 600
            //   f7f9                 | idiv                ecx
            //   85c0                 | test                eax, eax
            //   7443                 | je                  0x45
            //   3bf9                 | cmp                 edi, ecx
            //   7c3f                 | jl                  0x41

        $sequence_7 = { 8d55f0 52 e9???????? 81fe00900100 760b 6aff }
            // n = 6, score = 600
            //   8d55f0               | lea                 edx, dword ptr [ebp - 0x10]
            //   52                   | push                edx
            //   e9????????           |                     
            //   81fe00900100         | cmp                 esi, 0x19000
            //   760b                 | jbe                 0xd
            //   6aff                 | push                -1

        $sequence_8 = { 8d8c2484000000 e8???????? 8b4650 8b4e4c 8b5654 89ac24dc000000 c74424403fb5ff00 }
            // n = 7, score = 600
            //   8d8c2484000000       | lea                 ecx, dword ptr [esp + 0x84]
            //   e8????????           |                     
            //   8b4650               | mov                 eax, dword ptr [esi + 0x50]
            //   8b4e4c               | mov                 ecx, dword ptr [esi + 0x4c]
            //   8b5654               | mov                 edx, dword ptr [esi + 0x54]
            //   89ac24dc000000       | mov                 dword ptr [esp + 0xdc], ebp
            //   c74424403fb5ff00     | mov                 dword ptr [esp + 0x40], 0xffb53f

        $sequence_9 = { 8b4c244c 8bc1 51 c1e810 50 }
            // n = 5, score = 600
            //   8b4c244c             | mov                 ecx, dword ptr [esp + 0x4c]
            //   8bc1                 | mov                 eax, ecx
            //   51                   | push                ecx
            //   c1e810               | shr                 eax, 0x10
            //   50                   | push                eax

    condition:
        7 of them and filesize < 540672
}