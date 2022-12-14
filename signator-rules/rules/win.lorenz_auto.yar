rule win_lorenz_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.lorenz."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.lorenz"
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
        $sequence_0 = { 6b45ec34 0345d4 8945dc c745fc00000000 eb09 8b4dfc 83c101 }
            // n = 7, score = 200
            //   6b45ec34             | imul                eax, dword ptr [ebp - 0x14], 0x34
            //   0345d4               | add                 eax, dword ptr [ebp - 0x2c]
            //   8945dc               | mov                 dword ptr [ebp - 0x24], eax
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   eb09                 | jmp                 0xb
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   83c101               | add                 ecx, 1

        $sequence_1 = { 05d4000000 50 8b4dfc 8b5150 8b0a e8???????? 8b45fc }
            // n = 7, score = 200
            //   05d4000000           | add                 eax, 0xd4
            //   50                   | push                eax
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   8b5150               | mov                 edx, dword ptr [ecx + 0x50]
            //   8b0a                 | mov                 ecx, dword ptr [edx]
            //   e8????????           |                     
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]

        $sequence_2 = { e8???????? 8b4df0 894104 68???????? 6a04 6a08 8b55f0 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   8b4df0               | mov                 ecx, dword ptr [ebp - 0x10]
            //   894104               | mov                 dword ptr [ecx + 4], eax
            //   68????????           |                     
            //   6a04                 | push                4
            //   6a08                 | push                8
            //   8b55f0               | mov                 edx, dword ptr [ebp - 0x10]

        $sequence_3 = { cc 33c9 75c9 33d2 75c5 8b4dfc e8???????? }
            // n = 7, score = 200
            //   cc                   | int3                
            //   33c9                 | xor                 ecx, ecx
            //   75c9                 | jne                 0xffffffcb
            //   33d2                 | xor                 edx, edx
            //   75c5                 | jne                 0xffffffc7
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   e8????????           |                     

        $sequence_4 = { d9ee dec9 d97df2 0fb745f2 0d000c0000 8945cc d96dcc }
            // n = 7, score = 200
            //   d9ee                 | fldz                
            //   dec9                 | fmulp               st(1)
            //   d97df2               | fnstcw              word ptr [ebp - 0xe]
            //   0fb745f2             | movzx               eax, word ptr [ebp - 0xe]
            //   0d000c0000           | or                  eax, 0xc00
            //   8945cc               | mov                 dword ptr [ebp - 0x34], eax
            //   d96dcc               | fldcw               word ptr [ebp - 0x34]

        $sequence_5 = { 8b55e4 8b45fc 8b0c90 d9e8 dca51cffffff dc4920 dc6ddc }
            // n = 7, score = 200
            //   8b55e4               | mov                 edx, dword ptr [ebp - 0x1c]
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   8b0c90               | mov                 ecx, dword ptr [eax + edx*4]
            //   d9e8                 | fld1                
            //   dca51cffffff         | fsub                qword ptr [ebp - 0xe4]
            //   dc4920               | fmul                qword ptr [ecx + 0x20]
            //   dc6ddc               | fsubr               qword ptr [ebp - 0x24]

        $sequence_6 = { e8???????? 0fb6c0 85c0 7572 837dec00 740f 8b4dec }
            // n = 7, score = 200
            //   e8????????           |                     
            //   0fb6c0               | movzx               eax, al
            //   85c0                 | test                eax, eax
            //   7572                 | jne                 0x74
            //   837dec00             | cmp                 dword ptr [ebp - 0x14], 0
            //   740f                 | je                  0x11
            //   8b4dec               | mov                 ecx, dword ptr [ebp - 0x14]

        $sequence_7 = { 8b45a4 50 e8???????? 83c404 8b4df4 64890d00000000 59 }
            // n = 7, score = 200
            //   8b45a4               | mov                 eax, dword ptr [ebp - 0x5c]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]
            //   64890d00000000       | mov                 dword ptr fs:[0], ecx
            //   59                   | pop                 ecx

        $sequence_8 = { 837de800 760d 8b55e8 83ea01 8955e8 c645ff01 eb37 }
            // n = 7, score = 200
            //   837de800             | cmp                 dword ptr [ebp - 0x18], 0
            //   760d                 | jbe                 0xf
            //   8b55e8               | mov                 edx, dword ptr [ebp - 0x18]
            //   83ea01               | sub                 edx, 1
            //   8955e8               | mov                 dword ptr [ebp - 0x18], edx
            //   c645ff01             | mov                 byte ptr [ebp - 1], 1
            //   eb37                 | jmp                 0x39

        $sequence_9 = { ff15???????? 8945fc 837dfc00 7504 33c0 eb0c 8b4dfc }
            // n = 7, score = 200
            //   ff15????????         |                     
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   837dfc00             | cmp                 dword ptr [ebp - 4], 0
            //   7504                 | jne                 6
            //   33c0                 | xor                 eax, eax
            //   eb0c                 | jmp                 0xe
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]

    condition:
        7 of them and filesize < 2254848
}