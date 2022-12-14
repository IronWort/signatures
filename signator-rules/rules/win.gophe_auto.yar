rule win_gophe_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.gophe."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.gophe"
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
        $sequence_0 = { 0f94c0 84c0 7407 e8???????? }
            // n = 4, score = 400
            //   0f94c0               | sete                al
            //   84c0                 | test                al, al
            //   7407                 | je                  9
            //   e8????????           |                     

        $sequence_1 = { 8b4dec 33cd e8???????? 8be5 5d c21000 c745fc02000000 }
            // n = 7, score = 200
            //   8b4dec               | mov                 eax, dword ptr [esi + 0x14]
            //   33cd                 | test                eax, eax
            //   e8????????           |                     
            //   8be5                 | je                  0x14
            //   5d                   | add                 esp, 8
            //   c21000               | mov                 dword ptr [esi + 0x14], eax
            //   c745fc02000000       | mov                 eax, dword ptr [esi + 0x14]

        $sequence_2 = { 45334340 4133d8 8bc3 c1e810 }
            // n = 4, score = 200
            //   45334340             | sete                al
            //   4133d8               | test                al, al
            //   8bc3                 | je                  0xe
            //   c1e810               | sete                al

        $sequence_3 = { 803900 7422 80790100 7415 }
            // n = 4, score = 200
            //   803900               | cmp                 byte ptr [ecx], 0
            //   7422                 | je                  0x24
            //   80790100             | cmp                 byte ptr [ecx + 1], 0
            //   7415                 | je                  0x17

        $sequence_4 = { 85c0 7506 807e1000 7503 8a4e10 }
            // n = 5, score = 200
            //   85c0                 | cmp                 byte ptr [ecx + 1], 0
            //   7506                 | je                  0x1b
            //   807e1000             | cmp                 ebx, 0x100000
            //   7503                 | jbe                 0xf
            //   8a4e10               | xor                 al, al

        $sequence_5 = { 84c0 0f8461ffffff e8???????? e9???????? }
            // n = 4, score = 200
            //   84c0                 | mov                 eax, ebx
            //   0f8461ffffff         | shr                 eax, 0x10
            //   e8????????           |                     
            //   e9????????           |                     

        $sequence_6 = { 81fb00001000 7607 32c0 e9???????? }
            // n = 4, score = 200
            //   81fb00001000         | cmp                 ebx, 0x100000
            //   7607                 | jbe                 9
            //   32c0                 | xor                 al, al
            //   e9????????           |                     

        $sequence_7 = { 7507 32c0 e9???????? 483d00040000 }
            // n = 4, score = 200
            //   7507                 | jne                 0x1d
            //   32c0                 | cmp                 word ptr [ecx + 0x38], 0
            //   e9????????           |                     
            //   483d00040000         | setne               byte ptr [esp + 0x90]

        $sequence_8 = { 750d 6683793800 0f95842490000000 488b5210 }
            // n = 4, score = 200
            //   750d                 | test                al, al
            //   6683793800           | je                  0xb
            //   0f95842490000000     | jmp                 0xc
            //   488b5210             | cmp                 dword ptr [ecx], 2

        $sequence_9 = { 83c408 894614 8b4614 85c0 }
            // n = 4, score = 200
            //   83c408               | pop                 ebp
            //   894614               | ret                 
            //   8b4614               | test                al, al
            //   85c0                 | je                  9

        $sequence_10 = { 83c40c 8bc6 33d2 f7f3 }
            // n = 4, score = 200
            //   83c40c               | cmp                 dword ptr [ecx], 2
            //   8bc6                 | sete                al
            //   33d2                 | test                al, al
            //   f7f3                 | je                  0xb

        $sequence_11 = { 837d0800 7507 b802000000 5d }
            // n = 4, score = 200
            //   837d0800             | jmp                 0xb
            //   7507                 | cmp                 dword ptr [ecx], 2
            //   b802000000           | sete                al
            //   5d                   | test                al, al

        $sequence_12 = { 45038483580c0000 45334324 4133d8 8bc3 }
            // n = 4, score = 200
            //   45038483580c0000     | sete                al
            //   45334324             | test                al, al
            //   4133d8               | je                  0xe
            //   8bc3                 | cmp                 dword ptr [ecx], 2

        $sequence_13 = { 85f6 7416 6830020000 6a00 56 }
            // n = 5, score = 200
            //   85f6                 | movzx               edx, al
            //   7416                 | mov                 eax, ebx
            //   6830020000           | inc                 ebp
            //   6a00                 | add                 eax, dword ptr [ebx + eax*4 + 0xc58]
            //   56                   | inc                 ebp

        $sequence_14 = { 7838 488b4c2440 ff15???????? 8bf8 85c0 7818 488b4c2440 }
            // n = 7, score = 200
            //   7838                 | mov                 byte ptr [esp + 0x90], 0
            //   488b4c2440           | dec                 eax
            //   ff15????????         |                     
            //   8bf8                 | mov                 edx, dword ptr [esp + 0x40]
            //   85c0                 | dec                 eax
            //   7818                 | mov                 ecx, dword ptr [edx + 0x10]
            //   488b4c2440           | cmp                 word ptr [ecx + 0x30], 0xb

        $sequence_15 = { c684249000000000 488b542440 488b4a10 668379300b 750d }
            // n = 5, score = 200
            //   c684249000000000     | mov                 dword ptr [esi], edx
            //   488b542440           | dec                 eax
            //   488b4a10             | test                ebx, ebx
            //   668379300b           | mov                 byte ptr [esp + 0x90], 0
            //   750d                 | dec                 eax

        $sequence_16 = { c74708ffffffff 8b5014 4885f6 7402 8916 }
            // n = 5, score = 200
            //   c74708ffffffff       | mov                 dword ptr [edi + 8], 0xffffffff
            //   8b5014               | mov                 edx, dword ptr [eax + 0x14]
            //   4885f6               | dec                 eax
            //   7402                 | test                esi, esi
            //   8916                 | je                  4

    condition:
        7 of them and filesize < 1582080
}