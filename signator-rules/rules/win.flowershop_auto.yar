rule win_flowershop_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.flowershop."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.flowershop"
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
        $sequence_0 = { a1???????? 6683402004 a1???????? 668178200010 734a f6402201 740f }
            // n = 7, score = 500
            //   a1????????           |                     
            //   6683402004           | add                 word ptr [eax + 0x20], 4
            //   a1????????           |                     
            //   668178200010         | cmp                 word ptr [eax + 0x20], 0x1000
            //   734a                 | jae                 0x4c
            //   f6402201             | test                byte ptr [eax + 0x22], 1
            //   740f                 | je                  0x11

        $sequence_1 = { 85c0 740e f605????????02 7405 e8???????? 8d45e8 50 }
            // n = 7, score = 500
            //   85c0                 | test                eax, eax
            //   740e                 | je                  0x10
            //   f605????????02       |                     
            //   7405                 | je                  7
            //   e8????????           |                     
            //   8d45e8               | lea                 eax, dword ptr [ebp - 0x18]
            //   50                   | push                eax

        $sequence_2 = { 50 8d45e8 50 6a02 68???????? ff75fc e8???????? }
            // n = 7, score = 500
            //   50                   | push                eax
            //   8d45e8               | lea                 eax, dword ptr [ebp - 0x18]
            //   50                   | push                eax
            //   6a02                 | push                2
            //   68????????           |                     
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   e8????????           |                     

        $sequence_3 = { 8bec 51 56 57 33ff 6a04 be???????? }
            // n = 7, score = 500
            //   8bec                 | mov                 ebp, esp
            //   51                   | push                ecx
            //   56                   | push                esi
            //   57                   | push                edi
            //   33ff                 | xor                 edi, edi
            //   6a04                 | push                4
            //   be????????           |                     

        $sequence_4 = { 74dd 837d0c08 0f82a5000000 83e800 7469 48 0f8599000000 }
            // n = 7, score = 500
            //   74dd                 | je                  0xffffffdf
            //   837d0c08             | cmp                 dword ptr [ebp + 0xc], 8
            //   0f82a5000000         | jb                  0xab
            //   83e800               | sub                 eax, 0
            //   7469                 | je                  0x6b
            //   48                   | dec                 eax
            //   0f8599000000         | jne                 0x9f

        $sequence_5 = { 7cd6 802600 8a16 33c9 8a440de8 d2e0 }
            // n = 6, score = 500
            //   7cd6                 | jl                  0xffffffd8
            //   802600               | and                 byte ptr [esi], 0
            //   8a16                 | mov                 dl, byte ptr [esi]
            //   33c9                 | xor                 ecx, ecx
            //   8a440de8             | mov                 al, byte ptr [ebp + ecx - 0x18]
            //   d2e0                 | shl                 al, cl

        $sequence_6 = { 8bda c1e317 c1ea09 0bda 895f0c 8b15???????? 8b7a0c }
            // n = 7, score = 500
            //   8bda                 | mov                 ebx, edx
            //   c1e317               | shl                 ebx, 0x17
            //   c1ea09               | shr                 edx, 9
            //   0bda                 | or                  ebx, edx
            //   895f0c               | mov                 dword ptr [edi + 0xc], ebx
            //   8b15????????         |                     
            //   8b7a0c               | mov                 edi, dword ptr [edx + 0xc]

        $sequence_7 = { 53 ffd7 40 50 56 e8???????? 59 }
            // n = 7, score = 500
            //   53                   | push                ebx
            //   ffd7                 | call                edi
            //   40                   | inc                 eax
            //   50                   | push                eax
            //   56                   | push                esi
            //   e8????????           |                     
            //   59                   | pop                 ecx

        $sequence_8 = { 895dfc ff75f0 ff15???????? ff75f8 ff15???????? 8b45fc 5b }
            // n = 7, score = 500
            //   895dfc               | mov                 dword ptr [ebp - 4], ebx
            //   ff75f0               | push                dword ptr [ebp - 0x10]
            //   ff15????????         |                     
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   ff15????????         |                     
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   5b                   | pop                 ebx

        $sequence_9 = { 6a01 58 eb2d 8b35???????? 6a20 53 }
            // n = 6, score = 500
            //   6a01                 | push                1
            //   58                   | pop                 eax
            //   eb2d                 | jmp                 0x2f
            //   8b35????????         |                     
            //   6a20                 | push                0x20
            //   53                   | push                ebx

    condition:
        7 of them and filesize < 829440
}