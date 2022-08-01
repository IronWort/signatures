rule win_webc2_qbp_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.webc2_qbp."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.webc2_qbp"
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
        $sequence_0 = { 83bdf4feffff00 7507 33c0 e9???????? 68???????? }
            // n = 5, score = 100
            //   83bdf4feffff00       | cmp                 dword ptr [ebp - 0x10c], 0
            //   7507                 | jne                 9
            //   33c0                 | xor                 eax, eax
            //   e9????????           |                     
            //   68????????           |                     

        $sequence_1 = { 8b4df0 8b11 52 8b45f0 8b4808 }
            // n = 5, score = 100
            //   8b4df0               | mov                 ecx, dword ptr [ebp - 0x10]
            //   8b11                 | mov                 edx, dword ptr [ecx]
            //   52                   | push                edx
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   8b4808               | mov                 ecx, dword ptr [eax + 8]

        $sequence_2 = { 7502 eb0f 8b4dfc 8b5104 }
            // n = 4, score = 100
            //   7502                 | jne                 4
            //   eb0f                 | jmp                 0x11
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   8b5104               | mov                 edx, dword ptr [ecx + 4]

        $sequence_3 = { 85c0 7440 8b45fc 50 }
            // n = 4, score = 100
            //   85c0                 | test                eax, eax
            //   7440                 | je                  0x42
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   50                   | push                eax

        $sequence_4 = { eb2b 0fbf55fc 8b45e8 668b4d08 66898c504a300000 0fbf5508 8b45e8 }
            // n = 7, score = 100
            //   eb2b                 | jmp                 0x2d
            //   0fbf55fc             | movsx               edx, word ptr [ebp - 4]
            //   8b45e8               | mov                 eax, dword ptr [ebp - 0x18]
            //   668b4d08             | mov                 cx, word ptr [ebp + 8]
            //   66898c504a300000     | mov                 word ptr [eax + edx*2 + 0x304a], cx
            //   0fbf5508             | movsx               edx, word ptr [ebp + 8]
            //   8b45e8               | mov                 eax, dword ptr [ebp - 0x18]

        $sequence_5 = { 8a4df4 884c1008 ebc2 0fbf55e8 8b45e4 }
            // n = 5, score = 100
            //   8a4df4               | mov                 cl, byte ptr [ebp - 0xc]
            //   884c1008             | mov                 byte ptr [eax + edx + 8], cl
            //   ebc2                 | jmp                 0xffffffc4
            //   0fbf55e8             | movsx               edx, word ptr [ebp - 0x18]
            //   8b45e4               | mov                 eax, dword ptr [ebp - 0x1c]

        $sequence_6 = { eb52 8b4d0c 51 8b5508 52 8b45f8 50 }
            // n = 7, score = 100
            //   eb52                 | jmp                 0x54
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   51                   | push                ecx
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   52                   | push                edx
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   50                   | push                eax

        $sequence_7 = { 668b4df8 66898880830000 668b5508 52 8b4df0 e8???????? 8be5 }
            // n = 7, score = 100
            //   668b4df8             | mov                 cx, word ptr [ebp - 8]
            //   66898880830000       | mov                 word ptr [eax + 0x8380], cx
            //   668b5508             | mov                 dx, word ptr [ebp + 8]
            //   52                   | push                edx
            //   8b4df0               | mov                 ecx, dword ptr [ebp - 0x10]
            //   e8????????           |                     
            //   8be5                 | mov                 esp, ebp

        $sequence_8 = { 8b4d14 898894830000 8b55fc c7829883000000000000 8b45fc c7809c83000000000000 }
            // n = 6, score = 100
            //   8b4d14               | mov                 ecx, dword ptr [ebp + 0x14]
            //   898894830000         | mov                 dword ptr [eax + 0x8394], ecx
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   c7829883000000000000     | mov    dword ptr [edx + 0x8398], 0
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   c7809c83000000000000     | mov    dword ptr [eax + 0x839c], 0

        $sequence_9 = { 55 8bec 83ec10 894df0 66c745fc0000 66c745f80000 8b4508 }
            // n = 7, score = 100
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83ec10               | sub                 esp, 0x10
            //   894df0               | mov                 dword ptr [ebp - 0x10], ecx
            //   66c745fc0000         | mov                 word ptr [ebp - 4], 0
            //   66c745f80000         | mov                 word ptr [ebp - 8], 0
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]

    condition:
        7 of them and filesize < 630784
}