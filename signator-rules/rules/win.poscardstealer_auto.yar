rule win_poscardstealer_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.poscardstealer."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.poscardstealer"
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
        $sequence_0 = { e8???????? 83c404 8b8544ffffff 8b4df4 64890d00000000 59 5f }
            // n = 7, score = 200
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   8b8544ffffff         | mov                 eax, dword ptr [ebp - 0xbc]
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]
            //   64890d00000000       | mov                 dword ptr fs:[0], ecx
            //   59                   | pop                 ecx
            //   5f                   | pop                 edi

        $sequence_1 = { e8???????? 83c40c 3bc3 7514 83fe01 7305 83c8ff }
            // n = 7, score = 200
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   3bc3                 | cmp                 eax, ebx
            //   7514                 | jne                 0x16
            //   83fe01               | cmp                 esi, 1
            //   7305                 | jae                 7
            //   83c8ff               | or                  eax, 0xffffffff

        $sequence_2 = { 7442 8d9578edffff 52 683f000f00 6a00 }
            // n = 5, score = 200
            //   7442                 | je                  0x44
            //   8d9578edffff         | lea                 edx, dword ptr [ebp - 0x1288]
            //   52                   | push                edx
            //   683f000f00           | push                0xf003f
            //   6a00                 | push                0

        $sequence_3 = { e8???????? 6aff 40 50 8d8d64ffffff 51 8d4dd4 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   6aff                 | push                -1
            //   40                   | inc                 eax
            //   50                   | push                eax
            //   8d8d64ffffff         | lea                 ecx, dword ptr [ebp - 0x9c]
            //   51                   | push                ecx
            //   8d4dd4               | lea                 ecx, dword ptr [ebp - 0x2c]

        $sequence_4 = { 751d 8d04f5f05b4200 8938 68a00f0000 }
            // n = 4, score = 200
            //   751d                 | jne                 0x1f
            //   8d04f5f05b4200       | lea                 eax, dword ptr [esi*8 + 0x425bf0]
            //   8938                 | mov                 dword ptr [eax], edi
            //   68a00f0000           | push                0xfa0

        $sequence_5 = { 03d1 c1fa04 8bda c1eb1f 03da 899d98edffff }
            // n = 6, score = 200
            //   03d1                 | add                 edx, ecx
            //   c1fa04               | sar                 edx, 4
            //   8bda                 | mov                 ebx, edx
            //   c1eb1f               | shr                 ebx, 0x1f
            //   03da                 | add                 ebx, edx
            //   899d98edffff         | mov                 dword ptr [ebp - 0x1268], ebx

        $sequence_6 = { 8d4b01 837d9410 8b4580 7303 }
            // n = 4, score = 200
            //   8d4b01               | lea                 ecx, dword ptr [ebx + 1]
            //   837d9410             | cmp                 dword ptr [ebp - 0x6c], 0x10
            //   8b4580               | mov                 eax, dword ptr [ebp - 0x80]
            //   7303                 | jae                 5

        $sequence_7 = { 50 b9???????? e8???????? 837de810 }
            // n = 4, score = 200
            //   50                   | push                eax
            //   b9????????           |                     
            //   e8????????           |                     
            //   837de810             | cmp                 dword ptr [ebp - 0x18], 0x10

        $sequence_8 = { 83c404 84c0 0f858f000000 897de8 895de4 885dd4 }
            // n = 6, score = 200
            //   83c404               | add                 esp, 4
            //   84c0                 | test                al, al
            //   0f858f000000         | jne                 0x95
            //   897de8               | mov                 dword ptr [ebp - 0x18], edi
            //   895de4               | mov                 dword ptr [ebp - 0x1c], ebx
            //   885dd4               | mov                 byte ptr [ebp - 0x2c], bl

        $sequence_9 = { 51 8d5580 52 e8???????? 50 8d45b8 }
            // n = 6, score = 200
            //   51                   | push                ecx
            //   8d5580               | lea                 edx, dword ptr [ebp - 0x80]
            //   52                   | push                edx
            //   e8????????           |                     
            //   50                   | push                eax
            //   8d45b8               | lea                 eax, dword ptr [ebp - 0x48]

    condition:
        7 of them and filesize < 362496
}