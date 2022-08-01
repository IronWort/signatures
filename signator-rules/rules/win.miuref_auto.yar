rule win_miuref_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.miuref."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.miuref"
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
        $sequence_0 = { 2bfa 3bc7 7520 6a7f 50 51 e8???????? }
            // n = 7, score = 200
            //   2bfa                 | sub                 edi, edx
            //   3bc7                 | cmp                 eax, edi
            //   7520                 | jne                 0x22
            //   6a7f                 | push                0x7f
            //   50                   | push                eax
            //   51                   | push                ecx
            //   e8????????           |                     

        $sequence_1 = { 53 ff36 ffd7 ff753c 56 e8???????? ff7538 }
            // n = 7, score = 200
            //   53                   | push                ebx
            //   ff36                 | push                dword ptr [esi]
            //   ffd7                 | call                edi
            //   ff753c               | push                dword ptr [ebp + 0x3c]
            //   56                   | push                esi
            //   e8????????           |                     
            //   ff7538               | push                dword ptr [ebp + 0x38]

        $sequence_2 = { e8???????? 83c41c 5f c705????????01000000 5e }
            // n = 5, score = 200
            //   e8????????           |                     
            //   83c41c               | add                 esp, 0x1c
            //   5f                   | pop                 edi
            //   c705????????01000000     |     
            //   5e                   | pop                 esi

        $sequence_3 = { ff742408 6a01 ff74240c e8???????? 83c40c c3 8b442404 }
            // n = 7, score = 200
            //   ff742408             | push                dword ptr [esp + 8]
            //   6a01                 | push                1
            //   ff74240c             | push                dword ptr [esp + 0xc]
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   c3                   | ret                 
            //   8b442404             | mov                 eax, dword ptr [esp + 4]

        $sequence_4 = { ff75f4 57 ff75f8 ff15???????? 85c0 74c6 6800010000 }
            // n = 7, score = 200
            //   ff75f4               | push                dword ptr [ebp - 0xc]
            //   57                   | push                edi
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   74c6                 | je                  0xffffffc8
            //   6800010000           | push                0x100

        $sequence_5 = { 8b4124 83f801 7514 ff7514 ff7510 ff750c }
            // n = 6, score = 200
            //   8b4124               | mov                 eax, dword ptr [ecx + 0x24]
            //   83f801               | cmp                 eax, 1
            //   7514                 | jne                 0x16
            //   ff7514               | push                dword ptr [ebp + 0x14]
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   ff750c               | push                dword ptr [ebp + 0xc]

        $sequence_6 = { 8b4508 03c7 8bc8 2bcf 880e 46 }
            // n = 6, score = 200
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   03c7                 | add                 eax, edi
            //   8bc8                 | mov                 ecx, eax
            //   2bcf                 | sub                 ecx, edi
            //   880e                 | mov                 byte ptr [esi], cl
            //   46                   | inc                 esi

        $sequence_7 = { 56 57 be04080000 56 33ff 6a01 }
            // n = 6, score = 200
            //   56                   | push                esi
            //   57                   | push                edi
            //   be04080000           | mov                 esi, 0x804
            //   56                   | push                esi
            //   33ff                 | xor                 edi, edi
            //   6a01                 | push                1

        $sequence_8 = { e8???????? 83c40c 837c241000 7508 c744241010000000 53 e8???????? }
            // n = 7, score = 200
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   837c241000           | cmp                 dword ptr [esp + 0x10], 0
            //   7508                 | jne                 0xa
            //   c744241010000000     | mov                 dword ptr [esp + 0x10], 0x10
            //   53                   | push                ebx
            //   e8????????           |                     

        $sequence_9 = { 8903 e8???????? 83c420 894510 85c0 7463 8d45d8 }
            // n = 7, score = 200
            //   8903                 | mov                 dword ptr [ebx], eax
            //   e8????????           |                     
            //   83c420               | add                 esp, 0x20
            //   894510               | mov                 dword ptr [ebp + 0x10], eax
            //   85c0                 | test                eax, eax
            //   7463                 | je                  0x65
            //   8d45d8               | lea                 eax, dword ptr [ebp - 0x28]

    condition:
        7 of them and filesize < 180224
}