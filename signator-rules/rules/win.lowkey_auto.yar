rule win_lowkey_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.lowkey."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.lowkey"
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
        $sequence_0 = { 488d0d16010200 4533c0 33d2 e9???????? 4883ec28 488b0d???????? e8???????? }
            // n = 7, score = 100
            //   488d0d16010200       | lea                 eax, dword ptr [0x99a2]
            //   4533c0               | dec                 eax
            //   33d2                 | mov                 dword ptr [ebp - 0x19], edx
            //   e9????????           |                     
            //   4883ec28             | inc                 ecx
            //   488b0d????????       |                     
            //   e8????????           |                     

        $sequence_1 = { 7326 4863c9 488d15d0f70200 488bc1 }
            // n = 4, score = 100
            //   7326                 | dec                 eax
            //   4863c9               | mov                 esi, ebx
            //   488d15d0f70200       | dec                 esp
            //   488bc1               | mov                 esi, ebx

        $sequence_2 = { 448d4302 45894bd8 6641b90100 49894398 ff15???????? 85c0 0f94c3 }
            // n = 7, score = 100
            //   448d4302             | add                 esp, 0x2a90
            //   45894bd8             | inc                 ecx
            //   6641b90100           | pop                 esi
            //   49894398             | pop                 esi
            //   ff15????????         |                     
            //   85c0                 | pop                 ebp
            //   0f94c3               | dec                 eax

        $sequence_3 = { b8e8250000 e8???????? 482be0 488b05???????? 4833c4 488985d0240000 488bd9 }
            // n = 7, score = 100
            //   b8e8250000           | mov                 edi, eax
            //   e8????????           |                     
            //   482be0               | dec                 ecx
            //   488b05????????       |                     
            //   4833c4               | mov                 edi, eax
            //   488985d0240000       | dec                 eax
            //   488bd9               | mov                 eax, dword ptr [ecx + eax*8]

        $sequence_4 = { e8???????? 8b4c2468 488d95f0030000 e8???????? 448b4c2468 488d85e0010000 }
            // n = 6, score = 100
            //   e8????????           |                     
            //   8b4c2468             | lea                 eax, dword ptr [edx + esi]
            //   488d95f0030000       | dec                 eax
            //   e8????????           |                     
            //   448b4c2468           | sub                 ecx, edx
            //   488d85e0010000       | nop                 word ptr [eax + eax]

        $sequence_5 = { e8???????? 4c8d4c2448 4c89742428 4c8d0594fcffff }
            // n = 4, score = 100
            //   e8????????           |                     
            //   4c8d4c2448           | mov                 dword ptr [esp + 0x38], eax
            //   4c89742428           | dec                 esp
            //   4c8d0594fcffff       | lea                 eax, dword ptr [ebp + 0x4c0]

        $sequence_6 = { 89442430 4889442420 ff15???????? 83c9ff 85c0 }
            // n = 5, score = 100
            //   89442430             | dec                 eax
            //   4889442420           | add                 edx, dword ptr [esi + 0x10]
            //   ff15????????         |                     
            //   83c9ff               | inc                 esp
            //   85c0                 | sub                 edi, eax

        $sequence_7 = { 4889451f 488d05a3990000 4889452f 48895507 48895527 8d51ff }
            // n = 6, score = 100
            //   4889451f             | mov                 dword ptr [esp + 0x60], 0x238
            //   488d05a3990000       | xor                 ebx, ebx
            //   4889452f             | xor                 edx, edx
            //   48895507             | xor                 ecx, ecx
            //   48895527             | movups              xmmword ptr [ebp], xmm0
            //   8d51ff               | xor                 edx, edx

        $sequence_8 = { 4c8d05afedffff 33d2 33c9 ff15???????? 4889442430 c7442470433a5c57 c7442474696e646f }
            // n = 7, score = 100
            //   4c8d05afedffff       | mov                 esi, ecx
            //   33d2                 | dec                 eax
            //   33c9                 | sub                 esp, 0x38
            //   ff15????????         |                     
            //   4889442430           | dec                 eax
            //   c7442470433a5c57     | lea                 eax, dword ptr [0x9545]
            //   c7442474696e646f     | inc                 ecx

        $sequence_9 = { 6666660f1f840000000000 33db 488b0d???????? 488d542420 41b810000000 4863c3 442bc3 }
            // n = 7, score = 100
            //   6666660f1f840000000000     | mov    dword ptr [eax + 0x18], esi
            //   33db                 | dec                 eax
            //   488b0d????????       |                     
            //   488d542420           | mov                 dword ptr [eax + 0x20], edi
            //   41b810000000         | inc                 ecx
            //   4863c3               | push                esi
            //   442bc3               | xor                 ebp, ebp

    condition:
        7 of them and filesize < 643072
}