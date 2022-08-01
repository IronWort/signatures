rule win_vermilion_strike_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.vermilion_strike."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.vermilion_strike"
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
        $sequence_0 = { eb06 53 68???????? 8d8424e4000000 e8???????? 6a01 68???????? }
            // n = 7, score = 200
            //   eb06                 | jmp                 8
            //   53                   | push                ebx
            //   68????????           |                     
            //   8d8424e4000000       | lea                 eax, dword ptr [esp + 0xe4]
            //   e8????????           |                     
            //   6a01                 | push                1
            //   68????????           |                     

        $sequence_1 = { 8bc3 e8???????? 8b74240c 8d4c242c 51 56 ff15???????? }
            // n = 7, score = 200
            //   8bc3                 | mov                 eax, ebx
            //   e8????????           |                     
            //   8b74240c             | mov                 esi, dword ptr [esp + 0xc]
            //   8d4c242c             | lea                 ecx, dword ptr [esp + 0x2c]
            //   51                   | push                ecx
            //   56                   | push                esi
            //   ff15????????         |                     

        $sequence_2 = { 56 e8???????? 83c414 85ff 7420 0fb74c2414 0fb7542412 }
            // n = 7, score = 200
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c414               | add                 esp, 0x14
            //   85ff                 | test                edi, edi
            //   7420                 | je                  0x22
            //   0fb74c2414           | movzx               ecx, word ptr [esp + 0x14]
            //   0fb7542412           | movzx               edx, word ptr [esp + 0x12]

        $sequence_3 = { 8d742418 e8???????? 83c408 33ff 57 50 83c8ff }
            // n = 7, score = 200
            //   8d742418             | lea                 esi, dword ptr [esp + 0x18]
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   33ff                 | xor                 edi, edi
            //   57                   | push                edi
            //   50                   | push                eax
            //   83c8ff               | or                  eax, 0xffffffff

        $sequence_4 = { 8bf7 c744244803000000 e8???????? 885c2440 396c2428 720d 8b4c2414 }
            // n = 7, score = 200
            //   8bf7                 | mov                 esi, edi
            //   c744244803000000     | mov                 dword ptr [esp + 0x48], 3
            //   e8????????           |                     
            //   885c2440             | mov                 byte ptr [esp + 0x40], bl
            //   396c2428             | cmp                 dword ptr [esp + 0x28], ebp
            //   720d                 | jb                  0xf
            //   8b4c2414             | mov                 ecx, dword ptr [esp + 0x14]

        $sequence_5 = { 8bfb 89442420 897c2424 eb92 }
            // n = 4, score = 200
            //   8bfb                 | mov                 edi, ebx
            //   89442420             | mov                 dword ptr [esp + 0x20], eax
            //   897c2424             | mov                 dword ptr [esp + 0x24], edi
            //   eb92                 | jmp                 0xffffff94

        $sequence_6 = { 397c242c 720d 8b542418 52 e8???????? 83c404 68???????? }
            // n = 7, score = 200
            //   397c242c             | cmp                 dword ptr [esp + 0x2c], edi
            //   720d                 | jb                  0xf
            //   8b542418             | mov                 edx, dword ptr [esp + 0x18]
            //   52                   | push                edx
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   68????????           |                     

        $sequence_7 = { 7208 8b13 89542410 eb04 895c2410 8b54240c }
            // n = 6, score = 200
            //   7208                 | jb                  0xa
            //   8b13                 | mov                 edx, dword ptr [ebx]
            //   89542410             | mov                 dword ptr [esp + 0x10], edx
            //   eb04                 | jmp                 6
            //   895c2410             | mov                 dword ptr [esp + 0x10], ebx
            //   8b54240c             | mov                 edx, dword ptr [esp + 0xc]

        $sequence_8 = { 50 51 e8???????? 83c41c 8d742e10 eb03 83c60c }
            // n = 7, score = 200
            //   50                   | push                eax
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c41c               | add                 esp, 0x1c
            //   8d742e10             | lea                 esi, dword ptr [esi + ebp + 0x10]
            //   eb03                 | jmp                 5
            //   83c60c               | add                 esi, 0xc

        $sequence_9 = { b88c100000 e8???????? a1???????? 33c4 89842488100000 53 55 }
            // n = 7, score = 200
            //   b88c100000           | mov                 eax, 0x108c
            //   e8????????           |                     
            //   a1????????           |                     
            //   33c4                 | xor                 eax, esp
            //   89842488100000       | mov                 dword ptr [esp + 0x1088], eax
            //   53                   | push                ebx
            //   55                   | push                ebp

    condition:
        7 of them and filesize < 540672
}