rule win_taidoor_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.taidoor."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.taidoor"
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
        $sequence_0 = { 3bc3 0f84b9000000 83c002 50 e8???????? }
            // n = 5, score = 300
            //   3bc3                 | cmp                 eax, ebx
            //   0f84b9000000         | je                  0xbf
            //   83c002               | add                 eax, 2
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_1 = { 53 56 57 a0???????? 33ff }
            // n = 5, score = 300
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   a0????????           |                     
            //   33ff                 | xor                 edi, edi

        $sequence_2 = { 7441 0fb68699010000 50 0fb68698010000 50 0fb68697010000 }
            // n = 6, score = 300
            //   7441                 | je                  0x43
            //   0fb68699010000       | movzx               eax, byte ptr [esi + 0x199]
            //   50                   | push                eax
            //   0fb68698010000       | movzx               eax, byte ptr [esi + 0x198]
            //   50                   | push                eax
            //   0fb68697010000       | movzx               eax, byte ptr [esi + 0x197]

        $sequence_3 = { 817ddc04010000 0f8d5e030000 41 8d859cfcffff 51 }
            // n = 5, score = 300
            //   817ddc04010000       | cmp                 dword ptr [ebp - 0x24], 0x104
            //   0f8d5e030000         | jge                 0x364
            //   41                   | inc                 ecx
            //   8d859cfcffff         | lea                 eax, dword ptr [ebp - 0x364]
            //   51                   | push                ecx

        $sequence_4 = { 8d45e0 57 50 8d45e4 897de4 }
            // n = 5, score = 300
            //   8d45e0               | lea                 eax, dword ptr [ebp - 0x20]
            //   57                   | push                edi
            //   50                   | push                eax
            //   8d45e4               | lea                 eax, dword ptr [ebp - 0x1c]
            //   897de4               | mov                 dword ptr [ebp - 0x1c], edi

        $sequence_5 = { 8b4d08 50 e8???????? c745e801000000 8065fc00 }
            // n = 5, score = 300
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   50                   | push                eax
            //   e8????????           |                     
            //   c745e801000000       | mov                 dword ptr [ebp - 0x18], 1
            //   8065fc00             | and                 byte ptr [ebp - 4], 0

        $sequence_6 = { 6a04 8d45d4 51 50 e8???????? 8b45d4 83c40c }
            // n = 7, score = 300
            //   6a04                 | push                4
            //   8d45d4               | lea                 eax, dword ptr [ebp - 0x2c]
            //   51                   | push                ecx
            //   50                   | push                eax
            //   e8????????           |                     
            //   8b45d4               | mov                 eax, dword ptr [ebp - 0x2c]
            //   83c40c               | add                 esp, 0xc

        $sequence_7 = { ff70f8 50 e8???????? 395d10 7e1b 56 8b450c }
            // n = 7, score = 300
            //   ff70f8               | push                dword ptr [eax - 8]
            //   50                   | push                eax
            //   e8????????           |                     
            //   395d10               | cmp                 dword ptr [ebp + 0x10], ebx
            //   7e1b                 | jle                 0x1d
            //   56                   | push                esi
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]

        $sequence_8 = { e8???????? ff75ec 8d85a0fdffff 50 51 8bcc 8965f4 }
            // n = 7, score = 300
            //   e8????????           |                     
            //   ff75ec               | push                dword ptr [ebp - 0x14]
            //   8d85a0fdffff         | lea                 eax, dword ptr [ebp - 0x260]
            //   50                   | push                eax
            //   51                   | push                ecx
            //   8bcc                 | mov                 ecx, esp
            //   8965f4               | mov                 dword ptr [ebp - 0xc], esp

        $sequence_9 = { 3b70f8 7cdc 8b4d08 8d45f0 50 e8???????? }
            // n = 6, score = 300
            //   3b70f8               | cmp                 esi, dword ptr [eax - 8]
            //   7cdc                 | jl                  0xffffffde
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   8d45f0               | lea                 eax, dword ptr [ebp - 0x10]
            //   50                   | push                eax
            //   e8????????           |                     

    condition:
        7 of them and filesize < 49152
}