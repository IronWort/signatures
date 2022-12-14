rule win_mydogs_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.mydogs."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.mydogs"
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
        $sequence_0 = { 0f8435040000 8b1d???????? b941000000 898d08f4ffff c78510f4ffff1a000000 8bff }
            // n = 6, score = 200
            //   0f8435040000         | je                  0x43b
            //   8b1d????????         |                     
            //   b941000000           | mov                 ecx, 0x41
            //   898d08f4ffff         | mov                 dword ptr [ebp - 0xbf8], ecx
            //   c78510f4ffff1a000000     | mov    dword ptr [ebp - 0xbf0], 0x1a
            //   8bff                 | mov                 edi, edi

        $sequence_1 = { 8d450b 50 8bcf e8???????? 0fb6462d 88450b }
            // n = 6, score = 200
            //   8d450b               | lea                 eax, dword ptr [ebp + 0xb]
            //   50                   | push                eax
            //   8bcf                 | mov                 ecx, edi
            //   e8????????           |                     
            //   0fb6462d             | movzx               eax, byte ptr [esi + 0x2d]
            //   88450b               | mov                 byte ptr [ebp + 0xb], al

        $sequence_2 = { 83c801 85c0 0f8477000000 8d8544f4ffff 50 0fb78572f5ffff 68???????? }
            // n = 7, score = 200
            //   83c801               | or                  eax, 1
            //   85c0                 | test                eax, eax
            //   0f8477000000         | je                  0x7d
            //   8d8544f4ffff         | lea                 eax, dword ptr [ebp - 0xbbc]
            //   50                   | push                eax
            //   0fb78572f5ffff       | movzx               eax, word ptr [ebp - 0xa8e]
            //   68????????           |                     

        $sequence_3 = { 6a00 8bcf 81e900803ed5 8bc6 6880969800 1ddeb19d01 50 }
            // n = 7, score = 200
            //   6a00                 | push                0
            //   8bcf                 | mov                 ecx, edi
            //   81e900803ed5         | sub                 ecx, 0xd53e8000
            //   8bc6                 | mov                 eax, esi
            //   6880969800           | push                0x989680
            //   1ddeb19d01           | sbb                 eax, 0x19db1de
            //   50                   | push                eax

        $sequence_4 = { 50 2bca 51 8d85a0fdffff 50 53 ffd6 }
            // n = 7, score = 200
            //   50                   | push                eax
            //   2bca                 | sub                 ecx, edx
            //   51                   | push                ecx
            //   8d85a0fdffff         | lea                 eax, dword ptr [ebp - 0x260]
            //   50                   | push                eax
            //   53                   | push                ebx
            //   ffd6                 | call                esi

        $sequence_5 = { 8d8518f4ffff 50 56 ffd3 }
            // n = 4, score = 200
            //   8d8518f4ffff         | lea                 eax, dword ptr [ebp - 0xbe8]
            //   50                   | push                eax
            //   56                   | push                esi
            //   ffd3                 | call                ebx

        $sequence_6 = { e8???????? 8d4ddc 51 8d4dcc 51 }
            // n = 5, score = 200
            //   e8????????           |                     
            //   8d4ddc               | lea                 ecx, dword ptr [ebp - 0x24]
            //   51                   | push                ecx
            //   8d4dcc               | lea                 ecx, dword ptr [ebp - 0x34]
            //   51                   | push                ecx

        $sequence_7 = { 884dee 8b4b58 8bc2 0facc110 }
            // n = 4, score = 200
            //   884dee               | mov                 byte ptr [ebp - 0x12], cl
            //   8b4b58               | mov                 ecx, dword ptr [ebx + 0x58]
            //   8bc2                 | mov                 eax, edx
            //   0facc110             | shrd                ecx, eax, 0x10

        $sequence_8 = { ba???????? e8???????? 8d4ddc 51 8d4dcc 51 50 }
            // n = 7, score = 200
            //   ba????????           |                     
            //   e8????????           |                     
            //   8d4ddc               | lea                 ecx, dword ptr [ebp - 0x24]
            //   51                   | push                ecx
            //   8d4dcc               | lea                 ecx, dword ptr [ebp - 0x34]
            //   51                   | push                ecx
            //   50                   | push                eax

        $sequence_9 = { 75f4 b801000000 5f 5e 5b 8b4dfc 33cd }
            // n = 7, score = 200
            //   75f4                 | jne                 0xfffffff6
            //   b801000000           | mov                 eax, 1
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   33cd                 | xor                 ecx, ebp

    condition:
        7 of them and filesize < 313344
}