rule win_apocalipto_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.apocalipto."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.apocalipto"
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
        $sequence_0 = { 53 8b5d08 8b750c 8b4d10 85c9 740d 31c0 }
            // n = 7, score = 100
            //   53                   | push                ebx
            //   8b5d08               | mov                 ebx, dword ptr [ebp + 8]
            //   8b750c               | mov                 esi, dword ptr [ebp + 0xc]
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]
            //   85c9                 | test                ecx, ecx
            //   740d                 | je                  0xf
            //   31c0                 | xor                 eax, eax

        $sequence_1 = { 0f84d4070000 c7442404???????? 891c24 ff15???????? 83ec08 a3???????? }
            // n = 6, score = 100
            //   0f84d4070000         | je                  0x7da
            //   c7442404????????     |                     
            //   891c24               | mov                 dword ptr [esp], ebx
            //   ff15????????         |                     
            //   83ec08               | sub                 esp, 8
            //   a3????????           |                     

        $sequence_2 = { a3???????? 85c0 0f84b5090000 c7442404???????? }
            // n = 4, score = 100
            //   a3????????           |                     
            //   85c0                 | test                eax, eax
            //   0f84b5090000         | je                  0x9bb
            //   c7442404????????     |                     

        $sequence_3 = { 85c0 0f845a090000 c7442404???????? 891c24 ff15???????? 83ec08 a3???????? }
            // n = 7, score = 100
            //   85c0                 | test                eax, eax
            //   0f845a090000         | je                  0x960
            //   c7442404????????     |                     
            //   891c24               | mov                 dword ptr [esp], ebx
            //   ff15????????         |                     
            //   83ec08               | sub                 esp, 8
            //   a3????????           |                     

        $sequence_4 = { c7442404???????? 891c24 ff15???????? 83ec08 a3???????? 85c0 0f84480b0000 }
            // n = 7, score = 100
            //   c7442404????????     |                     
            //   891c24               | mov                 dword ptr [esp], ebx
            //   ff15????????         |                     
            //   83ec08               | sub                 esp, 8
            //   a3????????           |                     
            //   85c0                 | test                eax, eax
            //   0f84480b0000         | je                  0xb4e

        $sequence_5 = { ff15???????? 83ec08 a3???????? 85c0 0f8480070000 c7442404???????? 891c24 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   83ec08               | sub                 esp, 8
            //   a3????????           |                     
            //   85c0                 | test                eax, eax
            //   0f8480070000         | je                  0x786
            //   c7442404????????     |                     
            //   891c24               | mov                 dword ptr [esp], ebx

        $sequence_6 = { 7427 803f00 745f 31db 6690 43 }
            // n = 6, score = 100
            //   7427                 | je                  0x29
            //   803f00               | cmp                 byte ptr [edi], 0
            //   745f                 | je                  0x61
            //   31db                 | xor                 ebx, ebx
            //   6690                 | nop                 
            //   43                   | inc                 ebx

        $sequence_7 = { eb8a 31db e9???????? c744240800400000 }
            // n = 4, score = 100
            //   eb8a                 | jmp                 0xffffff8c
            //   31db                 | xor                 ebx, ebx
            //   e9????????           |                     
            //   c744240800400000     | mov                 dword ptr [esp + 8], 0x4000

        $sequence_8 = { ff15???????? 83ec08 a3???????? 85c0 0f84850a0000 c7442404???????? }
            // n = 6, score = 100
            //   ff15????????         |                     
            //   83ec08               | sub                 esp, 8
            //   a3????????           |                     
            //   85c0                 | test                eax, eax
            //   0f84850a0000         | je                  0xa8b
            //   c7442404????????     |                     

        $sequence_9 = { a3???????? 85c0 0f842a0a0000 c7442404???????? 891c24 ff15???????? 83ec08 }
            // n = 7, score = 100
            //   a3????????           |                     
            //   85c0                 | test                eax, eax
            //   0f842a0a0000         | je                  0xa30
            //   c7442404????????     |                     
            //   891c24               | mov                 dword ptr [esp], ebx
            //   ff15????????         |                     
            //   83ec08               | sub                 esp, 8

    condition:
        7 of them and filesize < 212992
}