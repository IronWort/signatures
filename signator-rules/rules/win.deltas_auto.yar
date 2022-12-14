rule win_deltas_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.deltas."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.deltas"
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
        $sequence_0 = { e8???????? 85c0 7e63 8b4604 8d542418 52 }
            // n = 6, score = 200
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7e63                 | jle                 0x65
            //   8b4604               | mov                 eax, dword ptr [esi + 4]
            //   8d542418             | lea                 edx, dword ptr [esp + 0x18]
            //   52                   | push                edx

        $sequence_1 = { 8bf2 81f900010000 8a443414 885c3414 }
            // n = 4, score = 200
            //   8bf2                 | mov                 esi, edx
            //   81f900010000         | cmp                 ecx, 0x100
            //   8a443414             | mov                 al, byte ptr [esp + esi + 0x14]
            //   885c3414             | mov                 byte ptr [esp + esi + 0x14], bl

        $sequence_2 = { 888c24a9000000 888424aa000000 888424ab000000 889c24ac000000 c644244c53 }
            // n = 5, score = 200
            //   888c24a9000000       | mov                 byte ptr [esp + 0xa9], cl
            //   888424aa000000       | mov                 byte ptr [esp + 0xaa], al
            //   888424ab000000       | mov                 byte ptr [esp + 0xab], al
            //   889c24ac000000       | mov                 byte ptr [esp + 0xac], bl
            //   c644244c53           | mov                 byte ptr [esp + 0x4c], 0x53

        $sequence_3 = { 3bde 7410 5f 5e 5d b803000000 }
            // n = 6, score = 200
            //   3bde                 | cmp                 ebx, esi
            //   7410                 | je                  0x12
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp
            //   b803000000           | mov                 eax, 3

        $sequence_4 = { 55 ff15???????? 899e88040000 5f }
            // n = 4, score = 200
            //   55                   | push                ebp
            //   ff15????????         |                     
            //   899e88040000         | mov                 dword ptr [esi + 0x488], ebx
            //   5f                   | pop                 edi

        $sequence_5 = { ff15???????? 83c408 894304 85c0 741f }
            // n = 5, score = 200
            //   ff15????????         |                     
            //   83c408               | add                 esp, 8
            //   894304               | mov                 dword ptr [ebx + 4], eax
            //   85c0                 | test                eax, eax
            //   741f                 | je                  0x21

        $sequence_6 = { 898d48020000 89bd88440000 8d8588040000 b900100000 3938 }
            // n = 5, score = 200
            //   898d48020000         | mov                 dword ptr [ebp + 0x248], ecx
            //   89bd88440000         | mov                 dword ptr [ebp + 0x4488], edi
            //   8d8588040000         | lea                 eax, dword ptr [ebp + 0x488]
            //   b900100000           | mov                 ecx, 0x1000
            //   3938                 | cmp                 dword ptr [eax], edi

        $sequence_7 = { b940000000 33c0 8d7c241d 33ed f3ab }
            // n = 5, score = 200
            //   b940000000           | mov                 ecx, 0x40
            //   33c0                 | xor                 eax, eax
            //   8d7c241d             | lea                 edi, dword ptr [esp + 0x1d]
            //   33ed                 | xor                 ebp, ebp
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax

        $sequence_8 = { 33ff 89442418 884c2437 8d4c2438 897c2424 897c2410 }
            // n = 6, score = 200
            //   33ff                 | xor                 edi, edi
            //   89442418             | mov                 dword ptr [esp + 0x18], eax
            //   884c2437             | mov                 byte ptr [esp + 0x37], cl
            //   8d4c2438             | lea                 ecx, dword ptr [esp + 0x38]
            //   897c2424             | mov                 dword ptr [esp + 0x24], edi
            //   897c2410             | mov                 dword ptr [esp + 0x10], edi

        $sequence_9 = { 8d542438 52 8b542444 53 }
            // n = 4, score = 200
            //   8d542438             | lea                 edx, dword ptr [esp + 0x38]
            //   52                   | push                edx
            //   8b542444             | mov                 edx, dword ptr [esp + 0x44]
            //   53                   | push                ebx

    condition:
        7 of them and filesize < 90112
}