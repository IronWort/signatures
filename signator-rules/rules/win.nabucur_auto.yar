rule win_nabucur_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.nabucur."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.nabucur"
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
        $sequence_0 = { 48 3bc3 8d54bafc 7c12 2bc3 40 }
            // n = 6, score = 200
            //   48                   | dec                 eax
            //   3bc3                 | cmp                 eax, ebx
            //   8d54bafc             | lea                 edx, dword ptr [edx + edi*4 - 4]
            //   7c12                 | jl                  0x14
            //   2bc3                 | sub                 eax, ebx
            //   40                   | inc                 eax

        $sequence_1 = { 48 43 0bf9 85c0 }
            // n = 4, score = 200
            //   48                   | dec                 eax
            //   43                   | inc                 ebx
            //   0bf9                 | or                  edi, ecx
            //   85c0                 | test                eax, eax

        $sequence_2 = { 48 41 0bf2 85c0 }
            // n = 4, score = 200
            //   48                   | dec                 eax
            //   41                   | inc                 ecx
            //   0bf2                 | or                  esi, edx
            //   85c0                 | test                eax, eax

        $sequence_3 = { 009eaa030000 0fb686aa030000 57 83f80a 0f876d010000 }
            // n = 5, score = 200
            //   009eaa030000         | add                 byte ptr [esi + 0x3aa], bl
            //   0fb686aa030000       | movzx               eax, byte ptr [esi + 0x3aa]
            //   57                   | push                edi
            //   83f80a               | cmp                 eax, 0xa
            //   0f876d010000         | ja                  0x173

        $sequence_4 = { 51 e8???????? 03fd 55 8d141f 52 8d86e8000000 }
            // n = 7, score = 200
            //   51                   | push                ecx
            //   e8????????           |                     
            //   03fd                 | add                 edi, ebp
            //   55                   | push                ebp
            //   8d141f               | lea                 edx, dword ptr [edi + ebx]
            //   52                   | push                edx
            //   8d86e8000000         | lea                 eax, dword ptr [esi + 0xe8]

        $sequence_5 = { 48 3bc8 7cee 8d742418 }
            // n = 4, score = 200
            //   48                   | dec                 eax
            //   3bc8                 | cmp                 ecx, eax
            //   7cee                 | jl                  0xfffffff0
            //   8d742418             | lea                 esi, dword ptr [esp + 0x18]

        $sequence_6 = { 48 49 85c0 75fa }
            // n = 4, score = 200
            //   48                   | dec                 eax
            //   49                   | dec                 ecx
            //   85c0                 | test                eax, eax
            //   75fa                 | jne                 0xfffffffc

        $sequence_7 = { 48 45 0bf1 85c0 }
            // n = 4, score = 200
            //   48                   | dec                 eax
            //   45                   | inc                 ebp
            //   0bf1                 | or                  esi, ecx
            //   85c0                 | test                eax, eax

        $sequence_8 = { 3b4514 0f8ff9000000 c785f8feffff00000000 8b4508 }
            // n = 4, score = 100
            //   3b4514               | cmp                 eax, dword ptr [ebp + 0x14]
            //   0f8ff9000000         | jg                  0xff
            //   c785f8feffff00000000     | mov    dword ptr [ebp - 0x108], 0
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]

        $sequence_9 = { 8345fc02 8802 61 41 3b4d0c 75cc }
            // n = 6, score = 100
            //   8345fc02             | add                 dword ptr [ebp - 4], 2
            //   8802                 | mov                 byte ptr [edx], al
            //   61                   | popal               
            //   41                   | inc                 ecx
            //   3b4d0c               | cmp                 ecx, dword ptr [ebp + 0xc]
            //   75cc                 | jne                 0xffffffce

        $sequence_10 = { 8be5 5d c20400 83f800 7518 }
            // n = 5, score = 100
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c20400               | ret                 4
            //   83f800               | cmp                 eax, 0
            //   7518                 | jne                 0x1a

        $sequence_11 = { 42 18fd e2bd f2dcf2 0fe77733 }
            // n = 5, score = 100
            //   42                   | inc                 edx
            //   18fd                 | sbb                 ch, bh
            //   e2bd                 | loop                0xffffffbf
            //   f2dcf2               | fdivr               st(2), st(0)
            //   0fe77733             | movntq              qword ptr [edi + 0x33], mm6

        $sequence_12 = { babb956afb 81f2634994ff 81f3a11fb0fc bb535218f8 }
            // n = 4, score = 100
            //   babb956afb           | mov                 edx, 0xfb6a95bb
            //   81f2634994ff         | xor                 edx, 0xff944963
            //   81f3a11fb0fc         | xor                 ebx, 0xfcb01fa1
            //   bb535218f8           | mov                 ebx, 0xf8185253

        $sequence_13 = { 8945f0 ff750c ff15???????? 668945ee 66c745ec0200 }
            // n = 5, score = 100
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   ff15????????         |                     
            //   668945ee             | mov                 word ptr [ebp - 0x12], ax
            //   66c745ec0200         | mov                 word ptr [ebp - 0x14], 2

        $sequence_14 = { baab10c2f8 3da760e4de 0f853ed6f4ff eb00 }
            // n = 4, score = 100
            //   baab10c2f8           | mov                 edx, 0xf8c210ab
            //   3da760e4de           | cmp                 eax, 0xdee460a7
            //   0f853ed6f4ff         | jne                 0xfff4d644
            //   eb00                 | jmp                 2

        $sequence_15 = { 2dbe272a7a 6e 5e db5079 a4 }
            // n = 5, score = 100
            //   2dbe272a7a           | sub                 eax, 0x7a2a27be
            //   6e                   | outsb               dx, byte ptr [esi]
            //   5e                   | pop                 esi
            //   db5079               | fist                dword ptr [eax + 0x79]
            //   a4                   | movsb               byte ptr es:[edi], byte ptr [esi]

    condition:
        7 of them and filesize < 1949696
}