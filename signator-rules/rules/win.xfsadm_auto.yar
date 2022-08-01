rule win_xfsadm_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.xfsadm."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.xfsadm"
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
        $sequence_0 = { 83c404 8d8d38fdffff 56 e8???????? }
            // n = 4, score = 100
            //   83c404               | add                 esp, 4
            //   8d8d38fdffff         | lea                 ecx, dword ptr [ebp - 0x2c8]
            //   56                   | push                esi
            //   e8????????           |                     

        $sequence_1 = { 8bbed0000000 c6043800 8bc6 ff86ec000000 8b4df4 64890d00000000 }
            // n = 6, score = 100
            //   8bbed0000000         | mov                 edi, dword ptr [esi + 0xd0]
            //   c6043800             | mov                 byte ptr [eax + edi], 0
            //   8bc6                 | mov                 eax, esi
            //   ff86ec000000         | inc                 dword ptr [esi + 0xec]
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]
            //   64890d00000000       | mov                 dword ptr fs:[0], ecx

        $sequence_2 = { 7406 8b4624 894124 8b06 8bce 8b7e30 6a00 }
            // n = 7, score = 100
            //   7406                 | je                  8
            //   8b4624               | mov                 eax, dword ptr [esi + 0x24]
            //   894124               | mov                 dword ptr [ecx + 0x24], eax
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   8bce                 | mov                 ecx, esi
            //   8b7e30               | mov                 edi, dword ptr [esi + 0x30]
            //   6a00                 | push                0

        $sequence_3 = { 85c0 7512 84db 750e 68???????? 56 e8???????? }
            // n = 7, score = 100
            //   85c0                 | test                eax, eax
            //   7512                 | jne                 0x14
            //   84db                 | test                bl, bl
            //   750e                 | jne                 0x10
            //   68????????           |                     
            //   56                   | push                esi
            //   e8????????           |                     

        $sequence_4 = { 7410 33c0 8bcf 50 e8???????? 5f 5e }
            // n = 7, score = 100
            //   7410                 | je                  0x12
            //   33c0                 | xor                 eax, eax
            //   8bcf                 | mov                 ecx, edi
            //   50                   | push                eax
            //   e8????????           |                     
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_5 = { 8be5 5d c20c00 f7470c00020000 740b ff7710 e8???????? }
            // n = 7, score = 100
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c20c00               | ret                 0xc
            //   f7470c00020000       | test                dword ptr [edi + 0xc], 0x200
            //   740b                 | je                  0xd
            //   ff7710               | push                dword ptr [edi + 0x10]
            //   e8????????           |                     

        $sequence_6 = { 741e 897024 8b471c 894628 8bc6 }
            // n = 5, score = 100
            //   741e                 | je                  0x20
            //   897024               | mov                 dword ptr [eax + 0x24], esi
            //   8b471c               | mov                 eax, dword ptr [edi + 0x1c]
            //   894628               | mov                 dword ptr [esi + 0x28], eax
            //   8bc6                 | mov                 eax, esi

        $sequence_7 = { 3b8ee8000000 7e4d 8d1c09 53 e8???????? ffb6ec000000 }
            // n = 6, score = 100
            //   3b8ee8000000         | cmp                 ecx, dword ptr [esi + 0xe8]
            //   7e4d                 | jle                 0x4f
            //   8d1c09               | lea                 ebx, dword ptr [ecx + ecx]
            //   53                   | push                ebx
            //   e8????????           |                     
            //   ffb6ec000000         | push                dword ptr [esi + 0xec]

        $sequence_8 = { 8bd0 83c408 85d2 0f8487010000 }
            // n = 4, score = 100
            //   8bd0                 | mov                 edx, eax
            //   83c408               | add                 esp, 8
            //   85d2                 | test                edx, edx
            //   0f8487010000         | je                  0x18d

        $sequence_9 = { b904000000 6a08 6a00 68e8030000 c7400201000000 a1???????? 6a00 }
            // n = 7, score = 100
            //   b904000000           | mov                 ecx, 4
            //   6a08                 | push                8
            //   6a00                 | push                0
            //   68e8030000           | push                0x3e8
            //   c7400201000000       | mov                 dword ptr [eax + 2], 1
            //   a1????????           |                     
            //   6a00                 | push                0

    condition:
        7 of them and filesize < 566272
}