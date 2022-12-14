rule win_darkrat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.darkrat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.darkrat"
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
        $sequence_0 = { 8b7d14 8a4518 8b5d08 895dc4 f7471400400000 8845d4 751c }
            // n = 7, score = 200
            //   8b7d14               | mov                 edi, dword ptr [ebp + 0x14]
            //   8a4518               | mov                 al, byte ptr [ebp + 0x18]
            //   8b5d08               | mov                 ebx, dword ptr [ebp + 8]
            //   895dc4               | mov                 dword ptr [ebp - 0x3c], ebx
            //   f7471400400000       | test                dword ptr [edi + 0x14], 0x4000
            //   8845d4               | mov                 byte ptr [ebp - 0x2c], al
            //   751c                 | jne                 0x1e

        $sequence_1 = { be???????? 6a06 894708 e8???????? 83c408 8945f0 85c0 }
            // n = 7, score = 200
            //   be????????           |                     
            //   6a06                 | push                6
            //   894708               | mov                 dword ptr [edi + 8], eax
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   85c0                 | test                eax, eax

        $sequence_2 = { 52 57 e8???????? 8b45c8 83c40c c6040700 }
            // n = 6, score = 200
            //   52                   | push                edx
            //   57                   | push                edi
            //   e8????????           |                     
            //   8b45c8               | mov                 eax, dword ptr [ebp - 0x38]
            //   83c40c               | add                 esp, 0xc
            //   c6040700             | mov                 byte ptr [edi + eax], 0

        $sequence_3 = { 8bce c746140f000000 68???????? c60600 e8???????? 8b551c }
            // n = 6, score = 200
            //   8bce                 | mov                 ecx, esi
            //   c746140f000000       | mov                 dword ptr [esi + 0x14], 0xf
            //   68????????           |                     
            //   c60600               | mov                 byte ptr [esi], 0
            //   e8????????           |                     
            //   8b551c               | mov                 edx, dword ptr [ebp + 0x1c]

        $sequence_4 = { 751f 6a13 68???????? 8bcb }
            // n = 4, score = 200
            //   751f                 | jne                 0x21
            //   6a13                 | push                0x13
            //   68????????           |                     
            //   8bcb                 | mov                 ecx, ebx

        $sequence_5 = { 8b8d68ffffff 8bc2 2bc1 57 3bf8 7731 }
            // n = 6, score = 200
            //   8b8d68ffffff         | mov                 ecx, dword ptr [ebp - 0x98]
            //   8bc2                 | mov                 eax, edx
            //   2bc1                 | sub                 eax, ecx
            //   57                   | push                edi
            //   3bf8                 | cmp                 edi, eax
            //   7731                 | ja                  0x33

        $sequence_6 = { 64a300000000 8bd9 895dd0 c745fc00000000 }
            // n = 4, score = 200
            //   64a300000000         | mov                 dword ptr fs:[0], eax
            //   8bd9                 | mov                 ebx, ecx
            //   895dd0               | mov                 dword ptr [ebp - 0x30], ebx
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0

        $sequence_7 = { 75f2 8b45f0 894714 66c7470c2e2c }
            // n = 4, score = 200
            //   75f2                 | jne                 0xfffffff4
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   894714               | mov                 dword ptr [edi + 0x14], eax
            //   66c7470c2e2c         | mov                 word ptr [edi + 0xc], 0x2c2e

        $sequence_8 = { eb18 6a02 68???????? c645e800 8d4dc8 }
            // n = 5, score = 200
            //   eb18                 | jmp                 0x1a
            //   6a02                 | push                2
            //   68????????           |                     
            //   c645e800             | mov                 byte ptr [ebp - 0x18], 0
            //   8d4dc8               | lea                 ecx, dword ptr [ebp - 0x38]

        $sequence_9 = { 0f438d58ffffff 8b5310 2bc2 8bbd68ffffff 3bf8 7723 }
            // n = 6, score = 200
            //   0f438d58ffffff       | cmovae              ecx, dword ptr [ebp - 0xa8]
            //   8b5310               | mov                 edx, dword ptr [ebx + 0x10]
            //   2bc2                 | sub                 eax, edx
            //   8bbd68ffffff         | mov                 edi, dword ptr [ebp - 0x98]
            //   3bf8                 | cmp                 edi, eax
            //   7723                 | ja                  0x25

    condition:
        7 of them and filesize < 884736
}