rule win_redalpha_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.redalpha."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.redalpha"
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
        $sequence_0 = { 68???????? 50 e8???????? 83c40c c0e304 }
            // n = 5, score = 400
            //   68????????           |                     
            //   50                   | inc                 ecx
            //   e8????????           |                     
            //   83c40c               | inc                 dword ptr [ecx + 0x28]
            //   c0e304               | inc                 ecx

        $sequence_1 = { 83c40c b8???????? 5f 5e 5b }
            // n = 5, score = 400
            //   83c40c               | inc                 ecx
            //   b8????????           |                     
            //   5f                   | mov                 ecx, ebx
            //   5e                   | inc                 ecx
            //   5b                   | sub                 cl, byte ptr [ecx + 0x1714]

        $sequence_2 = { 83c40c c0e304 0fb6c3 50 68???????? }
            // n = 5, score = 400
            //   83c40c               | mov                 eax, 0x400
            //   c0e304               | dec                 eax
            //   0fb6c3               | mov                 dword ptr [esp + 0x20], eax
            //   50                   | dec                 eax
            //   68????????           |                     

        $sequence_3 = { 41ff4228 458b4228 498b4210 66c1e908 }
            // n = 4, score = 300
            //   41ff4228             | mov                 dword ptr [esp + 0x20], eax
            //   458b4228             | dec                 eax
            //   498b4210             | mov                 dword ptr [esp + 0x28], esi
            //   66c1e908             | dec                 esp

        $sequence_4 = { 8b0e 8b4604 ffd0 c7467400000000 }
            // n = 4, score = 300
            //   8b0e                 | add                 esp, 0xc
            //   8b4604               | shl                 bl, 4
            //   ffd0                 | movzx               eax, bl
            //   c7467400000000       | push                eax

        $sequence_5 = { 41ff4128 418b5128 498b4910 410fb68111170000 88040a 418bcb }
            // n = 6, score = 300
            //   41ff4128             | add                 dword ptr [ecx + 0x1714], -9
            //   418b5128             | inc                 cx
            //   498b4910             | shr                 edx, cl
            //   410fb68111170000     | dec                 ecx
            //   88040a               | mov                 ecx, ecx
            //   418bcb               | inc                 bp

        $sequence_6 = { 41ff4228 418b5228 498b4a10 410fb68211170000 88040a b910000000 }
            // n = 6, score = 300
            //   41ff4228             | inc                 cx
            //   418b5228             | shr                 edx, cl
            //   498b4a10             | dec                 ecx
            //   410fb68211170000     | mov                 ecx, ecx
            //   88040a               | inc                 bp
            //   b910000000           | mov                 dword ptr [ecx + 0x1710], edx

        $sequence_7 = { 4889742430 33f6 89711c 89710c 48897120 488b4710 48894720 }
            // n = 7, score = 300
            //   4889742430           | dec                 ecx
            //   33f6                 | mov                 ecx, ecx
            //   89711c               | inc                 ecx
            //   89710c               | inc                 dword ptr [ecx + 0x28]
            //   48897120             | inc                 ecx
            //   488b4710             | movzx               ecx, bl
            //   48894720             | inc                 ecx

        $sequence_8 = { 8b0e 8b02 8906 83c604 }
            // n = 4, score = 300
            //   8b0e                 | sub                 cl, byte ptr [edx + 0x1714]
            //   8b02                 | inc                 ecx
            //   8906                 | inc                 dword ptr [edx + 0x28]
            //   83c604               | inc                 ebp

        $sequence_9 = { 41ff4128 410fb6cb 41838114170000f7 6641d3ea }
            // n = 4, score = 300
            //   41ff4128             | mov                 edx, edi
            //   410fb6cb             | dec                 eax
            //   41838114170000f7     | mov                 dword ptr [esp + 0x28], esi
            //   6641d3ea             | dec                 esp

        $sequence_10 = { 4889742428 4c8d8c2440040000 41b800040000 4889442420 }
            // n = 4, score = 300
            //   4889742428           | dec                 eax
            //   4c8d8c2440040000     | mov                 edx, edi
            //   41b800040000         | dec                 eax
            //   4889442420           | mov                 ecx, dword ptr [eax]

        $sequence_11 = { 8b0e 8b048508344300 894644 8b460c }
            // n = 4, score = 300
            //   8b0e                 | mov                 eax, dword ptr [edx + 0x10]
            //   8b048508344300       | shr                 cx, 8
            //   894644               | inc                 ecx
            //   8b460c               | mov                 byte ptr [eax + eax], cl

        $sequence_12 = { 8b0e 8b4608 53 ffd0 }
            // n = 4, score = 300
            //   8b0e                 | shl                 bl, 4
            //   8b4608               | movzx               eax, bl
            //   53                   | push                eax
            //   ffd0                 | push                eax

        $sequence_13 = { 4889742420 ff15???????? 448b842440040000 488bd7 488bcb e8???????? }
            // n = 6, score = 300
            //   4889742420           | dec                 eax
            //   ff15????????         |                     
            //   448b842440040000     | mov                 dword ptr [esp + 0x20], esi
            //   488bd7               | inc                 esp
            //   488bcb               | mov                 eax, dword ptr [esp + 0x440]
            //   e8????????           |                     

        $sequence_14 = { 4889742428 4c8bcb 41b820000000 48c744242000000000 }
            // n = 4, score = 300
            //   4889742428           | dec                 eax
            //   4c8bcb               | mov                 edx, edi
            //   41b820000000         | dec                 eax
            //   48c744242000000000     | mov    ecx, ebx

        $sequence_15 = { 8b0e 890f 8b4e04 8b75f8 5f 890e 5e }
            // n = 7, score = 300
            //   8b0e                 | dec                 ecx
            //   890f                 | mov                 ecx, dword ptr [edx + 0x10]
            //   8b4e04               | inc                 ecx
            //   8b75f8               | movzx               eax, byte ptr [edx + 0x1711]
            //   5f                   | mov                 byte ptr [edx + ecx], al
            //   890e                 | mov                 ecx, 0x10
            //   5e                   | inc                 ecx

        $sequence_16 = { 8b3d???????? 53 ffd7 8b4d9c 85c9 7403 }
            // n = 6, score = 100
            //   8b3d????????         |                     
            //   53                   | shl                 bl, 4
            //   ffd7                 | movzx               eax, bl
            //   8b4d9c               | mov                 ecx, dword ptr [esi]
            //   85c9                 | mov                 dword ptr [edi], ecx
            //   7403                 | mov                 ecx, dword ptr [esi + 4]

        $sequence_17 = { 8d4da8 e8???????? 837dbc08 8d4da8 8b45b8 }
            // n = 5, score = 100
            //   8d4da8               | mov                 dword ptr [edx], ecx
            //   e8????????           |                     
            //   837dbc08             | cmp                 esi, edx
            //   8d4da8               | jne                 0xfffffff7
            //   8b45b8               | mov                 ecx, dword ptr [esi]

        $sequence_18 = { 50 ff15???????? 8b4b04 85c9 7504 }
            // n = 5, score = 100
            //   50                   | cmp                 dword ptr [esi + 0x64], 0
            //   ff15????????         |                     
            //   8b4b04               | mov                 ecx, dword ptr [esi]
            //   85c9                 | mov                 eax, dword ptr [esi + 8]
            //   7504                 | call                eax

        $sequence_19 = { 0f84d3000000 8b048d8c864000 89859cf8ffff 85c0 0f8498000000 83f801 }
            // n = 6, score = 100
            //   0f84d3000000         | lea                 edx, dword ptr [ecx + 2]
            //   8b048d8c864000       | mov                 ax, word ptr [ecx]
            //   89859cf8ffff         | add                 ecx, 2
            //   85c0                 | test                ax, ax
            //   0f8498000000         | jne                 0
            //   83f801               | sar                 ecx, 6

        $sequence_20 = { 50 7413 68???????? 56 }
            // n = 4, score = 100
            //   50                   | imul                esi, esi, 0x30
            //   7413                 | mov                 ecx, dword ptr [ecx*4 + 0x417430]
            //   68????????           |                     
            //   56                   | and                 byte ptr [ecx + esi + 0x28], 0xfd

        $sequence_21 = { 7218 8b16 50 51 }
            // n = 4, score = 100
            //   7218                 | mov                 ecx, dword ptr [esi]
            //   8b16                 | mov                 eax, dword ptr [edx]
            //   50                   | mov                 dword ptr [esi], eax
            //   51                   | add                 esi, 4

        $sequence_22 = { c1f906 6bf630 8b0c8d30744100 80643128fd 5f 5e 8be5 }
            // n = 7, score = 100
            //   c1f906               | mov                 dword ptr [esi], eax
            //   6bf630               | add                 esi, 4
            //   8b0c8d30744100       | mov                 ecx, dword ptr [esi]
            //   80643128fd           | mov                 eax, dword ptr [edx]
            //   5f                   | mov                 dword ptr [esi], eax
            //   5e                   | add                 esi, 4
            //   8be5                 | mov                 dword ptr [edx], ecx

        $sequence_23 = { 6800010000 57 57 68???????? ff742468 }
            // n = 5, score = 100
            //   6800010000           | mov                 eax, dword ptr [eax*4 + 0x433408]
            //   57                   | mov                 dword ptr [esi + 0x44], eax
            //   57                   | mov                 eax, dword ptr [esi + 0xc]
            //   68????????           |                     
            //   ff742468             | mov                 ecx, dword ptr [esi]

        $sequence_24 = { c645fc01 8d5102 668b01 83c102 6685c0 75f5 }
            // n = 6, score = 100
            //   c645fc01             | mov                 esi, dword ptr [ebp - 8]
            //   8d5102               | pop                 edi
            //   668b01               | mov                 dword ptr [esi], ecx
            //   83c102               | pop                 esi
            //   6685c0               | mov                 ecx, dword ptr [esi]
            //   75f5                 | mov                 eax, dword ptr [edx]

        $sequence_25 = { 8d85ecfbffff c785e4fbffff00000000 8bf1 6a00 50 89b5e8fbffff }
            // n = 6, score = 100
            //   8d85ecfbffff         | mov                 ecx, dword ptr [esi]
            //   c785e4fbffff00000000     | mov    eax, dword ptr [edx]
            //   8bf1                 | mov                 dword ptr [esi], eax
            //   6a00                 | add                 esi, 4
            //   50                   | mov                 dword ptr [edx], ecx
            //   89b5e8fbffff         | cmp                 esi, edx

        $sequence_26 = { 8d842468040000 c744244c00020000 8944243c 8d8424680c0000 89442450 }
            // n = 5, score = 100
            //   8d842468040000       | add                 esp, 0xc
            //   c744244c00020000     | shl                 bl, 4
            //   8944243c             | movzx               eax, bl
            //   8d8424680c0000       | push                eax
            //   89442450             | add                 esp, 0xc

        $sequence_27 = { 83c002 51 50 8b45f8 56 ff7014 ff15???????? }
            // n = 7, score = 100
            //   83c002               | mov                 ecx, dword ptr [ebp - 0x18]
            //   51                   | lea                 eax, dword ptr [esp + 0x468]
            //   50                   | mov                 dword ptr [esp + 0x4c], 0x200
            //   8b45f8               | mov                 dword ptr [esp + 0x3c], eax
            //   56                   | lea                 eax, dword ptr [esp + 0xc68]
            //   ff7014               | mov                 dword ptr [esp + 0x50], eax
            //   ff15????????         |                     

        $sequence_28 = { 0f8e6fffffff 83c8ff eb07 8b04cdfc974000 5f 5e }
            // n = 6, score = 100
            //   0f8e6fffffff         | push                ebx
            //   83c8ff               | call                edi
            //   eb07                 | mov                 ecx, dword ptr [ebp - 0x64]
            //   8b04cdfc974000       | test                ecx, ecx
            //   5f                   | je                  0xa
            //   5e                   | mov                 byte ptr [ebp - 4], 1

    condition:
        7 of them and filesize < 606208
}