rule win_qhost_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.qhost."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.qhost"
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
        $sequence_0 = { 038db4fbffff 8a9405e8fbffff 8811 8b85b4fbffff 83c001 }
            // n = 5, score = 100
            //   038db4fbffff         | add                 ecx, dword ptr [ebp - 0x44c]
            //   8a9405e8fbffff       | mov                 dl, byte ptr [ebp + eax - 0x418]
            //   8811                 | mov                 byte ptr [ecx], dl
            //   8b85b4fbffff         | mov                 eax, dword ptr [ebp - 0x44c]
            //   83c001               | add                 eax, 1

        $sequence_1 = { 6a00 6a00 6a00 8d95e0fcffff }
            // n = 4, score = 100
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   8d95e0fcffff         | lea                 edx, dword ptr [ebp - 0x320]

        $sequence_2 = { 8b8de4feffff 51 68???????? 8d95e8feffff 52 ff15???????? 83c40c }
            // n = 7, score = 100
            //   8b8de4feffff         | mov                 ecx, dword ptr [ebp - 0x11c]
            //   51                   | push                ecx
            //   68????????           |                     
            //   8d95e8feffff         | lea                 edx, dword ptr [ebp - 0x118]
            //   52                   | push                edx
            //   ff15????????         |                     
            //   83c40c               | add                 esp, 0xc

        $sequence_3 = { 8b4da0 8b548db0 52 ff15???????? 83c408 898578ffffff }
            // n = 6, score = 100
            //   8b4da0               | mov                 ecx, dword ptr [ebp - 0x60]
            //   8b548db0             | mov                 edx, dword ptr [ebp + ecx*4 - 0x50]
            //   52                   | push                edx
            //   ff15????????         |                     
            //   83c408               | add                 esp, 8
            //   898578ffffff         | mov                 dword ptr [ebp - 0x88], eax

        $sequence_4 = { 6a00 8d95f0fcffff 52 e8???????? 83c40c 68???????? }
            // n = 6, score = 100
            //   6a00                 | push                0
            //   8d95f0fcffff         | lea                 edx, dword ptr [ebp - 0x310]
            //   52                   | push                edx
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   68????????           |                     

        $sequence_5 = { c745fcfaffffff e9???????? 33c0 837d1801 0f94c0 8885c4f9ffff 8b8dc4f9ffff }
            // n = 7, score = 100
            //   c745fcfaffffff       | mov                 dword ptr [ebp - 4], 0xfffffffa
            //   e9????????           |                     
            //   33c0                 | xor                 eax, eax
            //   837d1801             | cmp                 dword ptr [ebp + 0x18], 1
            //   0f94c0               | sete                al
            //   8885c4f9ffff         | mov                 byte ptr [ebp - 0x63c], al
            //   8b8dc4f9ffff         | mov                 ecx, dword ptr [ebp - 0x63c]

        $sequence_6 = { eba2 8b85a4f4ffff 50 ff15???????? }
            // n = 4, score = 100
            //   eba2                 | jmp                 0xffffffa4
            //   8b85a4f4ffff         | mov                 eax, dword ptr [ebp - 0xb5c]
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_7 = { 51 e8???????? 83c40c 8b9558ffffff }
            // n = 4, score = 100
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8b9558ffffff         | mov                 edx, dword ptr [ebp - 0xa8]

        $sequence_8 = { 03f0 8975fc 8b4d08 8b55fc 89148d74904000 8b4508 }
            // n = 6, score = 100
            //   03f0                 | add                 esi, eax
            //   8975fc               | mov                 dword ptr [ebp - 4], esi
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   89148d74904000       | mov                 dword ptr [ecx*4 + 0x409074], edx
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]

        $sequence_9 = { 68???????? 8d95f8fdffff 52 ff15???????? 83c414 6a01 8d85f8fdffff }
            // n = 7, score = 100
            //   68????????           |                     
            //   8d95f8fdffff         | lea                 edx, dword ptr [ebp - 0x208]
            //   52                   | push                edx
            //   ff15????????         |                     
            //   83c414               | add                 esp, 0x14
            //   6a01                 | push                1
            //   8d85f8fdffff         | lea                 eax, dword ptr [ebp - 0x208]

    condition:
        7 of them and filesize < 286720
}