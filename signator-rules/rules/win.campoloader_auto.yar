rule win_campoloader_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.campoloader."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.campoloader"
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
        $sequence_0 = { 52 8b8568efffff 50 ff15???????? 89858cefffff 83bd8cefffff00 }
            // n = 6, score = 200
            //   52                   | push                edx
            //   8b8568efffff         | mov                 eax, dword ptr [ebp - 0x1098]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   89858cefffff         | mov                 dword ptr [ebp - 0x1074], eax
            //   83bd8cefffff00       | cmp                 dword ptr [ebp - 0x1074], 0

        $sequence_1 = { 807dfe00 75ee 8b4dec 2b4dd8 894dd4 8b55f8 }
            // n = 6, score = 200
            //   807dfe00             | cmp                 byte ptr [ebp - 2], 0
            //   75ee                 | jne                 0xfffffff0
            //   8b4dec               | mov                 ecx, dword ptr [ebp - 0x14]
            //   2b4dd8               | sub                 ecx, dword ptr [ebp - 0x28]
            //   894dd4               | mov                 dword ptr [ebp - 0x2c], ecx
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]

        $sequence_2 = { 8b4dcc 894dc0 eb02 ebad 8b55c0 2b55c8 }
            // n = 6, score = 200
            //   8b4dcc               | mov                 ecx, dword ptr [ebp - 0x34]
            //   894dc0               | mov                 dword ptr [ebp - 0x40], ecx
            //   eb02                 | jmp                 4
            //   ebad                 | jmp                 0xffffffaf
            //   8b55c0               | mov                 edx, dword ptr [ebp - 0x40]
            //   2b55c8               | sub                 edx, dword ptr [ebp - 0x38]

        $sequence_3 = { 753b 8b4d14 c70150000000 8d55f4 8955d8 8b45d8 }
            // n = 6, score = 200
            //   753b                 | jne                 0x3d
            //   8b4d14               | mov                 ecx, dword ptr [ebp + 0x14]
            //   c70150000000         | mov                 dword ptr [ecx], 0x50
            //   8d55f4               | lea                 edx, dword ptr [ebp - 0xc]
            //   8955d8               | mov                 dword ptr [ebp - 0x28], edx
            //   8b45d8               | mov                 eax, dword ptr [ebp - 0x28]

        $sequence_4 = { 50 8d8df0feffff 51 8d95ecfdffff }
            // n = 4, score = 200
            //   50                   | push                eax
            //   8d8df0feffff         | lea                 ecx, dword ptr [ebp - 0x110]
            //   51                   | push                ecx
            //   8d95ecfdffff         | lea                 edx, dword ptr [ebp - 0x214]

        $sequence_5 = { 83c40c 6a10 6a00 8d4dcc 51 ff15???????? 83c40c }
            // n = 7, score = 200
            //   83c40c               | add                 esp, 0xc
            //   6a10                 | push                0x10
            //   6a00                 | push                0
            //   8d4dcc               | lea                 ecx, dword ptr [ebp - 0x34]
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   83c40c               | add                 esp, 0xc

        $sequence_6 = { 50 ff15???????? 83c40c 6a10 6a00 8d4dcc }
            // n = 6, score = 200
            //   50                   | push                eax
            //   ff15????????         |                     
            //   83c40c               | add                 esp, 0xc
            //   6a10                 | push                0x10
            //   6a00                 | push                0
            //   8d4dcc               | lea                 ecx, dword ptr [ebp - 0x34]

        $sequence_7 = { 0355cc 0fbe02 83f82f 7508 8b4dcc }
            // n = 5, score = 200
            //   0355cc               | add                 edx, dword ptr [ebp - 0x34]
            //   0fbe02               | movsx               eax, byte ptr [edx]
            //   83f82f               | cmp                 eax, 0x2f
            //   7508                 | jne                 0xa
            //   8b4dcc               | mov                 ecx, dword ptr [ebp - 0x34]

        $sequence_8 = { 33c5 8945fc a1???????? 8945e4 8b0d???????? 894de8 }
            // n = 6, score = 200
            //   33c5                 | xor                 eax, ebp
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   a1????????           |                     
            //   8945e4               | mov                 dword ptr [ebp - 0x1c], eax
            //   8b0d????????         |                     
            //   894de8               | mov                 dword ptr [ebp - 0x18], ecx

        $sequence_9 = { 8b9584efffff 52 ff15???????? 83c408 898584efffff 8b858cefffff 50 }
            // n = 7, score = 200
            //   8b9584efffff         | mov                 edx, dword ptr [ebp - 0x107c]
            //   52                   | push                edx
            //   ff15????????         |                     
            //   83c408               | add                 esp, 8
            //   898584efffff         | mov                 dword ptr [ebp - 0x107c], eax
            //   8b858cefffff         | mov                 eax, dword ptr [ebp - 0x1074]
            //   50                   | push                eax

    condition:
        7 of them and filesize < 66560
}