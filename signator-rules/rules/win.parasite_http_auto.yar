rule win_parasite_http_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.parasite_http."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.parasite_http"
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
        $sequence_0 = { 7576 8d8f88000000 03c8 8bd7 8b09 e8???????? 8bd7 }
            // n = 7, score = 100
            //   7576                 | jne                 0x78
            //   8d8f88000000         | lea                 ecx, dword ptr [edi + 0x88]
            //   03c8                 | add                 ecx, eax
            //   8bd7                 | mov                 edx, edi
            //   8b09                 | mov                 ecx, dword ptr [ecx]
            //   e8????????           |                     
            //   8bd7                 | mov                 edx, edi

        $sequence_1 = { 6a00 ff55f8 8945ec 837dec00 0f8413010000 ff75ec 6a00 }
            // n = 7, score = 100
            //   6a00                 | push                0
            //   ff55f8               | call                dword ptr [ebp - 8]
            //   8945ec               | mov                 dword ptr [ebp - 0x14], eax
            //   837dec00             | cmp                 dword ptr [ebp - 0x14], 0
            //   0f8413010000         | je                  0x119
            //   ff75ec               | push                dword ptr [ebp - 0x14]
            //   6a00                 | push                0

        $sequence_2 = { 5b 750a 837dfc00 7504 33c0 eb03 }
            // n = 6, score = 100
            //   5b                   | pop                 ebx
            //   750a                 | jne                 0xc
            //   837dfc00             | cmp                 dword ptr [ebp - 4], 0
            //   7504                 | jne                 6
            //   33c0                 | xor                 eax, eax
            //   eb03                 | jmp                 5

        $sequence_3 = { b9???????? e8???????? 8bc8 e8???????? a3???????? 85c0 7503 }
            // n = 7, score = 100
            //   b9????????           |                     
            //   e8????????           |                     
            //   8bc8                 | mov                 ecx, eax
            //   e8????????           |                     
            //   a3????????           |                     
            //   85c0                 | test                eax, eax
            //   7503                 | jne                 5

        $sequence_4 = { 5e 5b 8be5 5d c3 837d1800 74b5 }
            // n = 7, score = 100
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   837d1800             | cmp                 dword ptr [ebp + 0x18], 0
            //   74b5                 | je                  0xffffffb7

        $sequence_5 = { 8b45fc 59 59 85c0 7453 8b7de8 b9???????? }
            // n = 7, score = 100
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   85c0                 | test                eax, eax
            //   7453                 | je                  0x55
            //   8b7de8               | mov                 edi, dword ptr [ebp - 0x18]
            //   b9????????           |                     

        $sequence_6 = { 53 56 be???????? 8bce e8???????? 8bd0 8bce }
            // n = 7, score = 100
            //   53                   | push                ebx
            //   56                   | push                esi
            //   be????????           |                     
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   8bd0                 | mov                 edx, eax
            //   8bce                 | mov                 ecx, esi

        $sequence_7 = { 8b4c242c 85c9 7405 e8???????? 85f6 7407 8bce }
            // n = 7, score = 100
            //   8b4c242c             | mov                 ecx, dword ptr [esp + 0x2c]
            //   85c9                 | test                ecx, ecx
            //   7405                 | je                  7
            //   e8????????           |                     
            //   85f6                 | test                esi, esi
            //   7407                 | je                  9
            //   8bce                 | mov                 ecx, esi

        $sequence_8 = { 85c0 6a01 58 0f44c8 894df4 85f6 7415 }
            // n = 7, score = 100
            //   85c0                 | test                eax, eax
            //   6a01                 | push                1
            //   58                   | pop                 eax
            //   0f44c8               | cmove               ecx, eax
            //   894df4               | mov                 dword ptr [ebp - 0xc], ecx
            //   85f6                 | test                esi, esi
            //   7415                 | je                  0x17

        $sequence_9 = { baffff1f00 e8???????? 3d0f270000 753e 6a14 59 e8???????? }
            // n = 7, score = 100
            //   baffff1f00           | mov                 edx, 0x1fffff
            //   e8????????           |                     
            //   3d0f270000           | cmp                 eax, 0x270f
            //   753e                 | jne                 0x40
            //   6a14                 | push                0x14
            //   59                   | pop                 ecx
            //   e8????????           |                     

    condition:
        7 of them and filesize < 147456
}