rule win_bernhardpos_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.bernhardpos."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.bernhardpos"
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
        $sequence_0 = { c745f801000000 eb02 ebc1 837df800 0f8496000000 8b45fc }
            // n = 6, score = 200
            //   c745f801000000       | mov                 dword ptr [ebp - 8], 1
            //   eb02                 | jmp                 4
            //   ebc1                 | jmp                 0xffffffc3
            //   837df800             | cmp                 dword ptr [ebp - 8], 0
            //   0f8496000000         | je                  0x9c
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]

        $sequence_1 = { 68850b2167 a1???????? 50 e8???????? a3???????? 6815b43ed8 a1???????? }
            // n = 7, score = 200
            //   68850b2167           | push                0x67210b85
            //   a1????????           |                     
            //   50                   | push                eax
            //   e8????????           |                     
            //   a3????????           |                     
            //   6815b43ed8           | push                0xd83eb415
            //   a1????????           |                     

        $sequence_2 = { 894ddc 8b15???????? 8955e0 a0???????? 8845e4 }
            // n = 5, score = 200
            //   894ddc               | mov                 dword ptr [ebp - 0x24], ecx
            //   8b15????????         |                     
            //   8955e0               | mov                 dword ptr [ebp - 0x20], edx
            //   a0????????           |                     
            //   8845e4               | mov                 byte ptr [ebp - 0x1c], al

        $sequence_3 = { a3???????? 6842b832b5 a1???????? 50 e8???????? a3???????? }
            // n = 6, score = 200
            //   a3????????           |                     
            //   6842b832b5           | push                0xb532b842
            //   a1????????           |                     
            //   50                   | push                eax
            //   e8????????           |                     
            //   a3????????           |                     

        $sequence_4 = { ebda c745fc61000000 eb09 8b45fc }
            // n = 4, score = 200
            //   ebda                 | jmp                 0xffffffdc
            //   c745fc61000000       | mov                 dword ptr [ebp - 4], 0x61
            //   eb09                 | jmp                 0xb
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]

        $sequence_5 = { 8b4d08 51 ff15???????? 8d85c8fdffff 50 8b8dc8fdffff }
            // n = 6, score = 200
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   8d85c8fdffff         | lea                 eax, dword ptr [ebp - 0x238]
            //   50                   | push                eax
            //   8b8dc8fdffff         | mov                 ecx, dword ptr [ebp - 0x238]

        $sequence_6 = { 83e863 5f 5e 5b }
            // n = 4, score = 200
            //   83e863               | sub                 eax, 0x63
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx

        $sequence_7 = { c680????????2f 5f 5e 5b 8be5 }
            // n = 5, score = 200
            //   c680????????2f       |                     
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   8be5                 | mov                 esp, ebp

        $sequence_8 = { eb2c 33c0 eb2d 33c0 eb29 }
            // n = 5, score = 200
            //   eb2c                 | jmp                 0x2e
            //   33c0                 | xor                 eax, eax
            //   eb2d                 | jmp                 0x2f
            //   33c0                 | xor                 eax, eax
            //   eb29                 | jmp                 0x2b

        $sequence_9 = { 8b45f4 83c001 8945f4 8b4508 50 ff15???????? }
            // n = 6, score = 200
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   83c001               | add                 eax, 1
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   50                   | push                eax
            //   ff15????????         |                     

    condition:
        7 of them and filesize < 368640
}