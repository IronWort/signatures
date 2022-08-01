rule win_turla_rpc_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.turla_rpc."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.turla_rpc"
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
        $sequence_0 = { 488bd8 4885c0 744e 4c8b4708 488b17 488bcb 4c2b07 }
            // n = 7, score = 200
            //   488bd8               | dec                 eax
            //   4885c0               | mov                 ebx, eax
            //   744e                 | dec                 eax
            //   4c8b4708             | test                eax, eax
            //   488b17               | je                  0x50
            //   488bcb               | dec                 esp
            //   4c2b07               | mov                 eax, dword ptr [edi + 8]

        $sequence_1 = { c745c007303431 c745c4133c3930 c645c855 c744244806393030 66c744244c2555 c785c000000006302110 }
            // n = 6, score = 200
            //   c745c007303431       | mov                 dword ptr [ebp - 0x40], 0x31343007
            //   c745c4133c3930       | mov                 dword ptr [ebp - 0x3c], 0x30393c13
            //   c645c855             | mov                 byte ptr [ebp - 0x38], 0x55
            //   c744244806393030     | mov                 dword ptr [esp + 0x48], 0x30303906
            //   66c744244c2555       | mov                 word ptr [esp + 0x4c], 0x5525
            //   c785c000000006302110     | mov    dword ptr [ebp + 0xc0], 0x10213006

        $sequence_2 = { c7459c25303b55 c744247836343939 66c744247c3a36 c644247e55 c745883336393a 66c7458c2630 }
            // n = 6, score = 200
            //   c7459c25303b55       | mov                 eax, dword ptr [edi + 8]
            //   c744247836343939     | dec                 eax
            //   66c744247c3a36       | mov                 edx, dword ptr [edi]
            //   c644247e55           | dec                 eax
            //   c745883336393a       | mov                 ecx, ebx
            //   66c7458c2630         | dec                 esp

        $sequence_3 = { c785640100003a202155 c785a8010000271c3367 c685ac01000055 c785900100002130271c }
            // n = 4, score = 200
            //   c785640100003a202155     | mov    dword ptr [ebp + 0x1c0], 0x55213630
            //   c785a8010000271c3367     | mov    dword ptr [ebp - 0x30], 0x213c2702
            //   c685ac01000055       | mov                 dword ptr [ebp - 0x2c], 0x393c1330
            //   c785900100002130271c     | mov    word ptr [ebp - 0x28], 0x5530

        $sequence_4 = { c785f4000000133c2726 c785f800000021133c39 66c785fc0000003002 c685fe00000055 c785d000000012302113 c785d40000003c393006 }
            // n = 6, score = 200
            //   c785f4000000133c2726     | mov    dword ptr [ebp + 0xf4], 0x26273c13
            //   c785f800000021133c39     | mov    dword ptr [ebp + 0xf8], 0x393c1321
            //   66c785fc0000003002     | mov    word ptr [ebp + 0xfc], 0x230
            //   c685fe00000055       | mov                 byte ptr [ebp + 0xfe], 0x55
            //   c785d000000012302113     | mov    dword ptr [ebp + 0xd0], 0x13213012
            //   c785d40000003c393006     | mov    dword ptr [ebp + 0xd4], 0x630393c

        $sequence_5 = { c745b06970746f c745b472536163 66c745b86c00 ff15???????? }
            // n = 4, score = 200
            //   c745b06970746f       | mov                 dword ptr [ebp - 0x50], 0x6f747069
            //   c745b472536163       | mov                 dword ptr [ebp - 0x4c], 0x63615372
            //   66c745b86c00         | mov                 word ptr [ebp - 0x48], 0x6c
            //   ff15????????         |                     

        $sequence_6 = { 660f6f05???????? c7858000000012302101 c7858400000030382505 c7858800000034213d02 f30f7f8530010000 660f6f05???????? f30f7f8550010000 }
            // n = 7, score = 200
            //   660f6f05????????     |                     
            //   c7858000000012302101     | dec    eax
            //   c7858400000030382505     | mov    edx, dword ptr [edi]
            //   c7858800000034213d02     | dec    eax
            //   f30f7f8530010000     | mov                 ecx, ebx
            //   660f6f05????????     |                     
            //   f30f7f8550010000     | dec                 esp

        $sequence_7 = { c785b400000034262110 f30f7f85c8010000 660f6f05???????? f30f7f8d98010000 }
            // n = 4, score = 200
            //   c785b400000034262110     | mov    dword ptr [ebp + 0x120], 0x5213012
            //   f30f7f85c8010000     | je                  0x50
            //   660f6f05????????     |                     
            //   f30f7f8d98010000     | dec                 esp

        $sequence_8 = { c685cc00000055 c785c001000030362155 c745d002273c21 c745d430133c39 66c745d83055 c7852001000012302105 c78524010000273a3614 }
            // n = 7, score = 200
            //   c685cc00000055       | sub                 eax, dword ptr [edi]
            //   c785c001000030362155     | mov    dword ptr [ebp + 0x80], 0x1213012
            //   c745d002273c21       | mov                 dword ptr [ebp + 0x84], 0x5253830
            //   c745d430133c39       | mov                 dword ptr [ebp + 0x88], 0x23d2134
            //   66c745d83055         | movdqu              xmmword ptr [ebp + 0x130], xmm0
            //   c7852001000012302105     | movdqu    xmmword ptr [ebp + 0x150], xmm0
            //   c78524010000273a3614     | mov    byte ptr [ebp + 0xcc], 0x55

        $sequence_9 = { 40 83f819 72f2 660fefe0 }
            // n = 4, score = 100
            //   40                   | inc                 eax
            //   83f819               | cmp                 eax, 0x19
            //   72f2                 | jb                  0xfffffff4
            //   660fefe0             | pxor                xmm4, xmm0

        $sequence_10 = { c7430400000000 c7430800000000 e9???????? 8d45c4 }
            // n = 4, score = 100
            //   c7430400000000       | mov                 dword ptr [ebx + 4], 0
            //   c7430800000000       | mov                 dword ptr [ebx + 8], 0
            //   e9????????           |                     
            //   8d45c4               | lea                 eax, dword ptr [ebp - 0x3c]

        $sequence_11 = { 83c404 8901 85c0 751e 56 }
            // n = 5, score = 100
            //   83c404               | add                 esp, 4
            //   8901                 | mov                 dword ptr [ecx], eax
            //   85c0                 | test                eax, eax
            //   751e                 | jne                 0x20
            //   56                   | push                esi

        $sequence_12 = { c20400 6a00 6a00 6a00 6898000000 ff15???????? 8b4dfc }
            // n = 7, score = 100
            //   c20400               | ret                 4
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6898000000           | push                0x98
            //   ff15????????         |                     
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]

        $sequence_13 = { 894118 8d8500ffffff 50 57 ff9570fdffff }
            // n = 5, score = 100
            //   894118               | mov                 dword ptr [ecx + 0x18], eax
            //   8d8500ffffff         | lea                 eax, dword ptr [ebp - 0x100]
            //   50                   | push                eax
            //   57                   | push                edi
            //   ff9570fdffff         | call                dword ptr [ebp - 0x290]

        $sequence_14 = { 884dab 83f80b 0f877b020000 ff248576c10010 8d41cf }
            // n = 5, score = 100
            //   884dab               | mov                 byte ptr [ebp - 0x55], cl
            //   83f80b               | cmp                 eax, 0xb
            //   0f877b020000         | ja                  0x281
            //   ff248576c10010       | jmp                 dword ptr [eax*4 + 0x1000c176]
            //   8d41cf               | lea                 eax, dword ptr [ecx - 0x31]

        $sequence_15 = { c745cc63007400 c745d06c000000 c745ac41006400 c745b076006100 }
            // n = 4, score = 100
            //   c745cc63007400       | mov                 dword ptr [ebp - 0x34], 0x740063
            //   c745d06c000000       | mov                 dword ptr [ebp - 0x30], 0x6c
            //   c745ac41006400       | mov                 dword ptr [ebp - 0x54], 0x640041
            //   c745b076006100       | mov                 dword ptr [ebp - 0x50], 0x610076

    condition:
        7 of them and filesize < 311296
}