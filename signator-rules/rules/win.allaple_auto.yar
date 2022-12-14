rule win_allaple_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.allaple."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.allaple"
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
        $sequence_0 = { 0f8471040000 68???????? ffb56cffffff e8???????? 0bc0 0f8559040000 8d4584 }
            // n = 7, score = 300
            //   0f8471040000         | je                  0x477
            //   68????????           |                     
            //   ffb56cffffff         | push                dword ptr [ebp - 0x94]
            //   e8????????           |                     
            //   0bc0                 | or                  eax, eax
            //   0f8559040000         | jne                 0x45f
            //   8d4584               | lea                 eax, dword ptr [ebp - 0x7c]

        $sequence_1 = { 817c38fc68746d6c 7552 6858020000 e8???????? 8945f8 8d863e010000 50 }
            // n = 7, score = 300
            //   817c38fc68746d6c     | cmp                 dword ptr [eax + edi - 4], 0x6c6d7468
            //   7552                 | jne                 0x54
            //   6858020000           | push                0x258
            //   e8????????           |                     
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   8d863e010000         | lea                 eax, dword ptr [esi + 0x13e]
            //   50                   | push                eax

        $sequence_2 = { 8bec 81c4ecfdffff 57 56 }
            // n = 4, score = 300
            //   8bec                 | mov                 ebp, esp
            //   81c4ecfdffff         | add                 esp, 0xfffffdec
            //   57                   | push                edi
            //   56                   | push                esi

        $sequence_3 = { e8???????? 8d85ecf8ffff 50 68???????? 8d859cfdffff }
            // n = 5, score = 300
            //   e8????????           |                     
            //   8d85ecf8ffff         | lea                 eax, dword ptr [ebp - 0x714]
            //   50                   | push                eax
            //   68????????           |                     
            //   8d859cfdffff         | lea                 eax, dword ptr [ebp - 0x264]

        $sequence_4 = { 334df4 8b55f8 894a4c 8b45fc 8b4850 334df4 8b55f8 }
            // n = 7, score = 300
            //   334df4               | xor                 ecx, dword ptr [ebp - 0xc]
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]
            //   894a4c               | mov                 dword ptr [edx + 0x4c], ecx
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   8b4850               | mov                 ecx, dword ptr [eax + 0x50]
            //   334df4               | xor                 ecx, dword ptr [ebp - 0xc]
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]

        $sequence_5 = { 83c02a 66894621 83c623 6a07 68???????? 56 e8???????? }
            // n = 7, score = 300
            //   83c02a               | add                 eax, 0x2a
            //   66894621             | mov                 word ptr [esi + 0x21], ax
            //   83c623               | add                 esi, 0x23
            //   6a07                 | push                7
            //   68????????           |                     
            //   56                   | push                esi
            //   e8????????           |                     

        $sequence_6 = { 8a0411 8b55f8 8d8c95d4faffff 8b55f4 88040a ff45f4 837df404 }
            // n = 7, score = 300
            //   8a0411               | mov                 al, byte ptr [ecx + edx]
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]
            //   8d8c95d4faffff       | lea                 ecx, dword ptr [ebp + edx*4 - 0x52c]
            //   8b55f4               | mov                 edx, dword ptr [ebp - 0xc]
            //   88040a               | mov                 byte ptr [edx + ecx], al
            //   ff45f4               | inc                 dword ptr [ebp - 0xc]
            //   837df404             | cmp                 dword ptr [ebp - 0xc], 4

        $sequence_7 = { 8b55f8 8d8402019546fd 8945f8 8b4df8 c1e116 8b55f8 }
            // n = 6, score = 300
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]
            //   8d8402019546fd       | lea                 eax, dword ptr [edx + eax - 0x2b96aff]
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   c1e116               | shl                 ecx, 0x16
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]

        $sequence_8 = { 750f 6a00 6a00 6a00 8d45c4 50 e8???????? }
            // n = 7, score = 300
            //   750f                 | jne                 0x11
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   8d45c4               | lea                 eax, dword ptr [ebp - 0x3c]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_9 = { 55 8bec 83c4e8 57 56 53 68???????? }
            // n = 7, score = 300
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83c4e8               | add                 esp, -0x18
            //   57                   | push                edi
            //   56                   | push                esi
            //   53                   | push                ebx
            //   68????????           |                     

    condition:
        7 of them and filesize < 253952
}