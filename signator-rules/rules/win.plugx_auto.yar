rule win_plugx_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.plugx."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.plugx"
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
        $sequence_0 = { 3bc1 7c03 894dfc 8b4610 03462c ff75fc 50 }
            // n = 7, score = 1000
            //   3bc1                 | cmp                 eax, ecx
            //   7c03                 | jl                  5
            //   894dfc               | mov                 dword ptr [ebp - 4], ecx
            //   8b4610               | mov                 eax, dword ptr [esi + 0x10]
            //   03462c               | add                 eax, dword ptr [esi + 0x2c]
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   50                   | push                eax

        $sequence_1 = { 55 8bec 83e4f8 51 56 8b750c 8b4604 }
            // n = 7, score = 1000
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83e4f8               | and                 esp, 0xfffffff8
            //   51                   | push                ecx
            //   56                   | push                esi
            //   8b750c               | mov                 esi, dword ptr [ebp + 0xc]
            //   8b4604               | mov                 eax, dword ptr [esi + 4]

        $sequence_2 = { 56 e8???????? 59 8bc8 e8???????? 8bc7 5f }
            // n = 7, score = 1000
            //   56                   | push                esi
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   8bc8                 | mov                 ecx, eax
            //   e8????????           |                     
            //   8bc7                 | mov                 eax, edi
            //   5f                   | pop                 edi

        $sequence_3 = { 51 53 6a00 6a00 6a02 ffd0 }
            // n = 6, score = 1000
            //   51                   | push                ecx
            //   53                   | push                ebx
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a02                 | push                2
            //   ffd0                 | call                eax

        $sequence_4 = { 2b462c 2b4f10 8945fc 3bc1 }
            // n = 4, score = 1000
            //   2b462c               | sub                 eax, dword ptr [esi + 0x2c]
            //   2b4f10               | sub                 ecx, dword ptr [edi + 0x10]
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   3bc1                 | cmp                 eax, ecx

        $sequence_5 = { 53 56 8bf1 8d4614 }
            // n = 4, score = 1000
            //   53                   | push                ebx
            //   56                   | push                esi
            //   8bf1                 | mov                 esi, ecx
            //   8d4614               | lea                 eax, dword ptr [esi + 0x14]

        $sequence_6 = { 56 57 895de8 895df0 895dec 895de4 3bc3 }
            // n = 7, score = 1000
            //   56                   | push                esi
            //   57                   | push                edi
            //   895de8               | mov                 dword ptr [ebp - 0x18], ebx
            //   895df0               | mov                 dword ptr [ebp - 0x10], ebx
            //   895dec               | mov                 dword ptr [ebp - 0x14], ebx
            //   895de4               | mov                 dword ptr [ebp - 0x1c], ebx
            //   3bc3                 | cmp                 eax, ebx

        $sequence_7 = { 53 56 ff55ec 5f }
            // n = 4, score = 1000
            //   53                   | push                ebx
            //   56                   | push                esi
            //   ff55ec               | call                dword ptr [ebp - 0x14]
            //   5f                   | pop                 edi

        $sequence_8 = { 6a00 6a00 6a04 6a00 6a01 6800000040 57 }
            // n = 7, score = 600
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a04                 | push                4
            //   6a00                 | push                0
            //   6a01                 | push                1
            //   6800000040           | push                0x40000000
            //   57                   | push                edi

        $sequence_9 = { 6a00 6819000200 6a00 6a00 6a00 51 }
            // n = 6, score = 600
            //   6a00                 | push                0
            //   6819000200           | push                0x20019
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   51                   | push                ecx

        $sequence_10 = { 57 e8???????? eb0c e8???????? }
            // n = 4, score = 500
            //   57                   | push                edi
            //   e8????????           |                     
            //   eb0c                 | jmp                 0xe
            //   e8????????           |                     

        $sequence_11 = { ffd7 a3???????? 56 ffd0 }
            // n = 4, score = 400
            //   ffd7                 | call                edi
            //   a3????????           |                     
            //   56                   | push                esi
            //   ffd0                 | call                eax

        $sequence_12 = { 50 ffd6 a3???????? 57 ffd0 }
            // n = 5, score = 300
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   a3????????           |                     
            //   57                   | push                edi
            //   ffd0                 | call                eax

        $sequence_13 = { 6819000200 6a00 52 51 }
            // n = 4, score = 200
            //   6819000200           | push                0x20019
            //   6a00                 | push                0
            //   52                   | push                edx
            //   51                   | push                ecx

        $sequence_14 = { ffd7 a3???????? 68e8030000 ffd0 }
            // n = 4, score = 200
            //   ffd7                 | call                edi
            //   a3????????           |                     
            //   68e8030000           | push                0x3e8
            //   ffd0                 | call                eax

        $sequence_15 = { ffd6 a3???????? 6a64 ffd0 }
            // n = 4, score = 200
            //   ffd6                 | call                esi
            //   a3????????           |                     
            //   6a64                 | push                0x64
            //   ffd0                 | call                eax

        $sequence_16 = { 66898574ffffff b920000000 66898d76ffffff ba6e000000 66899578ffffff }
            // n = 5, score = 100
            //   66898574ffffff       | mov                 word ptr [ebp - 0x8c], ax
            //   b920000000           | mov                 ecx, 0x20
            //   66898d76ffffff       | mov                 word ptr [ebp - 0x8a], cx
            //   ba6e000000           | mov                 edx, 0x6e
            //   66899578ffffff       | mov                 word ptr [ebp - 0x88], dx

        $sequence_17 = { b832000000 6689458a b92e000000 66894d8c ba32000000 }
            // n = 5, score = 100
            //   b832000000           | mov                 eax, 0x32
            //   6689458a             | mov                 word ptr [ebp - 0x76], ax
            //   b92e000000           | mov                 ecx, 0x2e
            //   66894d8c             | mov                 word ptr [ebp - 0x74], cx
            //   ba32000000           | mov                 edx, 0x32

        $sequence_18 = { 6bc200 0fb78c05e0fcffff 83f92e 752d ba02000000 c1e200 0fb78415e0fcffff }
            // n = 7, score = 100
            //   6bc200               | imul                eax, edx, 0
            //   0fb78c05e0fcffff     | movzx               ecx, word ptr [ebp + eax - 0x320]
            //   83f92e               | cmp                 ecx, 0x2e
            //   752d                 | jne                 0x2f
            //   ba02000000           | mov                 edx, 2
            //   c1e200               | shl                 edx, 0
            //   0fb78415e0fcffff     | movzx               eax, word ptr [ebp + edx - 0x320]

        $sequence_19 = { 6a05 8b45f8 50 8b4dfc e8???????? 8945f4 }
            // n = 6, score = 100
            //   6a05                 | push                5
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   50                   | push                eax
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   e8????????           |                     
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax

        $sequence_20 = { 668945c6 b970000000 66894dc8 ba70000000 668955ca b864000000 668945cc }
            // n = 7, score = 100
            //   668945c6             | mov                 word ptr [ebp - 0x3a], ax
            //   b970000000           | mov                 ecx, 0x70
            //   66894dc8             | mov                 word ptr [ebp - 0x38], cx
            //   ba70000000           | mov                 edx, 0x70
            //   668955ca             | mov                 word ptr [ebp - 0x36], dx
            //   b864000000           | mov                 eax, 0x64
            //   668945cc             | mov                 word ptr [ebp - 0x34], ax

        $sequence_21 = { 83ec40 b802000000 6bc800 0fb79160850210 85d2 }
            // n = 5, score = 100
            //   83ec40               | sub                 esp, 0x40
            //   b802000000           | mov                 eax, 2
            //   6bc800               | imul                ecx, eax, 0
            //   0fb79160850210       | movzx               edx, word ptr [ecx + 0x10028560]
            //   85d2                 | test                edx, edx

        $sequence_22 = { 750b 8b55d8 8b45f8 0302 8945ac }
            // n = 5, score = 100
            //   750b                 | jne                 0xd
            //   8b55d8               | mov                 edx, dword ptr [ebp - 0x28]
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   0302                 | add                 eax, dword ptr [edx]
            //   8945ac               | mov                 dword ptr [ebp - 0x54], eax

        $sequence_23 = { 8d55c4 52 e8???????? 8d4dec e8???????? }
            // n = 5, score = 100
            //   8d55c4               | lea                 edx, dword ptr [ebp - 0x3c]
            //   52                   | push                edx
            //   e8????????           |                     
            //   8d4dec               | lea                 ecx, dword ptr [ebp - 0x14]
            //   e8????????           |                     

    condition:
        7 of them and filesize < 1018880
}