rule win_batel_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.batel."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.batel"
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
        $sequence_0 = { 33c0 5b c21000 3b0d???????? 7502 f3c3 e9???????? }
            // n = 7, score = 200
            //   33c0                 | xor                 eax, eax
            //   5b                   | pop                 ebx
            //   c21000               | ret                 0x10
            //   3b0d????????         |                     
            //   7502                 | jne                 4
            //   f3c3                 | ret                 
            //   e9????????           |                     

        $sequence_1 = { 7419 ffd0 56 ffd3 }
            // n = 4, score = 100
            //   7419                 | je                  0x1b
            //   ffd0                 | call                eax
            //   56                   | push                esi
            //   ffd3                 | call                ebx

        $sequence_2 = { 68ee020000 ff15???????? 689d020000 8d8561fdffff }
            // n = 4, score = 100
            //   68ee020000           | push                0x2ee
            //   ff15????????         |                     
            //   689d020000           | push                0x29d
            //   8d8561fdffff         | lea                 eax, dword ptr [ebp - 0x29f]

        $sequence_3 = { 8db560fdffff f3a5 66a5 ffd0 5f 5e }
            // n = 6, score = 100
            //   8db560fdffff         | lea                 esi, dword ptr [ebp - 0x2a0]
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   66a5                 | movsw               word ptr es:[edi], word ptr [esi]
            //   ffd0                 | call                eax
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_4 = { 8bff 55 8bec 6afe 68a8212300 }
            // n = 5, score = 100
            //   8bff                 | mov                 edi, edi
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   6afe                 | push                -2
            //   68a8212300           | push                0x2321a8

        $sequence_5 = { 83c003 41 3d???????? 7cec 56 57 }
            // n = 6, score = 100
            //   83c003               | add                 eax, 3
            //   41                   | inc                 ecx
            //   3d????????           |                     
            //   7cec                 | jl                  0xffffffee
            //   56                   | push                esi
            //   57                   | push                edi

        $sequence_6 = { 7404 33c0 eb35 a1???????? 81b80000230050450000 75eb }
            // n = 6, score = 100
            //   7404                 | je                  6
            //   33c0                 | xor                 eax, eax
            //   eb35                 | jmp                 0x37
            //   a1????????           |                     
            //   81b80000230050450000     | cmp    dword ptr [eax + 0x230000], 0x4550
            //   75eb                 | jne                 0xffffffed

        $sequence_7 = { 85c0 7412 ffd0 56 }
            // n = 4, score = 100
            //   85c0                 | test                eax, eax
            //   7412                 | je                  0x14
            //   ffd0                 | call                eax
            //   56                   | push                esi

        $sequence_8 = { 7ccd 5f 5e 5d 33c0 5b c21000 }
            // n = 7, score = 100
            //   7ccd                 | jl                  0xffffffcf
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp
            //   33c0                 | xor                 eax, eax
            //   5b                   | pop                 ebx
            //   c21000               | ret                 0x10

        $sequence_9 = { 59 c3 6a5c 6868212300 }
            // n = 4, score = 100
            //   59                   | pop                 ecx
            //   c3                   | ret                 
            //   6a5c                 | push                0x5c
            //   6868212300           | push                0x232168

        $sequence_10 = { 56 ffd3 68005c2605 ffd5 }
            // n = 4, score = 100
            //   56                   | push                esi
            //   ffd3                 | call                ebx
            //   68005c2605           | push                0x5265c00
            //   ffd5                 | call                ebp

        $sequence_11 = { 3bc6 751b 68c0202300 68b8202300 }
            // n = 4, score = 100
            //   3bc6                 | cmp                 eax, esi
            //   751b                 | jne                 0x1d
            //   68c0202300           | push                0x2320c0
            //   68b8202300           | push                0x2320b8

        $sequence_12 = { 6a40 6800100000 689e020000 6a00 ff15???????? 8bf8 }
            // n = 6, score = 100
            //   6a40                 | push                0x40
            //   6800100000           | push                0x1000
            //   689e020000           | push                0x29e
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax

        $sequence_13 = { 6879172300 64ff3500000000 8b442410 896c2410 }
            // n = 4, score = 100
            //   6879172300           | push                0x231779
            //   64ff3500000000       | push                dword ptr fs:[0]
            //   8b442410             | mov                 eax, dword ptr [esp + 0x10]
            //   896c2410             | mov                 dword ptr [esp + 0x10], ebp

        $sequence_14 = { 8b2d???????? 56 57 68a00f0000 }
            // n = 4, score = 100
            //   8b2d????????         |                     
            //   56                   | push                esi
            //   57                   | push                edi
            //   68a00f0000           | push                0xfa0

        $sequence_15 = { 8d642400 68???????? ff15???????? 8bf0 }
            // n = 4, score = 100
            //   8d642400             | lea                 esp, dword ptr [esp]
            //   68????????           |                     
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax

        $sequence_16 = { c68560fdffff00 e8???????? 83c40c 33c9 b8???????? 8a10 88940d60fdffff }
            // n = 7, score = 100
            //   c68560fdffff00       | mov                 byte ptr [ebp - 0x2a0], 0
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   33c9                 | xor                 ecx, ecx
            //   b8????????           |                     
            //   8a10                 | mov                 dl, byte ptr [eax]
            //   88940d60fdffff       | mov                 byte ptr [ebp + ecx - 0x2a0], dl

        $sequence_17 = { 68a00f0000 ffd5 8b1d???????? bf01000000 8d642400 }
            // n = 5, score = 100
            //   68a00f0000           | push                0xfa0
            //   ffd5                 | call                ebp
            //   8b1d????????         |                     
            //   bf01000000           | mov                 edi, 1
            //   8d642400             | lea                 esp, dword ptr [esp]

        $sequence_18 = { 689d020000 8d8561fdffff 6a00 50 }
            // n = 4, score = 100
            //   689d020000           | push                0x29d
            //   8d8561fdffff         | lea                 eax, dword ptr [ebp - 0x29f]
            //   6a00                 | push                0
            //   50                   | push                eax

        $sequence_19 = { 68e0930400 ff15???????? 8b1d???????? bf01000000 8da42400000000 68e0202300 }
            // n = 6, score = 100
            //   68e0930400           | push                0x493e0
            //   ff15????????         |                     
            //   8b1d????????         |                     
            //   bf01000000           | mov                 edi, 1
            //   8da42400000000       | lea                 esp, dword ptr [esp]
            //   68e0202300           | push                0x2320e0

        $sequence_20 = { 33c0 40 c20c00 55 8bec 81eca0020000 }
            // n = 6, score = 100
            //   33c0                 | xor                 eax, eax
            //   40                   | inc                 eax
            //   c20c00               | ret                 0xc
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   81eca0020000         | sub                 esp, 0x2a0

        $sequence_21 = { ffd5 47 83ff5a 7ccd }
            // n = 4, score = 100
            //   ffd5                 | call                ebp
            //   47                   | inc                 edi
            //   83ff5a               | cmp                 edi, 0x5a
            //   7ccd                 | jl                  0xffffffcf

        $sequence_22 = { 6a00 ff15???????? 8bf8 b9a7000000 8db560fdffff f3a5 66a5 }
            // n = 7, score = 100
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax
            //   b9a7000000           | mov                 ecx, 0xa7
            //   8db560fdffff         | lea                 esi, dword ptr [ebp - 0x2a0]
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   66a5                 | movsw               word ptr es:[edi], word ptr [esi]

    condition:
        7 of them and filesize < 49152
}