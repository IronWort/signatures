rule win_danabot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.danabot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.danabot"
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
        $sequence_0 = { 59 648910 68???????? 8d45ac ba0f000000 e8???????? }
            // n = 6, score = 400
            //   59                   | pop                 ecx
            //   648910               | mov                 dword ptr fs:[eax], edx
            //   68????????           |                     
            //   8d45ac               | lea                 eax, dword ptr [ebp - 0x54]
            //   ba0f000000           | mov                 edx, 0xf
            //   e8????????           |                     

        $sequence_1 = { 0305???????? 8b15???????? 0315???????? 3bc2 7e0a }
            // n = 5, score = 400
            //   0305????????         |                     
            //   8b15????????         |                     
            //   0315????????         |                     
            //   3bc2                 | cmp                 eax, edx
            //   7e0a                 | jle                 0xc

        $sequence_2 = { 8b03 50 8b442420 50 6a15 }
            // n = 5, score = 400
            //   8b03                 | mov                 eax, dword ptr [ebx]
            //   50                   | push                eax
            //   8b442420             | mov                 eax, dword ptr [esp + 0x20]
            //   50                   | push                eax
            //   6a15                 | push                0x15

        $sequence_3 = { 03c3 8906 8b06 e8???????? 8b55f8 8902 6a00 }
            // n = 7, score = 400
            //   03c3                 | add                 eax, ebx
            //   8906                 | mov                 dword ptr [esi], eax
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   e8????????           |                     
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]
            //   8902                 | mov                 dword ptr [edx], eax
            //   6a00                 | push                0

        $sequence_4 = { ff15???????? 8b13 85d2 7407 83ea04 8b12 }
            // n = 6, score = 400
            //   ff15????????         |                     
            //   8b13                 | mov                 edx, dword ptr [ebx]
            //   85d2                 | test                edx, edx
            //   7407                 | je                  9
            //   83ea04               | sub                 edx, 4
            //   8b12                 | mov                 edx, dword ptr [edx]

        $sequence_5 = { 50 8b44243c 50 6a06 684f7ea86f 8bc3 }
            // n = 6, score = 400
            //   50                   | push                eax
            //   8b44243c             | mov                 eax, dword ptr [esp + 0x3c]
            //   50                   | push                eax
            //   6a06                 | push                6
            //   684f7ea86f           | push                0x6fa87e4f
            //   8bc3                 | mov                 eax, ebx

        $sequence_6 = { 8d45fc e8???????? 8d4438ff 50 8bc6 33d2 }
            // n = 6, score = 400
            //   8d45fc               | lea                 eax, dword ptr [ebp - 4]
            //   e8????????           |                     
            //   8d4438ff             | lea                 eax, dword ptr [eax + edi - 1]
            //   50                   | push                eax
            //   8bc6                 | mov                 eax, esi
            //   33d2                 | xor                 edx, edx

        $sequence_7 = { 8d8ddcfbffff b208 8b45f8 e8???????? }
            // n = 4, score = 400
            //   8d8ddcfbffff         | lea                 ecx, dword ptr [ebp - 0x424]
            //   b208                 | mov                 dl, 8
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   e8????????           |                     

        $sequence_8 = { 85f6 7632 8d45fc e8???????? 8d4438ff 50 8bc6 }
            // n = 7, score = 400
            //   85f6                 | test                esi, esi
            //   7632                 | jbe                 0x34
            //   8d45fc               | lea                 eax, dword ptr [ebp - 4]
            //   e8????????           |                     
            //   8d4438ff             | lea                 eax, dword ptr [eax + edi - 1]
            //   50                   | push                eax
            //   8bc6                 | mov                 eax, esi

        $sequence_9 = { e8???????? 8bd8 8b17 8bc2 85c0 7407 83e804 }
            // n = 7, score = 400
            //   e8????????           |                     
            //   8bd8                 | mov                 ebx, eax
            //   8b17                 | mov                 edx, dword ptr [edi]
            //   8bc2                 | mov                 eax, edx
            //   85c0                 | test                eax, eax
            //   7407                 | je                  9
            //   83e804               | sub                 eax, 4

    condition:
        7 of them and filesize < 237568
}