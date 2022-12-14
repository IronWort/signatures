rule win_unidentified_041_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.unidentified_041."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.unidentified_041"
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
        $sequence_0 = { 68???????? e8???????? 83c40c c68424200300000a 8d4c2418 6a00 }
            // n = 6, score = 200
            //   68????????           |                     
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   c68424200300000a     | mov                 byte ptr [esp + 0x320], 0xa
            //   8d4c2418             | lea                 ecx, dword ptr [esp + 0x18]
            //   6a00                 | push                0

        $sequence_1 = { 50 8d8d0cffffff e8???????? 8bc8 c645fc03 e8???????? 6a27 }
            // n = 7, score = 200
            //   50                   | push                eax
            //   8d8d0cffffff         | lea                 ecx, dword ptr [ebp - 0xf4]
            //   e8????????           |                     
            //   8bc8                 | mov                 ecx, eax
            //   c645fc03             | mov                 byte ptr [ebp - 4], 3
            //   e8????????           |                     
            //   6a27                 | push                0x27

        $sequence_2 = { ff4714 83c0f0 66d3ee 0187bc160000 6689b7b8160000 eb13 66d3e6 }
            // n = 7, score = 200
            //   ff4714               | inc                 dword ptr [edi + 0x14]
            //   83c0f0               | add                 eax, -0x10
            //   66d3ee               | shr                 si, cl
            //   0187bc160000         | add                 dword ptr [edi + 0x16bc], eax
            //   6689b7b8160000       | mov                 word ptr [edi + 0x16b8], si
            //   eb13                 | jmp                 0x15
            //   66d3e6               | shl                 si, cl

        $sequence_3 = { ff742414 ff742414 e8???????? 59 59 8b4c244c 8bc6 }
            // n = 7, score = 200
            //   ff742414             | push                dword ptr [esp + 0x14]
            //   ff742414             | push                dword ptr [esp + 0x14]
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   8b4c244c             | mov                 ecx, dword ptr [esp + 0x4c]
            //   8bc6                 | mov                 eax, esi

        $sequence_4 = { eb03 8b45fc 5f 6bc00c 3998f0274700 7407 0fb798f8274700 }
            // n = 7, score = 200
            //   eb03                 | jmp                 5
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   5f                   | pop                 edi
            //   6bc00c               | imul                eax, eax, 0xc
            //   3998f0274700         | cmp                 dword ptr [eax + 0x4727f0], ebx
            //   7407                 | je                  9
            //   0fb798f8274700       | movzx               ebx, word ptr [eax + 0x4727f8]

        $sequence_5 = { d95c2438 83c40c 807d1000 8b4d0c 7535 85c9 7428 }
            // n = 7, score = 200
            //   d95c2438             | fstp                dword ptr [esp + 0x38]
            //   83c40c               | add                 esp, 0xc
            //   807d1000             | cmp                 byte ptr [ebp + 0x10], 0
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   7535                 | jne                 0x37
            //   85c9                 | test                ecx, ecx
            //   7428                 | je                  0x2a

        $sequence_6 = { eb0a 2bc2 6bf018 8b45fc 03f1 3bf7 75b0 }
            // n = 7, score = 200
            //   eb0a                 | jmp                 0xc
            //   2bc2                 | sub                 eax, edx
            //   6bf018               | imul                esi, eax, 0x18
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   03f1                 | add                 esi, ecx
            //   3bf7                 | cmp                 esi, edi
            //   75b0                 | jne                 0xffffffb2

        $sequence_7 = { 6a01 8d8dacfcffff e8???????? 6a00 6a01 8d8dc4fcffff c645fc18 }
            // n = 7, score = 200
            //   6a01                 | push                1
            //   8d8dacfcffff         | lea                 ecx, dword ptr [ebp - 0x354]
            //   e8????????           |                     
            //   6a00                 | push                0
            //   6a01                 | push                1
            //   8d8dc4fcffff         | lea                 ecx, dword ptr [ebp - 0x33c]
            //   c645fc18             | mov                 byte ptr [ebp - 4], 0x18

        $sequence_8 = { eb02 8bd3 2bc8 53 51 8bce e8???????? }
            // n = 7, score = 200
            //   eb02                 | jmp                 4
            //   8bd3                 | mov                 edx, ebx
            //   2bc8                 | sub                 ecx, eax
            //   53                   | push                ebx
            //   51                   | push                ecx
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     

        $sequence_9 = { eb02 8bcb 85d2 7504 33c0 eb06 8bc2 }
            // n = 7, score = 200
            //   eb02                 | jmp                 4
            //   8bcb                 | mov                 ecx, ebx
            //   85d2                 | test                edx, edx
            //   7504                 | jne                 6
            //   33c0                 | xor                 eax, eax
            //   eb06                 | jmp                 8
            //   8bc2                 | mov                 eax, edx

    condition:
        7 of them and filesize < 1097728
}