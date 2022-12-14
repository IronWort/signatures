rule win_protonbot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.protonbot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.protonbot"
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
        $sequence_0 = { 8bca c785b8feffff0f000000 c685a4feffff00 8d7101 8a01 }
            // n = 5, score = 400
            //   8bca                 | mov                 ecx, edx
            //   c785b8feffff0f000000     | mov    dword ptr [ebp - 0x148], 0xf
            //   c685a4feffff00       | mov                 byte ptr [ebp - 0x15c], 0
            //   8d7101               | lea                 esi, dword ptr [ecx + 1]
            //   8a01                 | mov                 al, byte ptr [ecx]

        $sequence_1 = { 41 81f970020000 7ce1 8b75ec }
            // n = 4, score = 400
            //   41                   | inc                 ecx
            //   81f970020000         | cmp                 ecx, 0x270
            //   7ce1                 | jl                  0xffffffe3
            //   8b75ec               | mov                 esi, dword ptr [ebp - 0x14]

        $sequence_2 = { c7854cecffff00000000 8bd8 2bd9 3bc8 }
            // n = 4, score = 400
            //   c7854cecffff00000000     | mov    dword ptr [ebp - 0x13b4], 0
            //   8bd8                 | mov                 ebx, eax
            //   2bd9                 | sub                 ebx, ecx
            //   3bc8                 | cmp                 ecx, eax

        $sequence_3 = { 7417 83f8ff 7412 b001 5e 8b4c2408 }
            // n = 6, score = 400
            //   7417                 | je                  0x19
            //   83f8ff               | cmp                 eax, -1
            //   7412                 | je                  0x14
            //   b001                 | mov                 al, 1
            //   5e                   | pop                 esi
            //   8b4c2408             | mov                 ecx, dword ptr [esp + 8]

        $sequence_4 = { c785b4feffff00000000 0f4395d4feffff 8bca c785b8feffff0f000000 c685a4feffff00 }
            // n = 5, score = 400
            //   c785b4feffff00000000     | mov    dword ptr [ebp - 0x14c], 0
            //   0f4395d4feffff       | cmovae              edx, dword ptr [ebp - 0x12c]
            //   8bca                 | mov                 ecx, edx
            //   c785b8feffff0f000000     | mov    dword ptr [ebp - 0x148], 0xf
            //   c685a4feffff00       | mov                 byte ptr [ebp - 0x15c], 0

        $sequence_5 = { 83c418 c645fc01 8d85bcfeffff 83bdd0feffff10 }
            // n = 4, score = 400
            //   83c418               | add                 esp, 0x18
            //   c645fc01             | mov                 byte ptr [ebp - 4], 1
            //   8d85bcfeffff         | lea                 eax, dword ptr [ebp - 0x144]
            //   83bdd0feffff10       | cmp                 dword ptr [ebp - 0x130], 0x10

        $sequence_6 = { e8???????? ffb588fdffff e8???????? 83c40c 8d85d8feffff 6a00 6a00 }
            // n = 7, score = 400
            //   e8????????           |                     
            //   ffb588fdffff         | push                dword ptr [ebp - 0x278]
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8d85d8feffff         | lea                 eax, dword ptr [ebp - 0x128]
            //   6a00                 | push                0
            //   6a00                 | push                0

        $sequence_7 = { 50 51 ff15???????? 8bd0 8995c0f7ffff 85d2 }
            // n = 6, score = 400
            //   50                   | push                eax
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   8bd0                 | mov                 edx, eax
            //   8995c0f7ffff         | mov                 dword ptr [ebp - 0x840], edx
            //   85d2                 | test                edx, edx

        $sequence_8 = { 50 ff15???????? 56 85c0 7404 ffd7 eb02 }
            // n = 7, score = 400
            //   50                   | push                eax
            //   ff15????????         |                     
            //   56                   | push                esi
            //   85c0                 | test                eax, eax
            //   7404                 | je                  6
            //   ffd7                 | call                edi
            //   eb02                 | jmp                 4

        $sequence_9 = { 8b1d???????? be02000000 66a3???????? 6a00 6a00 }
            // n = 5, score = 400
            //   8b1d????????         |                     
            //   be02000000           | mov                 esi, 2
            //   66a3????????         |                     
            //   6a00                 | push                0
            //   6a00                 | push                0

    condition:
        7 of them and filesize < 1073152
}