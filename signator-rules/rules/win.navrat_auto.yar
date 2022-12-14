rule win_navrat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.navrat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.navrat"
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
        $sequence_0 = { c647033d 85f6 7407 8b7608 83461c02 5f }
            // n = 6, score = 300
            //   c647033d             | mov                 byte ptr [edi + 3], 0x3d
            //   85f6                 | test                esi, esi
            //   7407                 | je                  9
            //   8b7608               | mov                 esi, dword ptr [esi + 8]
            //   83461c02             | add                 dword ptr [esi + 0x1c], 2
            //   5f                   | pop                 edi

        $sequence_1 = { 1bf6 f7de 56 68???????? e8???????? }
            // n = 5, score = 300
            //   1bf6                 | sbb                 esi, esi
            //   f7de                 | neg                 esi
            //   56                   | push                esi
            //   68????????           |                     
            //   e8????????           |                     

        $sequence_2 = { 68???????? 50 8d85f0feffff 8bf1 }
            // n = 4, score = 300
            //   68????????           |                     
            //   50                   | push                eax
            //   8d85f0feffff         | lea                 eax, dword ptr [ebp - 0x110]
            //   8bf1                 | mov                 esi, ecx

        $sequence_3 = { c745d85c4d6963 c745dc726f736f c745e066745c57 c745e4696e646f c745e877735c43 }
            // n = 5, score = 300
            //   c745d85c4d6963       | mov                 dword ptr [ebp - 0x28], 0x63694d5c
            //   c745dc726f736f       | mov                 dword ptr [ebp - 0x24], 0x6f736f72
            //   c745e066745c57       | mov                 dword ptr [ebp - 0x20], 0x575c7466
            //   c745e4696e646f       | mov                 dword ptr [ebp - 0x1c], 0x6f646e69
            //   c745e877735c43       | mov                 dword ptr [ebp - 0x18], 0x435c7377

        $sequence_4 = { 8d48bf 80f919 7707 0fbec0 83e841 }
            // n = 5, score = 300
            //   8d48bf               | lea                 ecx, dword ptr [eax - 0x41]
            //   80f919               | cmp                 cl, 0x19
            //   7707                 | ja                  9
            //   0fbec0               | movsx               eax, al
            //   83e841               | sub                 eax, 0x41

        $sequence_5 = { 8bf0 f7de 1bf6 f7de 56 68???????? }
            // n = 6, score = 300
            //   8bf0                 | mov                 esi, eax
            //   f7de                 | neg                 esi
            //   1bf6                 | sbb                 esi, esi
            //   f7de                 | neg                 esi
            //   56                   | push                esi
            //   68????????           |                     

        $sequence_6 = { 8136efbeadde 50 56 e8???????? }
            // n = 4, score = 300
            //   8136efbeadde         | xor                 dword ptr [esi], 0xdeadbeef
            //   50                   | push                eax
            //   56                   | push                esi
            //   e8????????           |                     

        $sequence_7 = { 56 68???????? 50 8d85f0feffff 8bf1 50 }
            // n = 6, score = 300
            //   56                   | push                esi
            //   68????????           |                     
            //   50                   | push                eax
            //   8d85f0feffff         | lea                 eax, dword ptr [ebp - 0x110]
            //   8bf1                 | mov                 esi, ecx
            //   50                   | push                eax

        $sequence_8 = { 56 50 57 a3???????? ff15???????? 57 }
            // n = 6, score = 300
            //   56                   | push                esi
            //   50                   | push                eax
            //   57                   | push                edi
            //   a3????????           |                     
            //   ff15????????         |                     
            //   57                   | push                edi

        $sequence_9 = { ff15???????? 8136efbeadde 50 56 e8???????? }
            // n = 5, score = 300
            //   ff15????????         |                     
            //   8136efbeadde         | xor                 dword ptr [esi], 0xdeadbeef
            //   50                   | push                eax
            //   56                   | push                esi
            //   e8????????           |                     

    condition:
        7 of them and filesize < 352256
}