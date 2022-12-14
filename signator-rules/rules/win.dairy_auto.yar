rule win_dairy_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.dairy."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.dairy"
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
        $sequence_0 = { 3acb 7213 80f97e 770e 80f925 7409 }
            // n = 6, score = 100
            //   3acb                 | cmp                 cl, bl
            //   7213                 | jb                  0x15
            //   80f97e               | cmp                 cl, 0x7e
            //   770e                 | ja                  0x10
            //   80f925               | cmp                 cl, 0x25
            //   7409                 | je                  0xb

        $sequence_1 = { 8b742448 8b0d???????? 56 ff5110 8b542414 }
            // n = 5, score = 100
            //   8b742448             | mov                 esi, dword ptr [esp + 0x48]
            //   8b0d????????         |                     
            //   56                   | push                esi
            //   ff5110               | call                dword ptr [ecx + 0x10]
            //   8b542414             | mov                 edx, dword ptr [esp + 0x14]

        $sequence_2 = { 57 8b3e ba2037efc6 8b08 8b4004 897c2418 8b7e04 }
            // n = 7, score = 100
            //   57                   | push                edi
            //   8b3e                 | mov                 edi, dword ptr [esi]
            //   ba2037efc6           | mov                 edx, 0xc6ef3720
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   8b4004               | mov                 eax, dword ptr [eax + 4]
            //   897c2418             | mov                 dword ptr [esp + 0x18], edi
            //   8b7e04               | mov                 edi, dword ptr [esi + 4]

        $sequence_3 = { f2ae f7d1 49 88440c0f eb1e 2bc5 }
            // n = 6, score = 100
            //   f2ae                 | repne scasb         al, byte ptr es:[edi]
            //   f7d1                 | not                 ecx
            //   49                   | dec                 ecx
            //   88440c0f             | mov                 byte ptr [esp + ecx + 0xf], al
            //   eb1e                 | jmp                 0x20
            //   2bc5                 | sub                 eax, ebp

        $sequence_4 = { 5e 5d 33c0 5b 83c420 c3 83c9ff }
            // n = 7, score = 100
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp
            //   33c0                 | xor                 eax, eax
            //   5b                   | pop                 ebx
            //   83c420               | add                 esp, 0x20
            //   c3                   | ret                 
            //   83c9ff               | or                  ecx, 0xffffffff

        $sequence_5 = { e8???????? 83c404 85c0 b808000000 89442410 7412 }
            // n = 6, score = 100
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   85c0                 | test                eax, eax
            //   b808000000           | mov                 eax, 8
            //   89442410             | mov                 dword ptr [esp + 0x10], eax
            //   7412                 | je                  0x14

        $sequence_6 = { 5b 81c40c020000 c3 8b442410 8d4c2414 }
            // n = 5, score = 100
            //   5b                   | pop                 ebx
            //   81c40c020000         | add                 esp, 0x20c
            //   c3                   | ret                 
            //   8b442410             | mov                 eax, dword ptr [esp + 0x10]
            //   8d4c2414             | lea                 ecx, dword ptr [esp + 0x14]

        $sequence_7 = { 83ec54 56 8b742460 56 50 }
            // n = 5, score = 100
            //   83ec54               | sub                 esp, 0x54
            //   56                   | push                esi
            //   8b742460             | mov                 esi, dword ptr [esp + 0x60]
            //   56                   | push                esi
            //   50                   | push                eax

        $sequence_8 = { 51 68???????? eb18 8b542420 }
            // n = 4, score = 100
            //   51                   | push                ecx
            //   68????????           |                     
            //   eb18                 | jmp                 0x1a
            //   8b542420             | mov                 edx, dword ptr [esp + 0x20]

        $sequence_9 = { c64401ff00 e8???????? 8b54242c 8b7c2420 83c40c 8902 }
            // n = 6, score = 100
            //   c64401ff00           | mov                 byte ptr [ecx + eax - 1], 0
            //   e8????????           |                     
            //   8b54242c             | mov                 edx, dword ptr [esp + 0x2c]
            //   8b7c2420             | mov                 edi, dword ptr [esp + 0x20]
            //   83c40c               | add                 esp, 0xc
            //   8902                 | mov                 dword ptr [edx], eax

    condition:
        7 of them and filesize < 212992
}