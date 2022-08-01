rule win_matryoshka_rat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.matryoshka_rat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.matryoshka_rat"
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
        $sequence_0 = { b037 c3 b073 c3 }
            // n = 4, score = 400
            //   b037                 | dec                 eax
            //   c3                   | lea                 ecx, dword ptr [esp + 0x56]
            //   b073                 | xor                 edx, edx
            //   c3                   | mov                 dword ptr [esp + 0x50], eax

        $sequence_1 = { b06f c3 b063 c3 }
            // n = 4, score = 400
            //   b06f                 | mov                 ecx, dword ptr [ecx*4 + 0x98c0c0]
            //   c3                   | mov                 dword ptr [ecx + ebx + 0x28], eax
            //   b063                 | mov                 eax, dword ptr [ebp - 0x10]
            //   c3                   | mov                 dword ptr [ecx + ebx + 0x2c], edx

        $sequence_2 = { c3 b06f c3 b063 c3 }
            // n = 5, score = 400
            //   c3                   | mov                 edi, 0x3e7
            //   b06f                 | mov                 dword ptr [esp + 0x70], eax
            //   c3                   | mov                 dword ptr [esp + 0x84], eax
            //   b063                 | lea                 eax, dword ptr [esp + 0x28]
            //   c3                   | movsd               dword ptr es:[edi], dword ptr [esi]

        $sequence_3 = { c3 b06f c3 b063 }
            // n = 4, score = 400
            //   c3                   | mov                 dword ptr [esp + 0xb0], ecx
            //   b06f                 | jne                 0x138
            //   c3                   | mov                 eax, dword ptr [esi + 0x28]
            //   b063                 | mov                 ebx, dword ptr [eax + esi + 0x6b8]

        $sequence_4 = { 5e c20400 51 51 6a02 33d2 e8???????? }
            // n = 7, score = 200
            //   5e                   | je                  0x1567
            //   c20400               | dec                 ecx
            //   51                   | mov                 eax, ecx
            //   51                   | add                 ecx, dword ptr [ebp + eax + 4]
            //   6a02                 | mov                 dword ptr [ebp + eax + 0x48], ecx
            //   33d2                 | dec                 eax
            //   e8????????           |                     

        $sequence_5 = { 33c0 89851cfaffff 3bc1 7d3e ff8534faffff 33c9 41 }
            // n = 7, score = 200
            //   33c0                 | lea                 ecx, dword ptr [ebp - 0x5e8]
            //   89851cfaffff         | push                dword ptr [ebp - 0x5e0]
            //   3bc1                 | pop                 ecx
            //   7d3e                 | ret                 
            //   ff8534faffff         | lea                 ecx, dword ptr [ebp - 0x4e4]
            //   33c9                 | and                 dword ptr [ebp - 4], 0
            //   41                   | push                4

        $sequence_6 = { 4c8bf2 8b5a08 488bf1 488b2a 448b6130 448b792c 899c24b8000000 }
            // n = 7, score = 200
            //   4c8bf2               | shr                 ecx, 8
            //   8b5a08               | and                 eax, ebx
            //   488bf1               | xor                 ecx, dword ptr [eax*4 + 0x967f10]
            //   488b2a               | xor                 ecx, dword ptr [eax*4 + 0x967f10]
            //   448b6130             | inc                 edx
            //   448b792c             | dec                 esi
            //   899c24b8000000       | jne                 0x9e0

        $sequence_7 = { 56 8b750c 57 8bf9 0f8494020000 837d1402 7410 }
            // n = 7, score = 200
            //   56                   | dec                 esp
            //   8b750c               | mov                 dword ptr [ebx + 0x58], ecx
            //   57                   | inc                 ecx
            //   8bf9                 | cmp                 ebp, esi
            //   0f8494020000         | jg                  0xa4
            //   837d1402             | or                  word ptr [esi], 4
            //   7410                 | jmp                 0xad

        $sequence_8 = { 6685f6 75ba 4c8bbc2490000000 4c89642420 4c8b9c2488000000 448bcf be01000000 }
            // n = 7, score = 200
            //   6685f6               | mov                 dword ptr [esp + 0x20], eax
            //   75ba                 | test                eax, eax
            //   4c8bbc2490000000     | je                  0xd2b
            //   4c89642420           | dec                 ecx
            //   4c8b9c2488000000     | mov                 ecx, esi
            //   448bcf               | inc                 esp
            //   be01000000           | mov                 ecx, ebx

        $sequence_9 = { 7405 488b12 eb03 498bd4 488b4d48 488b01 4533c0 }
            // n = 7, score = 200
            //   7405                 | mov                 edi, edx
            //   488b12               | mov                 esi, ecx
            //   eb03                 | dec                 eax
            //   498bd4               | cmp                 edx, 0x101
            //   488b4d48             | jne                 0x1d95
            //   488b01               | dec                 eax
            //   4533c0               | sub                 esp, 0x20

    condition:
        7 of them and filesize < 843776
}