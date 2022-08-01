rule win_eternal_petya_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.eternal_petya."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.eternal_petya"
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
        $sequence_0 = { 49 75f9 56 ff15???????? }
            // n = 4, score = 400
            //   49                   | dec                 ecx
            //   75f9                 | jne                 0xfffffffb
            //   56                   | push                esi
            //   ff15????????         |                     

        $sequence_1 = { 51 57 68000000f0 6a18 33ff }
            // n = 5, score = 400
            //   51                   | push                ecx
            //   57                   | push                edi
            //   68000000f0           | push                0xf0000000
            //   6a18                 | push                0x18
            //   33ff                 | xor                 edi, edi

        $sequence_2 = { 53 68f0000000 6a40 ff15???????? }
            // n = 4, score = 400
            //   53                   | push                ebx
            //   68f0000000           | push                0xf0
            //   6a40                 | push                0x40
            //   ff15????????         |                     

        $sequence_3 = { 53 6a21 8d460c 50 }
            // n = 4, score = 400
            //   53                   | push                ebx
            //   6a21                 | push                0x21
            //   8d460c               | lea                 eax, dword ptr [esi + 0xc]
            //   50                   | push                eax

        $sequence_4 = { 53 8d4644 50 53 }
            // n = 4, score = 400
            //   53                   | push                ebx
            //   8d4644               | lea                 eax, dword ptr [esi + 0x44]
            //   50                   | push                eax
            //   53                   | push                ebx

        $sequence_5 = { 68???????? 6a24 e8???????? 68ff000000 }
            // n = 4, score = 300
            //   68????????           |                     
            //   6a24                 | push                0x24
            //   e8????????           |                     
            //   68ff000000           | push                0xff

        $sequence_6 = { 55 8bec 83ec0c 56 8d45f8 50 6a01 }
            // n = 7, score = 300
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83ec0c               | sub                 esp, 0xc
            //   56                   | push                esi
            //   8d45f8               | lea                 eax, dword ptr [ebp - 8]
            //   50                   | push                eax
            //   6a01                 | push                1

        $sequence_7 = { 03c8 33c0 394310 0f45ca 3b4b18 }
            // n = 5, score = 300
            //   03c8                 | add                 ecx, eax
            //   33c0                 | xor                 eax, eax
            //   394310               | cmp                 dword ptr [ebx + 0x10], eax
            //   0f45ca               | cmovne              ecx, edx
            //   3b4b18               | cmp                 ecx, dword ptr [ebx + 0x18]

        $sequence_8 = { 83e60f 85f6 740a 83fe08 7c30 }
            // n = 5, score = 300
            //   83e60f               | and                 esi, 0xf
            //   85f6                 | test                esi, esi
            //   740a                 | je                  0xc
            //   83fe08               | cmp                 esi, 8
            //   7c30                 | jl                  0x32

        $sequence_9 = { 33db 3975f8 7648 83c704 }
            // n = 4, score = 300
            //   33db                 | xor                 ebx, ebx
            //   3975f8               | cmp                 dword ptr [ebp - 8], esi
            //   7648                 | jbe                 0x4a
            //   83c704               | add                 edi, 4

        $sequence_10 = { 0f8499050000 8b45f8 49 894dfc }
            // n = 4, score = 300
            //   0f8499050000         | je                  0x59f
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   49                   | dec                 ecx
            //   894dfc               | mov                 dword ptr [ebp - 4], ecx

        $sequence_11 = { 85c0 744f 33db 391f 764b 8d7704 837df400 }
            // n = 7, score = 300
            //   85c0                 | test                eax, eax
            //   744f                 | je                  0x51
            //   33db                 | xor                 ebx, ebx
            //   391f                 | cmp                 dword ptr [edi], ebx
            //   764b                 | jbe                 0x4d
            //   8d7704               | lea                 esi, dword ptr [edi + 4]
            //   837df400             | cmp                 dword ptr [ebp - 0xc], 0

        $sequence_12 = { 8d0443 50 6a02 e8???????? }
            // n = 4, score = 300
            //   8d0443               | lea                 eax, dword ptr [ebx + eax*2]
            //   50                   | push                eax
            //   6a02                 | push                2
            //   e8????????           |                     

        $sequence_13 = { 8b5250 8d8df4fdffff 51 50 }
            // n = 4, score = 200
            //   8b5250               | mov                 edx, dword ptr [edx + 0x50]
            //   8d8df4fdffff         | lea                 ecx, dword ptr [ebp - 0x20c]
            //   51                   | push                ecx
            //   50                   | push                eax

        $sequence_14 = { 8b95f4fdffff 8d8df8fdffff 51 6800020000 52 ff15???????? }
            // n = 6, score = 200
            //   8b95f4fdffff         | mov                 edx, dword ptr [ebp - 0x20c]
            //   8d8df8fdffff         | lea                 ecx, dword ptr [ebp - 0x208]
            //   51                   | push                ecx
            //   6800020000           | push                0x200
            //   52                   | push                edx
            //   ff15????????         |                     

        $sequence_15 = { ffd7 a3???????? ffd6 50 6a00 68???????? 6a02 }
            // n = 7, score = 200
            //   ffd7                 | call                edi
            //   a3????????           |                     
            //   ffd6                 | call                esi
            //   50                   | push                eax
            //   6a00                 | push                0
            //   68????????           |                     
            //   6a02                 | push                2

    condition:
        7 of them and filesize < 851968
}