rule win_bistromath_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.bistromath."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.bistromath"
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
        $sequence_0 = { ff75f8 8b5714 f7c100080000 8bcb 7407 e8???????? eb05 }
            // n = 7, score = 300
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   8b5714               | mov                 edx, dword ptr [edi + 0x14]
            //   f7c100080000         | test                ecx, 0x800
            //   8bcb                 | mov                 ecx, ebx
            //   7407                 | je                  9
            //   e8????????           |                     
            //   eb05                 | jmp                 7

        $sequence_1 = { ff942470030000 48 89442428 48 8d8c24c0000000 ff942470030000 48 }
            // n = 7, score = 300
            //   ff942470030000       | call                dword ptr [esp + 0x370]
            //   48                   | dec                 eax
            //   89442428             | mov                 dword ptr [esp + 0x28], eax
            //   48                   | dec                 eax
            //   8d8c24c0000000       | lea                 ecx, dword ptr [esp + 0xc0]
            //   ff942470030000       | call                dword ptr [esp + 0x370]
            //   48                   | dec                 eax

        $sequence_2 = { ffb5d8eeffff ff15???????? 85c0 0f85c4010000 90 33c0 8985b4eeffff }
            // n = 7, score = 300
            //   ffb5d8eeffff         | push                dword ptr [ebp - 0x1128]
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   0f85c4010000         | jne                 0x1ca
            //   90                   | nop                 
            //   33c0                 | xor                 eax, eax
            //   8985b4eeffff         | mov                 dword ptr [ebp - 0x114c], eax

        $sequence_3 = { 8bce e8???????? 83be0002000000 8b5f08 7435 3bbe0c010000 7219 }
            // n = 7, score = 300
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   83be0002000000       | cmp                 dword ptr [esi + 0x200], 0
            //   8b5f08               | mov                 ebx, dword ptr [edi + 8]
            //   7435                 | je                  0x37
            //   3bbe0c010000         | cmp                 edi, dword ptr [esi + 0x10c]
            //   7219                 | jb                  0x1b

        $sequence_4 = { e8???????? 83c408 85c0 7564 8d4c2408 e8???????? 8d4c2408 }
            // n = 7, score = 300
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   85c0                 | test                eax, eax
            //   7564                 | jne                 0x66
            //   8d4c2408             | lea                 ecx, dword ptr [esp + 8]
            //   e8????????           |                     
            //   8d4c2408             | lea                 ecx, dword ptr [esp + 8]

        $sequence_5 = { 8bf0 89742408 85ff 7f47 7c04 85f6 7341 }
            // n = 7, score = 300
            //   8bf0                 | mov                 esi, eax
            //   89742408             | mov                 dword ptr [esp + 8], esi
            //   85ff                 | test                edi, edi
            //   7f47                 | jg                  0x49
            //   7c04                 | jl                  6
            //   85f6                 | test                esi, esi
            //   7341                 | jae                 0x43

        $sequence_6 = { 8b54241c 8bb658010000 6a00 8b09 6a00 e8???????? 8bd6 }
            // n = 7, score = 300
            //   8b54241c             | mov                 edx, dword ptr [esp + 0x1c]
            //   8bb658010000         | mov                 esi, dword ptr [esi + 0x158]
            //   6a00                 | push                0
            //   8b09                 | mov                 ecx, dword ptr [ecx]
            //   6a00                 | push                0
            //   e8????????           |                     
            //   8bd6                 | mov                 edx, esi

        $sequence_7 = { f6400601 7405 ba???????? 8bcf e8???????? 8b442420 8b9424a8000000 }
            // n = 7, score = 300
            //   f6400601             | test                byte ptr [eax + 6], 1
            //   7405                 | je                  7
            //   ba????????           |                     
            //   8bcf                 | mov                 ecx, edi
            //   e8????????           |                     
            //   8b442420             | mov                 eax, dword ptr [esp + 0x20]
            //   8b9424a8000000       | mov                 edx, dword ptr [esp + 0xa8]

        $sequence_8 = { f7412400100000 7478 8b410c 8b7908 8bcf 8944243c 23ce }
            // n = 7, score = 300
            //   f7412400100000       | test                dword ptr [ecx + 0x24], 0x1000
            //   7478                 | je                  0x7a
            //   8b410c               | mov                 eax, dword ptr [ecx + 0xc]
            //   8b7908               | mov                 edi, dword ptr [ecx + 8]
            //   8bcf                 | mov                 ecx, edi
            //   8944243c             | mov                 dword ptr [esp + 0x3c], eax
            //   23ce                 | and                 ecx, esi

        $sequence_9 = { e9???????? 8b55dc 8bcb 8b75fc e8???????? e9???????? 8b45f0 }
            // n = 7, score = 300
            //   e9????????           |                     
            //   8b55dc               | mov                 edx, dword ptr [ebp - 0x24]
            //   8bcb                 | mov                 ecx, ebx
            //   8b75fc               | mov                 esi, dword ptr [ebp - 4]
            //   e8????????           |                     
            //   e9????????           |                     
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]

    condition:
        7 of them and filesize < 14131200
}