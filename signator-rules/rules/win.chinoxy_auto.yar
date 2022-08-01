rule win_chinoxy_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.chinoxy."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.chinoxy"
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
        $sequence_0 = { 740a 8d4604 50 ff15???????? 8b8730200000 c744241800000000 83f801 }
            // n = 7, score = 100
            //   740a                 | je                  0xc
            //   8d4604               | lea                 eax, dword ptr [esi + 4]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8b8730200000         | mov                 eax, dword ptr [edi + 0x2030]
            //   c744241800000000     | mov                 dword ptr [esp + 0x18], 0
            //   83f801               | cmp                 eax, 1

        $sequence_1 = { 83c8ff 5b c3 33c0 85ff 7628 8a0c30 }
            // n = 7, score = 100
            //   83c8ff               | or                  eax, 0xffffffff
            //   5b                   | pop                 ebx
            //   c3                   | ret                 
            //   33c0                 | xor                 eax, eax
            //   85ff                 | test                edi, edi
            //   7628                 | jbe                 0x2a
            //   8a0c30               | mov                 cl, byte ptr [eax + esi]

        $sequence_2 = { e9???????? 8b03 8bcb ff5010 5f 5e 5d }
            // n = 7, score = 100
            //   e9????????           |                     
            //   8b03                 | mov                 eax, dword ptr [ebx]
            //   8bcb                 | mov                 ecx, ebx
            //   ff5010               | call                dword ptr [eax + 0x10]
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp

        $sequence_3 = { 83f8ff 751a e8???????? 56 e8???????? 83c404 83c8ff }
            // n = 7, score = 100
            //   83f8ff               | cmp                 eax, -1
            //   751a                 | jne                 0x1c
            //   e8????????           |                     
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   83c8ff               | or                  eax, 0xffffffff

        $sequence_4 = { ff5258 5f 8bc3 5e 5b }
            // n = 5, score = 100
            //   ff5258               | call                dword ptr [edx + 0x58]
            //   5f                   | pop                 edi
            //   8bc3                 | mov                 eax, ebx
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx

        $sequence_5 = { 56 8b742410 57 8b06 33d0 33c0 89542414 }
            // n = 7, score = 100
            //   56                   | push                esi
            //   8b742410             | mov                 esi, dword ptr [esp + 0x10]
            //   57                   | push                edi
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   33d0                 | xor                 edx, eax
            //   33c0                 | xor                 eax, eax
            //   89542414             | mov                 dword ptr [esp + 0x14], edx

        $sequence_6 = { 2bf9 8bcf 8bc7 c1e910 c1e010 0bc8 }
            // n = 6, score = 100
            //   2bf9                 | sub                 edi, ecx
            //   8bcf                 | mov                 ecx, edi
            //   8bc7                 | mov                 eax, edi
            //   c1e910               | shr                 ecx, 0x10
            //   c1e010               | shl                 eax, 0x10
            //   0bc8                 | or                  ecx, eax

        $sequence_7 = { 83c608 4b 75eb b9d0070000 33c0 }
            // n = 5, score = 100
            //   83c608               | add                 esi, 8
            //   4b                   | dec                 ebx
            //   75eb                 | jne                 0xffffffed
            //   b9d0070000           | mov                 ecx, 0x7d0
            //   33c0                 | xor                 eax, eax

        $sequence_8 = { 8be8 83c404 83fdff 0f84c5000000 }
            // n = 4, score = 100
            //   8be8                 | mov                 ebp, eax
            //   83c404               | add                 esp, 4
            //   83fdff               | cmp                 ebp, -1
            //   0f84c5000000         | je                  0xcb

        $sequence_9 = { 8bd0 c1e912 c1e20e 0bca 33f8 2bf9 }
            // n = 6, score = 100
            //   8bd0                 | mov                 edx, eax
            //   c1e912               | shr                 ecx, 0x12
            //   c1e20e               | shl                 edx, 0xe
            //   0bca                 | or                  ecx, edx
            //   33f8                 | xor                 edi, eax
            //   2bf9                 | sub                 edi, ecx

    condition:
        7 of them and filesize < 1138688
}