rule win_chinad_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.chinad."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.chinad"
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
        $sequence_0 = { 8b45c0 899544ffffff 99 898dd4feffff 89855cffffff 89953cffffff }
            // n = 6, score = 200
            //   8b45c0               | mov                 eax, dword ptr [ebp - 0x40]
            //   899544ffffff         | mov                 dword ptr [ebp - 0xbc], edx
            //   99                   | cdq                 
            //   898dd4feffff         | mov                 dword ptr [ebp - 0x12c], ecx
            //   89855cffffff         | mov                 dword ptr [ebp - 0xa4], eax
            //   89953cffffff         | mov                 dword ptr [ebp - 0xc4], edx

        $sequence_1 = { 898d54ffffff 8b9554ffffff 899568ffffff 8b8568ffffff 50 8b8d78ffffff 51 }
            // n = 7, score = 200
            //   898d54ffffff         | mov                 dword ptr [ebp - 0xac], ecx
            //   8b9554ffffff         | mov                 edx, dword ptr [ebp - 0xac]
            //   899568ffffff         | mov                 dword ptr [ebp - 0x98], edx
            //   8b8568ffffff         | mov                 eax, dword ptr [ebp - 0x98]
            //   50                   | push                eax
            //   8b8d78ffffff         | mov                 ecx, dword ptr [ebp - 0x88]
            //   51                   | push                ecx

        $sequence_2 = { ff15???????? 6810270000 ff15???????? 68???????? 6a01 6a00 ff15???????? }
            // n = 7, score = 200
            //   ff15????????         |                     
            //   6810270000           | push                0x2710
            //   ff15????????         |                     
            //   68????????           |                     
            //   6a01                 | push                1
            //   6a00                 | push                0
            //   ff15????????         |                     

        $sequence_3 = { 8b4808 898d4cffffff 8b4810 898de4feffff 8b4814 894da4 8b4818 }
            // n = 7, score = 200
            //   8b4808               | mov                 ecx, dword ptr [eax + 8]
            //   898d4cffffff         | mov                 dword ptr [ebp - 0xb4], ecx
            //   8b4810               | mov                 ecx, dword ptr [eax + 0x10]
            //   898de4feffff         | mov                 dword ptr [ebp - 0x11c], ecx
            //   8b4814               | mov                 ecx, dword ptr [eax + 0x14]
            //   894da4               | mov                 dword ptr [ebp - 0x5c], ecx
            //   8b4818               | mov                 ecx, dword ptr [eax + 0x18]

        $sequence_4 = { 83d000 894df4 56 ff75dc 0facc71a ff75d4 c1f81a }
            // n = 7, score = 200
            //   83d000               | adc                 eax, 0
            //   894df4               | mov                 dword ptr [ebp - 0xc], ecx
            //   56                   | push                esi
            //   ff75dc               | push                dword ptr [ebp - 0x24]
            //   0facc71a             | shrd                edi, eax, 0x1a
            //   ff75d4               | push                dword ptr [ebp - 0x2c]
            //   c1f81a               | sar                 eax, 0x1a

        $sequence_5 = { 891a 8b5d0c 0fa4c319 8b5d8c c1e019 2bc8 8b8530ffffff }
            // n = 7, score = 200
            //   891a                 | mov                 dword ptr [edx], ebx
            //   8b5d0c               | mov                 ebx, dword ptr [ebp + 0xc]
            //   0fa4c319             | shld                ebx, eax, 0x19
            //   8b5d8c               | mov                 ebx, dword ptr [ebp - 0x74]
            //   c1e019               | shl                 eax, 0x19
            //   2bc8                 | sub                 ecx, eax
            //   8b8530ffffff         | mov                 eax, dword ptr [ebp - 0xd0]

        $sequence_6 = { ff75e8 1155f4 ffb53cffffff ffb55cffffff e8???????? ff758c 0145f8 }
            // n = 7, score = 200
            //   ff75e8               | push                dword ptr [ebp - 0x18]
            //   1155f4               | adc                 dword ptr [ebp - 0xc], edx
            //   ffb53cffffff         | push                dword ptr [ebp - 0xc4]
            //   ffb55cffffff         | push                dword ptr [ebp - 0xa4]
            //   e8????????           |                     
            //   ff758c               | push                dword ptr [ebp - 0x74]
            //   0145f8               | add                 dword ptr [ebp - 8], eax

        $sequence_7 = { c1e90e 0bd0 8b8524fdffff 0bf1 338520fdffff 33fe }
            // n = 6, score = 200
            //   c1e90e               | shr                 ecx, 0xe
            //   0bd0                 | or                  edx, eax
            //   8b8524fdffff         | mov                 eax, dword ptr [ebp - 0x2dc]
            //   0bf1                 | or                  esi, ecx
            //   338520fdffff         | xor                 eax, dword ptr [ebp - 0x2e0]
            //   33fe                 | xor                 edi, esi

        $sequence_8 = { 8b4de0 33c8 8b45ec 03c1 894de0 6a0d 50 }
            // n = 7, score = 200
            //   8b4de0               | mov                 ecx, dword ptr [ebp - 0x20]
            //   33c8                 | xor                 ecx, eax
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   03c1                 | add                 eax, ecx
            //   894de0               | mov                 dword ptr [ebp - 0x20], ecx
            //   6a0d                 | push                0xd
            //   50                   | push                eax

        $sequence_9 = { e8???????? 8d45d4 50 50 e8???????? 83c414 be31000000 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   8d45d4               | lea                 eax, dword ptr [ebp - 0x2c]
            //   50                   | push                eax
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c414               | add                 esp, 0x14
            //   be31000000           | mov                 esi, 0x31

    condition:
        7 of them and filesize < 598016
}