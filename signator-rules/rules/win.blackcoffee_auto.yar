rule win_blackcoffee_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.blackcoffee."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.blackcoffee"
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
        $sequence_0 = { 53 56 57 bf00100000 6a40 }
            // n = 5, score = 100
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   bf00100000           | mov                 edi, 0x1000
            //   6a40                 | push                0x40

        $sequence_1 = { 6a01 56 8d4710 56 50 56 }
            // n = 6, score = 100
            //   6a01                 | push                1
            //   56                   | push                esi
            //   8d4710               | lea                 eax, dword ptr [edi + 0x10]
            //   56                   | push                esi
            //   50                   | push                eax
            //   56                   | push                esi

        $sequence_2 = { 03f3 e8???????? 6854414449 8906 e8???????? ff750c 894604 }
            // n = 7, score = 100
            //   03f3                 | add                 esi, ebx
            //   e8????????           |                     
            //   6854414449           | push                0x49444154
            //   8906                 | mov                 dword ptr [esi], eax
            //   e8????????           |                     
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   894604               | mov                 dword ptr [esi + 4], eax

        $sequence_3 = { ffd0 3bc6 0f8c22020000 3975f0 }
            // n = 4, score = 100
            //   ffd0                 | call                eax
            //   3bc6                 | cmp                 eax, esi
            //   0f8c22020000         | jl                  0x228
            //   3975f0               | cmp                 dword ptr [ebp - 0x10], esi

        $sequence_4 = { 6880000000 8d85b4fcffff 56 50 ffd7 83c414 66899db2fdffff }
            // n = 7, score = 100
            //   6880000000           | push                0x80
            //   8d85b4fcffff         | lea                 eax, dword ptr [ebp - 0x34c]
            //   56                   | push                esi
            //   50                   | push                eax
            //   ffd7                 | call                edi
            //   83c414               | add                 esp, 0x14
            //   66899db2fdffff       | mov                 word ptr [ebp - 0x24e], bx

        $sequence_5 = { 57 8d8550edffff 6aff 50 ff75fc ffd6 57 }
            // n = 7, score = 100
            //   57                   | push                edi
            //   8d8550edffff         | lea                 eax, dword ptr [ebp - 0x12b0]
            //   6aff                 | push                -1
            //   50                   | push                eax
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ffd6                 | call                esi
            //   57                   | push                edi

        $sequence_6 = { 09450c ff45fc 83450808 ebd0 8b048558db0010 8b4b08 23450c }
            // n = 7, score = 100
            //   09450c               | or                  dword ptr [ebp + 0xc], eax
            //   ff45fc               | inc                 dword ptr [ebp - 4]
            //   83450808             | add                 dword ptr [ebp + 8], 8
            //   ebd0                 | jmp                 0xffffffd2
            //   8b048558db0010       | mov                 eax, dword ptr [eax*4 + 0x1000db58]
            //   8b4b08               | mov                 ecx, dword ptr [ebx + 8]
            //   23450c               | and                 eax, dword ptr [ebp + 0xc]

        $sequence_7 = { 50 ffd3 83c418 81c718010000 ff4d08 758e }
            // n = 6, score = 100
            //   50                   | push                eax
            //   ffd3                 | call                ebx
            //   83c418               | add                 esp, 0x18
            //   81c718010000         | add                 edi, 0x118
            //   ff4d08               | dec                 dword ptr [ebp + 8]
            //   758e                 | jne                 0xffffff90

        $sequence_8 = { 7603 6a7f 58 50 8d8560ffffff ffb600010000 50 }
            // n = 7, score = 100
            //   7603                 | jbe                 5
            //   6a7f                 | push                0x7f
            //   58                   | pop                 eax
            //   50                   | push                eax
            //   8d8560ffffff         | lea                 eax, dword ptr [ebp - 0xa0]
            //   ffb600010000         | push                dword ptr [esi + 0x100]
            //   50                   | push                eax

        $sequence_9 = { 2bc6 50 8b45ec 03c6 50 }
            // n = 5, score = 100
            //   2bc6                 | sub                 eax, esi
            //   50                   | push                eax
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   03c6                 | add                 eax, esi
            //   50                   | push                eax

    condition:
        7 of them and filesize < 118784
}