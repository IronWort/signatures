rule win_smokeloader_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.smokeloader."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.smokeloader"
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
        $sequence_0 = { ff15???????? 8d45f0 50 8d45e8 50 8d45e0 }
            // n = 6, score = 1300
            //   ff15????????         |                     
            //   8d45f0               | lea                 eax, dword ptr [ebp - 0x10]
            //   50                   | push                eax
            //   8d45e8               | lea                 eax, dword ptr [ebp - 0x18]
            //   50                   | push                eax
            //   8d45e0               | lea                 eax, dword ptr [ebp - 0x20]

        $sequence_1 = { 8bf0 8d45dc 50 6a00 53 }
            // n = 5, score = 1100
            //   8bf0                 | mov                 esi, eax
            //   8d45dc               | lea                 eax, dword ptr [ebp - 0x24]
            //   50                   | push                eax
            //   6a00                 | push                0
            //   53                   | push                ebx

        $sequence_2 = { 57 ff15???????? 6a00 6800000002 }
            // n = 4, score = 1100
            //   57                   | push                edi
            //   ff15????????         |                     
            //   6a00                 | push                0
            //   6800000002           | push                0x2000000

        $sequence_3 = { 8d45e8 50 8d45e0 50 56 ff15???????? 56 }
            // n = 7, score = 1100
            //   8d45e8               | lea                 eax, dword ptr [ebp - 0x18]
            //   50                   | push                eax
            //   8d45e0               | lea                 eax, dword ptr [ebp - 0x20]
            //   50                   | push                eax
            //   56                   | push                esi
            //   ff15????????         |                     
            //   56                   | push                esi

        $sequence_4 = { 6a00 53 ff15???????? 8d45f0 }
            // n = 4, score = 1100
            //   6a00                 | push                0
            //   53                   | push                ebx
            //   ff15????????         |                     
            //   8d45f0               | lea                 eax, dword ptr [ebp - 0x10]

        $sequence_5 = { ff15???????? bf90010000 8bcf e8???????? }
            // n = 4, score = 900
            //   ff15????????         |                     
            //   bf90010000           | mov                 edi, 0x190
            //   8bcf                 | mov                 ecx, edi
            //   e8????????           |                     

        $sequence_6 = { 668ce8 6685c0 7406 fe05???????? }
            // n = 4, score = 900
            //   668ce8               | mov                 ax, gs
            //   6685c0               | test                ax, ax
            //   7406                 | je                  8
            //   fe05????????         |                     

        $sequence_7 = { e8???????? 8bf0 8d45fc 50 ff75fc 56 }
            // n = 6, score = 800
            //   e8????????           |                     
            //   8bf0                 | mov                 ax, gs
            //   8d45fc               | test                ax, ax
            //   50                   | je                  8
            //   ff75fc               | mov                 edi, 0x190
            //   56                   | mov                 ecx, edi

        $sequence_8 = { ff15???????? 50 56 6a00 ff15???????? }
            // n = 5, score = 800
            //   ff15????????         |                     
            //   50                   | push                eax
            //   56                   | push                esi
            //   6a00                 | push                0
            //   ff15????????         |                     

        $sequence_9 = { 8b07 03c3 50 ff15???????? }
            // n = 4, score = 800
            //   8b07                 | mov                 eax, dword ptr [edi]
            //   03c3                 | add                 eax, ebx
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_10 = { ff15???????? 6800a00f00 50 a3???????? }
            // n = 4, score = 800
            //   ff15????????         |                     
            //   6800a00f00           | test                ax, ax
            //   50                   | je                  0xe
            //   a3????????           |                     

        $sequence_11 = { 7507 33c0 e9???????? e8???????? b904010000 }
            // n = 5, score = 800
            //   7507                 | jne                 9
            //   33c0                 | xor                 eax, eax
            //   e9????????           |                     
            //   e8????????           |                     
            //   b904010000           | mov                 ecx, 0x104

        $sequence_12 = { ff15???????? 33ff 2bf0 47 }
            // n = 4, score = 800
            //   ff15????????         |                     
            //   33ff                 | and                 dword ptr [ebp - 4], 0
            //   2bf0                 | lea                 eax, dword ptr [ebp - 4]
            //   47                   | push                eax

        $sequence_13 = { 83c410 56 53 53 }
            // n = 4, score = 800
            //   83c410               | mov                 ax, gs
            //   56                   | test                ax, ax
            //   53                   | je                  8
            //   53                   | mov                 ax, gs

        $sequence_14 = { ff15???????? ff35???????? 6aff ff15???????? }
            // n = 4, score = 800
            //   ff15????????         |                     
            //   ff35????????         |                     
            //   6aff                 | jb                  0xfffffff2
            //   ff15????????         |                     

        $sequence_15 = { 72f0 eb19 8365fc00 8d45fc 50 ff7508 ff15???????? }
            // n = 7, score = 800
            //   72f0                 | jne                 9
            //   eb19                 | xor                 eax, eax
            //   8365fc00             | mov                 ecx, 0x104
            //   8d45fc               | cmp                 ecx, 0x20
            //   50                   | jb                  0xfffffff2
            //   ff7508               | jmp                 0x1d
            //   ff15????????         |                     

        $sequence_16 = { 8d8decfdffff 8d95f0fdffff c70200000000 6800800000 52 51 6aff }
            // n = 7, score = 500
            //   8d8decfdffff         | xor                 eax, eax
            //   8d95f0fdffff         | xor                 edx, edx
            //   c70200000000         | dec                 eax
            //   6800800000           | mov                 dword ptr [esp + 0x20], eax
            //   52                   | mov                 ecx, 0x21
            //   51                   | xor                 ecx, ecx
            //   6aff                 | jmp                 8

        $sequence_17 = { 66894603 8d8de8fdffff 50 50 50 }
            // n = 5, score = 500
            //   66894603             | jmp                 0x68
            //   8d8de8fdffff         | dec                 eax
            //   50                   | mov                 ecx, edi
            //   50                   | mov                 edi, dword ptr [ebp + 0x10]
            //   50                   | push                eax

        $sequence_18 = { 89c6 6804010000 56 57 }
            // n = 4, score = 500
            //   89c6                 | push                0
            //   6804010000           | push                0
            //   56                   | mov                 byte ptr [esi], 0x53
            //   57                   | push                esi

        $sequence_19 = { 01d4 8d85f0fdffff 8b750c 8b7d10 50 }
            // n = 5, score = 500
            //   01d4                 | push                eax
            //   8d85f0fdffff         | push                edi
            //   8b750c               | push                esi
            //   8b7d10               | push                ebx
            //   50                   | lea                 edx, dword ptr [ebp - 0x210]

        $sequence_20 = { 8985ecfdffff ffb5f0fdffff 50 53 e8???????? 8d8decfdffff 8d95f0fdffff }
            // n = 7, score = 500
            //   8985ecfdffff         | push                edi
            //   ffb5f0fdffff         | push                esi
            //   50                   | push                ebx
            //   53                   | test                eax, eax
            //   e8????????           |                     
            //   8d8decfdffff         | lea                 ecx, dword ptr [ebp - 0x214]
            //   8d95f0fdffff         | lea                 edx, dword ptr [ebp - 0x210]

        $sequence_21 = { 8db5f8fdffff c60653 56 6a00 }
            // n = 4, score = 500
            //   8db5f8fdffff         | lea                 eax, dword ptr [ebp - 0x210]
            //   c60653               | mov                 esi, dword ptr [ebp + 0xc]
            //   56                   | mov                 edi, dword ptr [ebp + 0x10]
            //   6a00                 | push                eax

        $sequence_22 = { 8b7d10 50 57 56 53 e8???????? 85c0 }
            // n = 7, score = 500
            //   8b7d10               | arpl                word ptr [ebx + 0x3c], cx
            //   50                   | inc                 ebp
            //   57                   | xor                 ecx, ecx
            //   56                   | dec                 eax
            //   53                   | mov                 dword ptr [ecx + ebx + 0x30], ebx
            //   e8????????           |                     
            //   85c0                 | inc                 ebp

        $sequence_23 = { fc 5f 5e 5b }
            // n = 4, score = 400
            //   fc                   | push                esi
            //   5f                   | push                esi
            //   5e                   | push                eax
            //   5b                   | lea                 eax, dword ptr [ebp - 0x20]

        $sequence_24 = { 89c6 89cf fc b280 }
            // n = 4, score = 400
            //   89c6                 | inc                 edi
            //   89cf                 | mov                 esi, eax
            //   fc                   | lea                 eax, dword ptr [ebp - 4]
            //   b280                 | push                eax

        $sequence_25 = { 30d0 aa e2f3 7505 }
            // n = 4, score = 400
            //   30d0                 | xor                 al, dl
            //   aa                   | stosb               byte ptr es:[edi], al
            //   e2f3                 | loop                0xfffffff5
            //   7505                 | jne                 7

        $sequence_26 = { 55 89e5 81ec5c060000 53 }
            // n = 4, score = 400
            //   55                   | push                ebp
            //   89e5                 | mov                 ebp, esp
            //   81ec5c060000         | sub                 esp, 0x65c
            //   53                   | push                ebx

        $sequence_27 = { ffc9 49 8d3c8c 8b37 4c }
            // n = 5, score = 300
            //   ffc9                 | dec                 ecx
            //   49                   | dec                 ecx
            //   8d3c8c               | lea                 edi, dword ptr [esp + ecx*4]
            //   8b37                 | mov                 esi, dword ptr [edi]
            //   4c                   | dec                 esp

        $sequence_28 = { 4533c0 33d2 4889442420 ff15???????? b921000000 }
            // n = 5, score = 300
            //   4533c0               | mov                 ecx, dword ptr [ebp - 0x80]
            //   33d2                 | dec                 eax
            //   4889442420           | mov                 eax, dword ptr [ecx]
            //   ff15????????         |                     
            //   b921000000           | dec                 eax

        $sequence_29 = { 488bd6 488bc8 488bd8 ff15???????? 48634b3c 4533c9 48895c1930 }
            // n = 7, score = 300
            //   488bd6               | cmp                 ebx, 0x10
            //   488bc8               | jl                  0xffffffdf
            //   488bd8               | dec                 eax
            //   ff15????????         |                     
            //   48634b3c             | mov                 edx, edi
            //   4533c9               | call                dword ptr [eax + 0x88]
            //   48895c1930           | dec                 eax

        $sequence_30 = { ac 01c2 85c0 75f0 }
            // n = 4, score = 300
            //   ac                   | lodsb               al, byte ptr [esi]
            //   01c2                 | add                 edx, eax
            //   85c0                 | test                eax, eax
            //   75f0                 | jne                 0xfffffff2

        $sequence_31 = { 8b45d7 4103c5 44896b17 4881c3cd020000 89834ffdffff 448b875e030000 488d5701 }
            // n = 7, score = 300
            //   8b45d7               | mov                 eax, dword ptr [ebp - 0x29]
            //   4103c5               | inc                 ecx
            //   44896b17             | add                 eax, ebp
            //   4881c3cd020000       | inc                 esp
            //   89834ffdffff         | mov                 dword ptr [ebx + 0x17], ebp
            //   448b875e030000       | dec                 eax
            //   488d5701             | add                 ebx, 0x2cd

        $sequence_32 = { 8d1c10 41 8b4b18 45 8b6320 4d 01c4 }
            // n = 7, score = 300
            //   8d1c10               | lea                 ebx, dword ptr [eax + edx]
            //   41                   | inc                 ecx
            //   8b4b18               | mov                 ecx, dword ptr [ebx + 0x18]
            //   45                   | inc                 ebp
            //   8b6320               | mov                 esp, dword ptr [ebx + 0x20]
            //   4d                   | dec                 ebp
            //   01c4                 | add                 esp, eax

        $sequence_33 = { 01c2 31c0 ac 01c2 }
            // n = 4, score = 300
            //   01c2                 | add                 edx, eax
            //   31c0                 | xor                 eax, eax
            //   ac                   | lodsb               al, byte ptr [esi]
            //   01c2                 | add                 edx, eax

        $sequence_34 = { 488bd7 ff9088000000 488b4d80 488b01 }
            // n = 4, score = 300
            //   488bd7               | lea                 edx, dword ptr [edi + 1]
            //   ff9088000000         | dec                 eax
            //   488b4d80             | add                 edi, ecx
            //   488b01               | mov                 dword ptr [ebp + 0x30], ebx

        $sequence_35 = { 41 8b7b1c 4c 01c7 8b048f 4c }
            // n = 6, score = 300
            //   41                   | inc                 ecx
            //   8b7b1c               | mov                 edi, dword ptr [ebx + 0x1c]
            //   4c                   | dec                 esp
            //   01c7                 | add                 edi, eax
            //   8b048f               | mov                 eax, dword ptr [edi + ecx*4]
            //   4c                   | dec                 esp

        $sequence_36 = { 89d0 c1e205 01c2 31c0 }
            // n = 4, score = 300
            //   89d0                 | add                 esi, eax
            //   c1e205               | mov                 edi, dword ptr [ebx + 0x24]
            //   01c2                 | dec                 esp
            //   31c0                 | add                 edi, eax

        $sequence_37 = { 01c7 668b0c4f 41 8b7b1c }
            // n = 4, score = 300
            //   01c7                 | add                 edi, eax
            //   668b0c4f             | mov                 cx, word ptr [edi + ecx*2]
            //   41                   | inc                 ecx
            //   8b7b1c               | mov                 edi, dword ptr [ebx + 0x1c]

        $sequence_38 = { 4803f9 895d30 83fb10 7cd7 }
            // n = 4, score = 300
            //   4803f9               | mov                 dword ptr [ebx - 0x2b1], eax
            //   895d30               | inc                 esp
            //   83fb10               | mov                 eax, dword ptr [edi + 0x35e]
            //   7cd7                 | dec                 eax

        $sequence_39 = { 01ee 56 ad 01e8 31c9 }
            // n = 5, score = 200
            //   01ee                 | cld                 
            //   56                   | mov                 dl, 0x80
            //   ad                   | mov                 esi, eax
            //   01e8                 | mov                 edi, ecx
            //   31c9                 | cld                 

        $sequence_40 = { 83c001 894590 8b4dfc 0fb75102 395590 7d37 }
            // n = 6, score = 200
            //   83c001               | mov                 edx, dword ptr [ebp - 0x7c]
            //   894590               | mov                 eax, dword ptr [ebp - 0x4c]
            //   8b4dfc               | mov                 eax, dword ptr [ebp - 0x1c]
            //   0fb75102             | push                eax
            //   395590               | mov                 dword ptr [ebp - 0x4c], eax
            //   7d37                 | mov                 ecx, dword ptr [ebp - 0x60]

        $sequence_41 = { 8b45e4 50 e8???????? 8945b4 8b4da0 8b55b4 89514c }
            // n = 7, score = 200
            //   8b45e4               | push                eax
            //   50                   | push                esi
            //   e8????????           |                     
            //   8945b4               | push                eax
            //   8b4da0               | push                esi
            //   8b55b4               | push                0
            //   89514c               | push                eax

        $sequence_42 = { 803800 75f5 31d1 75ec }
            // n = 4, score = 200
            //   803800               | add                 esi, ebp
            //   75f5                 | push                esi
            //   31d1                 | lodsd               eax, dword ptr [esi]
            //   75ec                 | add                 eax, ebp

        $sequence_43 = { c1e002 03471c 8b0428 01e8 }
            // n = 4, score = 200
            //   c1e002               | mov                 dl, 0x80
            //   03471c               | xor                 ebx, ebx
            //   8b0428               | movsb               byte ptr es:[edi], byte ptr [esi]
            //   01e8                 | pushal              

        $sequence_44 = { 39458c 7d53 8b4d8c 6bc928 8b55ec 8b45d8 03440a0c }
            // n = 7, score = 200
            //   39458c               | mov                 ax, gs
            //   7d53                 | test                ax, ax
            //   8b4d8c               | je                  0xb
            //   6bc928               | mov                 ax, gs
            //   8b55ec               | test                ax, ax
            //   8b45d8               | je                  0xb
            //   03440a0c             | push                eax

        $sequence_45 = { ad 85c0 75f3 c3 56 }
            // n = 5, score = 200
            //   ad                   | mov                 dl, 0x80
            //   85c0                 | xor                 ebx, ebx
            //   75f3                 | movsb               byte ptr es:[edi], byte ptr [esi]
            //   c3                   | mov                 edi, ecx
            //   56                   | cld                 

        $sequence_46 = { 8b4590 6bc028 8b4dec 8b540110 52 8b4590 6bc028 }
            // n = 7, score = 200
            //   8b4590               | mov                 edx, dword ptr [ebp - 0x4c]
            //   6bc028               | mov                 dword ptr [ecx + 0x4c], edx
            //   8b4dec               | push                ebp
            //   8b540110             | mov                 ebp, esp
            //   52                   | mov                 ecx, dword ptr [ebp + 0xc]
            //   8b4590               | imul                ecx, dword ptr [ebp + 0xc]
            //   6bc028               | imul                ecx, ecx, 0x63

        $sequence_47 = { 55 8bec 8b4d0c 0faf4d0c 6bc963 8b4508 33d2 }
            // n = 7, score = 200
            //   55                   | push                edi
            //   8bec                 | inc                 ebx
            //   8b4d0c               | cmp                 ebx, 0xf
            //   0faf4d0c             | cmp                 dword ptr [ebp - 0x74], eax
            //   6bc963               | jge                 0x58
            //   8b4508               | mov                 ecx, dword ptr [ebp - 0x74]
            //   33d2                 | imul                ecx, ecx, 0x28

        $sequence_48 = { 8d45e8 50 ff55bc 894588 }
            // n = 4, score = 200
            //   8d45e8               | mov                 eax, dword ptr [ebp + 8]
            //   50                   | xor                 edx, edx
            //   ff55bc               | mov                 edx, dword ptr [ebp - 0x40]
            //   894588               | mov                 dword ptr [ecx + 0x14], edx

        $sequence_49 = { 8b55c0 895114 68ddf553cd 8b45e4 50 }
            // n = 5, score = 200
            //   8b55c0               | mov                 edx, dword ptr [ebp - 0x14]
            //   895114               | mov                 eax, dword ptr [ebp - 0x28]
            //   68ddf553cd           | add                 eax, dword ptr [edx + ecx + 0xc]
            //   8b45e4               | mov                 ecx, dword ptr [ebp - 0x48]
            //   50                   | mov                 dword ptr [eax + 0x1c], ecx

        $sequence_50 = { 57 007508 bbb84340c1 4a }
            // n = 4, score = 200
            //   57                   | xor                 ecx, ecx
            //   007508               | lodsd               eax, dword ptr [esi]
            //   bbb84340c1           | test                eax, eax
            //   4a                   | jne                 0xfffffff7

        $sequence_51 = { 8bec 83c4d0 1e 53 56 57 }
            // n = 6, score = 200
            //   8bec                 | mov                 esi, eax
            //   83c4d0               | mov                 edi, ecx
            //   1e                   | cld                 
            //   53                   | mov                 dl, 0x80
            //   56                   | xor                 ebx, ebx
            //   57                   | movsb               byte ptr es:[edi], byte ptr [esi]

        $sequence_52 = { 8b4db8 89481c 8b5584 8b45b4 }
            // n = 4, score = 200
            //   8b4db8               | push                esi
            //   89481c               | push                0
            //   8b5584               | mov                 eax, dword ptr [edi]
            //   8b45b4               | add                 eax, ebx

        $sequence_53 = { 8b7c2878 01ef 8b7720 01ee }
            // n = 4, score = 200
            //   8b7c2878             | ret                 
            //   01ef                 | push                esi
            //   8b7720               | shl                 eax, 2
            //   01ee                 | add                 eax, dword ptr [edi + 0x1c]

    condition:
        7 of them and filesize < 245760
}