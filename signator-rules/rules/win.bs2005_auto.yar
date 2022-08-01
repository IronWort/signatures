rule win_bs2005_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.bs2005."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.bs2005"
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
        $sequence_0 = { 771c 0fbeca c0e006 83c104 0ac1 8807 8b45fc }
            // n = 7, score = 100
            //   771c                 | ja                  0x1e
            //   0fbeca               | movsx               ecx, dl
            //   c0e006               | shl                 al, 6
            //   83c104               | add                 ecx, 4
            //   0ac1                 | or                  al, cl
            //   8807                 | mov                 byte ptr [edi], al
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]

        $sequence_1 = { ff15???????? 53 ff15???????? 85c0 0f845f030000 8b500c }
            // n = 6, score = 100
            //   ff15????????         |                     
            //   53                   | push                ebx
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   0f845f030000         | je                  0x365
            //   8b500c               | mov                 edx, dword ptr [eax + 0xc]

        $sequence_2 = { 83f810 7ced 8b4dfc 8b45bc 5e 33cd 83c020 }
            // n = 7, score = 100
            //   83f810               | cmp                 eax, 0x10
            //   7ced                 | jl                  0xffffffef
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   8b45bc               | mov                 eax, dword ptr [ebp - 0x44]
            //   5e                   | pop                 esi
            //   33cd                 | xor                 ecx, ebp
            //   83c020               | add                 eax, 0x20

        $sequence_3 = { e8???????? 8b874c060000 8b08 83b94400040000 8b1d???????? 0f86e5000000 8d4900 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8b874c060000         | mov                 eax, dword ptr [edi + 0x64c]
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   83b94400040000       | cmp                 dword ptr [ecx + 0x40044], 0
            //   8b1d????????         |                     
            //   0f86e5000000         | jbe                 0xeb
            //   8d4900               | lea                 ecx, dword ptr [ecx]

        $sequence_4 = { e8???????? b001 83c404 5f 5e 5b 8be5 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   b001                 | mov                 al, 1
            //   83c404               | add                 esp, 4
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   8be5                 | mov                 esp, ebp

        $sequence_5 = { 57 68???????? 68???????? 52 ffd3 8b4df8 83c410 }
            // n = 7, score = 100
            //   57                   | push                edi
            //   68????????           |                     
            //   68????????           |                     
            //   52                   | push                edx
            //   ffd3                 | call                ebx
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   83c410               | add                 esp, 0x10

        $sequence_6 = { 51 ff15???????? 85c0 741b 8b45fc 29860c010000 898614010200 }
            // n = 7, score = 100
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   741b                 | je                  0x1d
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   29860c010000         | sub                 dword ptr [esi + 0x10c], eax
            //   898614010200         | mov                 dword ptr [esi + 0x20114], eax

        $sequence_7 = { 8b9754060000 83c40c 6a00 6880000000 6a03 6a00 }
            // n = 6, score = 100
            //   8b9754060000         | mov                 edx, dword ptr [edi + 0x654]
            //   83c40c               | add                 esp, 0xc
            //   6a00                 | push                0
            //   6880000000           | push                0x80
            //   6a03                 | push                3
            //   6a00                 | push                0

        $sequence_8 = { bf???????? 33db be???????? b904010000 8bc6 }
            // n = 5, score = 100
            //   bf????????           |                     
            //   33db                 | xor                 ebx, ebx
            //   be????????           |                     
            //   b904010000           | mov                 ecx, 0x104
            //   8bc6                 | mov                 eax, esi

        $sequence_9 = { ffd3 8b85bcfeffff 6a00 50 ff15???????? 8b4dfc 5f }
            // n = 7, score = 100
            //   ffd3                 | call                ebx
            //   8b85bcfeffff         | mov                 eax, dword ptr [ebp - 0x144]
            //   6a00                 | push                0
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   5f                   | pop                 edi

    condition:
        7 of them and filesize < 212992
}