rule win_wonknu_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.wonknu."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.wonknu"
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
        $sequence_0 = { a5 a5 ff90d8000000 8d4d0b 8bf0 }
            // n = 5, score = 100
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]
            //   ff90d8000000         | call                dword ptr [eax + 0xd8]
            //   8d4d0b               | lea                 ecx, dword ptr [ebp + 0xb]
            //   8bf0                 | mov                 esi, eax

        $sequence_1 = { 8945f4 8b4514 40 c745ecf6333100 894df8 8945fc 64a100000000 }
            // n = 7, score = 100
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   8b4514               | mov                 eax, dword ptr [ebp + 0x14]
            //   40                   | inc                 eax
            //   c745ecf6333100       | mov                 dword ptr [ebp - 0x14], 0x3133f6
            //   894df8               | mov                 dword ptr [ebp - 8], ecx
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   64a100000000         | mov                 eax, dword ptr fs:[0]

        $sequence_2 = { 0f887bffffff 8d4db8 8b75ec 8b55d4 53 83ec10 8bfc }
            // n = 7, score = 100
            //   0f887bffffff         | js                  0xffffff81
            //   8d4db8               | lea                 ecx, dword ptr [ebp - 0x48]
            //   8b75ec               | mov                 esi, dword ptr [ebp - 0x14]
            //   8b55d4               | mov                 edx, dword ptr [ebp - 0x2c]
            //   53                   | push                ebx
            //   83ec10               | sub                 esp, 0x10
            //   8bfc                 | mov                 edi, esp

        $sequence_3 = { 5d c20800 b8???????? e8???????? b850160000 }
            // n = 5, score = 100
            //   5d                   | pop                 ebp
            //   c20800               | ret                 8
            //   b8????????           |                     
            //   e8????????           |                     
            //   b850160000           | mov                 eax, 0x1650

        $sequence_4 = { 33c0 85db 0f95c0 85c0 74f0 8d8598fdffff 50 }
            // n = 7, score = 100
            //   33c0                 | xor                 eax, eax
            //   85db                 | test                ebx, ebx
            //   0f95c0               | setne               al
            //   85c0                 | test                eax, eax
            //   74f0                 | je                  0xfffffff2
            //   8d8598fdffff         | lea                 eax, dword ptr [ebp - 0x268]
            //   50                   | push                eax

        $sequence_5 = { 53 56 57 68c8130000 }
            // n = 4, score = 100
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   68c8130000           | push                0x13c8

        $sequence_6 = { 837f0801 0f851cfdffff 8b75e8 8d4308 8b55d4 50 83ec10 }
            // n = 7, score = 100
            //   837f0801             | cmp                 dword ptr [edi + 8], 1
            //   0f851cfdffff         | jne                 0xfffffd22
            //   8b75e8               | mov                 esi, dword ptr [ebp - 0x18]
            //   8d4308               | lea                 eax, dword ptr [ebx + 8]
            //   8b55d4               | mov                 edx, dword ptr [ebp - 0x2c]
            //   50                   | push                eax
            //   83ec10               | sub                 esp, 0x10

        $sequence_7 = { a1???????? 8b1d???????? 3b8704000000 7e31 68???????? e8???????? 833d????????ff }
            // n = 7, score = 100
            //   a1????????           |                     
            //   8b1d????????         |                     
            //   3b8704000000         | cmp                 eax, dword ptr [edi + 4]
            //   7e31                 | jle                 0x33
            //   68????????           |                     
            //   e8????????           |                     
            //   833d????????ff       |                     

        $sequence_8 = { 51 50 ff15???????? 8bf0 85f6 0f88a6feffff }
            // n = 6, score = 100
            //   51                   | push                ecx
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   85f6                 | test                esi, esi
            //   0f88a6feffff         | js                  0xfffffeac

        $sequence_9 = { 8bc6 e8???????? c21000 6844020000 b8???????? e8???????? }
            // n = 6, score = 100
            //   8bc6                 | mov                 eax, esi
            //   e8????????           |                     
            //   c21000               | ret                 0x10
            //   6844020000           | push                0x244
            //   b8????????           |                     
            //   e8????????           |                     

    condition:
        7 of them and filesize < 540672
}