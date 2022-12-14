rule win_cueisfry_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.cueisfry."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.cueisfry"
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
        $sequence_0 = { 8d8424a8000000 c78424a800000028010000 50 55 e8???????? }
            // n = 5, score = 100
            //   8d8424a8000000       | lea                 eax, dword ptr [esp + 0xa8]
            //   c78424a800000028010000     | mov    dword ptr [esp + 0xa8], 0x128
            //   50                   | push                eax
            //   55                   | push                ebp
            //   e8????????           |                     

        $sequence_1 = { c644241000 f3ab 66ab aa 0fbec2 50 }
            // n = 6, score = 100
            //   c644241000           | mov                 byte ptr [esp + 0x10], 0
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   66ab                 | stosw               word ptr es:[edi], ax
            //   aa                   | stosb               byte ptr es:[edi], al
            //   0fbec2               | movsx               eax, dl
            //   50                   | push                eax

        $sequence_2 = { 50 6804010000 ff15???????? 8d8c24a4020000 8d9424a0010000 51 68???????? }
            // n = 7, score = 100
            //   50                   | push                eax
            //   6804010000           | push                0x104
            //   ff15????????         |                     
            //   8d8c24a4020000       | lea                 ecx, dword ptr [esp + 0x2a4]
            //   8d9424a0010000       | lea                 edx, dword ptr [esp + 0x1a0]
            //   51                   | push                ecx
            //   68????????           |                     

        $sequence_3 = { 66894c242c 8854242e e8???????? 8b0d???????? 8a15???????? 8be8 8d442414 }
            // n = 7, score = 100
            //   66894c242c           | mov                 word ptr [esp + 0x2c], cx
            //   8854242e             | mov                 byte ptr [esp + 0x2e], dl
            //   e8????????           |                     
            //   8b0d????????         |                     
            //   8a15????????         |                     
            //   8be8                 | mov                 ebp, eax
            //   8d442414             | lea                 eax, dword ptr [esp + 0x14]

        $sequence_4 = { 46 3bf7 7cdd 68???????? }
            // n = 4, score = 100
            //   46                   | inc                 esi
            //   3bf7                 | cmp                 esi, edi
            //   7cdd                 | jl                  0xffffffdf
            //   68????????           |                     

        $sequence_5 = { 33c0 8dbc249d000000 c684249c00000000 f3ab 66ab aa 8d84249c000000 }
            // n = 7, score = 100
            //   33c0                 | xor                 eax, eax
            //   8dbc249d000000       | lea                 edi, dword ptr [esp + 0x9d]
            //   c684249c00000000     | mov                 byte ptr [esp + 0x9c], 0
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   66ab                 | stosw               word ptr es:[edi], ax
            //   aa                   | stosb               byte ptr es:[edi], al
            //   8d84249c000000       | lea                 eax, dword ptr [esp + 0x9c]

        $sequence_6 = { 8bd8 85db 7d0c 68???????? 57 53 e8???????? }
            // n = 7, score = 100
            //   8bd8                 | mov                 ebx, eax
            //   85db                 | test                ebx, ebx
            //   7d0c                 | jge                 0xe
            //   68????????           |                     
            //   57                   | push                edi
            //   53                   | push                ebx
            //   e8????????           |                     

        $sequence_7 = { 52 56 e8???????? 8d45dc 68???????? 50 8975dc }
            // n = 7, score = 100
            //   52                   | push                edx
            //   56                   | push                esi
            //   e8????????           |                     
            //   8d45dc               | lea                 eax, dword ptr [ebp - 0x24]
            //   68????????           |                     
            //   50                   | push                eax
            //   8975dc               | mov                 dword ptr [ebp - 0x24], esi

        $sequence_8 = { e8???????? 8d4c2418 c78424d8030000ffffffff e8???????? 8b8c24d0030000 5f }
            // n = 6, score = 100
            //   e8????????           |                     
            //   8d4c2418             | lea                 ecx, dword ptr [esp + 0x18]
            //   c78424d8030000ffffffff     | mov    dword ptr [esp + 0x3d8], 0xffffffff
            //   e8????????           |                     
            //   8b8c24d0030000       | mov                 ecx, dword ptr [esp + 0x3d0]
            //   5f                   | pop                 edi

        $sequence_9 = { 8dbc2495000000 889c2494000000 f3ab 66ab aa 8d842494000000 }
            // n = 6, score = 100
            //   8dbc2495000000       | lea                 edi, dword ptr [esp + 0x95]
            //   889c2494000000       | mov                 byte ptr [esp + 0x94], bl
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   66ab                 | stosw               word ptr es:[edi], ax
            //   aa                   | stosb               byte ptr es:[edi], al
            //   8d842494000000       | lea                 eax, dword ptr [esp + 0x94]

    condition:
        7 of them and filesize < 81920
}