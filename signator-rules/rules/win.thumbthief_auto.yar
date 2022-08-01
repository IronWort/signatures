rule win_thumbthief_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.thumbthief."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.thumbthief"
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
        $sequence_0 = { ff7010 e8???????? 0fb786aa000000 8d4dc8 c1e80d 83e001 50 }
            // n = 7, score = 100
            //   ff7010               | push                dword ptr [eax + 0x10]
            //   e8????????           |                     
            //   0fb786aa000000       | movzx               eax, word ptr [esi + 0xaa]
            //   8d4dc8               | lea                 ecx, dword ptr [ebp - 0x38]
            //   c1e80d               | shr                 eax, 0xd
            //   83e001               | and                 eax, 1
            //   50                   | push                eax

        $sequence_1 = { e8???????? c645fc01 8d4de0 e8???????? bf???????? 8bce 57 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   c645fc01             | mov                 byte ptr [ebp - 4], 1
            //   8d4de0               | lea                 ecx, dword ptr [ebp - 0x20]
            //   e8????????           |                     
            //   bf????????           |                     
            //   8bce                 | mov                 ecx, esi
            //   57                   | push                edi

        $sequence_2 = { e8???????? ffb6e0010000 8bcf e8???????? 8d9594feffff b941040000 e8???????? }
            // n = 7, score = 100
            //   e8????????           |                     
            //   ffb6e0010000         | push                dword ptr [esi + 0x1e0]
            //   8bcf                 | mov                 ecx, edi
            //   e8????????           |                     
            //   8d9594feffff         | lea                 edx, dword ptr [ebp - 0x16c]
            //   b941040000           | mov                 ecx, 0x441
            //   e8????????           |                     

        $sequence_3 = { e8???????? c645fc1a 8d8f20090000 e8???????? c645fc1b 8d8f60090000 e8???????? }
            // n = 7, score = 100
            //   e8????????           |                     
            //   c645fc1a             | mov                 byte ptr [ebp - 4], 0x1a
            //   8d8f20090000         | lea                 ecx, dword ptr [edi + 0x920]
            //   e8????????           |                     
            //   c645fc1b             | mov                 byte ptr [ebp - 4], 0x1b
            //   8d8f60090000         | lea                 ecx, dword ptr [edi + 0x960]
            //   e8????????           |                     

        $sequence_4 = { e8???????? 8bce e8???????? 8b06 8bce ff5004 8bce }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   8bce                 | mov                 ecx, esi
            //   ff5004               | call                dword ptr [eax + 4]
            //   8bce                 | mov                 ecx, esi

        $sequence_5 = { e8???????? c645fc05 8d8d50ffffff e8???????? c645fc06 8d8d3cffffff e8???????? }
            // n = 7, score = 100
            //   e8????????           |                     
            //   c645fc05             | mov                 byte ptr [ebp - 4], 5
            //   8d8d50ffffff         | lea                 ecx, dword ptr [ebp - 0xb0]
            //   e8????????           |                     
            //   c645fc06             | mov                 byte ptr [ebp - 4], 6
            //   8d8d3cffffff         | lea                 ecx, dword ptr [ebp - 0xc4]
            //   e8????????           |                     

        $sequence_6 = { e8???????? c645fc00 8d4dcc e8???????? 834dfcff 8d8d68ffffff e8???????? }
            // n = 7, score = 100
            //   e8????????           |                     
            //   c645fc00             | mov                 byte ptr [ebp - 4], 0
            //   8d4dcc               | lea                 ecx, dword ptr [ebp - 0x34]
            //   e8????????           |                     
            //   834dfcff             | or                  dword ptr [ebp - 4], 0xffffffff
            //   8d8d68ffffff         | lea                 ecx, dword ptr [ebp - 0x98]
            //   e8????????           |                     

        $sequence_7 = { e8???????? 8d44247c 8bce 50 ff7608 e8???????? c68424880100002f }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8d44247c             | lea                 eax, dword ptr [esp + 0x7c]
            //   8bce                 | mov                 ecx, esi
            //   50                   | push                eax
            //   ff7608               | push                dword ptr [esi + 8]
            //   e8????????           |                     
            //   c68424880100002f     | mov                 byte ptr [esp + 0x188], 0x2f

        $sequence_8 = { e8???????? 8d4de0 ff7010 e8???????? 0fb6467f 8d4dc8 50 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8d4de0               | lea                 ecx, dword ptr [ebp - 0x20]
            //   ff7010               | push                dword ptr [eax + 0x10]
            //   e8????????           |                     
            //   0fb6467f             | movzx               eax, byte ptr [esi + 0x7f]
            //   8d4dc8               | lea                 ecx, dword ptr [ebp - 0x38]
            //   50                   | push                eax

        $sequence_9 = { ebaf 6afa 6a03 68c8000000 ffb598fdffff ff15???????? 0fb7c8 }
            // n = 7, score = 100
            //   ebaf                 | jmp                 0xffffffb1
            //   6afa                 | push                -6
            //   6a03                 | push                3
            //   68c8000000           | push                0xc8
            //   ffb598fdffff         | push                dword ptr [ebp - 0x268]
            //   ff15????????         |                     
            //   0fb7c8               | movzx               ecx, ax

    condition:
        7 of them and filesize < 4235264
}