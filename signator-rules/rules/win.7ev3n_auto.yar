rule win_7ev3n_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.7ev3n."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.7ev3n"
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
        $sequence_0 = { 0f84027b0000 8dbd1cefffff 8d4f02 0f1f840000000000 668b07 83c702 }
            // n = 6, score = 100
            //   0f84027b0000         | je                  0x7b08
            //   8dbd1cefffff         | lea                 edi, dword ptr [ebp - 0x10e4]
            //   8d4f02               | lea                 ecx, dword ptr [edi + 2]
            //   0f1f840000000000     | nop                 dword ptr [eax + eax]
            //   668b07               | mov                 ax, word ptr [edi]
            //   83c702               | add                 edi, 2

        $sequence_1 = { 83c702 6685c0 75f5 2bf9 d1ff 6a00 8d85f8eeffff }
            // n = 7, score = 100
            //   83c702               | add                 edi, 2
            //   6685c0               | test                ax, ax
            //   75f5                 | jne                 0xfffffff7
            //   2bf9                 | sub                 edi, ecx
            //   d1ff                 | sar                 edi, 1
            //   6a00                 | push                0
            //   8d85f8eeffff         | lea                 eax, dword ptr [ebp - 0x1108]

        $sequence_2 = { 6a00 8d85c4efffff 50 8d8dd0cdffff e8???????? 8bce 2bcf }
            // n = 7, score = 100
            //   6a00                 | push                0
            //   8d85c4efffff         | lea                 eax, dword ptr [ebp - 0x103c]
            //   50                   | push                eax
            //   8d8dd0cdffff         | lea                 ecx, dword ptr [ebp - 0x3230]
            //   e8????????           |                     
            //   8bce                 | mov                 ecx, esi
            //   2bcf                 | sub                 ecx, edi

        $sequence_3 = { 8bce 2bcf 3bc1 0f8452440000 8dbdf4e6ffff 8d4f02 0f1f840000000000 }
            // n = 7, score = 100
            //   8bce                 | mov                 ecx, esi
            //   2bcf                 | sub                 ecx, edi
            //   3bc1                 | cmp                 eax, ecx
            //   0f8452440000         | je                  0x4458
            //   8dbdf4e6ffff         | lea                 edi, dword ptr [ebp - 0x190c]
            //   8d4f02               | lea                 ecx, dword ptr [edi + 2]
            //   0f1f840000000000     | nop                 dword ptr [eax + eax]

        $sequence_4 = { 8dbdacf8ffff 8d4f02 0f1f840000000000 668b07 83c702 6685c0 75f5 }
            // n = 7, score = 100
            //   8dbdacf8ffff         | lea                 edi, dword ptr [ebp - 0x754]
            //   8d4f02               | lea                 ecx, dword ptr [edi + 2]
            //   0f1f840000000000     | nop                 dword ptr [eax + eax]
            //   668b07               | mov                 ax, word ptr [edi]
            //   83c702               | add                 edi, 2
            //   6685c0               | test                ax, ax
            //   75f5                 | jne                 0xfffffff7

        $sequence_5 = { 3bc1 0f8432520000 8dbdd4e8ffff 8d4f02 0f1f840000000000 668b07 }
            // n = 6, score = 100
            //   3bc1                 | cmp                 eax, ecx
            //   0f8432520000         | je                  0x5238
            //   8dbdd4e8ffff         | lea                 edi, dword ptr [ebp - 0x172c]
            //   8d4f02               | lea                 ecx, dword ptr [edi + 2]
            //   0f1f840000000000     | nop                 dword ptr [eax + eax]
            //   668b07               | mov                 ax, word ptr [edi]

        $sequence_6 = { e8???????? 8bce 2bcf 3bc1 0f8462930000 }
            // n = 5, score = 100
            //   e8????????           |                     
            //   8bce                 | mov                 ecx, esi
            //   2bcf                 | sub                 ecx, edi
            //   3bc1                 | cmp                 eax, ecx
            //   0f8462930000         | je                  0x9368

        $sequence_7 = { e8???????? 8bce 2bcf 3bc1 0f8422910000 8dbd88f2ffff 8d4f02 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8bce                 | mov                 ecx, esi
            //   2bcf                 | sub                 ecx, edi
            //   3bc1                 | cmp                 eax, ecx
            //   0f8422910000         | je                  0x9128
            //   8dbd88f2ffff         | lea                 edi, dword ptr [ebp - 0xd78]
            //   8d4f02               | lea                 ecx, dword ptr [edi + 2]

        $sequence_8 = { 3bc1 0f84c2000000 6a00 8d8560feffff 50 8d8dd0cdffff e8???????? }
            // n = 7, score = 100
            //   3bc1                 | cmp                 eax, ecx
            //   0f84c2000000         | je                  0xc8
            //   6a00                 | push                0
            //   8d8560feffff         | lea                 eax, dword ptr [ebp - 0x1a0]
            //   50                   | push                eax
            //   8d8dd0cdffff         | lea                 ecx, dword ptr [ebp - 0x3230]
            //   e8????????           |                     

        $sequence_9 = { d1ff 6a00 8d85bcf7ffff 50 8d8dd0cdffff e8???????? 8bce }
            // n = 7, score = 100
            //   d1ff                 | sar                 edi, 1
            //   6a00                 | push                0
            //   8d85bcf7ffff         | lea                 eax, dword ptr [ebp - 0x844]
            //   50                   | push                eax
            //   8d8dd0cdffff         | lea                 ecx, dword ptr [ebp - 0x3230]
            //   e8????????           |                     
            //   8bce                 | mov                 ecx, esi

    condition:
        7 of them and filesize < 803840
}