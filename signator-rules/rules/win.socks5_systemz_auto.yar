rule win_socks5_systemz_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.socks5_systemz."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.socks5_systemz"
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
        $sequence_0 = { c645b981 c645badb c645bbc3 c645bc95 c645bde6 c68518ffffff8e }
            // n = 6, score = 200
            //   c645b981             | mov                 byte ptr [ebp - 0x47], 0x81
            //   c645badb             | mov                 byte ptr [ebp - 0x46], 0xdb
            //   c645bbc3             | mov                 byte ptr [ebp - 0x45], 0xc3
            //   c645bc95             | mov                 byte ptr [ebp - 0x44], 0x95
            //   c645bde6             | mov                 byte ptr [ebp - 0x43], 0xe6
            //   c68518ffffff8e       | mov                 byte ptr [ebp - 0xe8], 0x8e

        $sequence_1 = { 5d c3 b8???????? e8???????? 83ec20 56 8bf1 }
            // n = 7, score = 200
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   b8????????           |                     
            //   e8????????           |                     
            //   83ec20               | sub                 esp, 0x20
            //   56                   | push                esi
            //   8bf1                 | mov                 esi, ecx

        $sequence_2 = { ff7510 e8???????? 8b4508 83c404 c7442428ffffffff }
            // n = 5, score = 200
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   e8????????           |                     
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   83c404               | add                 esp, 4
            //   c7442428ffffffff     | mov                 dword ptr [esp + 0x28], 0xffffffff

        $sequence_3 = { e8???????? c745fc00000000 8d4dec e8???????? 83f8ff 7527 8b4d1c }
            // n = 7, score = 200
            //   e8????????           |                     
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   8d4dec               | lea                 ecx, dword ptr [ebp - 0x14]
            //   e8????????           |                     
            //   83f8ff               | cmp                 eax, -1
            //   7527                 | jne                 0x29
            //   8b4d1c               | mov                 ecx, dword ptr [ebp + 0x1c]

        $sequence_4 = { e8???????? 8b10 8b4004 8b4d20 8911 894104 33c0 }
            // n = 7, score = 200
            //   e8????????           |                     
            //   8b10                 | mov                 edx, dword ptr [eax]
            //   8b4004               | mov                 eax, dword ptr [eax + 4]
            //   8b4d20               | mov                 ecx, dword ptr [ebp + 0x20]
            //   8911                 | mov                 dword ptr [ecx], edx
            //   894104               | mov                 dword ptr [ecx + 4], eax
            //   33c0                 | xor                 eax, eax

        $sequence_5 = { 8bc8 e8???????? 8d4de8 e8???????? 8d55e8 }
            // n = 5, score = 200
            //   8bc8                 | mov                 ecx, eax
            //   e8????????           |                     
            //   8d4de8               | lea                 ecx, dword ptr [ebp - 0x18]
            //   e8????????           |                     
            //   8d55e8               | lea                 edx, dword ptr [ebp - 0x18]

        $sequence_6 = { 8d4de8 e8???????? 8d4de8 51 8d55c4 }
            // n = 5, score = 200
            //   8d4de8               | lea                 ecx, dword ptr [ebp - 0x18]
            //   e8????????           |                     
            //   8d4de8               | lea                 ecx, dword ptr [ebp - 0x18]
            //   51                   | push                ecx
            //   8d55c4               | lea                 edx, dword ptr [ebp - 0x3c]

        $sequence_7 = { 83f9ff 7407 51 ff15???????? 897e0c 5f }
            // n = 6, score = 200
            //   83f9ff               | cmp                 ecx, -1
            //   7407                 | je                  9
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   897e0c               | mov                 dword ptr [esi + 0xc], edi
            //   5f                   | pop                 edi

    condition:
        7 of them and filesize < 491520
}