rule win_grabbot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.grabbot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.grabbot"
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
        $sequence_0 = { 770b 83f841 7206 83c020 }
            // n = 4, score = 3300
            //   770b                 | ja                  0xd
            //   83f841               | cmp                 eax, 0x41
            //   7206                 | jb                  8
            //   83c020               | add                 eax, 0x20

        $sequence_1 = { 0fb702 83f85a 770b 83f841 }
            // n = 4, score = 3300
            //   0fb702               | movzx               eax, word ptr [edx]
            //   83f85a               | cmp                 eax, 0x5a
            //   770b                 | ja                  0xd
            //   83f841               | cmp                 eax, 0x41

        $sequence_2 = { 7206 83c020 0fb7c0 83c202 }
            // n = 4, score = 3300
            //   7206                 | jb                  8
            //   83c020               | add                 eax, 0x20
            //   0fb7c0               | movzx               eax, ax
            //   83c202               | add                 edx, 2

        $sequence_3 = { 83f85a 770d 83f841 7208 83c020 }
            // n = 5, score = 3300
            //   83f85a               | cmp                 eax, 0x5a
            //   770d                 | ja                  0xf
            //   83f841               | cmp                 eax, 0x41
            //   7208                 | jb                  0xa
            //   83c020               | add                 eax, 0x20

        $sequence_4 = { 59 c9 c20c00 55 8bec 51 53 }
            // n = 7, score = 3200
            //   59                   | pop                 ecx
            //   c9                   | leave               
            //   c20c00               | ret                 0xc
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   51                   | push                ecx
            //   53                   | push                ebx

        $sequence_5 = { 50 e8???????? ffe0 c3 68785c3b55 e8???????? }
            // n = 6, score = 3200
            //   50                   | push                eax
            //   e8????????           |                     
            //   ffe0                 | jmp                 eax
            //   c3                   | ret                 
            //   68785c3b55           | push                0x553b5c78
            //   e8????????           |                     

        $sequence_6 = { 85c0 7404 85ff 75d5 }
            // n = 4, score = 3200
            //   85c0                 | test                eax, eax
            //   7404                 | je                  6
            //   85ff                 | test                edi, edi
            //   75d5                 | jne                 0xffffffd7

        $sequence_7 = { 68f63f4890 e8???????? 50 e8???????? ffd0 c3 50 }
            // n = 7, score = 3200
            //   68f63f4890           | push                0x90483ff6
            //   e8????????           |                     
            //   50                   | push                eax
            //   e8????????           |                     
            //   ffd0                 | call                eax
            //   c3                   | ret                 
            //   50                   | push                eax

        $sequence_8 = { 56 ffd0 33c9 66894c37fe }
            // n = 4, score = 2600
            //   56                   | push                esi
            //   ffd0                 | call                eax
            //   33c9                 | xor                 ecx, ecx
            //   66894c37fe           | mov                 word ptr [edi + esi - 2], cx

        $sequence_9 = { 89480c e9???????? 33c0 e9???????? }
            // n = 4, score = 2300
            //   89480c               | mov                 dword ptr [eax + 0xc], ecx
            //   e9????????           |                     
            //   33c0                 | xor                 eax, eax
            //   e9????????           |                     

        $sequence_10 = { 7428 8b0d???????? 8908 8b0d???????? 894804 8b0d???????? }
            // n = 6, score = 2300
            //   7428                 | je                  0x2a
            //   8b0d????????         |                     
            //   8908                 | mov                 dword ptr [eax], ecx
            //   8b0d????????         |                     
            //   894804               | mov                 dword ptr [eax + 4], ecx
            //   8b0d????????         |                     

        $sequence_11 = { 8b0d???????? 894808 8b0d???????? 89480c e9???????? }
            // n = 5, score = 2300
            //   8b0d????????         |                     
            //   894808               | mov                 dword ptr [eax + 8], ecx
            //   8b0d????????         |                     
            //   89480c               | mov                 dword ptr [eax + 0xc], ecx
            //   e9????????           |                     

        $sequence_12 = { 85c0 741b 8d440002 50 }
            // n = 4, score = 2000
            //   85c0                 | test                eax, eax
            //   741b                 | je                  0x1d
            //   8d440002             | lea                 eax, dword ptr [eax + eax + 2]
            //   50                   | push                eax

        $sequence_13 = { 8bf0 85f6 741d 8d4601 50 e8???????? 8bf8 }
            // n = 7, score = 2000
            //   8bf0                 | mov                 esi, eax
            //   85f6                 | test                esi, esi
            //   741d                 | je                  0x1f
            //   8d4601               | lea                 eax, dword ptr [esi + 1]
            //   50                   | push                eax
            //   e8????????           |                     
            //   8bf8                 | mov                 edi, eax

        $sequence_14 = { 85c0 56 0f9fc3 e8???????? 83c414 }
            // n = 5, score = 2000
            //   85c0                 | test                eax, eax
            //   56                   | push                esi
            //   0f9fc3               | setg                bl
            //   e8????????           |                     
            //   83c414               | add                 esp, 0x14

        $sequence_15 = { 85f6 741e 57 56 6aff }
            // n = 5, score = 2000
            //   85f6                 | test                esi, esi
            //   741e                 | je                  0x20
            //   57                   | push                edi
            //   56                   | push                esi
            //   6aff                 | push                -1

    condition:
        7 of them and filesize < 1335296
}