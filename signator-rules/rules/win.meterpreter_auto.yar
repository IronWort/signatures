rule win_meterpreter_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.meterpreter."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.meterpreter"
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
        $sequence_0 = { 90 55 8bd2 51 a0???????? }
            // n = 5, score = 200
            //   90                   | nop                 
            //   55                   | push                ebp
            //   8bd2                 | mov                 edx, edx
            //   51                   | push                ecx
            //   a0????????           |                     

        $sequence_1 = { 005688 06 ef e8???????? 5f 33c0 }
            // n = 6, score = 200
            //   005688               | add                 byte ptr [esi - 0x78], dl
            //   06                   | push                es
            //   ef                   | out                 dx, eax
            //   e8????????           |                     
            //   5f                   | pop                 edi
            //   33c0                 | xor                 eax, eax

        $sequence_2 = { 1889198b4a14 ac 08894214c142 388d4a1185a1 }
            // n = 4, score = 200
            //   1889198b4a14         | sbb                 byte ptr [ecx + 0x144a8b19], cl
            //   ac                   | lodsb               al, byte ptr [esi]
            //   08894214c142         | or                  byte ptr [ecx + 0x42c11442], cl
            //   388d4a1185a1         | cmp                 byte ptr [ebp - 0x5e7aeeb6], cl

        $sequence_3 = { 55 8bec 8b4d08 56 8b41a8 }
            // n = 5, score = 200
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   56                   | push                esi
            //   8b41a8               | mov                 eax, dword ptr [ecx - 0x58]

        $sequence_4 = { 8b6110 83c4c4 2bf0 8931 5e be9be55dc3 }
            // n = 6, score = 200
            //   8b6110               | mov                 esp, dword ptr [ecx + 0x10]
            //   83c4c4               | add                 esp, -0x3c
            //   2bf0                 | sub                 esi, eax
            //   8931                 | mov                 dword ptr [ecx], esi
            //   5e                   | pop                 esi
            //   be9be55dc3           | mov                 esi, 0xc35de59b

        $sequence_5 = { 15???????? 005ee6 e55d c3 8bbde0024100 52 }
            // n = 6, score = 200
            //   15????????           |                     
            //   005ee6               | add                 byte ptr [esi - 0x1a], bl
            //   e55d                 | in                  eax, 0x5d
            //   c3                   | ret                 
            //   8bbde0024100         | mov                 edi, dword ptr [ebp + 0x4102e0]
            //   52                   | push                edx

        $sequence_6 = { 6a38 895010 8b0e 8b512a }
            // n = 4, score = 200
            //   6a38                 | push                0x38
            //   895010               | mov                 dword ptr [eax + 0x10], edx
            //   8b0e                 | mov                 ecx, dword ptr [esi]
            //   8b512a               | mov                 edx, dword ptr [ecx + 0x2a]

        $sequence_7 = { 0000 8bfe 0c89 55 8e8d45ec0f51 f6593a }
            // n = 6, score = 200
            //   0000                 | add                 byte ptr [eax], al
            //   8bfe                 | mov                 edi, esi
            //   0c89                 | or                  al, 0x89
            //   55                   | push                ebp
            //   8e8d45ec0f51         | mov                 cs, word ptr [ebp + 0x510fec45]
            //   f6593a               | neg                 byte ptr [ecx + 0x3a]

        $sequence_8 = { 85f6 7508 8975f8 8975fc eb0d }
            // n = 5, score = 200
            //   85f6                 | test                esi, esi
            //   7508                 | jne                 0xa
            //   8975f8               | mov                 dword ptr [ebp - 8], esi
            //   8975fc               | mov                 dword ptr [ebp - 4], esi
            //   eb0d                 | jmp                 0xf

        $sequence_9 = { aa e8???????? 8b7508 8a4de4 ce 06 }
            // n = 6, score = 200
            //   aa                   | stosb               byte ptr es:[edi], al
            //   e8????????           |                     
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   8a4de4               | mov                 cl, byte ptr [ebp - 0x1c]
            //   ce                   | into                
            //   06                   | push                es

    condition:
        7 of them and filesize < 188416
}