rule win_hamweq_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.hamweq."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.hamweq"
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
        $sequence_0 = { 1bc9 f7d1 23c1 85c0 7501 c3 }
            // n = 6, score = 200
            //   1bc9                 | sbb                 ecx, ecx
            //   f7d1                 | not                 ecx
            //   23c1                 | and                 eax, ecx
            //   85c0                 | test                eax, eax
            //   7501                 | jne                 3
            //   c3                   | ret                 

        $sequence_1 = { ff75e8 ff55ec 8bd8 85db 744c }
            // n = 5, score = 200
            //   ff75e8               | push                dword ptr [ebp - 0x18]
            //   ff55ec               | call                dword ptr [ebp - 0x14]
            //   8bd8                 | mov                 ebx, eax
            //   85db                 | test                ebx, ebx
            //   744c                 | je                  0x4e

        $sequence_2 = { ff55e0 85c0 7447 8d85d8fdffff 50 ff75f4 ff55ec }
            // n = 7, score = 200
            //   ff55e0               | call                dword ptr [ebp - 0x20]
            //   85c0                 | test                eax, eax
            //   7447                 | je                  0x49
            //   8d85d8fdffff         | lea                 eax, dword ptr [ebp - 0x228]
            //   50                   | push                eax
            //   ff75f4               | push                dword ptr [ebp - 0xc]
            //   ff55ec               | call                dword ptr [ebp - 0x14]

        $sequence_3 = { 66c745f00200 ff5068 668945f2 8b06 }
            // n = 4, score = 200
            //   66c745f00200         | mov                 word ptr [ebp - 0x10], 2
            //   ff5068               | call                dword ptr [eax + 0x68]
            //   668945f2             | mov                 word ptr [ebp - 0xe], ax
            //   8b06                 | mov                 eax, dword ptr [esi]

        $sequence_4 = { ff5048 8b06 8d8decfeffff 53 51 }
            // n = 5, score = 200
            //   ff5048               | call                dword ptr [eax + 0x48]
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   8d8decfeffff         | lea                 ecx, dword ptr [ebp - 0x114]
            //   53                   | push                ebx
            //   51                   | push                ecx

        $sequence_5 = { 0f844e040000 8d4de4 51 ff75fc 6800104000 50 53 }
            // n = 7, score = 200
            //   0f844e040000         | je                  0x454
            //   8d4de4               | lea                 ecx, dword ptr [ebp - 0x1c]
            //   51                   | push                ecx
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   6800104000           | push                0x401000
            //   50                   | push                eax
            //   53                   | push                ebx

        $sequence_6 = { ebef ffb1f8000000 ff75e4 ff504c 85c0 }
            // n = 5, score = 200
            //   ebef                 | jmp                 0xfffffff1
            //   ffb1f8000000         | push                dword ptr [ecx + 0xf8]
            //   ff75e4               | push                dword ptr [ebp - 0x1c]
            //   ff504c               | call                dword ptr [eax + 0x4c]
            //   85c0                 | test                eax, eax

        $sequence_7 = { ff571c 85c0 8b06 7508 53 ff5020 }
            // n = 6, score = 200
            //   ff571c               | call                dword ptr [edi + 0x1c]
            //   85c0                 | test                eax, eax
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   7508                 | jne                 0xa
            //   53                   | push                ebx
            //   ff5020               | call                dword ptr [eax + 0x20]

        $sequence_8 = { ff5048 8b4e08 8b06 ffb110010000 8d8d00feffff 51 ff5048 }
            // n = 7, score = 200
            //   ff5048               | call                dword ptr [eax + 0x48]
            //   8b4e08               | mov                 ecx, dword ptr [esi + 8]
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   ffb110010000         | push                dword ptr [ecx + 0x110]
            //   8d8d00feffff         | lea                 ecx, dword ptr [ebp - 0x200]
            //   51                   | push                ecx
            //   ff5048               | call                dword ptr [eax + 0x48]

        $sequence_9 = { 57 51 ff5048 8b06 }
            // n = 4, score = 200
            //   57                   | push                edi
            //   51                   | push                ecx
            //   ff5048               | call                dword ptr [eax + 0x48]
            //   8b06                 | mov                 eax, dword ptr [esi]

    condition:
        7 of them and filesize < 24576
}