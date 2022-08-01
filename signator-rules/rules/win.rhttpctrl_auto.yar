rule win_rhttpctrl_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.rhttpctrl."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.rhttpctrl"
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
        $sequence_0 = { 6a00 6a00 8985e4fbffff 8d85d8fbffff 6a01 6a00 c785d8fbffff10fc4100 }
            // n = 7, score = 100
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   8985e4fbffff         | mov                 dword ptr [ebp - 0x41c], eax
            //   8d85d8fbffff         | lea                 eax, dword ptr [ebp - 0x428]
            //   6a01                 | push                1
            //   6a00                 | push                0
            //   c785d8fbffff10fc4100     | mov    dword ptr [ebp - 0x428], 0x41fc10

        $sequence_1 = { 83c40c 8d442404 8d542408 8d4c240c 50 e8???????? 83c404 }
            // n = 7, score = 100
            //   83c40c               | add                 esp, 0xc
            //   8d442404             | lea                 eax, dword ptr [esp + 4]
            //   8d542408             | lea                 edx, dword ptr [esp + 8]
            //   8d4c240c             | lea                 ecx, dword ptr [esp + 0xc]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c404               | add                 esp, 4

        $sequence_2 = { 8b85d8feffff 47 83c04c 89bde0feffff 8985d8feffff 3b7d0c 0f8228feffff }
            // n = 7, score = 100
            //   8b85d8feffff         | mov                 eax, dword ptr [ebp - 0x128]
            //   47                   | inc                 edi
            //   83c04c               | add                 eax, 0x4c
            //   89bde0feffff         | mov                 dword ptr [ebp - 0x120], edi
            //   8985d8feffff         | mov                 dword ptr [ebp - 0x128], eax
            //   3b7d0c               | cmp                 edi, dword ptr [ebp + 0xc]
            //   0f8228feffff         | jb                  0xfffffe2e

        $sequence_3 = { 85c9 7407 395004 7402 8811 8b4808 85c9 }
            // n = 7, score = 100
            //   85c9                 | test                ecx, ecx
            //   7407                 | je                  9
            //   395004               | cmp                 dword ptr [eax + 4], edx
            //   7402                 | je                  4
            //   8811                 | mov                 byte ptr [ecx], dl
            //   8b4808               | mov                 ecx, dword ptr [eax + 8]
            //   85c9                 | test                ecx, ecx

        $sequence_4 = { 8b4810 85c9 7407 395014 7402 8811 8b4818 }
            // n = 7, score = 100
            //   8b4810               | mov                 ecx, dword ptr [eax + 0x10]
            //   85c9                 | test                ecx, ecx
            //   7407                 | je                  9
            //   395014               | cmp                 dword ptr [eax + 0x14], edx
            //   7402                 | je                  4
            //   8811                 | mov                 byte ptr [ecx], dl
            //   8b4818               | mov                 ecx, dword ptr [eax + 0x18]

        $sequence_5 = { 8d049d58414200 8b30 8945fc 90 85f6 740b 83feff }
            // n = 7, score = 100
            //   8d049d58414200       | lea                 eax, dword ptr [ebx*4 + 0x424158]
            //   8b30                 | mov                 esi, dword ptr [eax]
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   90                   | nop                 
            //   85f6                 | test                esi, esi
            //   740b                 | je                  0xd
            //   83feff               | cmp                 esi, -1

        $sequence_6 = { 83c8ff 83c6f0 f00fc1460c 48 85c0 7f08 8b0e }
            // n = 7, score = 100
            //   83c8ff               | or                  eax, 0xffffffff
            //   83c6f0               | add                 esi, -0x10
            //   f00fc1460c           | lock xadd           dword ptr [esi + 0xc], eax
            //   48                   | dec                 eax
            //   85c0                 | test                eax, eax
            //   7f08                 | jg                  0xa
            //   8b0e                 | mov                 ecx, dword ptr [esi]

        $sequence_7 = { 0f8c22010000 8b19 8d043a 8b4bf4 }
            // n = 4, score = 100
            //   0f8c22010000         | jl                  0x128
            //   8b19                 | mov                 ebx, dword ptr [ecx]
            //   8d043a               | lea                 eax, dword ptr [edx + edi]
            //   8b4bf4               | mov                 ecx, dword ptr [ebx - 0xc]

        $sequence_8 = { 52 8b01 ff5004 8bbddcfeffff }
            // n = 4, score = 100
            //   52                   | push                edx
            //   8b01                 | mov                 eax, dword ptr [ecx]
            //   ff5004               | call                dword ptr [eax + 4]
            //   8bbddcfeffff         | mov                 edi, dword ptr [ebp - 0x124]

        $sequence_9 = { 51 e8???????? 57 e8???????? 83c404 ffb5f0feffff ff15???????? }
            // n = 7, score = 100
            //   51                   | push                ecx
            //   e8????????           |                     
            //   57                   | push                edi
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   ffb5f0feffff         | push                dword ptr [ebp - 0x110]
            //   ff15????????         |                     

    condition:
        7 of them and filesize < 339968
}