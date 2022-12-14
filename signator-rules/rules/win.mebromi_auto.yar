rule win_mebromi_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.mebromi."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.mebromi"
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
        $sequence_0 = { 68000000c0 68???????? ff15???????? 8b3d???????? 83f8ff a3???????? 7544 }
            // n = 7, score = 100
            //   68000000c0           | push                0xc0000000
            //   68????????           |                     
            //   ff15????????         |                     
            //   8b3d????????         |                     
            //   83f8ff               | cmp                 eax, -1
            //   a3????????           |                     
            //   7544                 | jne                 0x46

        $sequence_1 = { 8bf0 85f6 7416 57 56 }
            // n = 5, score = 100
            //   8bf0                 | mov                 esi, eax
            //   85f6                 | test                esi, esi
            //   7416                 | je                  0x18
            //   57                   | push                edi
            //   56                   | push                esi

        $sequence_2 = { ff2495082c2900 8bc7 ba03000000 83e904 }
            // n = 4, score = 100
            //   ff2495082c2900       | jmp                 dword ptr [edx*4 + 0x292c08]
            //   8bc7                 | mov                 eax, edi
            //   ba03000000           | mov                 edx, 3
            //   83e904               | sub                 ecx, 4

        $sequence_3 = { 56 56 56 56 b8???????? ff742420 }
            // n = 6, score = 100
            //   56                   | push                esi
            //   56                   | push                esi
            //   56                   | push                esi
            //   56                   | push                esi
            //   b8????????           |                     
            //   ff742420             | push                dword ptr [esp + 0x20]

        $sequence_4 = { c3 837c240400 56 7430 }
            // n = 4, score = 100
            //   c3                   | ret                 
            //   837c240400           | cmp                 dword ptr [esp + 4], 0
            //   56                   | push                esi
            //   7430                 | je                  0x32

        $sequence_5 = { 57 50 6a01 56 ff15???????? 56 }
            // n = 6, score = 100
            //   57                   | push                edi
            //   50                   | push                eax
            //   6a01                 | push                1
            //   56                   | push                esi
            //   ff15????????         |                     
            //   56                   | push                esi

        $sequence_6 = { 8d4508 8db694702900 6a00 50 }
            // n = 4, score = 100
            //   8d4508               | lea                 eax, dword ptr [ebp + 8]
            //   8db694702900         | lea                 esi, dword ptr [esi + 0x297094]
            //   6a00                 | push                0
            //   50                   | push                eax

        $sequence_7 = { 6a01 68???????? 56 e8???????? 83c410 85c0 }
            // n = 6, score = 100
            //   6a01                 | push                1
            //   68????????           |                     
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   85c0                 | test                eax, eax

        $sequence_8 = { 6880000000 6a03 55 55 68000000c0 68???????? ff15???????? }
            // n = 7, score = 100
            //   6880000000           | push                0x80
            //   6a03                 | push                3
            //   55                   | push                ebp
            //   55                   | push                ebp
            //   68000000c0           | push                0xc0000000
            //   68????????           |                     
            //   ff15????????         |                     

        $sequence_9 = { ebe0 80a0009f290000 40 3bc6 72be 5e c9 }
            // n = 7, score = 100
            //   ebe0                 | jmp                 0xffffffe2
            //   80a0009f290000       | and                 byte ptr [eax + 0x299f00], 0
            //   40                   | inc                 eax
            //   3bc6                 | cmp                 eax, esi
            //   72be                 | jb                  0xffffffc0
            //   5e                   | pop                 esi
            //   c9                   | leave               

    condition:
        7 of them and filesize < 106496
}