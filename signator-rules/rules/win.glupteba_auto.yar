rule win_glupteba_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.glupteba."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.glupteba"
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
        $sequence_0 = { 6a06 e8???????? 8bf0 0fb745fb 50 }
            // n = 5, score = 400
            //   6a06                 | push                6
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   0fb745fb             | movzx               eax, word ptr [ebp - 5]
            //   50                   | push                eax

        $sequence_1 = { 8bda c1e708 0b7dec 895dd0 33f7 8b7d10 }
            // n = 6, score = 400
            //   8bda                 | mov                 ebx, edx
            //   c1e708               | shl                 edi, 8
            //   0b7dec               | or                  edi, dword ptr [ebp - 0x14]
            //   895dd0               | mov                 dword ptr [ebp - 0x30], ebx
            //   33f7                 | xor                 esi, edi
            //   8b7d10               | mov                 edi, dword ptr [ebp + 0x10]

        $sequence_2 = { 53 e8???????? 8d85c4f9ffff 56 50 e8???????? 56 }
            // n = 7, score = 400
            //   53                   | push                ebx
            //   e8????????           |                     
            //   8d85c4f9ffff         | lea                 eax, dword ptr [ebp - 0x63c]
            //   56                   | push                esi
            //   50                   | push                eax
            //   e8????????           |                     
            //   56                   | push                esi

        $sequence_3 = { 83450804 33f7 8b7d0c 33de 315df8 891f }
            // n = 6, score = 400
            //   83450804             | add                 dword ptr [ebp + 8], 4
            //   33f7                 | xor                 esi, edi
            //   8b7d0c               | mov                 edi, dword ptr [ebp + 0xc]
            //   33de                 | xor                 ebx, esi
            //   315df8               | xor                 dword ptr [ebp - 8], ebx
            //   891f                 | mov                 dword ptr [edi], ebx

        $sequence_4 = { 8a4609 32c8 884f09 8a4b0a 884309 8a460a 32c8 }
            // n = 7, score = 400
            //   8a4609               | mov                 al, byte ptr [esi + 9]
            //   32c8                 | xor                 cl, al
            //   884f09               | mov                 byte ptr [edi + 9], cl
            //   8a4b0a               | mov                 cl, byte ptr [ebx + 0xa]
            //   884309               | mov                 byte ptr [ebx + 9], al
            //   8a460a               | mov                 al, byte ptr [esi + 0xa]
            //   32c8                 | xor                 cl, al

        $sequence_5 = { c1e907 81e380800000 0bfb 8d1c36 0bcb 8b5df8 }
            // n = 6, score = 400
            //   c1e907               | shr                 ecx, 7
            //   81e380800000         | and                 ebx, 0x8080
            //   0bfb                 | or                  edi, ebx
            //   8d1c36               | lea                 ebx, dword ptr [esi + esi]
            //   0bcb                 | or                  ecx, ebx
            //   8b5df8               | mov                 ebx, dword ptr [ebp - 8]

        $sequence_6 = { c605????????01 eb2e ffd7 99 }
            // n = 4, score = 400
            //   c605????????01       |                     
            //   eb2e                 | jmp                 0x30
            //   ffd7                 | call                edi
            //   99                   | cdq                 

        $sequence_7 = { eb73 56 eb68 385dff }
            // n = 4, score = 400
            //   eb73                 | jmp                 0x75
            //   56                   | push                esi
            //   eb68                 | jmp                 0x6a
            //   385dff               | cmp                 byte ptr [ebp - 1], bl

        $sequence_8 = { 005e3e 46 00ff 3e46 }
            // n = 4, score = 100
            //   005e3e               | add                 byte ptr [esi + 0x3e], bl
            //   46                   | inc                 esi
            //   00ff                 | add                 bh, bh
            //   3e46                 | inc                 esi

        $sequence_9 = { 00cd 3e46 005e3e 46 }
            // n = 4, score = 100
            //   00cd                 | add                 ch, cl
            //   3e46                 | inc                 esi
            //   005e3e               | add                 byte ptr [esi + 0x3e], bl
            //   46                   | inc                 esi

        $sequence_10 = { 0107 eb4d 8b02 89442418 }
            // n = 4, score = 100
            //   0107                 | add                 dword ptr [edi], eax
            //   eb4d                 | jmp                 0x4f
            //   8b02                 | mov                 eax, dword ptr [edx]
            //   89442418             | mov                 dword ptr [esp + 0x18], eax

        $sequence_11 = { 00f1 3d46005e3e 46 00cd }
            // n = 4, score = 100
            //   00f1                 | add                 cl, dh
            //   3d46005e3e           | cmp                 eax, 0x3e5e0046
            //   46                   | inc                 esi
            //   00cd                 | add                 ch, cl

        $sequence_12 = { 00ff 3e46 0012 3f }
            // n = 4, score = 100
            //   00ff                 | add                 bh, bh
            //   3e46                 | inc                 esi
            //   0012                 | add                 byte ptr [edx], dl
            //   3f                   | aas                 

        $sequence_13 = { 0101 03d3 8b4620 8bcb }
            // n = 4, score = 100
            //   0101                 | add                 dword ptr [ecx], eax
            //   03d3                 | add                 edx, ebx
            //   8b4620               | mov                 eax, dword ptr [esi + 0x20]
            //   8bcb                 | mov                 ecx, ebx

        $sequence_14 = { 0106 830702 392e 75a0 }
            // n = 4, score = 100
            //   0106                 | add                 dword ptr [esi], eax
            //   830702               | add                 dword ptr [edi], 2
            //   392e                 | cmp                 dword ptr [esi], ebp
            //   75a0                 | jne                 0xffffffa2

        $sequence_15 = { 0012 3f 46 008bff558bec }
            // n = 4, score = 100
            //   0012                 | add                 byte ptr [edx], dl
            //   3f                   | aas                 
            //   46                   | inc                 esi
            //   008bff558bec         | add                 byte ptr [ebx - 0x1374aa01], cl

    condition:
        7 of them and filesize < 1417216
}