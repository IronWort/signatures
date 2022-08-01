rule win_dexter_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.dexter."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.dexter"
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
        $sequence_0 = { e8???????? 83c40c 833d????????01 752e }
            // n = 4, score = 400
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   833d????????01       |                     
            //   752e                 | jne                 0x30

        $sequence_1 = { 83f801 7411 68???????? 8b4d08 51 ff15???????? eb18 }
            // n = 7, score = 400
            //   83f801               | cmp                 eax, 1
            //   7411                 | je                  0x13
            //   68????????           |                     
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   eb18                 | jmp                 0x1a

        $sequence_2 = { 0f85bc000000 e8???????? a3???????? 6808020000 }
            // n = 4, score = 400
            //   0f85bc000000         | jne                 0xc2
            //   e8????????           |                     
            //   a3????????           |                     
            //   6808020000           | push                0x208

        $sequence_3 = { 68???????? ff15???????? 50 8b45fc 50 68???????? }
            // n = 6, score = 400
            //   68????????           |                     
            //   ff15????????         |                     
            //   50                   | push                eax
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   50                   | push                eax
            //   68????????           |                     

        $sequence_4 = { e8???????? 83c40c c705????????00000000 a1???????? 0305???????? 8945fc 8b4d0c }
            // n = 7, score = 400
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   c705????????00000000     |     
            //   a1????????           |                     
            //   0305????????         |                     
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]

        $sequence_5 = { 6a0a 68???????? 68???????? ff15???????? 50 68???????? }
            // n = 6, score = 400
            //   6a0a                 | push                0xa
            //   68????????           |                     
            //   68????????           |                     
            //   ff15????????         |                     
            //   50                   | push                eax
            //   68????????           |                     

        $sequence_6 = { ff15???????? 8b55f8 52 8b4510 50 }
            // n = 5, score = 400
            //   ff15????????         |                     
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]
            //   52                   | push                edx
            //   8b4510               | mov                 eax, dword ptr [ebp + 0x10]
            //   50                   | push                eax

        $sequence_7 = { 83c40c 034508 894508 8b5508 83c201 }
            // n = 5, score = 400
            //   83c40c               | add                 esp, 0xc
            //   034508               | add                 eax, dword ptr [ebp + 8]
            //   894508               | mov                 dword ptr [ebp + 8], eax
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   83c201               | add                 edx, 1

        $sequence_8 = { 8b4510 8a4dfa 8808 8b5510 83c201 895510 }
            // n = 6, score = 400
            //   8b4510               | mov                 eax, dword ptr [ebp + 0x10]
            //   8a4dfa               | mov                 cl, byte ptr [ebp - 6]
            //   8808                 | mov                 byte ptr [eax], cl
            //   8b5510               | mov                 edx, dword ptr [ebp + 0x10]
            //   83c201               | add                 edx, 1
            //   895510               | mov                 dword ptr [ebp + 0x10], edx

        $sequence_9 = { 6a0a 68???????? 68???????? ff15???????? 50 68???????? e8???????? }
            // n = 7, score = 400
            //   6a0a                 | push                0xa
            //   68????????           |                     
            //   68????????           |                     
            //   ff15????????         |                     
            //   50                   | push                eax
            //   68????????           |                     
            //   e8????????           |                     

    condition:
        7 of them and filesize < 98304
}