rule win_satana_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.satana."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.satana"
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
        $sequence_0 = { 8bff 68???????? e8???????? a1???????? 83c404 85c0 7520 }
            // n = 7, score = 100
            //   8bff                 | mov                 edi, edi
            //   68????????           |                     
            //   e8????????           |                     
            //   a1????????           |                     
            //   83c404               | add                 esp, 4
            //   85c0                 | test                eax, eax
            //   7520                 | jne                 0x22

        $sequence_1 = { 83c408 50 ff15???????? b801000000 5e }
            // n = 5, score = 100
            //   83c408               | add                 esp, 8
            //   50                   | push                eax
            //   ff15????????         |                     
            //   b801000000           | mov                 eax, 1
            //   5e                   | pop                 esi

        $sequence_2 = { 8b35???????? 50 51 ffd6 a3???????? b8???????? }
            // n = 6, score = 100
            //   8b35????????         |                     
            //   50                   | push                eax
            //   51                   | push                ecx
            //   ffd6                 | call                esi
            //   a3????????           |                     
            //   b8????????           |                     

        $sequence_3 = { 33c9 8b45e4 ba02000000 f7e2 0f90c1 f7d9 0bc8 }
            // n = 7, score = 100
            //   33c9                 | xor                 ecx, ecx
            //   8b45e4               | mov                 eax, dword ptr [ebp - 0x1c]
            //   ba02000000           | mov                 edx, 2
            //   f7e2                 | mul                 edx
            //   0f90c1               | seto                cl
            //   f7d9                 | neg                 ecx
            //   0bc8                 | or                  ecx, eax

        $sequence_4 = { 8b16 3b11 757b 83e804 83c104 83c604 83f804 }
            // n = 7, score = 100
            //   8b16                 | mov                 edx, dword ptr [esi]
            //   3b11                 | cmp                 edx, dword ptr [ecx]
            //   757b                 | jne                 0x7d
            //   83e804               | sub                 eax, 4
            //   83c104               | add                 ecx, 4
            //   83c604               | add                 esi, 4
            //   83f804               | cmp                 eax, 4

        $sequence_5 = { 83f802 7409 83f804 0f8594000000 33c9 56 68???????? }
            // n = 7, score = 100
            //   83f802               | cmp                 eax, 2
            //   7409                 | je                  0xb
            //   83f804               | cmp                 eax, 4
            //   0f8594000000         | jne                 0x9a
            //   33c9                 | xor                 ecx, ecx
            //   56                   | push                esi
            //   68????????           |                     

        $sequence_6 = { ff15???????? 8b0d???????? 8b15???????? 6a00 8d45f8 50 }
            // n = 6, score = 100
            //   ff15????????         |                     
            //   8b0d????????         |                     
            //   8b15????????         |                     
            //   6a00                 | push                0
            //   8d45f8               | lea                 eax, dword ptr [ebp - 8]
            //   50                   | push                eax

        $sequence_7 = { 52 53 53 6800000700 50 895df8 ff15???????? }
            // n = 7, score = 100
            //   52                   | push                edx
            //   53                   | push                ebx
            //   53                   | push                ebx
            //   6800000700           | push                0x70000
            //   50                   | push                eax
            //   895df8               | mov                 dword ptr [ebp - 8], ebx
            //   ff15????????         |                     

        $sequence_8 = { 8b0c85d8844100 6a0f 51 ff15???????? e9???????? 8b1d???????? 6a00 }
            // n = 7, score = 100
            //   8b0c85d8844100       | mov                 ecx, dword ptr [eax*4 + 0x4184d8]
            //   6a0f                 | push                0xf
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   e9????????           |                     
            //   8b1d????????         |                     
            //   6a00                 | push                0

        $sequence_9 = { 7508 85db 0f84a6010000 8bce }
            // n = 4, score = 100
            //   7508                 | jne                 0xa
            //   85db                 | test                ebx, ebx
            //   0f84a6010000         | je                  0x1ac
            //   8bce                 | mov                 ecx, esi

    condition:
        7 of them and filesize < 221184
}