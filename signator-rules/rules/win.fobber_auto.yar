rule win_fobber_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.fobber."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.fobber"
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
        $sequence_0 = { 8d4d08 51 ff31 ffd0 85c0 7403 }
            // n = 6, score = 1100
            //   8d4d08               | lea                 ecx, dword ptr [ebp + 8]
            //   51                   | push                ecx
            //   ff31                 | push                dword ptr [ecx]
            //   ffd0                 | call                eax
            //   85c0                 | test                eax, eax
            //   7403                 | je                  5

        $sequence_1 = { 660fc146f9 6685c0 7515 0fb646f8 50 0fb746f6 }
            // n = 6, score = 1100
            //   660fc146f9           | xadd                word ptr [esi - 7], ax
            //   6685c0               | test                ax, ax
            //   7515                 | jne                 0x17
            //   0fb646f8             | movzx               eax, byte ptr [esi - 8]
            //   50                   | push                eax
            //   0fb746f6             | movzx               eax, word ptr [esi - 0xa]

        $sequence_2 = { 55 89e5 57 51 8b7d08 30c0 31c9 }
            // n = 7, score = 1100
            //   55                   | push                ebp
            //   89e5                 | mov                 ebp, esp
            //   57                   | push                edi
            //   51                   | push                ecx
            //   8b7d08               | mov                 edi, dword ptr [ebp + 8]
            //   30c0                 | xor                 al, al
            //   31c9                 | xor                 ecx, ecx

        $sequence_3 = { f2ae f7d1 49 89c8 59 }
            // n = 5, score = 1100
            //   f2ae                 | repne scasb         al, byte ptr es:[edi]
            //   f7d1                 | not                 ecx
            //   49                   | dec                 ecx
            //   89c8                 | mov                 eax, ecx
            //   59                   | pop                 ecx

        $sequence_4 = { 89e5 ff750c ff7508 e8???????? 85c0 7407 50 }
            // n = 7, score = 1100
            //   89e5                 | mov                 ebp, esp
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7407                 | je                  9
            //   50                   | push                eax

        $sequence_5 = { 0fb066f5 75f6 66b80100 660fc146f9 6685c0 7515 }
            // n = 6, score = 1100
            //   0fb066f5             | cmpxchg             byte ptr [esi - 0xb], ah
            //   75f6                 | jne                 0xfffffff8
            //   66b80100             | mov                 ax, 1
            //   660fc146f9           | xadd                word ptr [esi - 7], ax
            //   6685c0               | test                ax, ax
            //   7515                 | jne                 0x17

        $sequence_6 = { 760e 8d0431 39f8 7607 }
            // n = 4, score = 1100
            //   760e                 | jbe                 0x10
            //   8d0431               | lea                 eax, dword ptr [ecx + esi]
            //   39f8                 | cmp                 eax, edi
            //   7607                 | jbe                 9

        $sequence_7 = { 30c0 31c9 f7d1 fc }
            // n = 4, score = 1100
            //   30c0                 | xor                 al, al
            //   31c9                 | xor                 ecx, ecx
            //   f7d1                 | not                 ecx
            //   fc                   | cld                 

        $sequence_8 = { 85f6 0f84fd610100 8b45d4 83b8ac00000001 0f8f11620100 0fb60e }
            // n = 6, score = 100
            //   85f6                 | test                esi, esi
            //   0f84fd610100         | je                  0x16203
            //   8b45d4               | mov                 eax, dword ptr [ebp - 0x2c]
            //   83b8ac00000001       | cmp                 dword ptr [eax + 0xac], 1
            //   0f8f11620100         | jg                  0x16217
            //   0fb60e               | movzx               ecx, byte ptr [esi]

        $sequence_9 = { 82776d47 aa c48767768494 36705c fc 38d7 6a00 }
            // n = 7, score = 100
            //   82776d47             |                     
            //   aa                   | stosb               byte ptr es:[edi], al
            //   c48767768494         | les                 eax, ptr [edi - 0x6b7b8999]
            //   36705c               | jo                  0x5f
            //   fc                   | cld                 
            //   38d7                 | cmp                 bh, dl
            //   6a00                 | push                0

        $sequence_10 = { 16 46 10d2 c3 f7a3feff5959 85f6 }
            // n = 6, score = 100
            //   16                   | push                ss
            //   46                   | inc                 esi
            //   10d2                 | adc                 dl, dl
            //   c3                   | ret                 
            //   f7a3feff5959         | mul                 dword ptr [ebx + 0x5959fffe]
            //   85f6                 | test                esi, esi

        $sequence_11 = { e8???????? 59 c3 68d015c072 e9???????? }
            // n = 5, score = 100
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   c3                   | ret                 
            //   68d015c072           | push                0x72c015d0
            //   e9????????           |                     

        $sequence_12 = { 3bc3 7472 8bf8 663918 }
            // n = 4, score = 100
            //   3bc3                 | cmp                 eax, ebx
            //   7472                 | je                  0x74
            //   8bf8                 | mov                 edi, eax
            //   663918               | cmp                 word ptr [eax], bx

        $sequence_13 = { ebab c745e418d14000 817de41cd14000 7311 }
            // n = 4, score = 100
            //   ebab                 | jmp                 0xffffffad
            //   c745e418d14000       | mov                 dword ptr [ebp - 0x1c], 0x40d118
            //   817de41cd14000       | cmp                 dword ptr [ebp - 0x1c], 0x40d11c
            //   7311                 | jae                 0x13

        $sequence_14 = { 05d4a280bb bc16c7a126 ad 57 7168 a9a3c189c2 7fb2 }
            // n = 7, score = 100
            //   05d4a280bb           | add                 eax, 0xbb80a2d4
            //   bc16c7a126           | mov                 esp, 0x26a1c716
            //   ad                   | lodsd               eax, dword ptr [esi]
            //   57                   | push                edi
            //   7168                 | jno                 0x6a
            //   a9a3c189c2           | test                eax, 0xc289c1a3
            //   7fb2                 | jg                  0xffffffb4

        $sequence_15 = { 664d b672 3ef9 76fe ed }
            // n = 5, score = 100
            //   664d                 | dec                 bp
            //   b672                 | mov                 dh, 0x72
            //   3ef9                 | stc                 
            //   76fe                 | jbe                 0
            //   ed                   | in                  eax, dx

    condition:
        7 of them and filesize < 188416
}