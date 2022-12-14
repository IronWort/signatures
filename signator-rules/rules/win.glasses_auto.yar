rule win_glasses_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.glasses."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.glasses"
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
        $sequence_0 = { e9???????? 8b45e8 50 e8???????? 59 c3 8d4dac }
            // n = 7, score = 100
            //   e9????????           |                     
            //   8b45e8               | mov                 eax, dword ptr [ebp - 0x18]
            //   50                   | push                eax
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   c3                   | ret                 
            //   8d4dac               | lea                 ecx, dword ptr [ebp - 0x54]

        $sequence_1 = { e8???????? 83c418 83f804 7438 8b16 8b4214 68???????? }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c418               | add                 esp, 0x18
            //   83f804               | cmp                 eax, 4
            //   7438                 | je                  0x3a
            //   8b16                 | mov                 edx, dword ptr [esi]
            //   8b4214               | mov                 eax, dword ptr [edx + 0x14]
            //   68????????           |                     

        $sequence_2 = { e8???????? 83c404 894604 85c0 7413 8d14bd00000000 52 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   894604               | mov                 dword ptr [esi + 4], eax
            //   85c0                 | test                eax, eax
            //   7413                 | je                  0x15
            //   8d14bd00000000       | lea                 edx, dword ptr [edi*4]
            //   52                   | push                edx

        $sequence_3 = { c20c00 83fe15 7518 8b4d10 8b11 8b4508 8b522c }
            // n = 7, score = 100
            //   c20c00               | ret                 0xc
            //   83fe15               | cmp                 esi, 0x15
            //   7518                 | jne                 0x1a
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]
            //   8b11                 | mov                 edx, dword ptr [ecx]
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8b522c               | mov                 edx, dword ptr [edx + 0x2c]

        $sequence_4 = { e8???????? 85c0 7412 8b10 8bc8 8b4224 ffd0 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7412                 | je                  0x14
            //   8b10                 | mov                 edx, dword ptr [eax]
            //   8bc8                 | mov                 ecx, eax
            //   8b4224               | mov                 eax, dword ptr [edx + 0x24]
            //   ffd0                 | call                eax

        $sequence_5 = { e8???????? 8b8d58ffffff 83c108 3bc1 7657 8d8d30ffffff e8???????? }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8b8d58ffffff         | mov                 ecx, dword ptr [ebp - 0xa8]
            //   83c108               | add                 ecx, 8
            //   3bc1                 | cmp                 eax, ecx
            //   7657                 | jbe                 0x59
            //   8d8d30ffffff         | lea                 ecx, dword ptr [ebp - 0xd0]
            //   e8????????           |                     

        $sequence_6 = { e8???????? 85c0 7422 68???????? 8d8d7cffffff e8???????? 8d87a4280000 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7422                 | je                  0x24
            //   68????????           |                     
            //   8d8d7cffffff         | lea                 ecx, dword ptr [ebp - 0x84]
            //   e8????????           |                     
            //   8d87a4280000         | lea                 eax, dword ptr [edi + 0x28a4]

        $sequence_7 = { e8???????? 84c0 7522 68???????? 8b17 8b4214 8bcf }
            // n = 7, score = 100
            //   e8????????           |                     
            //   84c0                 | test                al, al
            //   7522                 | jne                 0x24
            //   68????????           |                     
            //   8b17                 | mov                 edx, dword ptr [edi]
            //   8b4214               | mov                 eax, dword ptr [edx + 0x14]
            //   8bcf                 | mov                 ecx, edi

        $sequence_8 = { e8???????? 83c410 84c0 7497 8d4db0 e8???????? 6a1e }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   84c0                 | test                al, al
            //   7497                 | je                  0xffffff99
            //   8d4db0               | lea                 ecx, dword ptr [ebp - 0x50]
            //   e8????????           |                     
            //   6a1e                 | push                0x1e

        $sequence_9 = { e9???????? 8d8d64faffff e9???????? 8b542408 8d420c 8b8a60faffff 33c8 }
            // n = 7, score = 100
            //   e9????????           |                     
            //   8d8d64faffff         | lea                 ecx, dword ptr [ebp - 0x59c]
            //   e9????????           |                     
            //   8b542408             | mov                 edx, dword ptr [esp + 8]
            //   8d420c               | lea                 eax, dword ptr [edx + 0xc]
            //   8b8a60faffff         | mov                 ecx, dword ptr [edx - 0x5a0]
            //   33c8                 | xor                 ecx, eax

    condition:
        7 of them and filesize < 4177920
}