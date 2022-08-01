rule win_chir_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.chir."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.chir"
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
        $sequence_0 = { 8a01 34fc 0402 3401 }
            // n = 4, score = 300
            //   8a01                 | mov                 al, byte ptr [ecx]
            //   34fc                 | xor                 al, 0xfc
            //   0402                 | add                 al, 2
            //   3401                 | xor                 al, 1

        $sequence_1 = { c745fc32212400 e8???????? 59 33c9 }
            // n = 4, score = 300
            //   c745fc32212400       | mov                 dword ptr [ebp - 4], 0x242132
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   33c9                 | xor                 ecx, ecx

        $sequence_2 = { 48 8906 66837c47fe5c 75ef 8b06 33c9 66890c47 }
            // n = 7, score = 300
            //   48                   | dec                 eax
            //   8906                 | mov                 dword ptr [esi], eax
            //   66837c47fe5c         | cmp                 word ptr [edi + eax*2 - 2], 0x5c
            //   75ef                 | jne                 0xfffffff1
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   33c9                 | xor                 ecx, ecx
            //   66890c47             | mov                 word ptr [edi + eax*2], cx

        $sequence_3 = { 59 8945fc 6a04 8d45fc 50 }
            // n = 5, score = 300
            //   59                   | pop                 ecx
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   6a04                 | push                4
            //   8d45fc               | lea                 eax, dword ptr [ebp - 4]
            //   50                   | push                eax

        $sequence_4 = { 50 c745f421352432 c745f851173300 e8???????? 48 59 }
            // n = 6, score = 300
            //   50                   | push                eax
            //   c745f421352432       | mov                 dword ptr [ebp - 0xc], 0x32243521
            //   c745f851173300       | mov                 dword ptr [ebp - 8], 0x331751
            //   e8????????           |                     
            //   48                   | dec                 eax
            //   59                   | pop                 ecx

        $sequence_5 = { 33c9 807df905 0f94c1 33d2 48 8d4c0901 }
            // n = 6, score = 300
            //   33c9                 | xor                 ecx, ecx
            //   807df905             | cmp                 byte ptr [ebp - 7], 5
            //   0f94c1               | sete                cl
            //   33d2                 | xor                 edx, edx
            //   48                   | dec                 eax
            //   8d4c0901             | lea                 ecx, dword ptr [ecx + ecx + 1]

        $sequence_6 = { 33c9 807df905 0f94c1 33d2 }
            // n = 4, score = 300
            //   33c9                 | xor                 ecx, ecx
            //   807df905             | cmp                 byte ptr [ebp - 7], 5
            //   0f94c1               | sete                cl
            //   33d2                 | xor                 edx, edx

        $sequence_7 = { c745f451173300 e8???????? 48 59 8bfb }
            // n = 5, score = 300
            //   c745f451173300       | mov                 dword ptr [ebp - 0xc], 0x331751
            //   e8????????           |                     
            //   48                   | dec                 eax
            //   59                   | pop                 ecx
            //   8bfb                 | mov                 edi, ebx

        $sequence_8 = { eb09 8b06 85c0 740b 48 8906 66837c47fe5c }
            // n = 7, score = 300
            //   eb09                 | jmp                 0xb
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   85c0                 | test                eax, eax
            //   740b                 | je                  0xd
            //   48                   | dec                 eax
            //   8906                 | mov                 dword ptr [esi], eax
            //   66837c47fe5c         | cmp                 word ptr [edi + eax*2 - 2], 0x5c

        $sequence_9 = { c745fc32212400 e8???????? 59 33c9 807df905 }
            // n = 5, score = 300
            //   c745fc32212400       | mov                 dword ptr [ebp - 4], 0x242132
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   33c9                 | xor                 ecx, ecx
            //   807df905             | cmp                 byte ptr [ebp - 7], 5

    condition:
        7 of them and filesize < 286720
}