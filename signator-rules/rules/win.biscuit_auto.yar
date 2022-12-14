rule win_biscuit_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.biscuit."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.biscuit"
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
        $sequence_0 = { 898d68b7ffff 8b9568b7ffff 52 e8???????? 83c404 eb22 }
            // n = 6, score = 100
            //   898d68b7ffff         | mov                 dword ptr [ebp - 0x4898], ecx
            //   8b9568b7ffff         | mov                 edx, dword ptr [ebp - 0x4898]
            //   52                   | push                edx
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   eb22                 | jmp                 0x24

        $sequence_1 = { f2ae f7d1 83c1ff 51 6a00 }
            // n = 5, score = 100
            //   f2ae                 | repne scasb         al, byte ptr es:[edi]
            //   f7d1                 | not                 ecx
            //   83c1ff               | add                 ecx, -1
            //   51                   | push                ecx
            //   6a00                 | push                0

        $sequence_2 = { 741a 3cff 7416 85ff 7539 fec8 57 }
            // n = 7, score = 100
            //   741a                 | je                  0x1c
            //   3cff                 | cmp                 al, 0xff
            //   7416                 | je                  0x18
            //   85ff                 | test                edi, edi
            //   7539                 | jne                 0x3b
            //   fec8                 | dec                 al
            //   57                   | push                edi

        $sequence_3 = { f3a4 bf???????? ba???????? 83c9ff 33c0 f2ae }
            // n = 6, score = 100
            //   f3a4                 | rep movsb           byte ptr es:[edi], byte ptr [esi]
            //   bf????????           |                     
            //   ba????????           |                     
            //   83c9ff               | or                  ecx, 0xffffffff
            //   33c0                 | xor                 eax, eax
            //   f2ae                 | repne scasb         al, byte ptr es:[edi]

        $sequence_4 = { 8b4de0 898d10b7ffff 837ddc00 750c c7853cb6ffffe8914000 eb09 }
            // n = 6, score = 100
            //   8b4de0               | mov                 ecx, dword ptr [ebp - 0x20]
            //   898d10b7ffff         | mov                 dword ptr [ebp - 0x48f0], ecx
            //   837ddc00             | cmp                 dword ptr [ebp - 0x24], 0
            //   750c                 | jne                 0xe
            //   c7853cb6ffffe8914000     | mov    dword ptr [ebp - 0x49c4], 0x4091e8
            //   eb09                 | jmp                 0xb

        $sequence_5 = { 6a01 8d8da0b8ffff e8???????? e9???????? }
            // n = 4, score = 100
            //   6a01                 | push                1
            //   8d8da0b8ffff         | lea                 ecx, dword ptr [ebp - 0x4760]
            //   e8????????           |                     
            //   e9????????           |                     

        $sequence_6 = { e8???????? 8d8d40b9ffff e8???????? 8d8d40fdffff }
            // n = 4, score = 100
            //   e8????????           |                     
            //   8d8d40b9ffff         | lea                 ecx, dword ptr [ebp - 0x46c0]
            //   e8????????           |                     
            //   8d8d40fdffff         | lea                 ecx, dword ptr [ebp - 0x2c0]

        $sequence_7 = { 40 f6d2 88540413 3bc1 7cf1 8d46f8 }
            // n = 6, score = 100
            //   40                   | inc                 eax
            //   f6d2                 | not                 dl
            //   88540413             | mov                 byte ptr [esp + eax + 0x13], dl
            //   3bc1                 | cmp                 eax, ecx
            //   7cf1                 | jl                  0xfffffff3
            //   8d46f8               | lea                 eax, dword ptr [esi - 8]

        $sequence_8 = { 52 6a00 8b85dcfeffff 50 8d4de0 }
            // n = 5, score = 100
            //   52                   | push                edx
            //   6a00                 | push                0
            //   8b85dcfeffff         | mov                 eax, dword ptr [ebp - 0x124]
            //   50                   | push                eax
            //   8d4de0               | lea                 ecx, dword ptr [ebp - 0x20]

        $sequence_9 = { 6a01 8d8de4faffff e8???????? 6a01 8d8d74fbffff }
            // n = 5, score = 100
            //   6a01                 | push                1
            //   8d8de4faffff         | lea                 ecx, dword ptr [ebp - 0x51c]
            //   e8????????           |                     
            //   6a01                 | push                1
            //   8d8d74fbffff         | lea                 ecx, dword ptr [ebp - 0x48c]

    condition:
        7 of them and filesize < 180224
}