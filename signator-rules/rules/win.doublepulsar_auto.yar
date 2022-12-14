rule win_doublepulsar_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.doublepulsar."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.doublepulsar"
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
        $sequence_0 = { 83c040 50 ff15???????? 83c408 c744242001000000 }
            // n = 5, score = 100
            //   83c040               | add                 eax, 0x40
            //   50                   | push                eax
            //   ff15????????         |                     
            //   83c408               | add                 esp, 8
            //   c744242001000000     | mov                 dword ptr [esp + 0x20], 1

        $sequence_1 = { e8???????? 8b8fa8000000 39c8 755a 8d4f5c 51 56 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8b8fa8000000         | mov                 ecx, dword ptr [edi + 0xa8]
            //   39c8                 | cmp                 eax, ecx
            //   755a                 | jne                 0x5c
            //   8d4f5c               | lea                 ecx, dword ptr [edi + 0x5c]
            //   51                   | push                ecx
            //   56                   | push                esi

        $sequence_2 = { 8b7575 8b7d30 8b4538 01c7 83c705 }
            // n = 5, score = 100
            //   8b7575               | mov                 esi, dword ptr [ebp + 0x75]
            //   8b7d30               | mov                 edi, dword ptr [ebp + 0x30]
            //   8b4538               | mov                 eax, dword ptr [ebp + 0x38]
            //   01c7                 | add                 edi, eax
            //   83c705               | add                 edi, 5

        $sequence_3 = { a0???????? 57 88842428020000 b981000000 33c0 }
            // n = 5, score = 100
            //   a0????????           |                     
            //   57                   | push                edi
            //   88842428020000       | mov                 byte ptr [esp + 0x228], al
            //   b981000000           | mov                 ecx, 0x81
            //   33c0                 | xor                 eax, eax

        $sequence_4 = { 68???????? e9???????? 3d93010000 0f8570060000 8b4304 8b0d???????? 50 }
            // n = 7, score = 100
            //   68????????           |                     
            //   e9????????           |                     
            //   3d93010000           | cmp                 eax, 0x193
            //   0f8570060000         | jne                 0x676
            //   8b4304               | mov                 eax, dword ptr [ebx + 4]
            //   8b0d????????         |                     
            //   50                   | push                eax

        $sequence_5 = { e8???????? 83c408 85f6 7515 8b4b04 8b15???????? }
            // n = 6, score = 100
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   85f6                 | test                esi, esi
            //   7515                 | jne                 0x17
            //   8b4b04               | mov                 ecx, dword ptr [ebx + 4]
            //   8b15????????         |                     

        $sequence_6 = { 83c410 bf03000000 8b4c2444 8bc7 5f }
            // n = 5, score = 100
            //   83c410               | add                 esp, 0x10
            //   bf03000000           | mov                 edi, 3
            //   8b4c2444             | mov                 ecx, dword ptr [esp + 0x44]
            //   8bc7                 | mov                 eax, edi
            //   5f                   | pop                 edi

        $sequence_7 = { ebf0 89d0 5e 5a c20800 58 }
            // n = 6, score = 100
            //   ebf0                 | jmp                 0xfffffff2
            //   89d0                 | mov                 eax, edx
            //   5e                   | pop                 esi
            //   5a                   | pop                 edx
            //   c20800               | ret                 8
            //   58                   | pop                 eax

        $sequence_8 = { 83ec10 56 57 8b7c2420 33c0 68???????? }
            // n = 6, score = 100
            //   83ec10               | sub                 esp, 0x10
            //   56                   | push                esi
            //   57                   | push                edi
            //   8b7c2420             | mov                 edi, dword ptr [esp + 0x20]
            //   33c0                 | xor                 eax, eax
            //   68????????           |                     

        $sequence_9 = { c3 8b0d???????? 8b2d???????? 83c120 68???????? }
            // n = 5, score = 100
            //   c3                   | ret                 
            //   8b0d????????         |                     
            //   8b2d????????         |                     
            //   83c120               | add                 ecx, 0x20
            //   68????????           |                     

        $sequence_10 = { ebbe 8b442408 68???????? 50 e8???????? 83c408 85c0 }
            // n = 7, score = 100
            //   ebbe                 | jmp                 0xffffffc0
            //   8b442408             | mov                 eax, dword ptr [esp + 8]
            //   68????????           |                     
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   85c0                 | test                eax, eax

        $sequence_11 = { ffd3 83c408 85c0 7475 8b4604 68???????? 50 }
            // n = 7, score = 100
            //   ffd3                 | call                ebx
            //   83c408               | add                 esp, 8
            //   85c0                 | test                eax, eax
            //   7475                 | je                  0x77
            //   8b4604               | mov                 eax, dword ptr [esi + 4]
            //   68????????           |                     
            //   50                   | push                eax

        $sequence_12 = { 8b15???????? 8d8d2cffffff 51 56 83c220 68???????? }
            // n = 6, score = 100
            //   8b15????????         |                     
            //   8d8d2cffffff         | lea                 ecx, dword ptr [ebp - 0xd4]
            //   51                   | push                ecx
            //   56                   | push                esi
            //   83c220               | add                 edx, 0x20
            //   68????????           |                     

        $sequence_13 = { 33db 57 8d44241c 53 8d4c2418 }
            // n = 5, score = 100
            //   33db                 | xor                 ebx, ebx
            //   57                   | push                edi
            //   8d44241c             | lea                 eax, dword ptr [esp + 0x1c]
            //   53                   | push                ebx
            //   8d4c2418             | lea                 ecx, dword ptr [esp + 0x18]

        $sequence_14 = { 48 31db 668b1a 48 89fa 48 }
            // n = 6, score = 100
            //   48                   | dec                 eax
            //   31db                 | xor                 ebx, ebx
            //   668b1a               | mov                 bx, word ptr [edx]
            //   48                   | dec                 eax
            //   89fa                 | mov                 edx, edi
            //   48                   | dec                 eax

        $sequence_15 = { 83c734 8b17 6a40 6800300000 53 52 }
            // n = 6, score = 100
            //   83c734               | add                 edi, 0x34
            //   8b17                 | mov                 edx, dword ptr [edi]
            //   6a40                 | push                0x40
            //   6800300000           | push                0x3000
            //   53                   | push                ebx
            //   52                   | push                edx

    condition:
        7 of them and filesize < 140288
}