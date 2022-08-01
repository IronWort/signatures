rule win_kimjongrat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.kimjongrat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.kimjongrat"
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
        $sequence_0 = { ff702c 6a01 6a57 56 e8???????? 47 83c410 }
            // n = 7, score = 100
            //   ff702c               | push                dword ptr [eax + 0x2c]
            //   6a01                 | push                1
            //   6a57                 | push                0x57
            //   56                   | push                esi
            //   e8????????           |                     
            //   47                   | inc                 edi
            //   83c410               | add                 esp, 0x10

        $sequence_1 = { ff7604 89460c ff15???????? 68???????? ff7604 894610 ff15???????? }
            // n = 7, score = 100
            //   ff7604               | push                dword ptr [esi + 4]
            //   89460c               | mov                 dword ptr [esi + 0xc], eax
            //   ff15????????         |                     
            //   68????????           |                     
            //   ff7604               | push                dword ptr [esi + 4]
            //   894610               | mov                 dword ptr [esi + 0x10], eax
            //   ff15????????         |                     

        $sequence_2 = { ff771c ff75f8 ff7508 e8???????? 0fbf4726 8b4d08 03c3 }
            // n = 7, score = 100
            //   ff771c               | push                dword ptr [edi + 0x1c]
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     
            //   0fbf4726             | movsx               eax, word ptr [edi + 0x26]
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   03c3                 | add                 eax, ebx

        $sequence_3 = { ff75e0 8d4824 89431c 51 894508 89480c e8???????? }
            // n = 7, score = 100
            //   ff75e0               | push                dword ptr [ebp - 0x20]
            //   8d4824               | lea                 ecx, dword ptr [eax + 0x24]
            //   89431c               | mov                 dword ptr [ebx + 0x1c], eax
            //   51                   | push                ecx
            //   894508               | mov                 dword ptr [ebp + 8], eax
            //   89480c               | mov                 dword ptr [eax + 0xc], ecx
            //   e8????????           |                     

        $sequence_4 = { 8b00 68a0010000 56 895df8 8975e4 894dcc 8945d4 }
            // n = 7, score = 100
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   68a0010000           | push                0x1a0
            //   56                   | push                esi
            //   895df8               | mov                 dword ptr [ebp - 8], ebx
            //   8975e4               | mov                 dword ptr [ebp - 0x1c], esi
            //   894dcc               | mov                 dword ptr [ebp - 0x34], ecx
            //   8945d4               | mov                 dword ptr [ebp - 0x2c], eax

        $sequence_5 = { ff7304 ff37 e8???????? 83c408 894304 e9???????? 8d4304 }
            // n = 7, score = 100
            //   ff7304               | push                dword ptr [ebx + 4]
            //   ff37                 | push                dword ptr [edi]
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   894304               | mov                 dword ptr [ebx + 4], eax
            //   e9????????           |                     
            //   8d4304               | lea                 eax, dword ptr [ebx + 4]

        $sequence_6 = { 8b5508 53 0fb74a08 56 8b750c 0fb74608 8bd8 }
            // n = 7, score = 100
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   53                   | push                ebx
            //   0fb74a08             | movzx               ecx, word ptr [edx + 8]
            //   56                   | push                esi
            //   8b750c               | mov                 esi, dword ptr [ebp + 0xc]
            //   0fb74608             | movzx               eax, word ptr [esi + 8]
            //   8bd8                 | mov                 ebx, eax

        $sequence_7 = { e8???????? 8b0d???????? a3???????? a1???????? 83c408 85c0 7412 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8b0d????????         |                     
            //   a3????????           |                     
            //   a1????????           |                     
            //   83c408               | add                 esp, 8
            //   85c0                 | test                eax, eax
            //   7412                 | je                  0x14

        $sequence_8 = { 8b4210 51 ff743804 e8???????? 83c40c 8945e4 85c0 }
            // n = 7, score = 100
            //   8b4210               | mov                 eax, dword ptr [edx + 0x10]
            //   51                   | push                ecx
            //   ff743804             | push                dword ptr [eax + edi + 4]
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8945e4               | mov                 dword ptr [ebp - 0x1c], eax
            //   85c0                 | test                eax, eax

        $sequence_9 = { c6840decbaffff63 e9???????? c6840decbaffff6c e9???????? c6840decbaffff64 e9???????? c6840decbaffff70 }
            // n = 7, score = 100
            //   c6840decbaffff63     | mov                 byte ptr [ebp + ecx - 0x4514], 0x63
            //   e9????????           |                     
            //   c6840decbaffff6c     | mov                 byte ptr [ebp + ecx - 0x4514], 0x6c
            //   e9????????           |                     
            //   c6840decbaffff64     | mov                 byte ptr [ebp + ecx - 0x4514], 0x64
            //   e9????????           |                     
            //   c6840decbaffff70     | mov                 byte ptr [ebp + ecx - 0x4514], 0x70

    condition:
        7 of them and filesize < 1572864
}