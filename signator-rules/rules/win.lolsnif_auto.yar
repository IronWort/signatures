rule win_lolsnif_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.lolsnif."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.lolsnif"
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
        $sequence_0 = { e8???????? 3bc7 8b4d20 8901 7508 ff15???????? }
            // n = 6, score = 200
            //   e8????????           |                     
            //   3bc7                 | cmp                 eax, edi
            //   8b4d20               | mov                 ecx, dword ptr [ebp + 0x20]
            //   8901                 | mov                 dword ptr [ecx], eax
            //   7508                 | jne                 0xa
            //   ff15????????         |                     

        $sequence_1 = { 8945f8 e8???????? b8???????? 83c9ff f00fc108 ff75f8 ff15???????? }
            // n = 7, score = 200
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   e8????????           |                     
            //   b8????????           |                     
            //   83c9ff               | or                  ecx, 0xffffffff
            //   f00fc108             | lock xadd           dword ptr [eax], ecx
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   ff15????????         |                     

        $sequence_2 = { 8945f0 53 8d45ec 50 6a02 ffd6 bf02010000 }
            // n = 7, score = 200
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   53                   | push                ebx
            //   8d45ec               | lea                 eax, dword ptr [ebp - 0x14]
            //   50                   | push                eax
            //   6a02                 | push                2
            //   ffd6                 | call                esi
            //   bf02010000           | mov                 edi, 0x102

        $sequence_3 = { 53 8945f4 68???????? 8d45f4 895df8 e8???????? }
            // n = 6, score = 200
            //   53                   | push                ebx
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   68????????           |                     
            //   8d45f4               | lea                 eax, dword ptr [ebp - 0xc]
            //   895df8               | mov                 dword ptr [ebp - 8], ebx
            //   e8????????           |                     

        $sequence_4 = { 7551 8b473c 2441 3c40 }
            // n = 4, score = 200
            //   7551                 | jne                 0x53
            //   8b473c               | mov                 eax, dword ptr [edi + 0x3c]
            //   2441                 | and                 al, 0x41
            //   3c40                 | cmp                 al, 0x40

        $sequence_5 = { e8???????? 8b45fc 894604 8b451c 3bc3 }
            // n = 5, score = 200
            //   e8????????           |                     
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   894604               | mov                 dword ptr [esi + 4], eax
            //   8b451c               | mov                 eax, dword ptr [ebp + 0x1c]
            //   3bc3                 | cmp                 eax, ebx

        $sequence_6 = { 7413 8b4010 3bc6 740c 8b5508 890a }
            // n = 6, score = 200
            //   7413                 | je                  0x15
            //   8b4010               | mov                 eax, dword ptr [eax + 0x10]
            //   3bc6                 | cmp                 eax, esi
            //   740c                 | je                  0xe
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   890a                 | mov                 dword ptr [edx], ecx

        $sequence_7 = { 8bf0 83feff 743e bf???????? }
            // n = 4, score = 200
            //   8bf0                 | mov                 esi, eax
            //   83feff               | cmp                 esi, -1
            //   743e                 | je                  0x40
            //   bf????????           |                     

        $sequence_8 = { 0f84fe030000 68???????? ff15???????? e9???????? 6a02 59 }
            // n = 6, score = 200
            //   0f84fe030000         | je                  0x404
            //   68????????           |                     
            //   ff15????????         |                     
            //   e9????????           |                     
            //   6a02                 | push                2
            //   59                   | pop                 ecx

        $sequence_9 = { 83483c40 8b4508 8a4e04 80e104 f6d9 1bc9 83e106 }
            // n = 7, score = 200
            //   83483c40             | or                  dword ptr [eax + 0x3c], 0x40
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8a4e04               | mov                 cl, byte ptr [esi + 4]
            //   80e104               | and                 cl, 4
            //   f6d9                 | neg                 cl
            //   1bc9                 | sbb                 ecx, ecx
            //   83e106               | and                 ecx, 6

    condition:
        7 of them and filesize < 425984
}