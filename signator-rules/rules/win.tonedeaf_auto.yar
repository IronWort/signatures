rule win_tonedeaf_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.tonedeaf."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.tonedeaf"
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
        $sequence_0 = { 84c0 75f9 2bde 4f }
            // n = 4, score = 400
            //   84c0                 | test                al, al
            //   75f9                 | jne                 0xfffffffb
            //   2bde                 | sub                 ebx, esi
            //   4f                   | dec                 edi

        $sequence_1 = { 2bc6 83f801 732f 8b0f 8bc1 2bc6 48 }
            // n = 7, score = 400
            //   2bc6                 | sub                 eax, esi
            //   83f801               | cmp                 eax, 1
            //   732f                 | jae                 0x31
            //   8b0f                 | mov                 ecx, dword ptr [edi]
            //   8bc1                 | mov                 eax, ecx
            //   2bc6                 | sub                 eax, esi
            //   48                   | dec                 eax

        $sequence_2 = { 33c0 660fd645d4 33db 8945d8 }
            // n = 4, score = 400
            //   33c0                 | xor                 eax, eax
            //   660fd645d4           | movq                qword ptr [ebp - 0x2c], xmm0
            //   33db                 | xor                 ebx, ebx
            //   8945d8               | mov                 dword ptr [ebp - 0x28], eax

        $sequence_3 = { 75f3 8bf3 8a03 43 84c0 75f9 }
            // n = 6, score = 400
            //   75f3                 | jne                 0xfffffff5
            //   8bf3                 | mov                 esi, ebx
            //   8a03                 | mov                 al, byte ptr [ebx]
            //   43                   | inc                 ebx
            //   84c0                 | test                al, al
            //   75f9                 | jne                 0xfffffffb

        $sequence_4 = { 2bd9 2bf1 8bc3 46 d1e8 33d2 }
            // n = 6, score = 400
            //   2bd9                 | sub                 ebx, ecx
            //   2bf1                 | sub                 esi, ecx
            //   8bc3                 | mov                 eax, ebx
            //   46                   | inc                 esi
            //   d1e8                 | shr                 eax, 1
            //   33d2                 | xor                 edx, edx

        $sequence_5 = { 732f 8b0f 8bc1 2bc6 48 }
            // n = 5, score = 400
            //   732f                 | jae                 0x31
            //   8b0f                 | mov                 ecx, dword ptr [edi]
            //   8bc1                 | mov                 eax, ecx
            //   2bc6                 | sub                 eax, esi
            //   48                   | dec                 eax

        $sequence_6 = { 8d7601 884c32ff 84c9 75f3 8bf3 8a03 43 }
            // n = 7, score = 400
            //   8d7601               | lea                 esi, dword ptr [esi + 1]
            //   884c32ff             | mov                 byte ptr [edx + esi - 1], cl
            //   84c9                 | test                cl, cl
            //   75f3                 | jne                 0xfffffff5
            //   8bf3                 | mov                 esi, ebx
            //   8a03                 | mov                 al, byte ptr [ebx]
            //   43                   | inc                 ebx

        $sequence_7 = { 898c153cffffff 8d45a8 c745fc01000000 50 }
            // n = 4, score = 400
            //   898c153cffffff       | mov                 dword ptr [ebp + edx - 0xc4], ecx
            //   8d45a8               | lea                 eax, dword ptr [ebp - 0x58]
            //   c745fc01000000       | mov                 dword ptr [ebp - 4], 1
            //   50                   | push                eax

        $sequence_8 = { 75f3 8bf3 8a03 43 84c0 }
            // n = 5, score = 400
            //   75f3                 | jne                 0xfffffff5
            //   8bf3                 | mov                 esi, ebx
            //   8a03                 | mov                 al, byte ptr [ebx]
            //   43                   | inc                 ebx
            //   84c0                 | test                al, al

        $sequence_9 = { 2bd9 2bf1 8bc3 46 }
            // n = 4, score = 400
            //   2bd9                 | sub                 ebx, ecx
            //   2bf1                 | sub                 esi, ecx
            //   8bc3                 | mov                 eax, ebx
            //   46                   | inc                 esi

    condition:
        7 of them and filesize < 851968
}