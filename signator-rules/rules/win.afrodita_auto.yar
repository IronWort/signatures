rule win_afrodita_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.afrodita."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.afrodita"
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
        $sequence_0 = { c745b000000000 c745b400000000 c645ac00 8b4d18 8d55ac 52 68???????? }
            // n = 7, score = 300
            //   c745b000000000       | mov                 dword ptr [ebp - 0x50], 0
            //   c745b400000000       | mov                 dword ptr [ebp - 0x4c], 0
            //   c645ac00             | mov                 byte ptr [ebp - 0x54], 0
            //   8b4d18               | mov                 ecx, dword ptr [ebp + 0x18]
            //   8d55ac               | lea                 edx, dword ptr [ebp - 0x54]
            //   52                   | push                edx
            //   68????????           |                     

        $sequence_1 = { ff7510 8b06 8bce ff750c ff7508 ff90a4000000 8bc8 }
            // n = 7, score = 300
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   8bce                 | mov                 ecx, esi
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ff90a4000000         | call                dword ptr [eax + 0xa4]
            //   8bc8                 | mov                 ecx, eax

        $sequence_2 = { e8???????? 6a00 8d4da0 e8???????? 8d45c8 c745acffffffff 8945b4 }
            // n = 7, score = 300
            //   e8????????           |                     
            //   6a00                 | push                0
            //   8d4da0               | lea                 ecx, dword ptr [ebp - 0x60]
            //   e8????????           |                     
            //   8d45c8               | lea                 eax, dword ptr [ebp - 0x38]
            //   c745acffffffff       | mov                 dword ptr [ebp - 0x54], 0xffffffff
            //   8945b4               | mov                 dword ptr [ebp - 0x4c], eax

        $sequence_3 = { 68???????? 8bc8 c645fc04 e8???????? 0fb64808 51 8d4df0 }
            // n = 7, score = 300
            //   68????????           |                     
            //   8bc8                 | mov                 ecx, eax
            //   c645fc04             | mov                 byte ptr [ebp - 4], 4
            //   e8????????           |                     
            //   0fb64808             | movzx               ecx, byte ptr [eax + 8]
            //   51                   | push                ecx
            //   8d4df0               | lea                 ecx, dword ptr [ebp - 0x10]

        $sequence_4 = { 8b4dec 33d2 8b01 8b4004 03c1 b904000000 }
            // n = 6, score = 300
            //   8b4dec               | mov                 ecx, dword ptr [ebp - 0x14]
            //   33d2                 | xor                 edx, edx
            //   8b01                 | mov                 eax, dword ptr [ecx]
            //   8b4004               | mov                 eax, dword ptr [eax + 4]
            //   03c1                 | add                 eax, ecx
            //   b904000000           | mov                 ecx, 4

        $sequence_5 = { c745fcffffffff 8b4e2c 85c9 740d 8b01 6a01 8b4004 }
            // n = 7, score = 300
            //   c745fcffffffff       | mov                 dword ptr [ebp - 4], 0xffffffff
            //   8b4e2c               | mov                 ecx, dword ptr [esi + 0x2c]
            //   85c9                 | test                ecx, ecx
            //   740d                 | je                  0xf
            //   8b01                 | mov                 eax, dword ptr [ecx]
            //   6a01                 | push                1
            //   8b4004               | mov                 eax, dword ptr [eax + 4]

        $sequence_6 = { ff75e8 0f4345d8 8d4dc0 50 e8???????? 8d45c0 }
            // n = 6, score = 300
            //   ff75e8               | push                dword ptr [ebp - 0x18]
            //   0f4345d8             | cmovae              eax, dword ptr [ebp - 0x28]
            //   8d4dc0               | lea                 ecx, dword ptr [ebp - 0x40]
            //   50                   | push                eax
            //   e8????????           |                     
            //   8d45c0               | lea                 eax, dword ptr [ebp - 0x40]

        $sequence_7 = { d1e9 23c8 8bd7 8b4604 83e201 47 8b0c88 }
            // n = 7, score = 300
            //   d1e9                 | shr                 ecx, 1
            //   23c8                 | and                 ecx, eax
            //   8bd7                 | mov                 edx, edi
            //   8b4604               | mov                 eax, dword ptr [esi + 4]
            //   83e201               | and                 edx, 1
            //   47                   | inc                 edi
            //   8b0c88               | mov                 ecx, dword ptr [eax + ecx*4]

        $sequence_8 = { 80383f 0f856a020000 8d4801 890d???????? 0fbe01 83e824 0f8438020000 }
            // n = 7, score = 300
            //   80383f               | cmp                 byte ptr [eax], 0x3f
            //   0f856a020000         | jne                 0x270
            //   8d4801               | lea                 ecx, dword ptr [eax + 1]
            //   890d????????         |                     
            //   0fbe01               | movsx               eax, byte ptr [ecx]
            //   83e824               | sub                 eax, 0x24
            //   0f8438020000         | je                  0x23e

        $sequence_9 = { 56 57 84c0 0f8483030000 3c36 7c04 }
            // n = 6, score = 300
            //   56                   | push                esi
            //   57                   | push                edi
            //   84c0                 | test                al, al
            //   0f8483030000         | je                  0x389
            //   3c36                 | cmp                 al, 0x36
            //   7c04                 | jl                  6

    condition:
        7 of them and filesize < 2334720
}