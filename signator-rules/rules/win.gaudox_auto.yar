rule win_gaudox_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.gaudox."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.gaudox"
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
        $sequence_0 = { 6a04 53 6a09 6a04 e8???????? }
            // n = 5, score = 200
            //   6a04                 | push                4
            //   53                   | push                ebx
            //   6a09                 | push                9
            //   6a04                 | push                4
            //   e8????????           |                     

        $sequence_1 = { 0f848c020000 8b7d0c 85ff 0f8481020000 53 32ff 33d2 }
            // n = 7, score = 200
            //   0f848c020000         | je                  0x292
            //   8b7d0c               | mov                 edi, dword ptr [ebp + 0xc]
            //   85ff                 | test                edi, edi
            //   0f8481020000         | je                  0x287
            //   53                   | push                ebx
            //   32ff                 | xor                 bh, bh
            //   33d2                 | xor                 edx, edx

        $sequence_2 = { 03c6 8b4878 85c9 0f843d020000 8b587c 85db 0f8432020000 }
            // n = 7, score = 200
            //   03c6                 | add                 eax, esi
            //   8b4878               | mov                 ecx, dword ptr [eax + 0x78]
            //   85c9                 | test                ecx, ecx
            //   0f843d020000         | je                  0x243
            //   8b587c               | mov                 ebx, dword ptr [eax + 0x7c]
            //   85db                 | test                ebx, ebx
            //   0f8432020000         | je                  0x238

        $sequence_3 = { 8945d4 8d45c4 6a00 8945d8 8d45d0 50 6803001f00 }
            // n = 7, score = 200
            //   8945d4               | mov                 dword ptr [ebp - 0x2c], eax
            //   8d45c4               | lea                 eax, dword ptr [ebp - 0x3c]
            //   6a00                 | push                0
            //   8945d8               | mov                 dword ptr [ebp - 0x28], eax
            //   8d45d0               | lea                 eax, dword ptr [ebp - 0x30]
            //   50                   | push                eax
            //   6803001f00           | push                0x1f0003

        $sequence_4 = { 9c 60 be???????? 56 64ff3500000000 64892500000000 }
            // n = 6, score = 200
            //   9c                   | pushfd              
            //   60                   | pushal              
            //   be????????           |                     
            //   56                   | push                esi
            //   64ff3500000000       | push                dword ptr fs:[0]
            //   64892500000000       | mov                 dword ptr fs:[0], esp

        $sequence_5 = { c745f000000000 ff7004 895dd4 e8???????? 85c0 0f88ab000000 8b03 }
            // n = 7, score = 200
            //   c745f000000000       | mov                 dword ptr [ebp - 0x10], 0
            //   ff7004               | push                dword ptr [eax + 4]
            //   895dd4               | mov                 dword ptr [ebp - 0x2c], ebx
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   0f88ab000000         | js                  0xb1
            //   8b03                 | mov                 eax, dword ptr [ebx]

        $sequence_6 = { 8b55fc 8b4dec 8b45f0 41 ff45f4 03c8 8b7508 }
            // n = 7, score = 200
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   8b4dec               | mov                 ecx, dword ptr [ebp - 0x14]
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   41                   | inc                 ecx
            //   ff45f4               | inc                 dword ptr [ebp - 0xc]
            //   03c8                 | add                 ecx, eax
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]

        $sequence_7 = { c20800 c7460c00000000 8b55fc 8a4d0b 5f 5e 8902 }
            // n = 7, score = 200
            //   c20800               | ret                 8
            //   c7460c00000000       | mov                 dword ptr [esi + 0xc], 0
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   8a4d0b               | mov                 cl, byte ptr [ebp + 0xb]
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   8902                 | mov                 dword ptr [edx], eax

        $sequence_8 = { 8d4902 668941fe 8d52fe 4f 75f0 8b45fc 03c6 }
            // n = 7, score = 200
            //   8d4902               | lea                 ecx, dword ptr [ecx + 2]
            //   668941fe             | mov                 word ptr [ecx - 2], ax
            //   8d52fe               | lea                 edx, dword ptr [edx - 2]
            //   4f                   | dec                 edi
            //   75f0                 | jne                 0xfffffff2
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   03c6                 | add                 eax, esi

        $sequence_9 = { 8b442438 03c7 7406 8a4c240b }
            // n = 4, score = 200
            //   8b442438             | mov                 eax, dword ptr [esp + 0x38]
            //   03c7                 | add                 eax, edi
            //   7406                 | je                  8
            //   8a4c240b             | mov                 cl, byte ptr [esp + 0xb]

    condition:
        7 of them and filesize < 155648
}