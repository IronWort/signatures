rule win_hawkball_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.hawkball."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.hawkball"
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
        $sequence_0 = { 8d84247d020000 c684247c02000000 6a00 50 e8???????? 33c0 }
            // n = 6, score = 200
            //   8d84247d020000       | lea                 eax, dword ptr [esp + 0x27d]
            //   c684247c02000000     | mov                 byte ptr [esp + 0x27c], 0
            //   6a00                 | push                0
            //   50                   | push                eax
            //   e8????????           |                     
            //   33c0                 | xor                 eax, eax

        $sequence_1 = { 837dfc00 b840000000 0f45f8 e8???????? 68fe000000 8bf0 }
            // n = 6, score = 200
            //   837dfc00             | cmp                 dword ptr [ebp - 4], 0
            //   b840000000           | mov                 eax, 0x40
            //   0f45f8               | cmovne              edi, eax
            //   e8????????           |                     
            //   68fe000000           | push                0xfe
            //   8bf0                 | mov                 esi, eax

        $sequence_2 = { 8bf8 8d8558feffff 68000000c0 50 ff15???????? 8bf0 83feff }
            // n = 7, score = 200
            //   8bf8                 | mov                 edi, eax
            //   8d8558feffff         | lea                 eax, dword ptr [ebp - 0x1a8]
            //   68000000c0           | push                0xc0000000
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   83feff               | cmp                 esi, -1

        $sequence_3 = { 50 e8???????? 6880000000 8d85dcfaffff 6a00 50 }
            // n = 6, score = 200
            //   50                   | push                eax
            //   e8????????           |                     
            //   6880000000           | push                0x80
            //   8d85dcfaffff         | lea                 eax, dword ptr [ebp - 0x524]
            //   6a00                 | push                0
            //   50                   | push                eax

        $sequence_4 = { ff75f4 ff75f0 ff75ec 68???????? 50 ff15???????? }
            // n = 6, score = 200
            //   ff75f4               | push                dword ptr [ebp - 0xc]
            //   ff75f0               | push                dword ptr [ebp - 0x10]
            //   ff75ec               | push                dword ptr [ebp - 0x14]
            //   68????????           |                     
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_5 = { ff15???????? 8bf8 85ff 741f 8d45fc 50 ff75fc }
            // n = 7, score = 200
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax
            //   85ff                 | test                edi, edi
            //   741f                 | je                  0x21
            //   8d45fc               | lea                 eax, dword ptr [ebp - 4]
            //   50                   | push                eax
            //   ff75fc               | push                dword ptr [ebp - 4]

        $sequence_6 = { ff15???????? 83c438 8d85d8feffff 50 6804010000 }
            // n = 5, score = 200
            //   ff15????????         |                     
            //   83c438               | add                 esp, 0x38
            //   8d85d8feffff         | lea                 eax, dword ptr [ebp - 0x128]
            //   50                   | push                eax
            //   6804010000           | push                0x104

        $sequence_7 = { 8d85d8faffff 50 56 ff15???????? 56 ff15???????? 56 }
            // n = 7, score = 200
            //   8d85d8faffff         | lea                 eax, dword ptr [ebp - 0x528]
            //   50                   | push                eax
            //   56                   | push                esi
            //   ff15????????         |                     
            //   56                   | push                esi
            //   ff15????????         |                     
            //   56                   | push                esi

        $sequence_8 = { ffd6 ff7304 ffd6 ff7308 }
            // n = 4, score = 200
            //   ffd6                 | call                esi
            //   ff7304               | push                dword ptr [ebx + 4]
            //   ffd6                 | call                esi
            //   ff7308               | push                dword ptr [ebx + 8]

        $sequence_9 = { 55 8bec 81ec8c000000 660f6f05???????? 8bc2 8945d4 }
            // n = 6, score = 200
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   81ec8c000000         | sub                 esp, 0x8c
            //   660f6f05????????     |                     
            //   8bc2                 | mov                 eax, edx
            //   8945d4               | mov                 dword ptr [ebp - 0x2c], eax

    condition:
        7 of them and filesize < 229376
}