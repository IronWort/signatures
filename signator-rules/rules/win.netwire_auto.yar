rule win_netwire_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.netwire."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.netwire"
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
        $sequence_0 = { c744241004020000 8944240c c744240801000000 c744240407000000 }
            // n = 4, score = 1100
            //   c744241004020000     | mov                 dword ptr [esp + 0x10], 0x204
            //   8944240c             | mov                 dword ptr [esp + 0xc], eax
            //   c744240801000000     | mov                 dword ptr [esp + 8], 1
            //   c744240407000000     | mov                 dword ptr [esp + 4], 7

        $sequence_1 = { c744242400000000 c7442420fdffffff c744241c00000000 c744241800000000 c744241400000000 }
            // n = 5, score = 1100
            //   c744242400000000     | mov                 dword ptr [esp + 0x24], 0
            //   c7442420fdffffff     | mov                 dword ptr [esp + 0x20], 0xfffffffd
            //   c744241c00000000     | mov                 dword ptr [esp + 0x1c], 0
            //   c744241800000000     | mov                 dword ptr [esp + 0x18], 0
            //   c744241400000000     | mov                 dword ptr [esp + 0x14], 0

        $sequence_2 = { c744242400000000 c7442420fdffffff c744241c00000000 c744241800000000 c744241400000000 c744241000000000 }
            // n = 6, score = 1100
            //   c744242400000000     | mov                 dword ptr [esp + 0x24], 0
            //   c7442420fdffffff     | mov                 dword ptr [esp + 0x20], 0xfffffffd
            //   c744241c00000000     | mov                 dword ptr [esp + 0x1c], 0
            //   c744241800000000     | mov                 dword ptr [esp + 0x18], 0
            //   c744241400000000     | mov                 dword ptr [esp + 0x14], 0
            //   c744241000000000     | mov                 dword ptr [esp + 0x10], 0

        $sequence_3 = { 890424 e8???????? 83ec10 83f806 }
            // n = 4, score = 1100
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     
            //   83ec10               | sub                 esp, 0x10
            //   83f806               | cmp                 eax, 6

        $sequence_4 = { e8???????? c70424d0070000 e8???????? e9???????? e8???????? }
            // n = 5, score = 1100
            //   e8????????           |                     
            //   c70424d0070000       | mov                 dword ptr [esp], 0x7d0
            //   e8????????           |                     
            //   e9????????           |                     
            //   e8????????           |                     

        $sequence_5 = { e8???????? c7042408000000 e8???????? 84c0 }
            // n = 4, score = 1100
            //   e8????????           |                     
            //   c7042408000000       | mov                 dword ptr [esp], 8
            //   e8????????           |                     
            //   84c0                 | test                al, al

        $sequence_6 = { 740c c7042400000000 e8???????? c70424???????? e8???????? }
            // n = 5, score = 1100
            //   740c                 | je                  0xe
            //   c7042400000000       | mov                 dword ptr [esp], 0
            //   e8????????           |                     
            //   c70424????????       |                     
            //   e8????????           |                     

        $sequence_7 = { e8???????? c7042401000000 e8???????? 84c0 }
            // n = 4, score = 1100
            //   e8????????           |                     
            //   c7042401000000       | mov                 dword ptr [esp], 1
            //   e8????????           |                     
            //   84c0                 | test                al, al

        $sequence_8 = { a3???????? e9???????? c705????????00000000 e9???????? c7042410020000 }
            // n = 5, score = 1100
            //   a3????????           |                     
            //   e9????????           |                     
            //   c705????????00000000     |     
            //   e9????????           |                     
            //   c7042410020000       | mov                 dword ptr [esp], 0x210

        $sequence_9 = { 890424 e8???????? eb11 c7042496000000 e8???????? }
            // n = 5, score = 1100
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     
            //   eb11                 | jmp                 0x13
            //   c7042496000000       | mov                 dword ptr [esp], 0x96
            //   e8????????           |                     

    condition:
        7 of them and filesize < 401408
}