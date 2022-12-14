rule win_cobint_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.cobint."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.cobint"
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
        $sequence_0 = { 8b7d0c 8bf0 2bf8 8a0c37 }
            // n = 4, score = 400
            //   8b7d0c               | mov                 edi, dword ptr [ebp + 0xc]
            //   8bf0                 | mov                 esi, eax
            //   2bf8                 | sub                 edi, eax
            //   8a0c37               | mov                 cl, byte ptr [edi + esi]

        $sequence_1 = { 740d 40 83c110 83f820 7cf3 }
            // n = 5, score = 400
            //   740d                 | je                  0xf
            //   40                   | inc                 eax
            //   83c110               | add                 ecx, 0x10
            //   83f820               | cmp                 eax, 0x20
            //   7cf3                 | jl                  0xfffffff5

        $sequence_2 = { 89750c 59 57 57 85f6 751d }
            // n = 6, score = 400
            //   89750c               | mov                 dword ptr [ebp + 0xc], esi
            //   59                   | pop                 ecx
            //   57                   | push                edi
            //   57                   | push                edi
            //   85f6                 | test                esi, esi
            //   751d                 | jne                 0x1f

        $sequence_3 = { 57 56 8b35???????? ffd6 53 57 }
            // n = 6, score = 400
            //   57                   | push                edi
            //   56                   | push                esi
            //   8b35????????         |                     
            //   ffd6                 | call                esi
            //   53                   | push                ebx
            //   57                   | push                edi

        $sequence_4 = { 56 be00020000 56 e8???????? 56 }
            // n = 5, score = 400
            //   56                   | push                esi
            //   be00020000           | mov                 esi, 0x200
            //   56                   | push                esi
            //   e8????????           |                     
            //   56                   | push                esi

        $sequence_5 = { 56 50 e8???????? 83c410 8935???????? 8935???????? }
            // n = 6, score = 400
            //   56                   | push                esi
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   8935????????         |                     
            //   8935????????         |                     

        $sequence_6 = { 50 e8???????? 8bd8 33f6 59 }
            // n = 5, score = 400
            //   50                   | push                eax
            //   e8????????           |                     
            //   8bd8                 | mov                 ebx, eax
            //   33f6                 | xor                 esi, esi
            //   59                   | pop                 ecx

        $sequence_7 = { 5d c3 55 8bec 837d0800 ff750c 7508 }
            // n = 7, score = 400
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   837d0800             | cmp                 dword ptr [ebp + 8], 0
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   7508                 | jne                 0xa

        $sequence_8 = { 84c9 7421 8bd8 8ac1 8bcb }
            // n = 5, score = 200
            //   84c9                 | test                cl, cl
            //   7421                 | je                  0x23
            //   8bd8                 | mov                 ebx, eax
            //   8ac1                 | mov                 al, cl
            //   8bcb                 | mov                 ecx, ebx

        $sequence_9 = { 1a807c170e81 7cd7 9b 807c909090 }
            // n = 4, score = 200
            //   1a807c170e81         | sbb                 al, byte ptr [eax - 0x7ef1e884]
            //   7cd7                 | jl                  0xffffffd9
            //   9b                   | wait                
            //   807c909090           | cmp                 byte ptr [eax + edx*4 - 0x70], 0x90

        $sequence_10 = { 66391e 75e3 8b5df4 81ffea968891 740a 33c0 8b12 }
            // n = 7, score = 200
            //   66391e               | cmp                 word ptr [esi], bx
            //   75e3                 | jne                 0xffffffe5
            //   8b5df4               | mov                 ebx, dword ptr [ebp - 0xc]
            //   81ffea968891         | cmp                 edi, 0x918896ea
            //   740a                 | je                  0xc
            //   33c0                 | xor                 eax, eax
            //   8b12                 | mov                 edx, dword ptr [edx]

        $sequence_11 = { 8945e4 8bcf e8???????? 8b4dc8 8d9524feffff 8bf0 e8???????? }
            // n = 7, score = 200
            //   8945e4               | mov                 dword ptr [ebp - 0x1c], eax
            //   8bcf                 | mov                 ecx, edi
            //   e8????????           |                     
            //   8b4dc8               | mov                 ecx, dword ptr [ebp - 0x38]
            //   8d9524feffff         | lea                 edx, dword ptr [ebp - 0x1dc]
            //   8bf0                 | mov                 esi, eax
            //   e8????????           |                     

        $sequence_12 = { 53 ff55f8 85c0 75e2 33c9 8bdf 85ff }
            // n = 7, score = 200
            //   53                   | push                ebx
            //   ff55f8               | call                dword ptr [ebp - 8]
            //   85c0                 | test                eax, eax
            //   75e2                 | jne                 0xffffffe4
            //   33c9                 | xor                 ecx, ecx
            //   8bdf                 | mov                 ebx, edi
            //   85ff                 | test                edi, edi

        $sequence_13 = { 90 bdfd807c90 90 90 90 90 90 }
            // n = 7, score = 200
            //   90                   | nop                 
            //   bdfd807c90           | mov                 ebp, 0x907c80fd
            //   90                   | nop                 
            //   90                   | nop                 
            //   90                   | nop                 
            //   90                   | nop                 
            //   90                   | nop                 

        $sequence_14 = { 90 90 749b 807ce19a80 7c90 90 90 }
            // n = 7, score = 200
            //   90                   | nop                 
            //   90                   | nop                 
            //   749b                 | je                  0xffffff9d
            //   807ce19a80           | cmp                 byte ptr [ecx - 0x66], 0x80
            //   7c90                 | jl                  0xffffff92
            //   90                   | nop                 
            //   90                   | nop                 

        $sequence_15 = { 0355f0 8a45ec 8802 eb0b 8b4d08 }
            // n = 5, score = 200
            //   0355f0               | add                 edx, dword ptr [ebp - 0x10]
            //   8a45ec               | mov                 al, byte ptr [ebp - 0x14]
            //   8802                 | mov                 byte ptr [edx], al
            //   eb0b                 | jmp                 0xd
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]

        $sequence_16 = { 6a01 53 8d0437 50 }
            // n = 4, score = 200
            //   6a01                 | push                1
            //   53                   | push                ebx
            //   8d0437               | lea                 eax, dword ptr [edi + esi]
            //   50                   | push                eax

        $sequence_17 = { c3 31b7807c30ae 807c909090 90 }
            // n = 4, score = 200
            //   c3                   | ret                 
            //   31b7807c30ae         | xor                 dword ptr [edi - 0x51cf8380], esi
            //   807c909090           | cmp                 byte ptr [eax + edx*4 - 0x70], 0x90
            //   90                   | nop                 

        $sequence_18 = { e10b 96 7c90 90 }
            // n = 4, score = 200
            //   e10b                 | loope               0xd
            //   96                   | xchg                eax, esi
            //   7c90                 | jl                  0xffffff92
            //   90                   | nop                 

        $sequence_19 = { 90 90 e10b 96 }
            // n = 4, score = 200
            //   90                   | nop                 
            //   90                   | nop                 
            //   e10b                 | loope               0xd
            //   96                   | xchg                eax, esi

        $sequence_20 = { 42 c1e802 3bd0 72e5 0fb74604 83c008 }
            // n = 6, score = 200
            //   42                   | inc                 edx
            //   c1e802               | shr                 eax, 2
            //   3bd0                 | cmp                 edx, eax
            //   72e5                 | jb                  0xffffffe7
            //   0fb74604             | movzx               eax, word ptr [esi + 4]
            //   83c008               | add                 eax, 8

        $sequence_21 = { 0fbec0 03c3 c1c108 47 8d1c08 8a07 84c0 }
            // n = 7, score = 200
            //   0fbec0               | movsx               eax, al
            //   03c3                 | add                 eax, ebx
            //   c1c108               | rol                 ecx, 8
            //   47                   | inc                 edi
            //   8d1c08               | lea                 ebx, dword ptr [eax + ecx]
            //   8a07                 | mov                 al, byte ptr [edi]
            //   84c0                 | test                al, al

        $sequence_22 = { 90 90 90 bffc807c28 1a807c170e81 7cd7 }
            // n = 6, score = 200
            //   90                   | nop                 
            //   90                   | nop                 
            //   90                   | nop                 
            //   bffc807c28           | mov                 edi, 0x287c80fc
            //   1a807c170e81         | sbb                 al, byte ptr [eax - 0x7ef1e884]
            //   7cd7                 | jl                  0xffffffd9

        $sequence_23 = { 8b400c 8b5014 33c0 eb38 8b7228 }
            // n = 5, score = 200
            //   8b400c               | mov                 eax, dword ptr [eax + 0xc]
            //   8b5014               | mov                 edx, dword ptr [eax + 0x14]
            //   33c0                 | xor                 eax, eax
            //   eb38                 | jmp                 0x3a
            //   8b7228               | mov                 esi, dword ptr [edx + 0x28]

    condition:
        7 of them and filesize < 65536
}