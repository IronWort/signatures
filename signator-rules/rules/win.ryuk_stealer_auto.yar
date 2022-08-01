rule win_ryuk_stealer_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.ryuk_stealer."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ryuk_stealer"
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
        $sequence_0 = { 50 ff15???????? 8bf0 ff15???????? 85c0 7518 }
            // n = 6, score = 800
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7518                 | jne                 0x1a

        $sequence_1 = { b910270000 f7f1 8bf2 e8???????? 8bc8 }
            // n = 5, score = 800
            //   b910270000           | mov                 ecx, 0x2710
            //   f7f1                 | div                 ecx
            //   8bf2                 | mov                 esi, edx
            //   e8????????           |                     
            //   8bc8                 | mov                 ecx, eax

        $sequence_2 = { 668945ec 8945ee 668945f2 8d45e0 50 }
            // n = 5, score = 800
            //   668945ec             | mov                 word ptr [ebp - 0x14], ax
            //   8945ee               | mov                 dword ptr [ebp - 0x12], eax
            //   668945f2             | mov                 word ptr [ebp - 0xe], ax
            //   8d45e0               | lea                 eax, dword ptr [ebp - 0x20]
            //   50                   | push                eax

        $sequence_3 = { 668945ec 8945ee 668945f2 8d45e0 }
            // n = 4, score = 800
            //   668945ec             | mov                 word ptr [ebp - 0x14], ax
            //   8945ee               | mov                 dword ptr [ebp - 0x12], eax
            //   668945f2             | mov                 word ptr [ebp - 0xe], ax
            //   8d45e0               | lea                 eax, dword ptr [ebp - 0x20]

        $sequence_4 = { 83f805 740a b9???????? e8???????? }
            // n = 4, score = 800
            //   83f805               | cmp                 eax, 5
            //   740a                 | je                  0xc
            //   b9????????           |                     
            //   e8????????           |                     

        $sequence_5 = { ff15???????? 83f805 740a b9???????? e8???????? }
            // n = 5, score = 800
            //   ff15????????         |                     
            //   83f805               | cmp                 eax, 5
            //   740a                 | je                  0xc
            //   b9????????           |                     
            //   e8????????           |                     

        $sequence_6 = { ff15???????? 50 ff15???????? 8bf0 ff15???????? 85c0 7518 }
            // n = 7, score = 800
            //   ff15????????         |                     
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7518                 | jne                 0x1a

        $sequence_7 = { 85c0 7560 8d85b4fdffff 68???????? }
            // n = 4, score = 800
            //   85c0                 | test                eax, eax
            //   7560                 | jne                 0x62
            //   8d85b4fdffff         | lea                 eax, dword ptr [ebp - 0x24c]
            //   68????????           |                     

        $sequence_8 = { e8???????? 99 b9a0860100 f7f9 81c2f8240100 52 }
            // n = 6, score = 800
            //   e8????????           |                     
            //   99                   | cdq                 
            //   b9a0860100           | mov                 ecx, 0x186a0
            //   f7f9                 | idiv                ecx
            //   81c2f8240100         | add                 edx, 0x124f8
            //   52                   | push                edx

        $sequence_9 = { 50 0fb7447302 50 e8???????? }
            // n = 4, score = 800
            //   50                   | push                eax
            //   0fb7447302           | movzx               eax, word ptr [ebx + esi*2 + 2]
            //   50                   | push                eax
            //   e8????????           |                     

    condition:
        7 of them and filesize < 368640
}