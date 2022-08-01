rule win_mofksys_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.mofksys."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.mofksys"
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
        $sequence_0 = { 51 6a01 ff15???????? f7d8 1bc0 f7d8 0bf0 }
            // n = 7, score = 100
            //   51                   | push                ecx
            //   6a01                 | push                1
            //   ff15????????         |                     
            //   f7d8                 | neg                 eax
            //   1bc0                 | sbb                 eax, eax
            //   f7d8                 | neg                 eax
            //   0bf0                 | or                  esi, eax

        $sequence_1 = { 8d8574fdffff 50 e8???????? 8d8d74fdffff 51 8d9578fdffff 52 }
            // n = 7, score = 100
            //   8d8574fdffff         | lea                 eax, dword ptr [ebp - 0x28c]
            //   50                   | push                eax
            //   e8????????           |                     
            //   8d8d74fdffff         | lea                 ecx, dword ptr [ebp - 0x28c]
            //   51                   | push                ecx
            //   8d9578fdffff         | lea                 edx, dword ptr [ebp - 0x288]
            //   52                   | push                edx

        $sequence_2 = { 80fa01 0f8587000000 a1???????? 3b05???????? 0f8467010000 e8???????? 8845cc }
            // n = 7, score = 100
            //   80fa01               | cmp                 dl, 1
            //   0f8587000000         | jne                 0x8d
            //   a1????????           |                     
            //   3b05????????         |                     
            //   0f8467010000         | je                  0x16d
            //   e8????????           |                     
            //   8845cc               | mov                 byte ptr [ebp - 0x34], al

        $sequence_3 = { ff15???????? 895de0 8b7d08 8b07 3bc3 0f8e1a030000 899d94feffff }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   895de0               | mov                 dword ptr [ebp - 0x20], ebx
            //   8b7d08               | mov                 edi, dword ptr [ebp + 8]
            //   8b07                 | mov                 eax, dword ptr [edi]
            //   3bc3                 | cmp                 eax, ebx
            //   0f8e1a030000         | jle                 0x320
            //   899d94feffff         | mov                 dword ptr [ebp - 0x16c], ebx

        $sequence_4 = { 52 6a02 ff15???????? 83c40c eb95 c745fc0c000000 8b45d8 }
            // n = 7, score = 100
            //   52                   | push                edx
            //   6a02                 | push                2
            //   ff15????????         |                     
            //   83c40c               | add                 esp, 0xc
            //   eb95                 | jmp                 0xffffff97
            //   c745fc0c000000       | mov                 dword ptr [ebp - 4], 0xc
            //   8b45d8               | mov                 eax, dword ptr [ebp - 0x28]

        $sequence_5 = { 51 e8???????? 89854cffffff ffd6 399d4cffffff 0f848c010000 8b558c }
            // n = 7, score = 100
            //   51                   | push                ecx
            //   e8????????           |                     
            //   89854cffffff         | mov                 dword ptr [ebp - 0xb4], eax
            //   ffd6                 | call                esi
            //   399d4cffffff         | cmp                 dword ptr [ebp - 0xb4], ebx
            //   0f848c010000         | je                  0x192
            //   8b558c               | mov                 edx, dword ptr [ebp - 0x74]

        $sequence_6 = { 83c40c c745fc06000000 e9???????? c745fc07000000 68???????? 6a00 ff15???????? }
            // n = 7, score = 100
            //   83c40c               | add                 esp, 0xc
            //   c745fc06000000       | mov                 dword ptr [ebp - 4], 6
            //   e9????????           |                     
            //   c745fc07000000       | mov                 dword ptr [ebp - 4], 7
            //   68????????           |                     
            //   6a00                 | push                0
            //   ff15????????         |                     

        $sequence_7 = { 52 e8???????? ffd6 6a00 8d45d8 50 }
            // n = 6, score = 100
            //   52                   | push                edx
            //   e8????????           |                     
            //   ffd6                 | call                esi
            //   6a00                 | push                0
            //   8d45d8               | lea                 eax, dword ptr [ebp - 0x28]
            //   50                   | push                eax

        $sequence_8 = { 8b9570fdffff 52 e8???????? 898550fdffff ff15???????? 8b856cfdffff 50 }
            // n = 7, score = 100
            //   8b9570fdffff         | mov                 edx, dword ptr [ebp - 0x290]
            //   52                   | push                edx
            //   e8????????           |                     
            //   898550fdffff         | mov                 dword ptr [ebp - 0x2b0], eax
            //   ff15????????         |                     
            //   8b856cfdffff         | mov                 eax, dword ptr [ebp - 0x294]
            //   50                   | push                eax

        $sequence_9 = { 8bd0 8d4dc0 ffd6 8b0d???????? 8b15???????? 50 8d4590 }
            // n = 7, score = 100
            //   8bd0                 | mov                 edx, eax
            //   8d4dc0               | lea                 ecx, dword ptr [ebp - 0x40]
            //   ffd6                 | call                esi
            //   8b0d????????         |                     
            //   8b15????????         |                     
            //   50                   | push                eax
            //   8d4590               | lea                 eax, dword ptr [ebp - 0x70]

    condition:
        7 of them and filesize < 401408
}