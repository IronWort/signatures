rule win_gozi_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.gozi."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.gozi"
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
        $sequence_0 = { e8???????? 83c414 85c0 751d 53 }
            // n = 5, score = 100
            //   e8????????           |                     
            //   83c414               | add                 esp, 0x14
            //   85c0                 | test                eax, eax
            //   751d                 | jne                 0x1f
            //   53                   | push                ebx

        $sequence_1 = { dc6f1b 95 bf633629a8 02738f 1da2c9dde2 }
            // n = 5, score = 100
            //   dc6f1b               | fsubr               qword ptr [edi + 0x1b]
            //   95                   | xchg                eax, ebp
            //   bf633629a8           | mov                 edi, 0xa8293663
            //   02738f               | add                 dh, byte ptr [ebx - 0x71]
            //   1da2c9dde2           | sbb                 eax, 0xe2ddc9a2

        $sequence_2 = { 50 e8???????? 898574ffffff 57 }
            // n = 4, score = 100
            //   50                   | push                eax
            //   e8????????           |                     
            //   898574ffffff         | mov                 dword ptr [ebp - 0x8c], eax
            //   57                   | push                edi

        $sequence_3 = { 56 56 6a50 ff7570 53 ff15???????? }
            // n = 6, score = 100
            //   56                   | push                esi
            //   56                   | push                esi
            //   6a50                 | push                0x50
            //   ff7570               | push                dword ptr [ebp + 0x70]
            //   53                   | push                ebx
            //   ff15????????         |                     

        $sequence_4 = { 68???????? 8d8500ffffff 50 e8???????? ff7508 8d8500ffffff }
            // n = 6, score = 100
            //   68????????           |                     
            //   8d8500ffffff         | lea                 eax, dword ptr [ebp - 0x100]
            //   50                   | push                eax
            //   e8????????           |                     
            //   ff7508               | push                dword ptr [ebp + 8]
            //   8d8500ffffff         | lea                 eax, dword ptr [ebp - 0x100]

        $sequence_5 = { 740a 53 8d9ff9040000 8903 5b }
            // n = 5, score = 100
            //   740a                 | je                  0xc
            //   53                   | push                ebx
            //   8d9ff9040000         | lea                 ebx, dword ptr [edi + 0x4f9]
            //   8903                 | mov                 dword ptr [ebx], eax
            //   5b                   | pop                 ebx

        $sequence_6 = { 8d8775030000 50 e8???????? 0bc0 7504 c9 }
            // n = 6, score = 100
            //   8d8775030000         | lea                 eax, dword ptr [edi + 0x375]
            //   50                   | push                eax
            //   e8????????           |                     
            //   0bc0                 | or                  eax, eax
            //   7504                 | jne                 6
            //   c9                   | leave               

        $sequence_7 = { ff5208 8b45f8 8b4df4 c9 c20400 }
            // n = 5, score = 100
            //   ff5208               | call                dword ptr [edx + 8]
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]
            //   c9                   | leave               
            //   c20400               | ret                 4

        $sequence_8 = { eb93 e8???????? 894654 ffb574ffffff }
            // n = 4, score = 100
            //   eb93                 | jmp                 0xffffff95
            //   e8????????           |                     
            //   894654               | mov                 dword ptr [esi + 0x54], eax
            //   ffb574ffffff         | push                dword ptr [ebp - 0x8c]

        $sequence_9 = { fd 4e 128b42926614 12a502b346d1 41 b87e8da638 e022 }
            // n = 7, score = 100
            //   fd                   | std                 
            //   4e                   | dec                 esi
            //   128b42926614         | adc                 cl, byte ptr [ebx + 0x14669242]
            //   12a502b346d1         | adc                 ah, byte ptr [ebp - 0x2eb94cfe]
            //   41                   | inc                 ecx
            //   b87e8da638           | mov                 eax, 0x38a68d7e
            //   e022                 | loopne              0x24

        $sequence_10 = { eb07 8b0485fa124100 833c85fa12410000 75ef }
            // n = 4, score = 100
            //   eb07                 | jmp                 9
            //   8b0485fa124100       | mov                 eax, dword ptr [eax*4 + 0x4112fa]
            //   833c85fa12410000     | cmp                 dword ptr [eax*4 + 0x4112fa], 0
            //   75ef                 | jne                 0xfffffff1

        $sequence_11 = { 10ba810b7f57 a4 8c6a38 55 }
            // n = 4, score = 100
            //   10ba810b7f57         | adc                 byte ptr [edx + 0x577f0b81], bh
            //   a4                   | movsb               byte ptr es:[edi], byte ptr [esi]
            //   8c6a38               | mov                 word ptr [edx + 0x38], gs
            //   55                   | push                ebp

        $sequence_12 = { 0e 96 3b5375 60 }
            // n = 4, score = 100
            //   0e                   | push                cs
            //   96                   | xchg                eax, esi
            //   3b5375               | cmp                 edx, dword ptr [ebx + 0x75]
            //   60                   | pushal              

        $sequence_13 = { c808bf35 6963c03caff3da c9 50 0c73 0e }
            // n = 6, score = 100
            //   c808bf35             | enter               -0x40f8, 0x35
            //   6963c03caff3da       | imul                esp, dword ptr [ebx - 0x40], 0xdaf3af3c
            //   c9                   | leave               
            //   50                   | push                eax
            //   0c73                 | or                  al, 0x73
            //   0e                   | push                cs

        $sequence_14 = { 8b5c2408 56 8bf1 57 8d7e0c 832700 }
            // n = 6, score = 100
            //   8b5c2408             | mov                 ebx, dword ptr [esp + 8]
            //   56                   | push                esi
            //   8bf1                 | mov                 esi, ecx
            //   57                   | push                edi
            //   8d7e0c               | lea                 edi, dword ptr [esi + 0xc]
            //   832700               | and                 dword ptr [edi], 0

        $sequence_15 = { 57 56 e8???????? 83c40c 56 ff7508 e8???????? }
            // n = 7, score = 100
            //   57                   | push                edi
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   56                   | push                esi
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     

        $sequence_16 = { b8???????? 50 64ff3500000000 64892500000000 33c0 8908 }
            // n = 6, score = 100
            //   b8????????           |                     
            //   50                   | push                eax
            //   64ff3500000000       | push                dword ptr fs:[0]
            //   64892500000000       | mov                 dword ptr fs:[0], esp
            //   33c0                 | xor                 eax, eax
            //   8908                 | mov                 dword ptr [eax], ecx

        $sequence_17 = { 93 8b7d08 8b750c fc 33c0 }
            // n = 5, score = 100
            //   93                   | xchg                eax, ebx
            //   8b7d08               | mov                 edi, dword ptr [ebp + 8]
            //   8b750c               | mov                 esi, dword ptr [ebp + 0xc]
            //   fc                   | cld                 
            //   33c0                 | xor                 eax, eax

        $sequence_18 = { e8???????? eb06 33c0 eb02 eb50 8bf8 }
            // n = 6, score = 100
            //   e8????????           |                     
            //   eb06                 | jmp                 8
            //   33c0                 | xor                 eax, eax
            //   eb02                 | jmp                 4
            //   eb50                 | jmp                 0x52
            //   8bf8                 | mov                 edi, eax

        $sequence_19 = { f79bfe7ca80d a7 ad b710 2dc7ce5bbb }
            // n = 5, score = 100
            //   f79bfe7ca80d         | neg                 dword ptr [ebx + 0xda87cfe]
            //   a7                   | cmpsd               dword ptr [esi], dword ptr es:[edi]
            //   ad                   | lodsd               eax, dword ptr [esi]
            //   b710                 | mov                 bh, 0x10
            //   2dc7ce5bbb           | sub                 eax, 0xbb5bcec7

        $sequence_20 = { ff15???????? 03c6 034508 50 e8???????? 8945e0 83f8ff }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   03c6                 | add                 eax, esi
            //   034508               | add                 eax, dword ptr [ebp + 8]
            //   50                   | push                eax
            //   e8????????           |                     
            //   8945e0               | mov                 dword ptr [ebp - 0x20], eax
            //   83f8ff               | cmp                 eax, -1

        $sequence_21 = { 895de0 c745fc01000000 8365dc00 8b7508 }
            // n = 4, score = 100
            //   895de0               | mov                 dword ptr [ebp - 0x20], ebx
            //   c745fc01000000       | mov                 dword ptr [ebp - 4], 1
            //   8365dc00             | and                 dword ptr [ebp - 0x24], 0
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]

        $sequence_22 = { ff75e0 ff15???????? ff7508 ff15???????? 85c0 7510 }
            // n = 6, score = 100
            //   ff75e0               | push                dword ptr [ebp - 0x20]
            //   ff15????????         |                     
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7510                 | jne                 0x12

        $sequence_23 = { 9a102a6715fb53 31db b0a6 46 312d???????? ca065b }
            // n = 6, score = 100
            //   9a102a6715fb53       | lcall               0x53fb:0x15672a10
            //   31db                 | xor                 ebx, ebx
            //   b0a6                 | mov                 al, 0xa6
            //   46                   | inc                 esi
            //   312d????????         |                     
            //   ca065b               | retf                0x5b06

    condition:
        7 of them and filesize < 237568
}