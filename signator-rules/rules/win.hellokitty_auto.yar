rule win_hellokitty_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.hellokitty."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.hellokitty"
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
        $sequence_0 = { 8955f8 895028 8bcb c1e918 89582c }
            // n = 5, score = 100
            //   8955f8               | mov                 dword ptr [ebp - 8], edx
            //   895028               | mov                 dword ptr [eax + 0x28], edx
            //   8bcb                 | mov                 ecx, ebx
            //   c1e918               | shr                 ecx, 0x18
            //   89582c               | mov                 dword ptr [eax + 0x2c], ebx

        $sequence_1 = { 8b4048 f00fc118 4b 7515 8b45fc 817848c0044200 7409 }
            // n = 7, score = 100
            //   8b4048               | mov                 eax, dword ptr [eax + 0x48]
            //   f00fc118             | lock xadd           dword ptr [eax], ebx
            //   4b                   | dec                 ebx
            //   7515                 | jne                 0x17
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   817848c0044200       | cmp                 dword ptr [eax + 0x48], 0x4204c0
            //   7409                 | je                  0xb

        $sequence_2 = { 8b500c 0fb6ca 8b7004 8b7808 0fb699303b4200 8bca c1e918 }
            // n = 7, score = 100
            //   8b500c               | mov                 edx, dword ptr [eax + 0xc]
            //   0fb6ca               | movzx               ecx, dl
            //   8b7004               | mov                 esi, dword ptr [eax + 4]
            //   8b7808               | mov                 edi, dword ptr [eax + 8]
            //   0fb699303b4200       | movzx               ebx, byte ptr [ecx + 0x423b30]
            //   8bca                 | mov                 ecx, edx
            //   c1e918               | shr                 ecx, 0x18

        $sequence_3 = { 331c8560414200 8b45f0 0fb6c0 331c8560554200 331a 83c204 }
            // n = 6, score = 100
            //   331c8560414200       | xor                 ebx, dword ptr [eax*4 + 0x424160]
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   0fb6c0               | movzx               eax, al
            //   331c8560554200       | xor                 ebx, dword ptr [eax*4 + 0x425560]
            //   331a                 | xor                 ebx, dword ptr [edx]
            //   83c204               | add                 edx, 4

        $sequence_4 = { 8d44241c 57 50 e8???????? 83c40c 8d7b08 8d542418 }
            // n = 7, score = 100
            //   8d44241c             | lea                 eax, dword ptr [esp + 0x1c]
            //   57                   | push                edi
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8d7b08               | lea                 edi, dword ptr [ebx + 8]
            //   8d542418             | lea                 edx, dword ptr [esp + 0x18]

        $sequence_5 = { 59 c60600 83c202 83ef01 75e4 5f 5e }
            // n = 7, score = 100
            //   59                   | pop                 ecx
            //   c60600               | mov                 byte ptr [esi], 0
            //   83c202               | add                 edx, 2
            //   83ef01               | sub                 edi, 1
            //   75e4                 | jne                 0xffffffe6
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_6 = { 56 33db 894df4 8b30 a1???????? 57 3b8604000000 }
            // n = 7, score = 100
            //   56                   | push                esi
            //   33db                 | xor                 ebx, ebx
            //   894df4               | mov                 dword ptr [ebp - 0xc], ecx
            //   8b30                 | mov                 esi, dword ptr [eax]
            //   a1????????           |                     
            //   57                   | push                edi
            //   3b8604000000         | cmp                 eax, dword ptr [esi + 4]

        $sequence_7 = { 85f6 0f84f3000000 832000 6a78 e8???????? 8bf8 59 }
            // n = 7, score = 100
            //   85f6                 | test                esi, esi
            //   0f84f3000000         | je                  0xf9
            //   832000               | and                 dword ptr [eax], 0
            //   6a78                 | push                0x78
            //   e8????????           |                     
            //   8bf8                 | mov                 edi, eax
            //   59                   | pop                 ecx

        $sequence_8 = { 3345c0 3345f8 d1c0 8945c8 89856cffffff 8bc7 }
            // n = 6, score = 100
            //   3345c0               | xor                 eax, dword ptr [ebp - 0x40]
            //   3345f8               | xor                 eax, dword ptr [ebp - 8]
            //   d1c0                 | rol                 eax, 1
            //   8945c8               | mov                 dword ptr [ebp - 0x38], eax
            //   89856cffffff         | mov                 dword ptr [ebp - 0x94], eax
            //   8bc7                 | mov                 eax, edi

        $sequence_9 = { 8bc3 3345e8 03f1 8b4dec 23c2 33c3 8bd1 }
            // n = 7, score = 100
            //   8bc3                 | mov                 eax, ebx
            //   3345e8               | xor                 eax, dword ptr [ebp - 0x18]
            //   03f1                 | add                 esi, ecx
            //   8b4dec               | mov                 ecx, dword ptr [ebp - 0x14]
            //   23c2                 | and                 eax, edx
            //   33c3                 | xor                 eax, ebx
            //   8bd1                 | mov                 edx, ecx

    condition:
        7 of them and filesize < 319488
}