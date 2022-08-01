rule win_grease_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.grease."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.grease"
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
        $sequence_0 = { 48897c2440 488d442450 4889442438 48897c2430 }
            // n = 4, score = 300
            //   48897c2440           | inc                 ebp
            //   488d442450           | xor                 eax, eax
            //   4889442438           | dec                 eax
            //   48897c2430           | mov                 ecx, 0x80000002

        $sequence_1 = { ff15???????? b801000000 488b8c2480020000 4833cc e8???????? }
            // n = 5, score = 300
            //   ff15????????         |                     
            //   b801000000           | mov                 dword ptr [esp + 0x28], 0x2001f
            //   488b8c2480020000     | mov                 dword ptr [esp + 0x20], ebx
            //   4833cc               | test                eax, eax
            //   e8????????           |                     

        $sequence_2 = { 41b904000000 4533c0 488bd3 c744242804000000 4889442420 }
            // n = 5, score = 300
            //   41b904000000         | dec                 eax
            //   4533c0               | mov                 ecx, 0x80000002
            //   488bd3               | mov                 dword ptr [esp + 0x28], 0x2001f
            //   c744242804000000     | mov                 dword ptr [esp + 0x20], ebx
            //   4889442420           | test                eax, eax

        $sequence_3 = { 4533c0 48c7c102000080 c74424281f000200 895c2420 ff15???????? 85c0 }
            // n = 6, score = 300
            //   4533c0               | jne                 0x36
            //   48c7c102000080       | dec                 eax
            //   c74424281f000200     | mov                 ecx, dword ptr [esp + 0x50]
            //   895c2420             | dec                 eax
            //   ff15????????         |                     
            //   85c0                 | lea                 eax, dword ptr [esp + 0x58]

        $sequence_4 = { 7534 488b4c2450 488d442458 41b904000000 4533c0 }
            // n = 5, score = 300
            //   7534                 | xor                 ecx, ecx
            //   488b4c2450           | inc                 ebp
            //   488d442458           | xor                 eax, eax
            //   41b904000000         | mov                 dword ptr [esp + 0x28], 0xf003f
            //   4533c0               | mov                 dword ptr [esp + 0x20], edi

        $sequence_5 = { 48895c2440 48895c2458 895c2460 48895c2468 }
            // n = 4, score = 300
            //   48895c2440           | dec                 eax
            //   48895c2458           | mov                 dword ptr [esp + 0x40], ebx
            //   895c2460             | dec                 eax
            //   48895c2468           | mov                 dword ptr [esp + 0x58], ebx

        $sequence_6 = { 4533c9 4533c0 c74424283f000f00 897c2420 ff15???????? }
            // n = 5, score = 300
            //   4533c9               | mov                 dword ptr [esp + 0x60], ebx
            //   4533c0               | dec                 eax
            //   c74424283f000f00     | mov                 dword ptr [esp + 0x68], ebx
            //   897c2420             | inc                 ebp
            //   ff15????????         |                     

        $sequence_7 = { 895c2420 ff15???????? 85c0 0f85e7000000 488b4c2460 488d442458 }
            // n = 6, score = 300
            //   895c2420             | dec                 eax
            //   ff15????????         |                     
            //   85c0                 | mov                 ecx, dword ptr [esp + 0x280]
            //   0f85e7000000         | dec                 eax
            //   488b4c2460           | xor                 ecx, esp
            //   488d442458           | inc                 ecx

        $sequence_8 = { 7521 8b542410 6a04 8d4c241c 51 6a04 53 }
            // n = 7, score = 200
            //   7521                 | jne                 0x23
            //   8b542410             | mov                 edx, dword ptr [esp + 0x10]
            //   6a04                 | push                4
            //   8d4c241c             | lea                 ecx, dword ptr [esp + 0x1c]
            //   51                   | push                ecx
            //   6a04                 | push                4
            //   53                   | push                ebx

        $sequence_9 = { 8d8c240c010000 51 ffd6 8d542404 52 8d84240c010000 }
            // n = 6, score = 200
            //   8d8c240c010000       | lea                 ecx, dword ptr [esp + 0x10c]
            //   51                   | push                ecx
            //   ffd6                 | call                esi
            //   8d542404             | lea                 edx, dword ptr [esp + 4]
            //   52                   | push                edx
            //   8d84240c010000       | lea                 eax, dword ptr [esp + 0x10c]

        $sequence_10 = { 8d9b00000000 8a10 83c001 3ad3 75f7 2bc1 53 }
            // n = 7, score = 200
            //   8d9b00000000         | lea                 ebx, dword ptr [ebx]
            //   8a10                 | mov                 dl, byte ptr [eax]
            //   83c001               | add                 eax, 1
            //   3ad3                 | cmp                 dl, bl
            //   75f7                 | jne                 0xfffffff9
            //   2bc1                 | sub                 eax, ecx
            //   53                   | push                ebx

        $sequence_11 = { 8d442420 68???????? 50 e8???????? 83c428 }
            // n = 5, score = 200
            //   8d442420             | lea                 eax, dword ptr [esp + 0x20]
            //   68????????           |                     
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c428               | add                 esp, 0x28

        $sequence_12 = { 51 56 66899c2440010000 66899c2446010000 66899c244a010000 66899c244c010000 66c784244e0100005d00 }
            // n = 7, score = 200
            //   51                   | push                ecx
            //   56                   | push                esi
            //   66899c2440010000     | mov                 word ptr [esp + 0x140], bx
            //   66899c2446010000     | mov                 word ptr [esp + 0x146], bx
            //   66899c244a010000     | mov                 word ptr [esp + 0x14a], bx
            //   66899c244c010000     | mov                 word ptr [esp + 0x14c], bx
            //   66c784244e0100005d00     | mov    word ptr [esp + 0x14e], 0x5d

        $sequence_13 = { 53 68???????? 50 895c242c }
            // n = 4, score = 200
            //   53                   | push                ebx
            //   68????????           |                     
            //   50                   | push                eax
            //   895c242c             | mov                 dword ptr [esp + 0x2c], ebx

        $sequence_14 = { c644243850 c644243952 c644243a65 c644243b67 c644243c01 }
            // n = 5, score = 200
            //   c644243850           | mov                 byte ptr [esp + 0x38], 0x50
            //   c644243952           | mov                 byte ptr [esp + 0x39], 0x52
            //   c644243a65           | mov                 byte ptr [esp + 0x3a], 0x65
            //   c644243b67           | mov                 byte ptr [esp + 0x3b], 0x67
            //   c644243c01           | mov                 byte ptr [esp + 0x3c], 1

        $sequence_15 = { 53 68???????? 52 897c2430 ffd5 }
            // n = 5, score = 200
            //   53                   | push                ebx
            //   68????????           |                     
            //   52                   | push                edx
            //   897c2430             | mov                 dword ptr [esp + 0x30], edi
            //   ffd5                 | call                ebp

    condition:
        7 of them and filesize < 278528
}