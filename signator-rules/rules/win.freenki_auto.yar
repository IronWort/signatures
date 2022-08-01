rule win_freenki_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.freenki."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.freenki"
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
        $sequence_0 = { 3bd6 8b0c8578394200 0f95c0 02c0 3244392d 2402 }
            // n = 6, score = 200
            //   3bd6                 | cmp                 edx, esi
            //   8b0c8578394200       | mov                 ecx, dword ptr [eax*4 + 0x423978]
            //   0f95c0               | setne               al
            //   02c0                 | add                 al, al
            //   3244392d             | xor                 al, byte ptr [ecx + edi + 0x2d]
            //   2402                 | and                 al, 2

        $sequence_1 = { 8d041f 8975d0 8975e0 8975f0 c745f448b14100 8b7485bc 8d4601 }
            // n = 7, score = 200
            //   8d041f               | lea                 eax, dword ptr [edi + ebx]
            //   8975d0               | mov                 dword ptr [ebp - 0x30], esi
            //   8975e0               | mov                 dword ptr [ebp - 0x20], esi
            //   8975f0               | mov                 dword ptr [ebp - 0x10], esi
            //   c745f448b14100       | mov                 dword ptr [ebp - 0xc], 0x41b148
            //   8b7485bc             | mov                 esi, dword ptr [ebp + eax*4 - 0x44]
            //   8d4601               | lea                 eax, dword ptr [esi + 1]

        $sequence_2 = { 8d85fcfeffff 50 ff15???????? 8b85f8fcffff 03c0 3d00010000 }
            // n = 6, score = 200
            //   8d85fcfeffff         | lea                 eax, dword ptr [ebp - 0x104]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8b85f8fcffff         | mov                 eax, dword ptr [ebp - 0x308]
            //   03c0                 | add                 eax, eax
            //   3d00010000           | cmp                 eax, 0x100

        $sequence_3 = { ff520c 85c0 7428 8b8560ffffff 50 8b08 ff5108 }
            // n = 7, score = 200
            //   ff520c               | call                dword ptr [edx + 0xc]
            //   85c0                 | test                eax, eax
            //   7428                 | je                  0x2a
            //   8b8560ffffff         | mov                 eax, dword ptr [ebp - 0xa0]
            //   50                   | push                eax
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   ff5108               | call                dword ptr [ecx + 8]

        $sequence_4 = { ff15???????? 85c0 7472 8d45f8 50 }
            // n = 5, score = 200
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7472                 | je                  0x74
            //   8d45f8               | lea                 eax, dword ptr [ebp - 8]
            //   50                   | push                eax

        $sequence_5 = { 6810040000 ff15???????? 8bd8 85db 0f84b6000000 8d85c8edffff 50 }
            // n = 7, score = 200
            //   6810040000           | push                0x410
            //   ff15????????         |                     
            //   8bd8                 | mov                 ebx, eax
            //   85db                 | test                ebx, ebx
            //   0f84b6000000         | je                  0xbc
            //   8d85c8edffff         | lea                 eax, dword ptr [ebp - 0x1238]
            //   50                   | push                eax

        $sequence_6 = { 7504 8816 eb3e c6060d 8b048d78394200 8854382a eb2e }
            // n = 7, score = 200
            //   7504                 | jne                 6
            //   8816                 | mov                 byte ptr [esi], dl
            //   eb3e                 | jmp                 0x40
            //   c6060d               | mov                 byte ptr [esi], 0xd
            //   8b048d78394200       | mov                 eax, dword ptr [ecx*4 + 0x423978]
            //   8854382a             | mov                 byte ptr [eax + edi + 0x2a], dl
            //   eb2e                 | jmp                 0x30

        $sequence_7 = { 8b45dc 50 8b08 ff5108 8b4dd8 85c9 }
            // n = 6, score = 200
            //   8b45dc               | mov                 eax, dword ptr [ebp - 0x24]
            //   50                   | push                eax
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   ff5108               | call                dword ptr [ecx + 8]
            //   8b4dd8               | mov                 ecx, dword ptr [ebp - 0x28]
            //   85c9                 | test                ecx, ecx

        $sequence_8 = { 6a01 ffb5f4f9ffff e8???????? 56 e8???????? 56 e8???????? }
            // n = 7, score = 200
            //   6a01                 | push                1
            //   ffb5f4f9ffff         | push                dword ptr [ebp - 0x60c]
            //   e8????????           |                     
            //   56                   | push                esi
            //   e8????????           |                     
            //   56                   | push                esi
            //   e8????????           |                     

        $sequence_9 = { eb02 33f6 0f1005???????? 8d45ec c78574ffffff01000000 8d9564ffffff }
            // n = 6, score = 200
            //   eb02                 | jmp                 4
            //   33f6                 | xor                 esi, esi
            //   0f1005????????       |                     
            //   8d45ec               | lea                 eax, dword ptr [ebp - 0x14]
            //   c78574ffffff01000000     | mov    dword ptr [ebp - 0x8c], 1
            //   8d9564ffffff         | lea                 edx, dword ptr [ebp - 0x9c]

    condition:
        7 of them and filesize < 327680
}