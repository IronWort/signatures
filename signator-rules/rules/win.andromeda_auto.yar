rule win_andromeda_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.andromeda."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.andromeda"
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
        $sequence_0 = { 8bec 81c400ffffff 60 b940000000 8d7dfc b8fcfdfeff fd }
            // n = 7, score = 800
            //   8bec                 | mov                 ebp, esp
            //   81c400ffffff         | add                 esp, 0xffffff00
            //   60                   | pushal              
            //   b940000000           | mov                 ecx, 0x40
            //   8d7dfc               | lea                 edi, dword ptr [ebp - 4]
            //   b8fcfdfeff           | mov                 eax, 0xfffefdfc
            //   fd                   | std                 

        $sequence_1 = { 368ab42b00ffffff 3688b42800ffffff 3688942b00ffffff 02d6 81e2ff000000 368a942a00ffffff }
            // n = 6, score = 800
            //   368ab42b00ffffff     | mov                 dh, byte ptr ss:[ebx + ebp - 0x100]
            //   3688b42800ffffff     | mov                 byte ptr ss:[eax + ebp - 0x100], dh
            //   3688942b00ffffff     | mov                 byte ptr ss:[ebx + ebp - 0x100], dl
            //   02d6                 | add                 dl, dh
            //   81e2ff000000         | and                 edx, 0xff
            //   368a942a00ffffff     | mov                 dl, byte ptr ss:[edx + ebp - 0x100]

        $sequence_2 = { 368a942800ffffff 02da 368ab42b00ffffff 3688b42800ffffff }
            // n = 4, score = 800
            //   368a942800ffffff     | mov                 dl, byte ptr ss:[eax + ebp - 0x100]
            //   02da                 | add                 bl, dl
            //   368ab42b00ffffff     | mov                 dh, byte ptr ss:[ebx + ebp - 0x100]
            //   3688b42800ffffff     | mov                 byte ptr ss:[eax + ebp - 0x100], dh

        $sequence_3 = { 368ab42800ffffff 3688b42900ffffff 3688942800ffffff fec1 7408 }
            // n = 5, score = 800
            //   368ab42800ffffff     | mov                 dh, byte ptr ss:[eax + ebp - 0x100]
            //   3688b42900ffffff     | mov                 byte ptr ss:[ecx + ebp - 0x100], dh
            //   3688942800ffffff     | mov                 byte ptr ss:[eax + ebp - 0x100], dl
            //   fec1                 | inc                 cl
            //   7408                 | je                  0xa

        $sequence_4 = { e2f8 fc 33c0 8b7508 33db }
            // n = 5, score = 800
            //   e2f8                 | loop                0xfffffffa
            //   fc                   | cld                 
            //   33c0                 | xor                 eax, eax
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   33db                 | xor                 ebx, ebx

        $sequence_5 = { 8b7508 33db 368a942900ffffff 02c2 020433 }
            // n = 5, score = 800
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   33db                 | xor                 ebx, ebx
            //   368a942900ffffff     | mov                 dl, byte ptr ss:[ecx + ebp - 0x100]
            //   02c2                 | add                 al, dl
            //   020433               | add                 al, byte ptr [ebx + esi]

        $sequence_6 = { 43 3b5d0c 74cf ebcf 33c0 33db 33c9 }
            // n = 7, score = 800
            //   43                   | inc                 ebx
            //   3b5d0c               | cmp                 ebx, dword ptr [ebp + 0xc]
            //   74cf                 | je                  0xffffffd1
            //   ebcf                 | jmp                 0xffffffd1
            //   33c0                 | xor                 eax, eax
            //   33db                 | xor                 ebx, ebx
            //   33c9                 | xor                 ecx, ecx

        $sequence_7 = { 8b7d10 fec0 368a942800ffffff 02da }
            // n = 4, score = 800
            //   8b7d10               | mov                 edi, dword ptr [ebp + 0x10]
            //   fec0                 | inc                 al
            //   368a942800ffffff     | mov                 dl, byte ptr ss:[eax + ebp - 0x100]
            //   02da                 | add                 bl, dl

        $sequence_8 = { 60 e8???????? 5d 81ed???????? }
            // n = 4, score = 700
            //   60                   | pushal              
            //   e8????????           |                     
            //   5d                   | pop                 ebp
            //   81ed????????         |                     

        $sequence_9 = { 0fb64601 84c0 7905 0d00ffffff }
            // n = 4, score = 400
            //   0fb64601             | movzx               eax, byte ptr [esi + 1]
            //   84c0                 | test                al, al
            //   7905                 | jns                 7
            //   0d00ffffff           | or                  eax, 0xffffff00

        $sequence_10 = { 0f9ec1 33d2 3c41 0f9dc2 85ca 7404 0420 }
            // n = 7, score = 400
            //   0f9ec1               | setle               cl
            //   33d2                 | xor                 edx, edx
            //   3c41                 | cmp                 al, 0x41
            //   0f9dc2               | setge               dl
            //   85ca                 | test                edx, ecx
            //   7404                 | je                  6
            //   0420                 | add                 al, 0x20

        $sequence_11 = { 8a06 33c9 3c5a 0f9ec1 33d2 3c41 }
            // n = 6, score = 400
            //   8a06                 | mov                 al, byte ptr [esi]
            //   33c9                 | xor                 ecx, ecx
            //   3c5a                 | cmp                 al, 0x5a
            //   0f9ec1               | setle               cl
            //   33d2                 | xor                 edx, edx
            //   3c41                 | cmp                 al, 0x41

        $sequence_12 = { 6a30 8d45d0 50 6a01 ff7508 e8???????? }
            // n = 6, score = 400
            //   6a30                 | push                0x30
            //   8d45d0               | lea                 eax, dword ptr [ebp - 0x30]
            //   50                   | push                eax
            //   6a01                 | push                1
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     

        $sequence_13 = { 50 e8???????? 83c40c 6800000100 }
            // n = 4, score = 400
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   6800000100           | push                0x10000

        $sequence_14 = { 8945d0 3bc7 0f84be000000 ff35???????? 68???????? 50 }
            // n = 6, score = 300
            //   8945d0               | mov                 dword ptr [ebp - 0x30], eax
            //   3bc7                 | cmp                 eax, edi
            //   0f84be000000         | je                  0xc4
            //   ff35????????         |                     
            //   68????????           |                     
            //   50                   | push                eax

        $sequence_15 = { ff75e4 50 ff75f0 ff15???????? 8d45dc }
            // n = 5, score = 300
            //   ff75e4               | push                dword ptr [ebp - 0x1c]
            //   50                   | push                eax
            //   ff75f0               | push                dword ptr [ebp - 0x10]
            //   ff15????????         |                     
            //   8d45dc               | lea                 eax, dword ptr [ebp - 0x24]

        $sequence_16 = { 6801000080 e8???????? 83f800 7526 ff75f8 e8???????? }
            // n = 6, score = 200
            //   6801000080           | push                0x80000001
            //   e8????????           |                     
            //   83f800               | cmp                 eax, 0
            //   7526                 | jne                 0x28
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   e8????????           |                     

        $sequence_17 = { 68???????? e8???????? 6804010000 ff75fc 6a00 e8???????? }
            // n = 6, score = 200
            //   68????????           |                     
            //   e8????????           |                     
            //   6804010000           | push                0x104
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   6a00                 | push                0
            //   e8????????           |                     

        $sequence_18 = { 7479 6a10 8d45e0 50 ff75f0 }
            // n = 5, score = 200
            //   7479                 | je                  0x7b
            //   6a10                 | push                0x10
            //   8d45e0               | lea                 eax, dword ptr [ebp - 0x20]
            //   50                   | push                eax
            //   ff75f0               | push                dword ptr [ebp - 0x10]

        $sequence_19 = { 6a06 6a01 6a02 e8???????? 8945f0 83f8ff }
            // n = 6, score = 200
            //   6a06                 | push                6
            //   6a01                 | push                1
            //   6a02                 | push                2
            //   e8????????           |                     
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   83f8ff               | cmp                 eax, -1

        $sequence_20 = { 6a00 ff35???????? e8???????? 8945f8 83f800 0f8458010000 6804010000 }
            // n = 7, score = 200
            //   6a00                 | push                0
            //   ff35????????         |                     
            //   e8????????           |                     
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   83f800               | cmp                 eax, 0
            //   0f8458010000         | je                  0x15e
            //   6804010000           | push                0x104

        $sequence_21 = { c745e400000000 6a00 6a00 6a00 6a06 6a01 6a02 }
            // n = 7, score = 200
            //   c745e400000000       | mov                 dword ptr [ebp - 0x1c], 0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a06                 | push                6
            //   6a01                 | push                1
            //   6a02                 | push                2

        $sequence_22 = { f3aa 6a00 6a00 ff75f0 e8???????? c7459c44000000 8945d4 }
            // n = 7, score = 200
            //   f3aa                 | rep stosb           byte ptr es:[edi], al
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   ff75f0               | push                dword ptr [ebp - 0x10]
            //   e8????????           |                     
            //   c7459c44000000       | mov                 dword ptr [ebp - 0x64], 0x44
            //   8945d4               | mov                 dword ptr [ebp - 0x2c], eax

        $sequence_23 = { a3???????? 6804010000 6a00 ff35???????? e8???????? 8945fc 83f800 }
            // n = 7, score = 200
            //   a3????????           |                     
            //   6804010000           | push                0x104
            //   6a00                 | push                0
            //   ff35????????         |                     
            //   e8????????           |                     
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   83f800               | cmp                 eax, 0

        $sequence_24 = { 8b4518 8d9c1decfeffff 8a0b 8d8405ecfeffff 8945f0 8808 }
            // n = 6, score = 100
            //   8b4518               | mov                 eax, dword ptr [ebp + 0x18]
            //   8d9c1decfeffff       | lea                 ebx, dword ptr [ebp + ebx - 0x114]
            //   8a0b                 | mov                 cl, byte ptr [ebx]
            //   8d8405ecfeffff       | lea                 eax, dword ptr [ebp + eax - 0x114]
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   8808                 | mov                 byte ptr [eax], cl

        $sequence_25 = { 6af5 89450c ff5630 23f8 e9???????? 8b45fc }
            // n = 6, score = 100
            //   6af5                 | push                -0xb
            //   89450c               | mov                 dword ptr [ebp + 0xc], eax
            //   ff5630               | call                dword ptr [esi + 0x30]
            //   23f8                 | and                 edi, eax
            //   e9????????           |                     
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]

        $sequence_26 = { 69ff77f02186 81c6002a7b28 8945ec 3bc2 0f848d010000 8b4d08 014dec }
            // n = 7, score = 100
            //   69ff77f02186         | imul                edi, edi, 0x8621f077
            //   81c6002a7b28         | add                 esi, 0x287b2a00
            //   8945ec               | mov                 dword ptr [ebp - 0x14], eax
            //   3bc2                 | cmp                 eax, edx
            //   0f848d010000         | je                  0x193
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   014dec               | add                 dword ptr [ebp - 0x14], ecx

        $sequence_27 = { 8365f400 8bf8 ff5634 8b4d0c 81c951dbc951 }
            // n = 5, score = 100
            //   8365f400             | and                 dword ptr [ebp - 0xc], 0
            //   8bf8                 | mov                 edi, eax
            //   ff5634               | call                dword ptr [esi + 0x34]
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   81c951dbc951         | or                  ecx, 0x51c9db51

        $sequence_28 = { 3b450c 740d ff45f4 ff560c }
            // n = 4, score = 100
            //   3b450c               | cmp                 eax, dword ptr [ebp + 0xc]
            //   740d                 | je                  0xf
            //   ff45f4               | inc                 dword ptr [ebp - 0xc]
            //   ff560c               | call                dword ptr [esi + 0xc]

        $sequence_29 = { 83651800 81c39f3a1a00 81f7aadd7d3f 81fb2d60a634 74b1 e9???????? 8b5518 }
            // n = 7, score = 100
            //   83651800             | and                 dword ptr [ebp + 0x18], 0
            //   81c39f3a1a00         | add                 ebx, 0x1a3a9f
            //   81f7aadd7d3f         | xor                 edi, 0x3f7dddaa
            //   81fb2d60a634         | cmp                 ebx, 0x34a6602d
            //   74b1                 | je                  0xffffffb3
            //   e9????????           |                     
            //   8b5518               | mov                 edx, dword ptr [ebp + 0x18]

        $sequence_30 = { 81c7fbbebe70 e8???????? 05???????? 50 ff7510 ff5644 e9???????? }
            // n = 7, score = 100
            //   81c7fbbebe70         | add                 edi, 0x70bebefb
            //   e8????????           |                     
            //   05????????           |                     
            //   50                   | push                eax
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   ff5644               | call                dword ptr [esi + 0x44]
            //   e9????????           |                     

        $sequence_31 = { eb8d 837d1000 7417 ff75f8 ff7508 ff5510 81e723fc4c01 }
            // n = 7, score = 100
            //   eb8d                 | jmp                 0xffffff8f
            //   837d1000             | cmp                 dword ptr [ebp + 0x10], 0
            //   7417                 | je                  0x19
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ff5510               | call                dword ptr [ebp + 0x10]
            //   81e723fc4c01         | and                 edi, 0x14cfc23

    condition:
        7 of them and filesize < 204800
}