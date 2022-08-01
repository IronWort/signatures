rule win_unidentified_070_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.unidentified_070."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.unidentified_070"
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
        $sequence_0 = { 8945fc 53 ff15???????? ff75f8 8b1d???????? }
            // n = 5, score = 200
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   53                   | push                ebx
            //   ff15????????         |                     
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   8b1d????????         |                     

        $sequence_1 = { 6a00 56 ff15???????? 33c0 5f 5e 8b8c24d4040000 }
            // n = 7, score = 200
            //   6a00                 | push                0
            //   56                   | push                esi
            //   ff15????????         |                     
            //   33c0                 | xor                 eax, eax
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   8b8c24d4040000       | mov                 ecx, dword ptr [esp + 0x4d4]

        $sequence_2 = { 56 ff15???????? 8945f8 85c0 0f8493000000 }
            // n = 5, score = 200
            //   56                   | push                esi
            //   ff15????????         |                     
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   85c0                 | test                eax, eax
            //   0f8493000000         | je                  0x99

        $sequence_3 = { e8???????? 8bd8 b8???????? 2ad8 8b45fc }
            // n = 5, score = 200
            //   e8????????           |                     
            //   8bd8                 | mov                 ebx, eax
            //   b8????????           |                     
            //   2ad8                 | sub                 bl, al
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]

        $sequence_4 = { 51 e8???????? b9???????? 2ac1 8945f8 8b45fc 0fb6440703 }
            // n = 7, score = 200
            //   51                   | push                ecx
            //   e8????????           |                     
            //   b9????????           |                     
            //   2ac1                 | sub                 al, cl
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   0fb6440703           | movzx               eax, byte ptr [edi + eax + 3]

        $sequence_5 = { b8???????? 2ad8 8b45fc 0fb6440701 50 68???????? e8???????? }
            // n = 7, score = 200
            //   b8????????           |                     
            //   2ad8                 | sub                 bl, al
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   0fb6440701           | movzx               eax, byte ptr [edi + eax + 1]
            //   50                   | push                eax
            //   68????????           |                     
            //   e8????????           |                     

        $sequence_6 = { 50 ff15???????? 83c418 8d442460 50 }
            // n = 5, score = 200
            //   50                   | push                eax
            //   ff15????????         |                     
            //   83c418               | add                 esp, 0x18
            //   8d442460             | lea                 eax, dword ptr [esp + 0x60]
            //   50                   | push                eax

        $sequence_7 = { a3???????? 85c0 746d 68???????? ffd3 8bf8 }
            // n = 6, score = 200
            //   a3????????           |                     
            //   85c0                 | test                eax, eax
            //   746d                 | je                  0x6f
            //   68????????           |                     
            //   ffd3                 | call                ebx
            //   8bf8                 | mov                 edi, eax

        $sequence_8 = { 7511 68???????? 50 ff15???????? 83c40c eb17 }
            // n = 6, score = 200
            //   7511                 | jne                 0x13
            //   68????????           |                     
            //   50                   | push                eax
            //   ff15????????         |                     
            //   83c40c               | add                 esp, 0xc
            //   eb17                 | jmp                 0x19

        $sequence_9 = { 83c40c 8d442424 50 c74424283c000000 c744242c40000000 }
            // n = 5, score = 200
            //   83c40c               | add                 esp, 0xc
            //   8d442424             | lea                 eax, dword ptr [esp + 0x24]
            //   50                   | push                eax
            //   c74424283c000000     | mov                 dword ptr [esp + 0x28], 0x3c
            //   c744242c40000000     | mov                 dword ptr [esp + 0x2c], 0x40

    condition:
        7 of them and filesize < 90112
}