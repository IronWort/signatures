rule win_skip20_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.skip20."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.skip20"
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
        $sequence_0 = { b900020000 e8???????? 448b9c24d8000000 4585db 7531 }
            // n = 5, score = 200
            //   b900020000           | inc                 ecx
            //   e8????????           |                     
            //   448b9c24d8000000     | mov                 eax, ebx
            //   4585db               | dec                 ecx
            //   7531                 | arpl                ax, cx

        $sequence_1 = { 41ffc0 4183e20f 410fb6043a 488b7c2410 }
            // n = 4, score = 200
            //   41ffc0               | mov                 ecx, 0xd
            //   4183e20f             | dec                 esp
            //   410fb6043a           | lea                 eax, dword ptr [esp + 0x90]
            //   488b7c2410           | jne                 0xffffffe0

        $sequence_2 = { 75de 418bc3 4963c8 41ffc0 }
            // n = 4, score = 200
            //   75de                 | mov                 dword ptr [esp + 0x94], 0x48f28b48
            //   418bc3               | mov                 dword ptr [esp + 0x98], 0x8545f98b
            //   4963c8               | mov                 byte ptr [esp + 0x9c], 0xc0
            //   41ffc0               | inc                 ecx

        $sequence_3 = { 4489542428 44895c2420 488d1517310100 488d0df02e0100 e8???????? }
            // n = 5, score = 200
            //   4489542428           | inc                 ecx
            //   44895c2420           | inc                 eax
            //   488d1517310100       | inc                 ecx
            //   488d0df02e0100       | inc                 eax
            //   e8????????           |                     

        $sequence_4 = { 486308 48894e08 4883471004 837f1c02 7516 }
            // n = 5, score = 200
            //   486308               | inc                 ecx
            //   48894e08             | and                 edx, 0xf
            //   4883471004           | inc                 ecx
            //   837f1c02             | movzx               eax, byte ptr [edx + edi]
            //   7516                 | dec                 eax

        $sequence_5 = { 4c896c2450 c7842490000000204963d8 c7842494000000488bf248 c78424980000008bf94585 c684249c000000c0 41b90d000000 4c8d842490000000 }
            // n = 7, score = 200
            //   4c896c2450           | inc                 ecx
            //   c7842490000000204963d8     | or    dword ptr [eax], 0x2000000
            //   c7842494000000488bf248     | inc    ecx
            //   c78424980000008bf94585     | movzx    eax, byte ptr [edx]
            //   c684249c000000c0     | dec                 esp
            //   41b90d000000         | mov                 dword ptr [esp + 0x50], ebp
            //   4c8d842490000000     | mov                 dword ptr [esp + 0x90], 0xd8634920

        $sequence_6 = { 4803cb ffe1 4183f902 0f8510010000 41810800000002 410fb602 }
            // n = 6, score = 200
            //   4803cb               | dec                 eax
            //   ffe1                 | add                 ecx, ebx
            //   4183f902             | jmp                 ecx
            //   0f8510010000         | inc                 ecx
            //   41810800000002       | cmp                 ecx, 2
            //   410fb602             | jne                 0x116

        $sequence_7 = { 4189809c000000 488b4210 498980a0000000 66394a18 7557 }
            // n = 5, score = 200
            //   4189809c000000       | mov                 edi, dword ptr [esp + 0x10]
            //   488b4210             | mov                 ecx, 0x200
            //   498980a0000000       | inc                 esp
            //   66394a18             | mov                 ebx, dword ptr [esp + 0xd8]
            //   7557                 | inc                 ebp

    condition:
        7 of them and filesize < 794624
}