rule win_mrdec_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.mrdec."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.mrdec"
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
        $sequence_0 = { e8???????? 6a00 ff75d8 e8???????? 68000000f0 6a01 6a00 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   6a00                 | push                0
            //   ff75d8               | push                dword ptr [ebp - 0x28]
            //   e8????????           |                     
            //   68000000f0           | push                0xf0000000
            //   6a01                 | push                1
            //   6a00                 | push                0

        $sequence_1 = { 5f c6072e 68???????? 57 }
            // n = 4, score = 100
            //   5f                   | pop                 edi
            //   c6072e               | mov                 byte ptr [edi], 0x2e
            //   68????????           |                     
            //   57                   | push                edi

        $sequence_2 = { 836dcc05 b904000000 51 ad 8bd0 0fca b904000000 }
            // n = 7, score = 100
            //   836dcc05             | sub                 dword ptr [ebp - 0x34], 5
            //   b904000000           | mov                 ecx, 4
            //   51                   | push                ecx
            //   ad                   | lodsd               eax, dword ptr [esi]
            //   8bd0                 | mov                 edx, eax
            //   0fca                 | bswap               edx
            //   b904000000           | mov                 ecx, 4

        $sequence_3 = { 6a00 6814010000 68???????? ff75d8 e8???????? c745cc04000000 }
            // n = 6, score = 100
            //   6a00                 | push                0
            //   6814010000           | push                0x114
            //   68????????           |                     
            //   ff75d8               | push                dword ptr [ebp - 0x28]
            //   e8????????           |                     
            //   c745cc04000000       | mov                 dword ptr [ebp - 0x34], 4

        $sequence_4 = { 68???????? 8d8640000100 50 e8???????? 8b85a8fdffff 83e001 }
            // n = 6, score = 100
            //   68????????           |                     
            //   8d8640000100         | lea                 eax, dword ptr [esi + 0x10040]
            //   50                   | push                eax
            //   e8????????           |                     
            //   8b85a8fdffff         | mov                 eax, dword ptr [ebp - 0x258]
            //   83e001               | and                 eax, 1

        $sequence_5 = { c745f000400000 ff75f0 e8???????? 8945fc ff75f0 e8???????? }
            // n = 6, score = 100
            //   c745f000400000       | mov                 dword ptr [ebp - 0x10], 0x4000
            //   ff75f0               | push                dword ptr [ebp - 0x10]
            //   e8????????           |                     
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   ff75f0               | push                dword ptr [ebp - 0x10]
            //   e8????????           |                     

        $sequence_6 = { e8???????? 68???????? 6a00 6a00 6814010000 68???????? }
            // n = 6, score = 100
            //   e8????????           |                     
            //   68????????           |                     
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6814010000           | push                0x114
            //   68????????           |                     

        $sequence_7 = { 6a00 6a00 6800000008 e8???????? }
            // n = 4, score = 100
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6800000008           | push                0x8000000
            //   e8????????           |                     

        $sequence_8 = { 6a00 6a00 ff35???????? e8???????? 83c70c }
            // n = 5, score = 100
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   ff35????????         |                     
            //   e8????????           |                     
            //   83c70c               | add                 edi, 0xc

        $sequence_9 = { 8b75dc 8d3d50514000 8bdf b9f4000000 }
            // n = 4, score = 100
            //   8b75dc               | mov                 esi, dword ptr [ebp - 0x24]
            //   8d3d50514000         | lea                 edi, dword ptr [0x405150]
            //   8bdf                 | mov                 ebx, edi
            //   b9f4000000           | mov                 ecx, 0xf4

    condition:
        7 of them and filesize < 44864
}