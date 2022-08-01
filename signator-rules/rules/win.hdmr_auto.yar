rule win_hdmr_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.hdmr."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.hdmr"
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
        $sequence_0 = { 8bce c1eb08 c1e910 81e3ff000000 }
            // n = 4, score = 100
            //   8bce                 | mov                 ecx, esi
            //   c1eb08               | shr                 ebx, 8
            //   c1e910               | shr                 ecx, 0x10
            //   81e3ff000000         | and                 ebx, 0xff

        $sequence_1 = { 8bf1 83e61f 8d3c8540d04100 8b07 c1e606 }
            // n = 5, score = 100
            //   8bf1                 | mov                 esi, ecx
            //   83e61f               | and                 esi, 0x1f
            //   8d3c8540d04100       | lea                 edi, dword ptr [eax*4 + 0x41d040]
            //   8b07                 | mov                 eax, dword ptr [edi]
            //   c1e606               | shl                 esi, 6

        $sequence_2 = { 8bc8 8b4228 ffd0 5e 8be5 }
            // n = 5, score = 100
            //   8bc8                 | mov                 ecx, eax
            //   8b4228               | mov                 eax, dword ptr [edx + 0x28]
            //   ffd0                 | call                eax
            //   5e                   | pop                 esi
            //   8be5                 | mov                 esp, ebp

        $sequence_3 = { 3310 5f 8bc2 c1c808 2500ff00ff }
            // n = 5, score = 100
            //   3310                 | xor                 edx, dword ptr [eax]
            //   5f                   | pop                 edi
            //   8bc2                 | mov                 eax, edx
            //   c1c808               | ror                 eax, 8
            //   2500ff00ff           | and                 eax, 0xff00ff00

        $sequence_4 = { be10040000 66ab 8bff 4e 33c0 89b570ffffff 8d8d78ffffff }
            // n = 7, score = 100
            //   be10040000           | mov                 esi, 0x410
            //   66ab                 | stosw               word ptr es:[edi], ax
            //   8bff                 | mov                 edi, edi
            //   4e                   | dec                 esi
            //   33c0                 | xor                 eax, eax
            //   89b570ffffff         | mov                 dword ptr [ebp - 0x90], esi
            //   8d8d78ffffff         | lea                 ecx, dword ptr [ebp - 0x88]

        $sequence_5 = { 250000ff00 81e3000000ff 33c3 8bda 81e2ff000000 }
            // n = 5, score = 100
            //   250000ff00           | and                 eax, 0xff0000
            //   81e3000000ff         | and                 ebx, 0xff000000
            //   33c3                 | xor                 eax, ebx
            //   8bda                 | mov                 ebx, edx
            //   81e2ff000000         | and                 edx, 0xff

        $sequence_6 = { 68e8030000 8904b530b84100 ffd7 46 fe85f0f5ffff d1eb }
            // n = 6, score = 100
            //   68e8030000           | push                0x3e8
            //   8904b530b84100       | mov                 dword ptr [esi*4 + 0x41b830], eax
            //   ffd7                 | call                edi
            //   46                   | inc                 esi
            //   fe85f0f5ffff         | inc                 byte ptr [ebp - 0xa10]
            //   d1eb                 | shr                 ebx, 1

        $sequence_7 = { 8b4258 6aff 8bce ffd0 }
            // n = 4, score = 100
            //   8b4258               | mov                 eax, dword ptr [edx + 0x58]
            //   6aff                 | push                -1
            //   8bce                 | mov                 ecx, esi
            //   ffd0                 | call                eax

        $sequence_8 = { 83e80c 8bce 83d900 33f6 39442440 7514 3bf1 }
            // n = 7, score = 100
            //   83e80c               | sub                 eax, 0xc
            //   8bce                 | mov                 ecx, esi
            //   83d900               | sbb                 ecx, 0
            //   33f6                 | xor                 esi, esi
            //   39442440             | cmp                 dword ptr [esp + 0x40], eax
            //   7514                 | jne                 0x16
            //   3bf1                 | cmp                 esi, ecx

        $sequence_9 = { c1ea10 81e2ff000000 894df4 895d08 c1ee08 8b1495683a4100 81e6ff000000 }
            // n = 7, score = 100
            //   c1ea10               | shr                 edx, 0x10
            //   81e2ff000000         | and                 edx, 0xff
            //   894df4               | mov                 dword ptr [ebp - 0xc], ecx
            //   895d08               | mov                 dword ptr [ebp + 8], ebx
            //   c1ee08               | shr                 esi, 8
            //   8b1495683a4100       | mov                 edx, dword ptr [edx*4 + 0x413a68]
            //   81e6ff000000         | and                 esi, 0xff

    condition:
        7 of them and filesize < 284672
}