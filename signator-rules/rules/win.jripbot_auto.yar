rule win_jripbot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.jripbot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.jripbot"
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
        $sequence_0 = { 7405 49 75ef eb06 33d2 66891448 8bd8 }
            // n = 7, score = 100
            //   7405                 | je                  7
            //   49                   | dec                 ecx
            //   75ef                 | jne                 0xfffffff1
            //   eb06                 | jmp                 8
            //   33d2                 | xor                 edx, edx
            //   66891448             | mov                 word ptr [eax + ecx*2], dx
            //   8bd8                 | mov                 ebx, eax

        $sequence_1 = { ff35???????? 68???????? ff74243c ff742420 ff15???????? 83c414 57 }
            // n = 7, score = 100
            //   ff35????????         |                     
            //   68????????           |                     
            //   ff74243c             | push                dword ptr [esp + 0x3c]
            //   ff742420             | push                dword ptr [esp + 0x20]
            //   ff15????????         |                     
            //   83c414               | add                 esp, 0x14
            //   57                   | push                edi

        $sequence_2 = { 33ff 8d44240c 50 81cf19000200 57 6a00 bb???????? }
            // n = 7, score = 100
            //   33ff                 | xor                 edi, edi
            //   8d44240c             | lea                 eax, dword ptr [esp + 0xc]
            //   50                   | push                eax
            //   81cf19000200         | or                  edi, 0x20019
            //   57                   | push                edi
            //   6a00                 | push                0
            //   bb????????           |                     

        $sequence_3 = { 66c7400a0201 66c7400c0101 8810 66c740010d00 6a0e 66c740030a00 c6400508 }
            // n = 7, score = 100
            //   66c7400a0201         | mov                 word ptr [eax + 0xa], 0x102
            //   66c7400c0101         | mov                 word ptr [eax + 0xc], 0x101
            //   8810                 | mov                 byte ptr [eax], dl
            //   66c740010d00         | mov                 word ptr [eax + 1], 0xd
            //   6a0e                 | push                0xe
            //   66c740030a00         | mov                 word ptr [eax + 3], 0xa
            //   c6400508             | mov                 byte ptr [eax + 5], 8

        $sequence_4 = { ff15???????? 8bf8 89bdc4fbffff 83ffff 7418 57 8db5dcfbffff }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax
            //   89bdc4fbffff         | mov                 dword ptr [ebp - 0x43c], edi
            //   83ffff               | cmp                 edi, -1
            //   7418                 | je                  0x1a
            //   57                   | push                edi
            //   8db5dcfbffff         | lea                 esi, dword ptr [ebp - 0x424]

        $sequence_5 = { 0faf5dc8 015dc0 42 81fa00010000 76da 33c0 }
            // n = 6, score = 100
            //   0faf5dc8             | imul                ebx, dword ptr [ebp - 0x38]
            //   015dc0               | add                 dword ptr [ebp - 0x40], ebx
            //   42                   | inc                 edx
            //   81fa00010000         | cmp                 edx, 0x100
            //   76da                 | jbe                 0xffffffdc
            //   33c0                 | xor                 eax, eax

        $sequence_6 = { ff44240c 8344241010 8b44240c 48 3b442418 0f822bffffff }
            // n = 6, score = 100
            //   ff44240c             | inc                 dword ptr [esp + 0xc]
            //   8344241010           | add                 dword ptr [esp + 0x10], 0x10
            //   8b44240c             | mov                 eax, dword ptr [esp + 0xc]
            //   48                   | dec                 eax
            //   3b442418             | cmp                 eax, dword ptr [esp + 0x18]
            //   0f822bffffff         | jb                  0xffffff31

        $sequence_7 = { e8???????? 83c408 85c0 75a2 8b85f4fdffff 8985e4fdffff 0385e0fdffff }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   85c0                 | test                eax, eax
            //   75a2                 | jne                 0xffffffa4
            //   8b85f4fdffff         | mov                 eax, dword ptr [ebp - 0x20c]
            //   8985e4fdffff         | mov                 dword ptr [ebp - 0x21c], eax
            //   0385e0fdffff         | add                 eax, dword ptr [ebp - 0x220]

        $sequence_8 = { ff75e8 ffd7 395d0c 0f849e000000 a1???????? 3bc3 0f8491000000 }
            // n = 7, score = 100
            //   ff75e8               | push                dword ptr [ebp - 0x18]
            //   ffd7                 | call                edi
            //   395d0c               | cmp                 dword ptr [ebp + 0xc], ebx
            //   0f849e000000         | je                  0xa4
            //   a1????????           |                     
            //   3bc3                 | cmp                 eax, ebx
            //   0f8491000000         | je                  0x97

        $sequence_9 = { 57 ff742424 33c9 0b4bfc 0bc7 50 51 }
            // n = 7, score = 100
            //   57                   | push                edi
            //   ff742424             | push                dword ptr [esp + 0x24]
            //   33c9                 | xor                 ecx, ecx
            //   0b4bfc               | or                  ecx, dword ptr [ebx - 4]
            //   0bc7                 | or                  eax, edi
            //   50                   | push                eax
            //   51                   | push                ecx

    condition:
        7 of them and filesize < 507904
}