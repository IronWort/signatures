rule win_regretlocker_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.regretlocker."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.regretlocker"
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
        $sequence_0 = { 6bc930 8b048558d74600 80640828fe ff36 e8???????? 59 c3 }
            // n = 7, score = 100
            //   6bc930               | imul                ecx, ecx, 0x30
            //   8b048558d74600       | mov                 eax, dword ptr [eax*4 + 0x46d758]
            //   80640828fe           | and                 byte ptr [eax + ecx + 0x28], 0xfe
            //   ff36                 | push                dword ptr [esi]
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   c3                   | ret                 

        $sequence_1 = { 8d4ddc 8945ec e8???????? 807de000 897dfc 7508 }
            // n = 6, score = 100
            //   8d4ddc               | lea                 ecx, dword ptr [ebp - 0x24]
            //   8945ec               | mov                 dword ptr [ebp - 0x14], eax
            //   e8????????           |                     
            //   807de000             | cmp                 byte ptr [ebp - 0x20], 0
            //   897dfc               | mov                 dword ptr [ebp - 4], edi
            //   7508                 | jne                 0xa

        $sequence_2 = { ff7508 ff750c 50 51 e8???????? 83c418 5d }
            // n = 7, score = 100
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   50                   | push                eax
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c418               | add                 esp, 0x18
            //   5d                   | pop                 ebp

        $sequence_3 = { ff75e4 8d8dacfeffff ff75e0 e8???????? 8d45d0 50 ff75ec }
            // n = 7, score = 100
            //   ff75e4               | push                dword ptr [ebp - 0x1c]
            //   8d8dacfeffff         | lea                 ecx, dword ptr [ebp - 0x154]
            //   ff75e0               | push                dword ptr [ebp - 0x20]
            //   e8????????           |                     
            //   8d45d0               | lea                 eax, dword ptr [ebp - 0x30]
            //   50                   | push                eax
            //   ff75ec               | push                dword ptr [ebp - 0x14]

        $sequence_4 = { e8???????? 8b450c 8b00 894620 eb02 33f6 8b4508 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   894620               | mov                 dword ptr [esi + 0x20], eax
            //   eb02                 | jmp                 4
            //   33f6                 | xor                 esi, esi
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]

        $sequence_5 = { 668906 8b048d58d74600 6a0a 8854382a 8b048d58d74600 8874382b 8b048d58d74600 }
            // n = 7, score = 100
            //   668906               | mov                 word ptr [esi], ax
            //   8b048d58d74600       | mov                 eax, dword ptr [ecx*4 + 0x46d758]
            //   6a0a                 | push                0xa
            //   8854382a             | mov                 byte ptr [eax + edi + 0x2a], dl
            //   8b048d58d74600       | mov                 eax, dword ptr [ecx*4 + 0x46d758]
            //   8874382b             | mov                 byte ptr [eax + edi + 0x2b], dh
            //   8b048d58d74600       | mov                 eax, dword ptr [ecx*4 + 0x46d758]

        $sequence_6 = { 2bc3 c1f803 3dffffff1f 0f8486000000 }
            // n = 4, score = 100
            //   2bc3                 | sub                 eax, ebx
            //   c1f803               | sar                 eax, 3
            //   3dffffff1f           | cmp                 eax, 0x1fffffff
            //   0f8486000000         | je                  0x8c

        $sequence_7 = { b961188601 8bd0 d1ea 2bca 3bc1 7707 03c2 }
            // n = 7, score = 100
            //   b961188601           | mov                 ecx, 0x1861861
            //   8bd0                 | mov                 edx, eax
            //   d1ea                 | shr                 edx, 1
            //   2bca                 | sub                 ecx, edx
            //   3bc1                 | cmp                 eax, ecx
            //   7707                 | ja                  9
            //   03c2                 | add                 eax, edx

        $sequence_8 = { 3bf0 0f84ee010000 837e1000 0f8460010000 56 8d4594 68???????? }
            // n = 7, score = 100
            //   3bf0                 | cmp                 esi, eax
            //   0f84ee010000         | je                  0x1f4
            //   837e1000             | cmp                 dword ptr [esi + 0x10], 0
            //   0f8460010000         | je                  0x166
            //   56                   | push                esi
            //   8d4594               | lea                 eax, dword ptr [ebp - 0x6c]
            //   68????????           |                     

        $sequence_9 = { 83c108 83791410 7202 8b09 6a00 51 e8???????? }
            // n = 7, score = 100
            //   83c108               | add                 ecx, 8
            //   83791410             | cmp                 dword ptr [ecx + 0x14], 0x10
            //   7202                 | jb                  4
            //   8b09                 | mov                 ecx, dword ptr [ecx]
            //   6a00                 | push                0
            //   51                   | push                ecx
            //   e8????????           |                     

    condition:
        7 of them and filesize < 1021952
}