rule win_necurs_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.necurs."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.necurs"
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
        $sequence_0 = { 13f2 a3???????? 8935???????? 890d???????? 8bc1 5e }
            // n = 6, score = 1300
            //   13f2                 | adc                 esi, edx
            //   a3????????           |                     
            //   8935????????         |                     
            //   890d????????         |                     
            //   8bc1                 | mov                 eax, ecx
            //   5e                   | pop                 esi

        $sequence_1 = { 397508 7604 33c0 eb12 e8???????? 2b7508 }
            // n = 6, score = 1300
            //   397508               | cmp                 dword ptr [ebp + 8], esi
            //   7604                 | jbe                 6
            //   33c0                 | xor                 eax, eax
            //   eb12                 | jmp                 0x14
            //   e8????????           |                     
            //   2b7508               | sub                 esi, dword ptr [ebp + 8]

        $sequence_2 = { 0f31 8bc8 a1???????? 56 }
            // n = 4, score = 1300
            //   0f31                 | rdtsc               
            //   8bc8                 | mov                 ecx, eax
            //   a1????????           |                     
            //   56                   | push                esi

        $sequence_3 = { 890d???????? 8bc1 5e c3 55 8bec 56 }
            // n = 7, score = 1300
            //   890d????????         |                     
            //   8bc1                 | mov                 eax, ecx
            //   5e                   | pop                 esi
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   56                   | push                esi

        $sequence_4 = { 33d2 46 f7f6 8bc2 034508 5e 5d }
            // n = 7, score = 1300
            //   33d2                 | xor                 edx, edx
            //   46                   | inc                 esi
            //   f7f6                 | div                 esi
            //   8bc2                 | mov                 eax, edx
            //   034508               | add                 eax, dword ptr [ebp + 8]
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp

        $sequence_5 = { 33d2 030d???????? a3???????? a1???????? 13f2 a3???????? 8935???????? }
            // n = 7, score = 1300
            //   33d2                 | xor                 edx, edx
            //   030d????????         |                     
            //   a3????????           |                     
            //   a1????????           |                     
            //   13f2                 | adc                 esi, edx
            //   a3????????           |                     
            //   8935????????         |                     

        $sequence_6 = { 03c8 a1???????? 13f2 33d2 030d???????? a3???????? }
            // n = 6, score = 1300
            //   03c8                 | add                 ecx, eax
            //   a1????????           |                     
            //   13f2                 | adc                 esi, edx
            //   33d2                 | xor                 edx, edx
            //   030d????????         |                     
            //   a3????????           |                     

        $sequence_7 = { 56 8bf2 ba06e0a636 f7e2 03c8 a1???????? 13f2 }
            // n = 7, score = 1300
            //   56                   | push                esi
            //   8bf2                 | mov                 esi, edx
            //   ba06e0a636           | mov                 edx, 0x36a6e006
            //   f7e2                 | mul                 edx
            //   03c8                 | add                 ecx, eax
            //   a1????????           |                     
            //   13f2                 | adc                 esi, edx

        $sequence_8 = { 8d85ecfbffff 57 50 e8???????? 83c410 }
            // n = 5, score = 1100
            //   8d85ecfbffff         | lea                 eax, dword ptr [ebp - 0x414]
            //   57                   | push                edi
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10

        $sequence_9 = { 33d7 33c1 52 50 e8???????? }
            // n = 5, score = 900
            //   33d7                 | xor                 edx, edi
            //   33c1                 | xor                 eax, ecx
            //   52                   | push                edx
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_10 = { 33d2 5e 5f c9 c3 8b35???????? }
            // n = 6, score = 800
            //   33d2                 | xor                 edx, edx
            //   5e                   | pop                 esi
            //   5f                   | pop                 edi
            //   c9                   | leave               
            //   c3                   | ret                 
            //   8b35????????         |                     

        $sequence_11 = { 59 59 85c0 74ce }
            // n = 4, score = 800
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   85c0                 | test                eax, eax
            //   74ce                 | je                  0xffffffd0

        $sequence_12 = { 57 57 57 8d8574ffffff }
            // n = 4, score = 800
            //   57                   | push                edi
            //   57                   | push                edi
            //   57                   | push                edi
            //   8d8574ffffff         | lea                 eax, dword ptr [ebp - 0x8c]

        $sequence_13 = { 6a7b 50 ffd6 8bf8 59 59 }
            // n = 6, score = 800
            //   6a7b                 | push                0x7b
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   8bf8                 | mov                 edi, eax
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx

        $sequence_14 = { 0bc7 7409 8bc1 8bd7 e9???????? }
            // n = 5, score = 800
            //   0bc7                 | or                  eax, edi
            //   7409                 | je                  0xb
            //   8bc1                 | mov                 eax, ecx
            //   8bd7                 | mov                 edx, edi
            //   e9????????           |                     

        $sequence_15 = { 8bd7 e9???????? 83caff 8bc2 e9???????? }
            // n = 5, score = 800
            //   8bd7                 | mov                 edx, edi
            //   e9????????           |                     
            //   83caff               | or                  edx, 0xffffffff
            //   8bc2                 | mov                 eax, edx
            //   e9????????           |                     

    condition:
        7 of them and filesize < 475136
}