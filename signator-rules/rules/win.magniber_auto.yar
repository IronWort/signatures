rule win_magniber_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.magniber."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.magniber"
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
        $sequence_0 = { c78568feffff2c9c4000 c7856cfeffff349c4000 c78570feffff3c9c4000 c78574feffff449c4000 }
            // n = 4, score = 400
            //   c78568feffff2c9c4000     | mov    dword ptr [ebp - 0x198], 0x409c2c
            //   c7856cfeffff349c4000     | mov    dword ptr [ebp - 0x194], 0x409c34
            //   c78570feffff3c9c4000     | mov    dword ptr [ebp - 0x190], 0x409c3c
            //   c78574feffff449c4000     | mov    dword ptr [ebp - 0x18c], 0x409c44

        $sequence_1 = { c785e8f9ffff68924000 c785ecf9ffff74924000 c785f0f9ffff80924000 c785f4f9ffff88924000 c785f8f9ffff90924000 c785fcf9ffff98924000 c78500faffffa0924000 }
            // n = 7, score = 400
            //   c785e8f9ffff68924000     | mov    dword ptr [ebp - 0x618], 0x409268
            //   c785ecf9ffff74924000     | mov    dword ptr [ebp - 0x614], 0x409274
            //   c785f0f9ffff80924000     | mov    dword ptr [ebp - 0x610], 0x409280
            //   c785f4f9ffff88924000     | mov    dword ptr [ebp - 0x60c], 0x409288
            //   c785f8f9ffff90924000     | mov    dword ptr [ebp - 0x608], 0x409290
            //   c785fcf9ffff98924000     | mov    dword ptr [ebp - 0x604], 0x409298
            //   c78500faffffa0924000     | mov    dword ptr [ebp - 0x600], 0x4092a0

        $sequence_2 = { 668945e4 b96c000000 66894de6 ba75000000 668955e8 b861000000 668945ea }
            // n = 7, score = 400
            //   668945e4             | mov                 word ptr [ebp - 0x1c], ax
            //   b96c000000           | mov                 ecx, 0x6c
            //   66894de6             | mov                 word ptr [ebp - 0x1a], cx
            //   ba75000000           | mov                 edx, 0x75
            //   668955e8             | mov                 word ptr [ebp - 0x18], dx
            //   b861000000           | mov                 eax, 0x61
            //   668945ea             | mov                 word ptr [ebp - 0x16], ax

        $sequence_3 = { ff15???????? 8945d8 837dd800 7448 8b4df0 }
            // n = 5, score = 400
            //   ff15????????         |                     
            //   8945d8               | mov                 dword ptr [ebp - 0x28], eax
            //   837dd800             | cmp                 dword ptr [ebp - 0x28], 0
            //   7448                 | je                  0x4a
            //   8b4df0               | mov                 ecx, dword ptr [ebp - 0x10]

        $sequence_4 = { c78528fbffff0c954000 c7852cfbffff14954000 c78530fbffff1c954000 c78534fbffff24954000 }
            // n = 4, score = 400
            //   c78528fbffff0c954000     | mov    dword ptr [ebp - 0x4d8], 0x40950c
            //   c7852cfbffff14954000     | mov    dword ptr [ebp - 0x4d4], 0x409514
            //   c78530fbffff1c954000     | mov    dword ptr [ebp - 0x4d0], 0x40951c
            //   c78534fbffff24954000     | mov    dword ptr [ebp - 0x4cc], 0x409524

        $sequence_5 = { 740a 8b55cc 52 ff15???????? 837dc800 }
            // n = 5, score = 400
            //   740a                 | je                  0xc
            //   8b55cc               | mov                 edx, dword ptr [ebp - 0x34]
            //   52                   | push                edx
            //   ff15????????         |                     
            //   837dc800             | cmp                 dword ptr [ebp - 0x38], 0

        $sequence_6 = { ff15???????? 8b45e8 50 ff15???????? 8b4df4 }
            // n = 5, score = 400
            //   ff15????????         |                     
            //   8b45e8               | mov                 eax, dword ptr [ebp - 0x18]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]

        $sequence_7 = { 51 ff15???????? 85c0 7502 ebb9 8b5508 }
            // n = 6, score = 400
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7502                 | jne                 4
            //   ebb9                 | jmp                 0xffffffbb
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]

        $sequence_8 = { c7851cfdffff48994000 c78520fdffff54994000 c78524fdffff60994000 c78528fdffff68994000 c7852cfdffff70994000 c78530fdffff78994000 c78534fdffff80994000 }
            // n = 7, score = 400
            //   c7851cfdffff48994000     | mov    dword ptr [ebp - 0x2e4], 0x409948
            //   c78520fdffff54994000     | mov    dword ptr [ebp - 0x2e0], 0x409954
            //   c78524fdffff60994000     | mov    dword ptr [ebp - 0x2dc], 0x409960
            //   c78528fdffff68994000     | mov    dword ptr [ebp - 0x2d8], 0x409968
            //   c7852cfdffff70994000     | mov    dword ptr [ebp - 0x2d4], 0x409970
            //   c78530fdffff78994000     | mov    dword ptr [ebp - 0x2d0], 0x409978
            //   c78534fdffff80994000     | mov    dword ptr [ebp - 0x2cc], 0x409980

        $sequence_9 = { 8b5508 8b826c040000 50 ff15???????? 85c0 740e 8b4d08 }
            // n = 7, score = 400
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   8b826c040000         | mov                 eax, dword ptr [edx + 0x46c]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   740e                 | je                  0x10
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]

    condition:
        7 of them and filesize < 114688
}