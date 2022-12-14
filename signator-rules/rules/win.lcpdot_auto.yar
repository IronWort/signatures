rule win_lcpdot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.lcpdot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.lcpdot"
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
        $sequence_0 = { 8bd0 8bf0 41ff5008 85c0 }
            // n = 4, score = 100
            //   8bd0                 | jmp                 0x2cd
            //   8bf0                 | dec                 eax
            //   41ff5008             | mov                 eax, dword ptr [ebx]
            //   85c0                 | dec                 eax

        $sequence_1 = { eb06 660f2f442450 0f87b5000000 ff15???????? 8bf8 b9d0070000 ff15???????? }
            // n = 7, score = 100
            //   eb06                 | mov                 ebx, ebp
            //   660f2f442450         | inc                 ecx
            //   0f87b5000000         | mov                 esi, esi
            //   ff15????????         |                     
            //   8bf8                 | mov                 ecx, eax
            //   b9d0070000           | inc                 esp
            //   ff15????????         |                     

        $sequence_2 = { 89542420 83fa05 7d15 4863ca 0fb7444b10 664189844800b90100 ffc2 }
            // n = 7, score = 100
            //   89542420             | dec                 edx
            //   83fa05               | mov                 ecx, dword ptr [eax]
            //   7d15                 | inc                 ecx
            //   4863ca               | test                byte ptr [edi + ecx + 8], 0x80
            //   0fb7444b10           | cmp                 eax, 1
            //   664189844800b90100     | jne    0x11ce
            //   ffc2                 | jmp                 0x1193

        $sequence_3 = { f2ae 4c8d842440020000 488d542430 48f7d1 89742428 4889742430 }
            // n = 6, score = 100
            //   f2ae                 | inc                 esp
            //   4c8d842440020000     | mov                 dword ptr [esp + 0x40], esp
            //   488d542430           | inc                 esp
            //   48f7d1               | mov                 dword ptr [esp + 0x60], esp
            //   89742428             | dec                 eax
            //   4889742430           | lea                 ecx, dword ptr [ebp + 0x7b2]

        $sequence_4 = { c70016000000 e8???????? eb40 4c8d25c5340100 488b0d???????? e9???????? }
            // n = 6, score = 100
            //   c70016000000         | mov                 eax, 0x16
            //   e8????????           |                     
            //   eb40                 | dec                 eax
            //   4c8d25c5340100       | mov                 ecx, edi
            //   488b0d????????       |                     
            //   e9????????           |                     

        $sequence_5 = { 4533c0 e8???????? 85c0 750e eb37 4c8bc6 e8???????? }
            // n = 7, score = 100
            //   4533c0               | dec                 eax
            //   e8????????           |                     
            //   85c0                 | mov                 ecx, edi
            //   750e                 | call                dword ptr [eax + 0x10]
            //   eb37                 | dec                 eax
            //   4c8bc6               | mov                 eax, dword ptr [edi]
            //   e8????????           |                     

        $sequence_6 = { 490fbec4 420fbe8c0870350100 83e10f eb03 418bca }
            // n = 5, score = 100
            //   490fbec4             | dec                 eax
            //   420fbe8c0870350100     | and    dword ptr [ecx + 8], 0
            //   83e10f               | dec                 eax
            //   eb03                 | lea                 eax, dword ptr [0xe5f2]
            //   418bca               | dec                 eax

        $sequence_7 = { 488d3d57a7ffff 6644391d4fa7ffff 7404 33db eb31 4863057ea7ffff }
            // n = 6, score = 100
            //   488d3d57a7ffff       | mov                 edx, edi
            //   6644391d4fa7ffff     | dec                 esp
            //   7404                 | lea                 eax, dword ptr [0xffff5800]
            //   33db                 | mov                 dword ptr [esp + 0x20], edx
            //   eb31                 | cmp                 edx, 5
            //   4863057ea7ffff       | mov                 dword ptr [edi], eax

        $sequence_8 = { 56 57 4881ec30080000 488b05???????? 4833c4 }
            // n = 5, score = 100
            //   56                   | inc                 ecx
            //   57                   | call                dword ptr [ecx + 0x28]
            //   4881ec30080000       | mov                 ecx, 0x430
            //   488b05????????       |                     
            //   4833c4               | dec                 eax

        $sequence_9 = { 41b8f3010000 c644244000 e8???????? 4883c9ff 33c0 488d7e3c 66f2af }
            // n = 7, score = 100
            //   41b8f3010000         | lea                 ecx, dword ptr [0xf817]
            //   c644244000           | dec                 eax
            //   e8????????           |                     
            //   4883c9ff             | cmp                 eax, ecx
            //   33c0                 | dec                 eax
            //   488d7e3c             | mov                 ecx, dword ptr [eax + 0x128]
            //   66f2af               | dec                 eax

    condition:
        7 of them and filesize < 257024
}