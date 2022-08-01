rule win_waterspout_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.waterspout."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.waterspout"
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
        $sequence_0 = { 6a64 e8???????? 83c418 33ed 55 55 55 }
            // n = 7, score = 200
            //   6a64                 | push                0x64
            //   e8????????           |                     
            //   83c418               | add                 esp, 0x18
            //   33ed                 | xor                 ebp, ebp
            //   55                   | push                ebp
            //   55                   | push                ebp
            //   55                   | push                ebp

        $sequence_1 = { b924000000 33c0 8d7c2428 f3ab 8d442424 33db }
            // n = 6, score = 200
            //   b924000000           | mov                 ecx, 0x24
            //   33c0                 | xor                 eax, eax
            //   8d7c2428             | lea                 edi, dword ptr [esp + 0x28]
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   8d442424             | lea                 eax, dword ptr [esp + 0x24]
            //   33db                 | xor                 ebx, ebx

        $sequence_2 = { 50 ff15???????? 8b742460 8b5c245c 33c0 8bfb 8d4e01 }
            // n = 7, score = 200
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8b742460             | mov                 esi, dword ptr [esp + 0x60]
            //   8b5c245c             | mov                 ebx, dword ptr [esp + 0x5c]
            //   33c0                 | xor                 eax, eax
            //   8bfb                 | mov                 edi, ebx
            //   8d4e01               | lea                 ecx, dword ptr [esi + 1]

        $sequence_3 = { 892d???????? 53 e8???????? 83c404 5f 5e 5d }
            // n = 7, score = 200
            //   892d????????         |                     
            //   53                   | push                ebx
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp

        $sequence_4 = { 893a 7403 53 ffd6 a1???????? 3bc7 7409 }
            // n = 7, score = 200
            //   893a                 | mov                 dword ptr [edx], edi
            //   7403                 | je                  5
            //   53                   | push                ebx
            //   ffd6                 | call                esi
            //   a1????????           |                     
            //   3bc7                 | cmp                 eax, edi
            //   7409                 | je                  0xb

        $sequence_5 = { 83f801 7706 ff15???????? 8b4c241c }
            // n = 4, score = 200
            //   83f801               | cmp                 eax, 1
            //   7706                 | ja                  8
            //   ff15????????         |                     
            //   8b4c241c             | mov                 ecx, dword ptr [esp + 0x1c]

        $sequence_6 = { 8b74242c 8d543101 52 e8???????? }
            // n = 4, score = 200
            //   8b74242c             | mov                 esi, dword ptr [esp + 0x2c]
            //   8d543101             | lea                 edx, dword ptr [ecx + esi + 1]
            //   52                   | push                edx
            //   e8????????           |                     

        $sequence_7 = { c684248600000040 c68424870000008f c684248800000092 c68424890000009d c684248a00000038 c684248b000000f5 c684248c000000bc }
            // n = 7, score = 200
            //   c684248600000040     | mov                 byte ptr [esp + 0x86], 0x40
            //   c68424870000008f     | mov                 byte ptr [esp + 0x87], 0x8f
            //   c684248800000092     | mov                 byte ptr [esp + 0x88], 0x92
            //   c68424890000009d     | mov                 byte ptr [esp + 0x89], 0x9d
            //   c684248a00000038     | mov                 byte ptr [esp + 0x8a], 0x38
            //   c684248b000000f5     | mov                 byte ptr [esp + 0x8b], 0xf5
            //   c684248c000000bc     | mov                 byte ptr [esp + 0x8c], 0xbc

        $sequence_8 = { 50 51 a3???????? ffd6 83f801 }
            // n = 5, score = 200
            //   50                   | push                eax
            //   51                   | push                ecx
            //   a3????????           |                     
            //   ffd6                 | call                esi
            //   83f801               | cmp                 eax, 1

        $sequence_9 = { c644245ed6 c644245fb3 33db c644246029 c6442461e3 c64424622f c644246384 }
            // n = 7, score = 200
            //   c644245ed6           | mov                 byte ptr [esp + 0x5e], 0xd6
            //   c644245fb3           | mov                 byte ptr [esp + 0x5f], 0xb3
            //   33db                 | xor                 ebx, ebx
            //   c644246029           | mov                 byte ptr [esp + 0x60], 0x29
            //   c6442461e3           | mov                 byte ptr [esp + 0x61], 0xe3
            //   c64424622f           | mov                 byte ptr [esp + 0x62], 0x2f
            //   c644246384           | mov                 byte ptr [esp + 0x63], 0x84

    condition:
        7 of them and filesize < 98304
}