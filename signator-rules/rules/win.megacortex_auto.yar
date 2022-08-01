rule win_megacortex_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.megacortex."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.megacortex"
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
        $sequence_0 = { 2bf9 8d75f0 8d4d0c 897de8 2bf1 8975ec 33d2 }
            // n = 7, score = 400
            //   2bf9                 | sub                 edi, ecx
            //   8d75f0               | lea                 esi, dword ptr [ebp - 0x10]
            //   8d4d0c               | lea                 ecx, dword ptr [ebp + 0xc]
            //   897de8               | mov                 dword ptr [ebp - 0x18], edi
            //   2bf1                 | sub                 esi, ecx
            //   8975ec               | mov                 dword ptr [ebp - 0x14], esi
            //   33d2                 | xor                 edx, edx

        $sequence_1 = { 3bc3 0f44d6 8b7208 83c208 2bd7 8d46ff f7d8 }
            // n = 7, score = 400
            //   3bc3                 | cmp                 eax, ebx
            //   0f44d6               | cmove               edx, esi
            //   8b7208               | mov                 esi, dword ptr [edx + 8]
            //   83c208               | add                 edx, 8
            //   2bd7                 | sub                 edx, edi
            //   8d46ff               | lea                 eax, dword ptr [esi - 1]
            //   f7d8                 | neg                 eax

        $sequence_2 = { ff75e0 e8???????? 5f 5e 5b 8be5 5d }
            // n = 7, score = 400
            //   ff75e0               | push                dword ptr [ebp - 0x20]
            //   e8????????           |                     
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp

        $sequence_3 = { e8???????? 46 83ef01 75d4 8b45b4 85c0 7438 }
            // n = 7, score = 400
            //   e8????????           |                     
            //   46                   | inc                 esi
            //   83ef01               | sub                 edi, 1
            //   75d4                 | jne                 0xffffffd6
            //   8b45b4               | mov                 eax, dword ptr [ebp - 0x4c]
            //   85c0                 | test                eax, eax
            //   7438                 | je                  0x3a

        $sequence_4 = { c785e0faffff00000000 c785e4faffff0f000000 8d5101 c685d0faffff00 c78598faffff00000000 c7859cfaffff0f000000 c68588faffff00 }
            // n = 7, score = 400
            //   c785e0faffff00000000     | mov    dword ptr [ebp - 0x520], 0
            //   c785e4faffff0f000000     | mov    dword ptr [ebp - 0x51c], 0xf
            //   8d5101               | lea                 edx, dword ptr [ecx + 1]
            //   c685d0faffff00       | mov                 byte ptr [ebp - 0x530], 0
            //   c78598faffff00000000     | mov    dword ptr [ebp - 0x568], 0
            //   c7859cfaffff0f000000     | mov    dword ptr [ebp - 0x564], 0xf
            //   c68588faffff00       | mov                 byte ptr [ebp - 0x578], 0

        $sequence_5 = { e8???????? 83c408 85c0 0f8587010000 8b4514 85ff 7454 }
            // n = 7, score = 400
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   85c0                 | test                eax, eax
            //   0f8587010000         | jne                 0x18d
            //   8b4514               | mov                 eax, dword ptr [ebp + 0x14]
            //   85ff                 | test                edi, edi
            //   7454                 | je                  0x56

        $sequence_6 = { ff7608 e8???????? 8b8df8fbffff 83c40c c70601000000 c7460400000000 }
            // n = 6, score = 400
            //   ff7608               | push                dword ptr [esi + 8]
            //   e8????????           |                     
            //   8b8df8fbffff         | mov                 ecx, dword ptr [ebp - 0x408]
            //   83c40c               | add                 esp, 0xc
            //   c70601000000         | mov                 dword ptr [esi], 1
            //   c7460400000000       | mov                 dword ptr [esi + 4], 0

        $sequence_7 = { e8???????? 83c408 c7462800000000 c7462c0f000000 c6461800 5e c3 }
            // n = 7, score = 400
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   c7462800000000       | mov                 dword ptr [esi + 0x28], 0
            //   c7462c0f000000       | mov                 dword ptr [esi + 0x2c], 0xf
            //   c6461800             | mov                 byte ptr [esi + 0x18], 0
            //   5e                   | pop                 esi
            //   c3                   | ret                 

        $sequence_8 = { 8d75c0 2bce f7df 1bff 23f9 8d72ff 03f8 }
            // n = 7, score = 400
            //   8d75c0               | lea                 esi, dword ptr [ebp - 0x40]
            //   2bce                 | sub                 ecx, esi
            //   f7df                 | neg                 edi
            //   1bff                 | sbb                 edi, edi
            //   23f9                 | and                 edi, ecx
            //   8d72ff               | lea                 esi, dword ptr [edx - 1]
            //   03f8                 | add                 edi, eax

        $sequence_9 = { e8???????? 8d4598 c645fc05 50 8d45d8 83cb0a 50 }
            // n = 7, score = 400
            //   e8????????           |                     
            //   8d4598               | lea                 eax, dword ptr [ebp - 0x68]
            //   c645fc05             | mov                 byte ptr [ebp - 4], 5
            //   50                   | push                eax
            //   8d45d8               | lea                 eax, dword ptr [ebp - 0x28]
            //   83cb0a               | or                  ebx, 0xa
            //   50                   | push                eax

    condition:
        7 of them and filesize < 1556480
}