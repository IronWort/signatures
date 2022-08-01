rule win_stinger_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.stinger."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.stinger"
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
        $sequence_0 = { 83c208 8b75f8 83c608 b900010000 }
            // n = 4, score = 200
            //   83c208               | add                 edx, 8
            //   8b75f8               | mov                 esi, dword ptr [ebp - 8]
            //   83c608               | add                 esi, 8
            //   b900010000           | mov                 ecx, 0x100

        $sequence_1 = { 50 e8???????? 68???????? 8d45ec 50 8d45f4 50 }
            // n = 7, score = 200
            //   50                   | push                eax
            //   e8????????           |                     
            //   68????????           |                     
            //   8d45ec               | lea                 eax, dword ptr [ebp - 0x14]
            //   50                   | push                eax
            //   8d45f4               | lea                 eax, dword ptr [ebp - 0xc]
            //   50                   | push                eax

        $sequence_2 = { e2e7 8b7508 8b36 8b4e04 894df4 83c608 }
            // n = 6, score = 200
            //   e2e7                 | loop                0xffffffe9
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   8b36                 | mov                 esi, dword ptr [esi]
            //   8b4e04               | mov                 ecx, dword ptr [esi + 4]
            //   894df4               | mov                 dword ptr [ebp - 0xc], ecx
            //   83c608               | add                 esi, 8

        $sequence_3 = { 8b5df8 8903 8b5dfc 83c318 895df8 }
            // n = 5, score = 200
            //   8b5df8               | mov                 ebx, dword ptr [ebp - 8]
            //   8903                 | mov                 dword ptr [ebx], eax
            //   8b5dfc               | mov                 ebx, dword ptr [ebp - 4]
            //   83c318               | add                 ebx, 0x18
            //   895df8               | mov                 dword ptr [ebp - 8], ebx

        $sequence_4 = { 8965f8 6800000000 6800000000 6800000000 6800000000 6800000000 6800000000 }
            // n = 7, score = 200
            //   8965f8               | mov                 dword ptr [ebp - 8], esp
            //   6800000000           | push                0
            //   6800000000           | push                0
            //   6800000000           | push                0
            //   6800000000           | push                0
            //   6800000000           | push                0
            //   6800000000           | push                0

        $sequence_5 = { 6806000000 e8???????? 83c404 a3???????? 8965f8 6800000000 6800000000 }
            // n = 7, score = 200
            //   6806000000           | push                6
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   a3????????           |                     
            //   8965f8               | mov                 dword ptr [ebp - 8], esp
            //   6800000000           | push                0
            //   6800000000           | push                0

        $sequence_6 = { ff75e8 8b5d08 ff33 b902000000 }
            // n = 4, score = 200
            //   ff75e8               | push                dword ptr [ebp - 0x18]
            //   8b5d08               | mov                 ebx, dword ptr [ebp + 8]
            //   ff33                 | push                dword ptr [ebx]
            //   b902000000           | mov                 ecx, 2

        $sequence_7 = { 8d45f0 50 8d45f8 50 e8???????? 68???????? 8d45ec }
            // n = 7, score = 200
            //   8d45f0               | lea                 eax, dword ptr [ebp - 0x10]
            //   50                   | push                eax
            //   8d45f8               | lea                 eax, dword ptr [ebp - 8]
            //   50                   | push                eax
            //   e8????????           |                     
            //   68????????           |                     
            //   8d45ec               | lea                 eax, dword ptr [ebp - 0x14]

        $sequence_8 = { dc05???????? dd5dc0 dd45c0 e8???????? 6801030080 }
            // n = 5, score = 200
            //   dc05????????         |                     
            //   dd5dc0               | fstp                qword ptr [ebp - 0x40]
            //   dd45c0               | fld                 qword ptr [ebp - 0x40]
            //   e8????????           |                     
            //   6801030080           | push                0x80000301

        $sequence_9 = { ff33 b902000000 e8???????? 83c408 8945e4 6802000080 6a00 }
            // n = 7, score = 200
            //   ff33                 | push                dword ptr [ebx]
            //   b902000000           | mov                 ecx, 2
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   8945e4               | mov                 dword ptr [ebp - 0x1c], eax
            //   6802000080           | push                0x80000002
            //   6a00                 | push                0

    condition:
        7 of them and filesize < 197096
}