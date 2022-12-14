rule win_rikamanu_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.rikamanu."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.rikamanu"
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
        $sequence_0 = { e8???????? 6a14 ff15???????? a801 }
            // n = 4, score = 200
            //   e8????????           |                     
            //   6a14                 | push                0x14
            //   ff15????????         |                     
            //   a801                 | test                al, 1

        $sequence_1 = { bf???????? f3a5 8bc8 33c0 83e103 f3a4 83c9ff }
            // n = 7, score = 200
            //   bf????????           |                     
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   8bc8                 | mov                 ecx, eax
            //   33c0                 | xor                 eax, eax
            //   83e103               | and                 ecx, 3
            //   f3a4                 | rep movsb           byte ptr es:[edi], byte ptr [esi]
            //   83c9ff               | or                  ecx, 0xffffffff

        $sequence_2 = { 50 ff15???????? 8b35???????? 3d80969800 }
            // n = 4, score = 200
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8b35????????         |                     
            //   3d80969800           | cmp                 eax, 0x989680

        $sequence_3 = { 81e2ffff0000 52 68???????? 68???????? e8???????? 83c9ff }
            // n = 6, score = 100
            //   81e2ffff0000         | and                 edx, 0xffff
            //   52                   | push                edx
            //   68????????           |                     
            //   68????????           |                     
            //   e8????????           |                     
            //   83c9ff               | or                  ecx, 0xffffffff

        $sequence_4 = { c745f0b0cc4000 50 e8???????? cc 55 8bec }
            // n = 6, score = 100
            //   c745f0b0cc4000       | mov                 dword ptr [ebp - 0x10], 0x40ccb0
            //   50                   | push                eax
            //   e8????????           |                     
            //   cc                   | int3                
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp

        $sequence_5 = { 889df8feffff 53 50 e8???????? 57 8d85e9faffff 889de8faffff }
            // n = 7, score = 100
            //   889df8feffff         | mov                 byte ptr [ebp - 0x108], bl
            //   53                   | push                ebx
            //   50                   | push                eax
            //   e8????????           |                     
            //   57                   | push                edi
            //   8d85e9faffff         | lea                 eax, dword ptr [ebp - 0x517]
            //   889de8faffff         | mov                 byte ptr [ebp - 0x518], bl

        $sequence_6 = { 0f94c1 5e 890d???????? 5b }
            // n = 4, score = 100
            //   0f94c1               | sete                cl
            //   5e                   | pop                 esi
            //   890d????????         |                     
            //   5b                   | pop                 ebx

        $sequence_7 = { 0f849e000000 33c0 663bcb 0f95c0 a3???????? }
            // n = 5, score = 100
            //   0f849e000000         | je                  0xa4
            //   33c0                 | xor                 eax, eax
            //   663bcb               | cmp                 cx, bx
            //   0f95c0               | setne               al
            //   a3????????           |                     

        $sequence_8 = { 7429 0fb63e 0fb6c0 eb12 8b45e0 8a800c982400 }
            // n = 6, score = 100
            //   7429                 | je                  0x2b
            //   0fb63e               | movzx               edi, byte ptr [esi]
            //   0fb6c0               | movzx               eax, al
            //   eb12                 | jmp                 0x14
            //   8b45e0               | mov                 eax, dword ptr [ebp - 0x20]
            //   8a800c982400         | mov                 al, byte ptr [eax + 0x24980c]

        $sequence_9 = { 50 6830040000 53 53 53 8d8df4fdffff 51 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   6830040000           | push                0x430
            //   53                   | push                ebx
            //   53                   | push                ebx
            //   53                   | push                ebx
            //   8d8df4fdffff         | lea                 ecx, dword ptr [ebp - 0x20c]
            //   51                   | push                ecx

        $sequence_10 = { 33c0 33c9 66a1???????? 668b0d???????? 52 }
            // n = 5, score = 100
            //   33c0                 | xor                 eax, eax
            //   33c9                 | xor                 ecx, ecx
            //   66a1????????         |                     
            //   668b0d????????       |                     
            //   52                   | push                edx

        $sequence_11 = { 0f94c1 898d3ce5ffff 8b8d24e5ffff 8b0485383f4100 ff3401 ff15???????? }
            // n = 6, score = 100
            //   0f94c1               | sete                cl
            //   898d3ce5ffff         | mov                 dword ptr [ebp - 0x1ac4], ecx
            //   8b8d24e5ffff         | mov                 ecx, dword ptr [ebp - 0x1adc]
            //   8b0485383f4100       | mov                 eax, dword ptr [eax*4 + 0x413f38]
            //   ff3401               | push                dword ptr [ecx + eax]
            //   ff15????????         |                     

        $sequence_12 = { 8d9e88774000 803b00 8bcb 742c 8a5101 84d2 7425 }
            // n = 7, score = 100
            //   8d9e88774000         | lea                 ebx, dword ptr [esi + 0x407788]
            //   803b00               | cmp                 byte ptr [ebx], 0
            //   8bcb                 | mov                 ecx, ebx
            //   742c                 | je                  0x2e
            //   8a5101               | mov                 dl, byte ptr [ecx + 1]
            //   84d2                 | test                dl, dl
            //   7425                 | je                  0x27

        $sequence_13 = { 74d2 a1???????? 85c0 74c9 33c9 }
            // n = 5, score = 100
            //   74d2                 | je                  0xffffffd4
            //   a1????????           |                     
            //   85c0                 | test                eax, eax
            //   74c9                 | je                  0xffffffcb
            //   33c9                 | xor                 ecx, ecx

        $sequence_14 = { 899de8fdffff 899df0fdffff ff15???????? 8d8de8fdffff 51 }
            // n = 5, score = 100
            //   899de8fdffff         | mov                 dword ptr [ebp - 0x218], ebx
            //   899df0fdffff         | mov                 dword ptr [ebp - 0x210], ebx
            //   ff15????????         |                     
            //   8d8de8fdffff         | lea                 ecx, dword ptr [ebp - 0x218]
            //   51                   | push                ecx

        $sequence_15 = { 3b0cc5c86e2400 740a 40 83f816 }
            // n = 4, score = 100
            //   3b0cc5c86e2400       | cmp                 ecx, dword ptr [eax*8 + 0x246ec8]
            //   740a                 | je                  0xc
            //   40                   | inc                 eax
            //   83f816               | cmp                 eax, 0x16

        $sequence_16 = { 8d54243c 52 ffd7 8d44243c 50 ffd3 }
            // n = 6, score = 100
            //   8d54243c             | lea                 edx, dword ptr [esp + 0x3c]
            //   52                   | push                edx
            //   ffd7                 | call                edi
            //   8d44243c             | lea                 eax, dword ptr [esp + 0x3c]
            //   50                   | push                eax
            //   ffd3                 | call                ebx

        $sequence_17 = { 750b 68???????? ff15???????? 6800010000 }
            // n = 4, score = 100
            //   750b                 | jne                 0xd
            //   68????????           |                     
            //   ff15????????         |                     
            //   6800010000           | push                0x100

        $sequence_18 = { 8bca 83e103 f3a4 8dbc243c020000 83c9ff f2ae }
            // n = 6, score = 100
            //   8bca                 | mov                 ecx, edx
            //   83e103               | and                 ecx, 3
            //   f3a4                 | rep movsb           byte ptr es:[edi], byte ptr [esi]
            //   8dbc243c020000       | lea                 edi, dword ptr [esp + 0x23c]
            //   83c9ff               | or                  ecx, 0xffffffff
            //   f2ae                 | repne scasb         al, byte ptr es:[edi]

        $sequence_19 = { 6bc000 c780ec3b410002000000 6a04 58 6bc000 8b0d???????? }
            // n = 6, score = 100
            //   6bc000               | imul                eax, eax, 0
            //   c780ec3b410002000000     | mov    dword ptr [eax + 0x413bec], 2
            //   6a04                 | push                4
            //   58                   | pop                 eax
            //   6bc000               | imul                eax, eax, 0
            //   8b0d????????         |                     

        $sequence_20 = { 6a00 55 ffd7 bf???????? 83c9ff 33c0 8b1d???????? }
            // n = 7, score = 100
            //   6a00                 | push                0
            //   55                   | push                ebp
            //   ffd7                 | call                edi
            //   bf????????           |                     
            //   83c9ff               | or                  ecx, 0xffffffff
            //   33c0                 | xor                 eax, eax
            //   8b1d????????         |                     

        $sequence_21 = { 8b4d0c f7d9 8d55f0 52 1bc9 }
            // n = 5, score = 100
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   f7d9                 | neg                 ecx
            //   8d55f0               | lea                 edx, dword ptr [ebp - 0x10]
            //   52                   | push                edx
            //   1bc9                 | sbb                 ecx, ecx

        $sequence_22 = { 750d 68e8030000 ff15???????? eba1 8b85f0fdffff }
            // n = 5, score = 100
            //   750d                 | jne                 0xf
            //   68e8030000           | push                0x3e8
            //   ff15????????         |                     
            //   eba1                 | jmp                 0xffffffa3
            //   8b85f0fdffff         | mov                 eax, dword ptr [ebp - 0x210]

        $sequence_23 = { 8b45e8 50 ff15???????? 33c0 5e 8b4dfc }
            // n = 6, score = 100
            //   8b45e8               | mov                 eax, dword ptr [ebp - 0x18]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   33c0                 | xor                 eax, eax
            //   5e                   | pop                 esi
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]

        $sequence_24 = { 56 57 50 53 e8???????? 56 57 }
            // n = 7, score = 100
            //   56                   | push                esi
            //   57                   | push                edi
            //   50                   | push                eax
            //   53                   | push                ebx
            //   e8????????           |                     
            //   56                   | push                esi
            //   57                   | push                edi

        $sequence_25 = { 7229 f3a5 ff249500522400 8bc7 }
            // n = 4, score = 100
            //   7229                 | jb                  0x2b
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   ff249500522400       | jmp                 dword ptr [edx*4 + 0x245200]
            //   8bc7                 | mov                 eax, edi

        $sequence_26 = { 3910 75f5 8d0c49 5e 8d0c8d90844000 3bc1 7304 }
            // n = 7, score = 100
            //   3910                 | cmp                 dword ptr [eax], edx
            //   75f5                 | jne                 0xfffffff7
            //   8d0c49               | lea                 ecx, dword ptr [ecx + ecx*2]
            //   5e                   | pop                 esi
            //   8d0c8d90844000       | lea                 ecx, dword ptr [ecx*4 + 0x408490]
            //   3bc1                 | cmp                 eax, ecx
            //   7304                 | jae                 6

        $sequence_27 = { ff15???????? 5b 5f 5e 33c0 5d 83c424 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   5b                   | pop                 ebx
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   33c0                 | xor                 eax, eax
            //   5d                   | pop                 ebp
            //   83c424               | add                 esp, 0x24

        $sequence_28 = { 7d10 668b444b0c 6689044d18494100 41 }
            // n = 4, score = 100
            //   7d10                 | jge                 0x12
            //   668b444b0c           | mov                 ax, word ptr [ebx + ecx*2 + 0xc]
            //   6689044d18494100     | mov                 word ptr [ecx*2 + 0x414918], ax
            //   41                   | inc                 ecx

    condition:
        7 of them and filesize < 212992
}