rule win_remexi_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.remexi."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.remexi"
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
        $sequence_0 = { 56 c706ffffffff e8???????? 83c404 }
            // n = 4, score = 300
            //   56                   | push                esi
            //   c706ffffffff         | mov                 dword ptr [esi], 0xffffffff
            //   e8????????           |                     
            //   83c404               | add                 esp, 4

        $sequence_1 = { 8b95d4feffff 52 6a00 68ffff1f00 ffd7 }
            // n = 5, score = 200
            //   8b95d4feffff         | mov                 edx, dword ptr [ebp - 0x12c]
            //   52                   | push                edx
            //   6a00                 | push                0
            //   68ffff1f00           | push                0x1fffff
            //   ffd7                 | call                edi

        $sequence_2 = { ff15???????? 8bf0 85f6 7513 8b45d8 }
            // n = 5, score = 200
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   85f6                 | test                esi, esi
            //   7513                 | jne                 0x15
            //   8b45d8               | mov                 eax, dword ptr [ebp - 0x28]

        $sequence_3 = { ff15???????? 6a10 8d4ddc 8bf0 }
            // n = 4, score = 200
            //   ff15????????         |                     
            //   6a10                 | push                0x10
            //   8d4ddc               | lea                 ecx, dword ptr [ebp - 0x24]
            //   8bf0                 | mov                 esi, eax

        $sequence_4 = { e8???????? 83ec1c 8bcc 89642430 6aff 53 }
            // n = 6, score = 200
            //   e8????????           |                     
            //   83ec1c               | sub                 esp, 0x1c
            //   8bcc                 | mov                 ecx, esp
            //   89642430             | mov                 dword ptr [esp + 0x30], esp
            //   6aff                 | push                -1
            //   53                   | push                ebx

        $sequence_5 = { 8945e4 8945e8 b802000000 51 668945dc ff15???????? }
            // n = 6, score = 200
            //   8945e4               | mov                 dword ptr [ebp - 0x1c], eax
            //   8945e8               | mov                 dword ptr [ebp - 0x18], eax
            //   b802000000           | mov                 eax, 2
            //   51                   | push                ecx
            //   668945dc             | mov                 word ptr [ebp - 0x24], ax
            //   ff15????????         |                     

        $sequence_6 = { 53 50 ff15???????? 3dffffff00 }
            // n = 4, score = 200
            //   53                   | push                ebx
            //   50                   | push                eax
            //   ff15????????         |                     
            //   3dffffff00           | cmp                 eax, 0xffffff

        $sequence_7 = { c705????????01000000 c705????????00000000 ff15???????? 8b0d???????? 51 ff15???????? }
            // n = 6, score = 200
            //   c705????????01000000     |     
            //   c705????????00000000     |     
            //   ff15????????         |                     
            //   8b0d????????         |                     
            //   51                   | push                ecx
            //   ff15????????         |                     

        $sequence_8 = { 6a01 89470c 57 894710 ff15???????? }
            // n = 5, score = 200
            //   6a01                 | push                1
            //   89470c               | mov                 dword ptr [edi + 0xc], eax
            //   57                   | push                edi
            //   894710               | mov                 dword ptr [edi + 0x10], eax
            //   ff15????????         |                     

        $sequence_9 = { 68???????? 41 50 a3???????? }
            // n = 4, score = 200
            //   68????????           |                     
            //   41                   | inc                 ecx
            //   50                   | push                eax
            //   a3????????           |                     

        $sequence_10 = { 890d???????? ffd6 6a00 6a00 6a00 }
            // n = 5, score = 200
            //   890d????????         |                     
            //   ffd6                 | call                esi
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0

        $sequence_11 = { 8bf0 51 56 ff15???????? 85c0 }
            // n = 5, score = 200
            //   8bf0                 | mov                 esi, eax
            //   51                   | push                ecx
            //   56                   | push                esi
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_12 = { eb23 488d0deba00100 48890c03 4883c130 488d5b08 }
            // n = 5, score = 100
            //   eb23                 | mov                 dword ptr [esp + 0x20], 0xfffffffe
            //   488d0deba00100       | mov                 ebx, ecx
            //   48890c03             | mov                 ecx, 0x8050000
            //   4883c130             | dec                 eax
            //   488d5b08             | cmp                 dword ptr [edi + 0x10], eax

        $sequence_13 = { 4053 4883ec30 48c7442420feffffff 8bd9 b900000508 e8???????? }
            // n = 6, score = 100
            //   4053                 | cmp                 dword ptr [esp + 0xd8], 0x10
            //   4883ec30             | dec                 eax
            //   48c7442420feffffff     | lea    ecx, dword ptr [esi + 0x20]
            //   8bd9                 | dec                 eax
            //   b900000508           | lea                 ecx, dword ptr [esi + 0x28]
            //   e8????????           |                     

        $sequence_14 = { 4c897c2470 c644246000 488bd6 488d4c2460 e8???????? 4883bc24d800000010 }
            // n = 6, score = 100
            //   4c897c2470           | dec                 esp
            //   c644246000           | mov                 dword ptr [esp + 0x70], edi
            //   488bd6               | mov                 byte ptr [esp + 0x60], 0
            //   488d4c2460           | dec                 eax
            //   e8????????           |                     
            //   4883bc24d800000010     | mov    edx, esi

        $sequence_15 = { 48394710 0f95c0 85c0 0f94c0 84c0 7422 }
            // n = 6, score = 100
            //   48394710             | mov                 ecx, dword ptr [esi + 0x10]
            //   0f95c0               | inc                 eax
            //   85c0                 | push                ebx
            //   0f94c0               | dec                 eax
            //   84c0                 | sub                 esp, 0x30
            //   7422                 | dec                 eax

        $sequence_16 = { 4889842498000000 48898424a0000000 c744247038000000 488d0530590200 }
            // n = 4, score = 100
            //   4889842498000000     | lea                 ecx, dword ptr [0x1a0eb]
            //   48898424a0000000     | dec                 eax
            //   c744247038000000     | mov                 dword ptr [ebx + eax], ecx
            //   488d0530590200       | dec                 eax

        $sequence_17 = { 48898424600e0300 498bd8 b9000003a0 e8???????? 48c74424680f000000 }
            // n = 5, score = 100
            //   48898424600e0300     | setne               al
            //   498bd8               | test                eax, eax
            //   b9000003a0           | sete                al
            //   e8????????           |                     
            //   48c74424680f000000     | test    al, al

        $sequence_18 = { e8???????? 498bc7 488b8d30880100 4833cc }
            // n = 4, score = 100
            //   e8????????           |                     
            //   498bc7               | je                  0x2e
            //   488b8d30880100       | jmp                 0x25
            //   4833cc               | dec                 eax

        $sequence_19 = { e8???????? 488d4e20 e8???????? 488d4e28 e8???????? 8b4e10 }
            // n = 6, score = 100
            //   e8????????           |                     
            //   488d4e20             | dec                 eax
            //   e8????????           |                     
            //   488d4e28             | lea                 ecx, dword ptr [esp + 0x60]
            //   e8????????           |                     
            //   8b4e10               | dec                 eax

    condition:
        7 of them and filesize < 614400
}