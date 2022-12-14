rule win_neteagle_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.neteagle."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.neteagle"
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
        $sequence_0 = { 89542433 e8???????? 8bce e8???????? 8944242b 8954242f }
            // n = 6, score = 100
            //   89542433             | mov                 dword ptr [esp + 0x33], edx
            //   e8????????           |                     
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   8944242b             | mov                 dword ptr [esp + 0x2b], eax
            //   8954242f             | mov                 dword ptr [esp + 0x2f], edx

        $sequence_1 = { 6a0f 8d55e0 51 52 8bcb e8???????? 8b7304 }
            // n = 7, score = 100
            //   6a0f                 | push                0xf
            //   8d55e0               | lea                 edx, dword ptr [ebp - 0x20]
            //   51                   | push                ecx
            //   52                   | push                edx
            //   8bcb                 | mov                 ecx, ebx
            //   e8????????           |                     
            //   8b7304               | mov                 esi, dword ptr [ebx + 4]

        $sequence_2 = { 8bfc 89642438 51 8bcc }
            // n = 4, score = 100
            //   8bfc                 | mov                 edi, esp
            //   89642438             | mov                 dword ptr [esp + 0x38], esp
            //   51                   | push                ecx
            //   8bcc                 | mov                 ecx, esp

        $sequence_3 = { 6a00 52 ffd7 8b4670 85c0 7408 }
            // n = 6, score = 100
            //   6a00                 | push                0
            //   52                   | push                edx
            //   ffd7                 | call                edi
            //   8b4670               | mov                 eax, dword ptr [esi + 0x70]
            //   85c0                 | test                eax, eax
            //   7408                 | je                  0xa

        $sequence_4 = { e8???????? 3bc5 0f8448010000 8b5624 83c9ff 8bfa 33c0 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   3bc5                 | cmp                 eax, ebp
            //   0f8448010000         | je                  0x14e
            //   8b5624               | mov                 edx, dword ptr [esi + 0x24]
            //   83c9ff               | or                  ecx, 0xffffffff
            //   8bfa                 | mov                 edi, edx
            //   33c0                 | xor                 eax, eax

        $sequence_5 = { 68???????? ff15???????? 8bf8 85ff 0f84eb000000 68???????? 57 }
            // n = 7, score = 100
            //   68????????           |                     
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax
            //   85ff                 | test                edi, edi
            //   0f84eb000000         | je                  0xf1
            //   68????????           |                     
            //   57                   | push                edi

        $sequence_6 = { 52 50 8bce e8???????? 8d4de0 c745fc04000000 e8???????? }
            // n = 7, score = 100
            //   52                   | push                edx
            //   50                   | push                eax
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   8d4de0               | lea                 ecx, dword ptr [ebp - 0x20]
            //   c745fc04000000       | mov                 dword ptr [ebp - 4], 4
            //   e8????????           |                     

        $sequence_7 = { 897508 5e 83f901 750d 33db b701 8ad8 }
            // n = 7, score = 100
            //   897508               | mov                 dword ptr [ebp + 8], esi
            //   5e                   | pop                 esi
            //   83f901               | cmp                 ecx, 1
            //   750d                 | jne                 0xf
            //   33db                 | xor                 ebx, ebx
            //   b701                 | mov                 bh, 1
            //   8ad8                 | mov                 bl, al

        $sequence_8 = { 51 e8???????? 8b55d4 6841100000 52 8d8d5cffffff c645fc13 }
            // n = 7, score = 100
            //   51                   | push                ecx
            //   e8????????           |                     
            //   8b55d4               | mov                 edx, dword ptr [ebp - 0x2c]
            //   6841100000           | push                0x1041
            //   52                   | push                edx
            //   8d8d5cffffff         | lea                 ecx, dword ptr [ebp - 0xa4]
            //   c645fc13             | mov                 byte ptr [ebp - 4], 0x13

        $sequence_9 = { 8bce c644244800 e8???????? 8b44241c 85c0 7409 c7460c01000000 }
            // n = 7, score = 100
            //   8bce                 | mov                 ecx, esi
            //   c644244800           | mov                 byte ptr [esp + 0x48], 0
            //   e8????????           |                     
            //   8b44241c             | mov                 eax, dword ptr [esp + 0x1c]
            //   85c0                 | test                eax, eax
            //   7409                 | je                  0xb
            //   c7460c01000000       | mov                 dword ptr [esi + 0xc], 1

    condition:
        7 of them and filesize < 262144
}