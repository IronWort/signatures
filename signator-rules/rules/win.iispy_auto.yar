rule win_iispy_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.iispy."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.iispy"
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
        $sequence_0 = { 8b7608 8b00 c1e005 03c6 3bf0 7463 b800100000 }
            // n = 7, score = 100
            //   8b7608               | mov                 esi, dword ptr [esi + 8]
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   c1e005               | shl                 eax, 5
            //   03c6                 | add                 eax, esi
            //   3bf0                 | cmp                 esi, eax
            //   7463                 | je                  0x65
            //   b800100000           | mov                 eax, 0x1000

        $sequence_1 = { 8bca 3b7108 7461 803e75 755c 8d4601 8901 }
            // n = 7, score = 100
            //   8bca                 | mov                 ecx, edx
            //   3b7108               | cmp                 esi, dword ptr [ecx + 8]
            //   7461                 | je                  0x63
            //   803e75               | cmp                 byte ptr [esi], 0x75
            //   755c                 | jne                 0x5e
            //   8d4601               | lea                 eax, dword ptr [esi + 1]
            //   8901                 | mov                 dword ptr [ecx], eax

        $sequence_2 = { 8bc3 c1e804 83e30f 0fb68088830210 8802 8b0e 8b510c }
            // n = 7, score = 100
            //   8bc3                 | mov                 eax, ebx
            //   c1e804               | shr                 eax, 4
            //   83e30f               | and                 ebx, 0xf
            //   0fb68088830210       | movzx               eax, byte ptr [eax + 0x10028388]
            //   8802                 | mov                 byte ptr [edx], al
            //   8b0e                 | mov                 ecx, dword ptr [esi]
            //   8b510c               | mov                 edx, dword ptr [ecx + 0xc]

        $sequence_3 = { 8d45d0 c7458800000000 50 8d4580 }
            // n = 4, score = 100
            //   8d45d0               | lea                 eax, dword ptr [ebp - 0x30]
            //   c7458800000000       | mov                 dword ptr [ebp - 0x78], 0
            //   50                   | push                eax
            //   8d4580               | lea                 eax, dword ptr [ebp - 0x80]

        $sequence_4 = { 8d4dcc c745e400000000 0f1145cc 6a05 68???????? e8???????? 51 }
            // n = 7, score = 100
            //   8d4dcc               | lea                 ecx, dword ptr [ebp - 0x34]
            //   c745e400000000       | mov                 dword ptr [ebp - 0x1c], 0
            //   0f1145cc             | movups              xmmword ptr [ebp - 0x34], xmm0
            //   6a05                 | push                5
            //   68????????           |                     
            //   e8????????           |                     
            //   51                   | push                ecx

        $sequence_5 = { 89442440 53 56 8bf2 }
            // n = 4, score = 100
            //   89442440             | mov                 dword ptr [esp + 0x40], eax
            //   53                   | push                ebx
            //   56                   | push                esi
            //   8bf2                 | mov                 esi, edx

        $sequence_6 = { 68e9fd0000 ff15???????? 85c0 0f8419ffffff 8b442438 0f57c0 6a01 }
            // n = 7, score = 100
            //   68e9fd0000           | push                0xfde9
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   0f8419ffffff         | je                  0xffffff1f
            //   8b442438             | mov                 eax, dword ptr [esp + 0x38]
            //   0f57c0               | xorps               xmm0, xmm0
            //   6a01                 | push                1

        $sequence_7 = { 68???????? e8???????? c745fc03000000 8b4618 51 8d4da0 ff7010 }
            // n = 7, score = 100
            //   68????????           |                     
            //   e8????????           |                     
            //   c745fc03000000       | mov                 dword ptr [ebp - 4], 3
            //   8b4618               | mov                 eax, dword ptr [esi + 0x18]
            //   51                   | push                ecx
            //   8d4da0               | lea                 ecx, dword ptr [ebp - 0x60]
            //   ff7010               | push                dword ptr [eax + 0x10]

        $sequence_8 = { 5e 8be5 5d c3 53 57 f6c203 }
            // n = 7, score = 100
            //   5e                   | pop                 esi
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   53                   | push                ebx
            //   57                   | push                edi
            //   f6c203               | test                dl, 3

        $sequence_9 = { 897ddc 33f6 8975d0 8975d8 8975fc 8d45dc 50 }
            // n = 7, score = 100
            //   897ddc               | mov                 dword ptr [ebp - 0x24], edi
            //   33f6                 | xor                 esi, esi
            //   8975d0               | mov                 dword ptr [ebp - 0x30], esi
            //   8975d8               | mov                 dword ptr [ebp - 0x28], esi
            //   8975fc               | mov                 dword ptr [ebp - 4], esi
            //   8d45dc               | lea                 eax, dword ptr [ebp - 0x24]
            //   50                   | push                eax

    condition:
        7 of them and filesize < 397312
}