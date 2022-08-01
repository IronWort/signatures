rule win_netsupportmanager_rat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.netsupportmanager_rat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.netsupportmanager_rat"
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
        $sequence_0 = { e8???????? 8b4dec 83c408 8b83a4030000 85c0 0f8494000000 83f932 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8b4dec               | mov                 ecx, dword ptr [ebp - 0x14]
            //   83c408               | add                 esp, 8
            //   8b83a4030000         | mov                 eax, dword ptr [ebx + 0x3a4]
            //   85c0                 | test                eax, eax
            //   0f8494000000         | je                  0x9a
            //   83f932               | cmp                 ecx, 0x32

        $sequence_1 = { e8???????? 8b4f04 8945e8 3bc1 7415 83c00c 8d4db0 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8b4f04               | mov                 ecx, dword ptr [edi + 4]
            //   8945e8               | mov                 dword ptr [ebp - 0x18], eax
            //   3bc1                 | cmp                 eax, ecx
            //   7415                 | je                  0x17
            //   83c00c               | add                 eax, 0xc
            //   8d4db0               | lea                 ecx, dword ptr [ebp - 0x50]

        $sequence_2 = { eb52 8b4508 8d55fc 52 8b550c 8b08 68???????? }
            // n = 7, score = 100
            //   eb52                 | jmp                 0x54
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8d55fc               | lea                 edx, dword ptr [ebp - 4]
            //   52                   | push                edx
            //   8b550c               | mov                 edx, dword ptr [ebp + 0xc]
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   68????????           |                     

        $sequence_3 = { e8???????? 25ffff0000 33c9 668b0e 8bd6 03d0 8b45bc }
            // n = 7, score = 100
            //   e8????????           |                     
            //   25ffff0000           | and                 eax, 0xffff
            //   33c9                 | xor                 ecx, ecx
            //   668b0e               | mov                 cx, word ptr [esi]
            //   8bd6                 | mov                 edx, esi
            //   03d0                 | add                 edx, eax
            //   8b45bc               | mov                 eax, dword ptr [ebp - 0x44]

        $sequence_4 = { e8???????? 8d4324 8b4b24 894dd0 8b5004 8955d4 8b7808 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8d4324               | lea                 eax, dword ptr [ebx + 0x24]
            //   8b4b24               | mov                 ecx, dword ptr [ebx + 0x24]
            //   894dd0               | mov                 dword ptr [ebp - 0x30], ecx
            //   8b5004               | mov                 edx, dword ptr [eax + 4]
            //   8955d4               | mov                 dword ptr [ebp - 0x2c], edx
            //   8b7808               | mov                 edi, dword ptr [eax + 8]

        $sequence_5 = { e8???????? 8bf0 8b45f4 83c40c 85c0 7407 50 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   83c40c               | add                 esp, 0xc
            //   85c0                 | test                eax, eax
            //   7407                 | je                  9
            //   50                   | push                eax

        $sequence_6 = { ff15???????? 8bd8 85db 7525 8b450c 6a30 683b080000 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   8bd8                 | mov                 ebx, eax
            //   85db                 | test                ebx, ebx
            //   7525                 | jne                 0x27
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   6a30                 | push                0x30
            //   683b080000           | push                0x83b

        $sequence_7 = { e8???????? 83c410 85c0 7570 8b45e8 85c0 751c }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   85c0                 | test                eax, eax
            //   7570                 | jne                 0x72
            //   8b45e8               | mov                 eax, dword ptr [ebp - 0x18]
            //   85c0                 | test                eax, eax
            //   751c                 | jne                 0x1e

        $sequence_8 = { 8bb6b4030000 8b8fb4030000 3bce 7e1d 89b7b4030000 5f 5e }
            // n = 7, score = 100
            //   8bb6b4030000         | mov                 esi, dword ptr [esi + 0x3b4]
            //   8b8fb4030000         | mov                 ecx, dword ptr [edi + 0x3b4]
            //   3bce                 | cmp                 ecx, esi
            //   7e1d                 | jle                 0x1f
            //   89b7b4030000         | mov                 dword ptr [edi + 0x3b4], esi
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_9 = { e8???????? 85c0 894510 7550 8b4d1c e8???????? 84c0 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   894510               | mov                 dword ptr [ebp + 0x10], eax
            //   7550                 | jne                 0x52
            //   8b4d1c               | mov                 ecx, dword ptr [ebp + 0x1c]
            //   e8????????           |                     
            //   84c0                 | test                al, al

    condition:
        7 of them and filesize < 4734976
}