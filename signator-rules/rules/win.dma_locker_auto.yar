rule win_dma_locker_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.dma_locker."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.dma_locker"
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
        $sequence_0 = { 894108 89410c 894110 894114 894118 89411c 66894120 }
            // n = 7, score = 200
            //   894108               | mov                 dword ptr [ecx + 8], eax
            //   89410c               | mov                 dword ptr [ecx + 0xc], eax
            //   894110               | mov                 dword ptr [ecx + 0x10], eax
            //   894114               | mov                 dword ptr [ecx + 0x14], eax
            //   894118               | mov                 dword ptr [ecx + 0x18], eax
            //   89411c               | mov                 dword ptr [ecx + 0x1c], eax
            //   66894120             | mov                 word ptr [ecx + 0x20], ax

        $sequence_1 = { 8975c4 8975c8 ffd7 68007f0000 56 8945cc ff15???????? }
            // n = 7, score = 200
            //   8975c4               | mov                 dword ptr [ebp - 0x3c], esi
            //   8975c8               | mov                 dword ptr [ebp - 0x38], esi
            //   ffd7                 | call                edi
            //   68007f0000           | push                0x7f00
            //   56                   | push                esi
            //   8945cc               | mov                 dword ptr [ebp - 0x34], eax
            //   ff15????????         |                     

        $sequence_2 = { ff15???????? 8b442414 8b0d???????? 6a00 50 6a30 }
            // n = 6, score = 200
            //   ff15????????         |                     
            //   8b442414             | mov                 eax, dword ptr [esp + 0x14]
            //   8b0d????????         |                     
            //   6a00                 | push                0
            //   50                   | push                eax
            //   6a30                 | push                0x30

        $sequence_3 = { 50 6a00 56 6a11 6a5f 68d4010000 680c030000 }
            // n = 7, score = 200
            //   50                   | push                eax
            //   6a00                 | push                0
            //   56                   | push                esi
            //   6a11                 | push                0x11
            //   6a5f                 | push                0x5f
            //   68d4010000           | push                0x1d4
            //   680c030000           | push                0x30c

        $sequence_4 = { c3 68???????? e8???????? 8b4dfc 83c404 5f }
            // n = 6, score = 200
            //   c3                   | ret                 
            //   68????????           |                     
            //   e8????????           |                     
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   83c404               | add                 esp, 4
            //   5f                   | pop                 edi

        $sequence_5 = { 7411 8d95e0fdffff 52 50 e8???????? 8bf0 eb02 }
            // n = 7, score = 200
            //   7411                 | je                  0x13
            //   8d95e0fdffff         | lea                 edx, dword ptr [ebp - 0x220]
            //   52                   | push                edx
            //   50                   | push                eax
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   eb02                 | jmp                 4

        $sequence_6 = { 83c40c 8b9dc0efffff eb29 3b4610 }
            // n = 4, score = 200
            //   83c40c               | add                 esp, 0xc
            //   8b9dc0efffff         | mov                 ebx, dword ptr [ebp - 0x1040]
            //   eb29                 | jmp                 0x2b
            //   3b4610               | cmp                 eax, dword ptr [esi + 0x10]

        $sequence_7 = { 6a00 56 6a0f 6896000000 }
            // n = 4, score = 200
            //   6a00                 | push                0
            //   56                   | push                esi
            //   6a0f                 | push                0xf
            //   6896000000           | push                0x96

        $sequence_8 = { e8???????? 83c444 8d95f4fdffff 52 8d85f8feffff 50 }
            // n = 6, score = 200
            //   e8????????           |                     
            //   83c444               | add                 esp, 0x44
            //   8d95f4fdffff         | lea                 edx, dword ptr [ebp - 0x20c]
            //   52                   | push                edx
            //   8d85f8feffff         | lea                 eax, dword ptr [ebp - 0x108]
            //   50                   | push                eax

        $sequence_9 = { 895dfc 68ffff0000 885e18 e8???????? 68ffff0000 53 50 }
            // n = 7, score = 200
            //   895dfc               | mov                 dword ptr [ebp - 4], ebx
            //   68ffff0000           | push                0xffff
            //   885e18               | mov                 byte ptr [esi + 0x18], bl
            //   e8????????           |                     
            //   68ffff0000           | push                0xffff
            //   53                   | push                ebx
            //   50                   | push                eax

    condition:
        7 of them and filesize < 532480
}