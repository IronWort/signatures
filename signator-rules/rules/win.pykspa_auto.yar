rule win_pykspa_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.pykspa."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.pykspa"
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
        $sequence_0 = { 742e 56 e8???????? 84c0 59 7523 57 }
            // n = 7, score = 100
            //   742e                 | je                  0x30
            //   56                   | push                esi
            //   e8????????           |                     
            //   84c0                 | test                al, al
            //   59                   | pop                 ecx
            //   7523                 | jne                 0x25
            //   57                   | push                edi

        $sequence_1 = { 50 8d8538fdffff 50 ff15???????? 85c0 0f8427020000 8b7508 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   8d8538fdffff         | lea                 eax, dword ptr [ebp - 0x2c8]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   0f8427020000         | je                  0x22d
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]

        $sequence_2 = { 756f 837dfc02 7c69 8a8d58f4ffff 8d8558f4ffff eb0d }
            // n = 6, score = 100
            //   756f                 | jne                 0x71
            //   837dfc02             | cmp                 dword ptr [ebp - 4], 2
            //   7c69                 | jl                  0x6b
            //   8a8d58f4ffff         | mov                 cl, byte ptr [ebp - 0xba8]
            //   8d8558f4ffff         | lea                 eax, dword ptr [ebp - 0xba8]
            //   eb0d                 | jmp                 0xf

        $sequence_3 = { e8???????? 53 57 33c0 33db 889dfc9effff b9ff0f0000 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   53                   | push                ebx
            //   57                   | push                edi
            //   33c0                 | xor                 eax, eax
            //   33db                 | xor                 ebx, ebx
            //   889dfc9effff         | mov                 byte ptr [ebp - 0x6104], bl
            //   b9ff0f0000           | mov                 ecx, 0xfff

        $sequence_4 = { e8???????? e8???????? 8b0d???????? 3bc1 a3???????? 7609 2bc1 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   e8????????           |                     
            //   8b0d????????         |                     
            //   3bc1                 | cmp                 eax, ecx
            //   a3????????           |                     
            //   7609                 | jbe                 0xb
            //   2bc1                 | sub                 eax, ecx

        $sequence_5 = { 8bc7 e8???????? 83c418 8bc6 5e c3 55 }
            // n = 7, score = 100
            //   8bc7                 | mov                 eax, edi
            //   e8????????           |                     
            //   83c418               | add                 esp, 0x18
            //   8bc6                 | mov                 eax, esi
            //   5e                   | pop                 esi
            //   c3                   | ret                 
            //   55                   | push                ebp

        $sequence_6 = { 8bf8 83c428 85ff 897df8 7c42 57 ff75fc }
            // n = 7, score = 100
            //   8bf8                 | mov                 edi, eax
            //   83c428               | add                 esp, 0x28
            //   85ff                 | test                edi, edi
            //   897df8               | mov                 dword ptr [ebp - 8], edi
            //   7c42                 | jl                  0x44
            //   57                   | push                edi
            //   ff75fc               | push                dword ptr [ebp - 4]

        $sequence_7 = { f7d9 893c13 2bc1 83c204 ff4de8 8bd8 75d3 }
            // n = 7, score = 100
            //   f7d9                 | neg                 ecx
            //   893c13               | mov                 dword ptr [ebx + edx], edi
            //   2bc1                 | sub                 eax, ecx
            //   83c204               | add                 edx, 4
            //   ff4de8               | dec                 dword ptr [ebp - 0x18]
            //   8bd8                 | mov                 ebx, eax
            //   75d3                 | jne                 0xffffffd5

        $sequence_8 = { 33ff 57 68e8030000 57 8d45f4 50 6a01 }
            // n = 7, score = 100
            //   33ff                 | xor                 edi, edi
            //   57                   | push                edi
            //   68e8030000           | push                0x3e8
            //   57                   | push                edi
            //   8d45f4               | lea                 eax, dword ptr [ebp - 0xc]
            //   50                   | push                eax
            //   6a01                 | push                1

        $sequence_9 = { aa 66c785bffeffff4c00 33c0 8dbdc1feffff ab aa 66c785c6feffff3a00 }
            // n = 7, score = 100
            //   aa                   | stosb               byte ptr es:[edi], al
            //   66c785bffeffff4c00     | mov    word ptr [ebp - 0x141], 0x4c
            //   33c0                 | xor                 eax, eax
            //   8dbdc1feffff         | lea                 edi, dword ptr [ebp - 0x13f]
            //   ab                   | stosd               dword ptr es:[edi], eax
            //   aa                   | stosb               byte ptr es:[edi], al
            //   66c785c6feffff3a00     | mov    word ptr [ebp - 0x13a], 0x3a

    condition:
        7 of them and filesize < 835584
}