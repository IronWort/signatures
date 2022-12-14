rule win_plaintee_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.plaintee."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.plaintee"
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
        $sequence_0 = { f3a5 a4 83c9ff 8bfb f2ae f7d1 }
            // n = 6, score = 300
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   a4                   | movsb               byte ptr es:[edi], byte ptr [esi]
            //   83c9ff               | or                  ecx, 0xffffffff
            //   8bfb                 | mov                 edi, ebx
            //   f2ae                 | repne scasb         al, byte ptr es:[edi]
            //   f7d1                 | not                 ecx

        $sequence_1 = { 3dd5010000 72ea b90f000000 33c0 }
            // n = 4, score = 300
            //   3dd5010000           | cmp                 eax, 0x1d5
            //   72ea                 | jb                  0xffffffec
            //   b90f000000           | mov                 ecx, 0xf
            //   33c0                 | xor                 eax, eax

        $sequence_2 = { 7e0f 53 8a1c08 32da 881c08 40 }
            // n = 6, score = 300
            //   7e0f                 | jle                 0x11
            //   53                   | push                ebx
            //   8a1c08               | mov                 bl, byte ptr [eax + ecx]
            //   32da                 | xor                 bl, dl
            //   881c08               | mov                 byte ptr [eax + ecx], bl
            //   40                   | inc                 eax

        $sequence_3 = { 8b400c 33c9 33d2 8b00 8a4803 8a5002 51 }
            // n = 7, score = 300
            //   8b400c               | mov                 eax, dword ptr [eax + 0xc]
            //   33c9                 | xor                 ecx, ecx
            //   33d2                 | xor                 edx, edx
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   8a4803               | mov                 cl, byte ptr [eax + 3]
            //   8a5002               | mov                 dl, byte ptr [eax + 2]
            //   51                   | push                ecx

        $sequence_4 = { 6a02 ff15???????? 83f8ff 898638010000 }
            // n = 4, score = 300
            //   6a02                 | push                2
            //   ff15????????         |                     
            //   83f8ff               | cmp                 eax, -1
            //   898638010000         | mov                 dword ptr [esi + 0x138], eax

        $sequence_5 = { 50 ff15???????? 83f85a 721a 8a16 }
            // n = 5, score = 300
            //   50                   | push                eax
            //   ff15????????         |                     
            //   83f85a               | cmp                 eax, 0x5a
            //   721a                 | jb                  0x1c
            //   8a16                 | mov                 dl, byte ptr [esi]

        $sequence_6 = { 7e0f 53 8a1c31 32da }
            // n = 4, score = 300
            //   7e0f                 | jle                 0x11
            //   53                   | push                ebx
            //   8a1c31               | mov                 bl, byte ptr [ecx + esi]
            //   32da                 | xor                 bl, dl

        $sequence_7 = { 7e0f 53 8a1c31 32da 881c31 41 3bc8 }
            // n = 7, score = 300
            //   7e0f                 | jle                 0x11
            //   53                   | push                ebx
            //   8a1c31               | mov                 bl, byte ptr [ecx + esi]
            //   32da                 | xor                 bl, dl
            //   881c31               | mov                 byte ptr [ecx + esi], bl
            //   41                   | inc                 ecx
            //   3bc8                 | cmp                 ecx, eax

        $sequence_8 = { 52 56 50 ff15???????? 83f85a 721a 8a16 }
            // n = 7, score = 300
            //   52                   | push                edx
            //   56                   | push                esi
            //   50                   | push                eax
            //   ff15????????         |                     
            //   83f85a               | cmp                 eax, 0x5a
            //   721a                 | jb                  0x1c
            //   8a16                 | mov                 dl, byte ptr [esi]

        $sequence_9 = { 8bf1 6802020000 ff15???????? 85c0 740a b001 }
            // n = 6, score = 300
            //   8bf1                 | mov                 esi, ecx
            //   6802020000           | push                0x202
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   740a                 | je                  0xc
            //   b001                 | mov                 al, 1

    condition:
        7 of them and filesize < 73728
}