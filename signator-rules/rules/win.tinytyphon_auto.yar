rule win_tinytyphon_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.tinytyphon."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.tinytyphon"
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
        $sequence_0 = { 894de0 8b45e0 0345f8 8945e0 8b4de0 334df8 334de4 }
            // n = 7, score = 200
            //   894de0               | mov                 dword ptr [ebp - 0x20], ecx
            //   8b45e0               | mov                 eax, dword ptr [ebp - 0x20]
            //   0345f8               | add                 eax, dword ptr [ebp - 8]
            //   8945e0               | mov                 dword ptr [ebp - 0x20], eax
            //   8b4de0               | mov                 ecx, dword ptr [ebp - 0x20]
            //   334df8               | xor                 ecx, dword ptr [ebp - 8]
            //   334de4               | xor                 ecx, dword ptr [ebp - 0x1c]

        $sequence_1 = { 50 8d95f0fdffff 52 6a01 a1???????? 50 8d8de0fbffff }
            // n = 7, score = 200
            //   50                   | push                eax
            //   8d95f0fdffff         | lea                 edx, dword ptr [ebp - 0x210]
            //   52                   | push                edx
            //   6a01                 | push                1
            //   a1????????           |                     
            //   50                   | push                eax
            //   8d8de0fbffff         | lea                 ecx, dword ptr [ebp - 0x420]

        $sequence_2 = { 8b55b8 52 8b4588 50 8b4de0 51 ff15???????? }
            // n = 7, score = 200
            //   8b55b8               | mov                 edx, dword ptr [ebp - 0x48]
            //   52                   | push                edx
            //   8b4588               | mov                 eax, dword ptr [ebp - 0x78]
            //   50                   | push                eax
            //   8b4de0               | mov                 ecx, dword ptr [ebp - 0x20]
            //   51                   | push                ecx
            //   ff15????????         |                     

        $sequence_3 = { c785e4feffff00000000 83bde4feffff00 753d 8d85a0fdffff 50 }
            // n = 5, score = 200
            //   c785e4feffff00000000     | mov    dword ptr [ebp - 0x11c], 0
            //   83bde4feffff00       | cmp                 dword ptr [ebp - 0x11c], 0
            //   753d                 | jne                 0x3f
            //   8d85a0fdffff         | lea                 eax, dword ptr [ebp - 0x260]
            //   50                   | push                eax

        $sequence_4 = { 0355dc 8955e4 8b45f4 0fb64820 8b55f4 }
            // n = 5, score = 200
            //   0355dc               | add                 edx, dword ptr [ebp - 0x24]
            //   8955e4               | mov                 dword ptr [ebp - 0x1c], edx
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   0fb64820             | movzx               ecx, byte ptr [eax + 0x20]
            //   8b55f4               | mov                 edx, dword ptr [ebp - 0xc]

        $sequence_5 = { 0fb608 81f99a000000 7454 8b95f4feffff }
            // n = 4, score = 200
            //   0fb608               | movzx               ecx, byte ptr [eax]
            //   81f99a000000         | cmp                 ecx, 0x9a
            //   7454                 | je                  0x56
            //   8b95f4feffff         | mov                 edx, dword ptr [ebp - 0x10c]

        $sequence_6 = { 8b55dc c1ea10 0bca 894ddc 8b45dc 0345e0 }
            // n = 6, score = 200
            //   8b55dc               | mov                 edx, dword ptr [ebp - 0x24]
            //   c1ea10               | shr                 edx, 0x10
            //   0bca                 | or                  ecx, edx
            //   894ddc               | mov                 dword ptr [ebp - 0x24], ecx
            //   8b45dc               | mov                 eax, dword ptr [ebp - 0x24]
            //   0345e0               | add                 eax, dword ptr [ebp - 0x20]

        $sequence_7 = { 740a 8b55bc 52 ff15???????? 837de000 740a 8b45e0 }
            // n = 7, score = 200
            //   740a                 | je                  0xc
            //   8b55bc               | mov                 edx, dword ptr [ebp - 0x44]
            //   52                   | push                edx
            //   ff15????????         |                     
            //   837de000             | cmp                 dword ptr [ebp - 0x20], 0
            //   740a                 | je                  0xc
            //   8b45e0               | mov                 eax, dword ptr [ebp - 0x20]

        $sequence_8 = { 81ec60020000 837d0c00 7e06 837d0800 750a b801000000 e9???????? }
            // n = 7, score = 200
            //   81ec60020000         | sub                 esp, 0x260
            //   837d0c00             | cmp                 dword ptr [ebp + 0xc], 0
            //   7e06                 | jle                 8
            //   837d0800             | cmp                 dword ptr [ebp + 8], 0
            //   750a                 | jne                 0xc
            //   b801000000           | mov                 eax, 1
            //   e9????????           |                     

        $sequence_9 = { 55 8bec 83ec10 c745fc???????? a1???????? }
            // n = 5, score = 200
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83ec10               | sub                 esp, 0x10
            //   c745fc????????       |                     
            //   a1????????           |                     

    condition:
        7 of them and filesize < 90112
}