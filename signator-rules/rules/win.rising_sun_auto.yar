rule win_rising_sun_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.rising_sun."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.rising_sun"
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
        $sequence_0 = { ba01680000 4c895c2420 ff15???????? 488b4c2448 4533c9 4c8d5c2440 488d4594 }
            // n = 7, score = 100
            //   ba01680000           | mov                 dword ptr [edx + eax*8 + 8], ecx
            //   4c895c2420           | inc                 ecx
            //   ff15????????         |                     
            //   488b4c2448           | mov                 eax, ebp
            //   4533c9               | jmp                 0x1d32
            //   4c8d5c2440           | mov                 dword ptr [ebx], 2
            //   488d4594             | or                  eax, 0xffffffff

        $sequence_1 = { 750e 458d442403 488d153edb0100 eb36 4883bdd000000008 480f438db8000000 }
            // n = 6, score = 100
            //   750e                 | dec                 ecx
            //   458d442403           | je                  0x179b
            //   488d153edb0100       | inc                 ebp
            //   eb36                 | test                ecx, ecx
            //   4883bdd000000008     | jne                 0x1785
            //   480f438db8000000     | mov                 al, 0x3d

        $sequence_2 = { 4c89a42498010000 4c8d25fde10100 660f1f840000000000 4863c7 83c704 }
            // n = 5, score = 100
            //   4c89a42498010000     | cmovae              ecx, dword ptr [ebp + 0xb8]
            //   4c8d25fde10100       | mov                 edi, 3
            //   660f1f840000000000     | dec    esp
            //   4863c7               | mov                 eax, dword ptr [ebp + 0xc8]
            //   83c704               | dec                 esp

        $sequence_3 = { ff15???????? 488be8 4c8d4304 33d2 488bc8 e8???????? 4c8bc3 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   488be8               | mov                 eax, 0x24c
            //   4c8d4304             | mov                 dword ptr [ebp + 0x2c0], 0x12867c46
            //   33d2                 | mov                 dword ptr [ebp + 0x2c4], 0x4124bf64
            //   488bc8               | mov                 dword ptr [ebp + 0x2c8], 0x996ce2f7
            //   e8????????           |                     
            //   4c8bc3               | mov                 dword ptr [ebp + 0x2cc], 0x53d004a3

        $sequence_4 = { 448b448500 4183f8ff 0f8488000000 418bc9 4585c9 }
            // n = 5, score = 100
            //   448b448500           | mov                 dword ptr [ebp + 0xa4], 0x8250f0e9
            //   4183f8ff             | mov                 dword ptr [ebp + 0xa8], 0xcb6afae7
            //   0f8488000000         | mov                 dword ptr [ebp + 0x19c], 0x508bb546
            //   418bc9               | mov                 dword ptr [ebp + 0x1a0], 0xbcca02e8
            //   4585c9               | mov                 dword ptr [ebp + 0x1a4], 0x821e14b8

        $sequence_5 = { 4533c9 4533c0 33d2 498bce ff15???????? 85c0 0f84410a0000 }
            // n = 7, score = 100
            //   4533c9               | mov                 esi, edx
            //   4533c0               | dec                 eax
            //   33d2                 | mov                 dword ptr [esp + 0x40], eax
            //   498bce               | push                edi
            //   ff15????????         |                     
            //   85c0                 | dec                 eax
            //   0f84410a0000         | mov                 esi, edx

        $sequence_6 = { 488bcb ff15???????? 488905???????? 4885c0 0f84effeffff 488d55d4 }
            // n = 6, score = 100
            //   488bcb               | lea                 edx, dword ptr [ebp + 0x1390]
            //   ff15????????         |                     
            //   488905????????       |                     
            //   4885c0               | dec                 eax
            //   0f84effeffff         | mov                 ecx, edi
            //   488d55d4             | test                eax, eax

        $sequence_7 = { c744246c1f0b1dd7 c744247088c64d61 c7442474d84c9a1e c7442478f53b3940 c744247cd8fb010d c745803ea1c5e2 c705????????03000000 }
            // n = 7, score = 100
            //   c744246c1f0b1dd7     | jne                 0xe24
            //   c744247088c64d61     | inc                 esp
            //   c7442474d84c9a1e     | lea                 ecx, dword ptr [eax + 1]
            //   c7442478f53b3940     | dec                 eax
            //   c744247cd8fb010d     | add                 ebx, 8
            //   c745803ea1c5e2       | dec                 eax
            //   c705????????03000000     |     

        $sequence_8 = { 41b819000000 488d15d4d20100 488d8d90000000 e8???????? 4c8d442450 488d15d4860200 488d8d90000000 }
            // n = 7, score = 100
            //   41b819000000         | lea                 esp, dword ptr [0x140c7]
            //   488d15d4d20100       | dec                 ecx
            //   488d8d90000000       | cmp                 ebx, esp
            //   e8????????           |                     
            //   4c8d442450           | je                  0x1426
            //   488d15d4860200       | dec                 eax
            //   488d8d90000000       | mov                 ecx, ebx

        $sequence_9 = { 4983c004 c644245800 48ffc6 41ffc2 493bf4 0f862fffffff 4c8b742450 }
            // n = 7, score = 100
            //   4983c004             | inc                 ecx
            //   c644245800           | mov                 eax, 0x400
            //   48ffc6               | cmp                 eax, -0x61
            //   41ffc2               | jne                 0xe31
            //   493bf4               | dec                 eax
            //   0f862fffffff         | lea                 ecx, dword ptr [esp + 0x1020]
            //   4c8b742450           | mov                 edx, 0x55

    condition:
        7 of them and filesize < 409600
}