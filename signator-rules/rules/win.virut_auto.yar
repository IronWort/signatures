rule win_virut_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.virut."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.virut"
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
        $sequence_0 = { e8???????? 6894000000 5e 2be6 893424 }
            // n = 5, score = 200
            //   e8????????           |                     
            //   6894000000           | push                0x94
            //   5e                   | pop                 esi
            //   2be6                 | sub                 esp, esi
            //   893424               | mov                 dword ptr [esp], esi

        $sequence_1 = { 59 85c0 7416 e314 50 8bd4 6a00 }
            // n = 7, score = 200
            //   59                   | pop                 ecx
            //   85c0                 | test                eax, eax
            //   7416                 | je                  0x18
            //   e314                 | jecxz               0x16
            //   50                   | push                eax
            //   8bd4                 | mov                 edx, esp
            //   6a00                 | push                0

        $sequence_2 = { 8d442410 50 6800040000 8d842404060000 }
            // n = 4, score = 200
            //   8d442410             | lea                 eax, dword ptr [esp + 0x10]
            //   50                   | push                eax
            //   6800040000           | push                0x400
            //   8d842404060000       | lea                 eax, dword ptr [esp + 0x604]

        $sequence_3 = { 8d9704010000 51 51 6a02 51 6a01 }
            // n = 6, score = 200
            //   8d9704010000         | lea                 edx, dword ptr [edi + 0x104]
            //   51                   | push                ecx
            //   51                   | push                ecx
            //   6a02                 | push                2
            //   51                   | push                ecx
            //   6a01                 | push                1

        $sequence_4 = { 33c0 3bf3 895c240c 7e2f 81bc04f80500000d0a0d0a }
            // n = 5, score = 200
            //   33c0                 | xor                 eax, eax
            //   3bf3                 | cmp                 esi, ebx
            //   895c240c             | mov                 dword ptr [esp + 0xc], ebx
            //   7e2f                 | jle                 0x31
            //   81bc04f80500000d0a0d0a     | cmp    dword ptr [esp + eax + 0x5f8], 0xa0d0a0d

        $sequence_5 = { 83c004 2bf0 56 8d8404fc050000 50 }
            // n = 5, score = 200
            //   83c004               | add                 eax, 4
            //   2bf0                 | sub                 esi, eax
            //   56                   | push                esi
            //   8d8404fc050000       | lea                 eax, dword ptr [esp + eax + 0x5fc]
            //   50                   | push                eax

        $sequence_6 = { 8d5744 52 57 6a44 58 8d9704010000 ab }
            // n = 7, score = 200
            //   8d5744               | lea                 edx, dword ptr [edi + 0x44]
            //   52                   | push                edx
            //   57                   | push                edi
            //   6a44                 | push                0x44
            //   58                   | pop                 eax
            //   8d9704010000         | lea                 edx, dword ptr [edi + 0x104]
            //   ab                   | stosd               dword ptr es:[edi], eax

        $sequence_7 = { 885c2413 ff742418 ff15???????? 385c2413 0f8402010000 }
            // n = 5, score = 200
            //   885c2413             | mov                 byte ptr [esp + 0x13], bl
            //   ff742418             | push                dword ptr [esp + 0x18]
            //   ff15????????         |                     
            //   385c2413             | cmp                 byte ptr [esp + 0x13], bl
            //   0f8402010000         | je                  0x108

        $sequence_8 = { 83c70f 57 8bd4 53 8bcc 50 }
            // n = 6, score = 200
            //   83c70f               | add                 edi, 0xf
            //   57                   | push                edi
            //   8bd4                 | mov                 edx, esp
            //   53                   | push                ebx
            //   8bcc                 | mov                 ecx, esp
            //   50                   | push                eax

        $sequence_9 = { 8bcb f3a6 61 7405 47 }
            // n = 5, score = 200
            //   8bcb                 | mov                 ecx, ebx
            //   f3a6                 | repe cmpsb          byte ptr [esi], byte ptr es:[edi]
            //   61                   | popal               
            //   7405                 | je                  7
            //   47                   | inc                 edi

        $sequence_10 = { eb49 395c240c 7449 33c0 }
            // n = 4, score = 200
            //   eb49                 | jmp                 0x4b
            //   395c240c             | cmp                 dword ptr [esp + 0xc], ebx
            //   7449                 | je                  0x4b
            //   33c0                 | xor                 eax, eax

        $sequence_11 = { 7c19 60 e8???????? 8b542430 5d }
            // n = 5, score = 200
            //   7c19                 | jl                  0x1b
            //   60                   | pushal              
            //   e8????????           |                     
            //   8b542430             | mov                 edx, dword ptr [esp + 0x30]
            //   5d                   | pop                 ebp

        $sequence_12 = { 49 4e 2000 57 }
            // n = 4, score = 200
            //   49                   | dec                 ecx
            //   4e                   | dec                 esi
            //   2000                 | and                 byte ptr [eax], al
            //   57                   | push                edi

        $sequence_13 = { 8d8424e8000000 50 53 89742468 ff15???????? 85c0 7416 }
            // n = 7, score = 200
            //   8d8424e8000000       | lea                 eax, dword ptr [esp + 0xe8]
            //   50                   | push                eax
            //   53                   | push                ebx
            //   89742468             | mov                 dword ptr [esp + 0x68], esi
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7416                 | je                  0x18

        $sequence_14 = { 8d442428 50 8d8424e0020000 50 }
            // n = 4, score = 200
            //   8d442428             | lea                 eax, dword ptr [esp + 0x28]
            //   50                   | push                eax
            //   8d8424e0020000       | lea                 eax, dword ptr [esp + 0x2e0]
            //   50                   | push                eax

        $sequence_15 = { 7cdc 53 8d442410 50 }
            // n = 4, score = 200
            //   7cdc                 | jl                  0xffffffde
            //   53                   | push                ebx
            //   8d442410             | lea                 eax, dword ptr [esp + 0x10]
            //   50                   | push                eax

    condition:
        7 of them and filesize < 98304
}