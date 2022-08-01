rule win_anchor_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.anchor."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.anchor"
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
        $sequence_0 = { 66c740016578 c6400365 eb0a 66c74001646c c640036c }
            // n = 5, score = 800
            //   66c740016578         | mov                 word ptr [eax + 1], 0x7865
            //   c6400365             | mov                 byte ptr [eax + 3], 0x65
            //   eb0a                 | jmp                 0xc
            //   66c74001646c         | mov                 word ptr [eax + 1], 0x6c64
            //   c640036c             | mov                 byte ptr [eax + 3], 0x6c

        $sequence_1 = { 68???????? 8d45f4 50 e8???????? cc ff25???????? 6a08 }
            // n = 7, score = 600
            //   68????????           |                     
            //   8d45f4               | lea                 eax, dword ptr [ebp - 0xc]
            //   50                   | push                eax
            //   e8????????           |                     
            //   cc                   | int3                
            //   ff25????????         |                     
            //   6a08                 | push                8

        $sequence_2 = { 51 6a00 50 a3???????? e8???????? }
            // n = 5, score = 600
            //   51                   | push                ecx
            //   6a00                 | push                0
            //   50                   | push                eax
            //   a3????????           |                     
            //   e8????????           |                     

        $sequence_3 = { 8d8dbcfeffff c645fc01 8ad8 e8???????? 84db }
            // n = 5, score = 600
            //   8d8dbcfeffff         | lea                 ecx, dword ptr [ebp - 0x144]
            //   c645fc01             | mov                 byte ptr [ebp - 4], 1
            //   8ad8                 | mov                 bl, al
            //   e8????????           |                     
            //   84db                 | test                bl, bl

        $sequence_4 = { 8d8dbcfeffff e8???????? 56 8d8dbcfeffff e8???????? 68???????? }
            // n = 6, score = 600
            //   8d8dbcfeffff         | lea                 ecx, dword ptr [ebp - 0x144]
            //   e8????????           |                     
            //   56                   | push                esi
            //   8d8dbcfeffff         | lea                 ecx, dword ptr [ebp - 0x144]
            //   e8????????           |                     
            //   68????????           |                     

        $sequence_5 = { 0fb7c1 6641 66890d???????? 50 }
            // n = 4, score = 600
            //   0fb7c1               | movzx               eax, cx
            //   6641                 | inc                 cx
            //   66890d????????       |                     
            //   50                   | push                eax

        $sequence_6 = { b101 e8???????? e8???????? 84c0 }
            // n = 4, score = 600
            //   b101                 | mov                 byte ptr [eax + 3], 0x65
            //   e8????????           |                     
            //   e8????????           |                     
            //   84c0                 | jmp                 0x10

        $sequence_7 = { 66894304 33c0 6a01 894306 6689430a }
            // n = 5, score = 600
            //   66894304             | mov                 word ptr [ebx + 4], ax
            //   33c0                 | xor                 eax, eax
            //   6a01                 | push                1
            //   894306               | mov                 dword ptr [ebx + 6], eax
            //   6689430a             | mov                 word ptr [ebx + 0xa], ax

        $sequence_8 = { 56 e8???????? 8b30 837e2000 }
            // n = 4, score = 600
            //   56                   | push                esi
            //   e8????????           |                     
            //   8b30                 | mov                 esi, dword ptr [eax]
            //   837e2000             | cmp                 dword ptr [esi + 0x20], 0

        $sequence_9 = { 7509 33d2 33c9 e8???????? }
            // n = 4, score = 400
            //   7509                 | jne                 0xb
            //   33d2                 | xor                 edx, edx
            //   33c9                 | xor                 ecx, ecx
            //   e8????????           |                     

        $sequence_10 = { 488d0d3c520200 e8???????? e8???????? 488b8d20010000 48894c2428 488b8d18010000 }
            // n = 6, score = 200
            //   488d0d3c520200       | dec                 eax
            //   e8????????           |                     
            //   e8????????           |                     
            //   488b8d20010000       | lea                 ecx, dword ptr [0x2523c]
            //   48894c2428           | dec                 eax
            //   488b8d18010000       | mov                 ecx, dword ptr [ebp + 0x120]

        $sequence_11 = { 488d0d3eb80200 e8???????? 8b95e8000000 488b8de0000000 }
            // n = 4, score = 200
            //   488d0d3eb80200       | dec                 eax
            //   e8????????           |                     
            //   8b95e8000000         | mov                 eax, dword ptr [ebp + 0x100]
            //   488b8de0000000       | dec                 eax

        $sequence_12 = { 488d0d3ebe0100 8b542430 48891401 488d0d2f350100 }
            // n = 4, score = 200
            //   488d0d3ebe0100       | lea                 esp, dword ptr [ebp + 0xe8]
            //   8b542430             | pop                 edi
            //   48891401             | dec                 eax
            //   488d0d2f350100       | lea                 ecx, dword ptr [0x2833d]

        $sequence_13 = { 4889442440 48837a1810 498bf1 4d8bf0 }
            // n = 4, score = 200
            //   4889442440           | lea                 eax, dword ptr [ebp - 0x12c]
            //   48837a1810           | push                eax
            //   498bf1               | push                esi
            //   4d8bf0               | je                  0xe

        $sequence_14 = { 488d0d3ca30200 e8???????? 488b85e0000000 488da5c8000000 }
            // n = 4, score = 200
            //   488d0d3ca30200       | lea                 ecx, dword ptr [0x2523c]
            //   e8????????           |                     
            //   488b85e0000000       | dec                 eax
            //   488da5c8000000       | mov                 ecx, dword ptr [ebp + 0x120]

        $sequence_15 = { 488d0d3d4a0300 e8???????? 90 488b8500010000 }
            // n = 4, score = 200
            //   488d0d3d4a0300       | dec                 eax
            //   e8????????           |                     
            //   90                   | lea                 ecx, dword ptr [0x3fd3c]
            //   488b8500010000       | mov                 byte ptr [ebp + 4], 1

        $sequence_16 = { 488bc2 488d0ddc180100 4889442420 48890b 488d5308 33c9 }
            // n = 6, score = 200
            //   488bc2               | jmp                 0x10
            //   488d0ddc180100       | mov                 word ptr [eax + 1], 0x6c64
            //   4889442420           | mov                 byte ptr [eax + 3], 0x6c
            //   48890b               | mov                 byte ptr [eax + 3], 0x65
            //   488d5308             | jmp                 0x10
            //   33c9                 | mov                 word ptr [eax + 1], 0x6c64

        $sequence_17 = { eb06 e8???????? cc 408ac7 }
            // n = 4, score = 200
            //   eb06                 | mov                 word ptr [eax + 1], 0x7865
            //   e8????????           |                     
            //   cc                   | mov                 byte ptr [eax + 3], 0x65
            //   408ac7               | jmp                 0xc

        $sequence_18 = { 4c896c2438 4533c9 4c8d442438 488d542430 498bcf e8???????? }
            // n = 6, score = 200
            //   4c896c2438           | mov                 word ptr [eax + 1], 0x6c64
            //   4533c9               | mov                 byte ptr [eax + 3], 0x6c
            //   4c8d442438           | je                  0xe
            //   488d542430           | mov                 word ptr [eax + 1], 0x7865
            //   498bcf               | mov                 byte ptr [eax + 3], 0x65
            //   e8????????           |                     

        $sequence_19 = { e9???????? 488d05befc0000 4a8b0ce8 42f644313880 744d }
            // n = 5, score = 200
            //   e9????????           |                     
            //   488d05befc0000       | mov                 word ptr [eax + 1], 0x7865
            //   4a8b0ce8             | mov                 byte ptr [eax + 3], 0x65
            //   42f644313880         | jmp                 0x16
            //   744d                 | mov                 word ptr [eax + 1], 0x6c64

        $sequence_20 = { 488d0d3cfd0300 e8???????? c6450401 488b8dc0010000 }
            // n = 4, score = 200
            //   488d0d3cfd0300       | dec                 eax
            //   e8????????           |                     
            //   c6450401             | mov                 dword ptr [esp + 0x20], ecx
            //   488b8dc0010000       | dec                 eax

        $sequence_21 = { 488d0d3d830200 e8???????? eb4d 4c8b4528 }
            // n = 4, score = 200
            //   488d0d3d830200       | mov                 byte ptr [ebp + 4], 1
            //   e8????????           |                     
            //   eb4d                 | dec                 eax
            //   4c8b4528             | mov                 ecx, dword ptr [ebp + 0x1c0]

    condition:
        7 of them and filesize < 778240
}