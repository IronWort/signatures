rule win_nestegg_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.nestegg."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.nestegg"
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
        $sequence_0 = { 85c0 7411 68???????? 50 ff15???????? a3???????? 8b4c2448 }
            // n = 7, score = 200
            //   85c0                 | test                eax, eax
            //   7411                 | je                  0x13
            //   68????????           |                     
            //   50                   | push                eax
            //   ff15????????         |                     
            //   a3????????           |                     
            //   8b4c2448             | mov                 ecx, dword ptr [esp + 0x48]

        $sequence_1 = { 8d54240c 52 8b01 ff5014 a1???????? 0520030000 50 }
            // n = 7, score = 200
            //   8d54240c             | lea                 edx, dword ptr [esp + 0xc]
            //   52                   | push                edx
            //   8b01                 | mov                 eax, dword ptr [ecx]
            //   ff5014               | call                dword ptr [eax + 0x14]
            //   a1????????           |                     
            //   0520030000           | add                 eax, 0x320
            //   50                   | push                eax

        $sequence_2 = { 8d44240c 50 687f660440 56 }
            // n = 4, score = 200
            //   8d44240c             | lea                 eax, dword ptr [esp + 0xc]
            //   50                   | push                eax
            //   687f660440           | push                0x4004667f
            //   56                   | push                esi

        $sequence_3 = { 8d842488000000 50 ffd6 8d4c2434 }
            // n = 4, score = 200
            //   8d842488000000       | lea                 eax, dword ptr [esp + 0x88]
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   8d4c2434             | lea                 ecx, dword ptr [esp + 0x34]

        $sequence_4 = { 7405 be20040000 8b0d???????? 897c246c }
            // n = 4, score = 200
            //   7405                 | je                  7
            //   be20040000           | mov                 esi, 0x420
            //   8b0d????????         |                     
            //   897c246c             | mov                 dword ptr [esp + 0x6c], edi

        $sequence_5 = { 8d4c2438 e8???????? 8b0d???????? 50 55 e8???????? }
            // n = 6, score = 200
            //   8d4c2438             | lea                 ecx, dword ptr [esp + 0x38]
            //   e8????????           |                     
            //   8b0d????????         |                     
            //   50                   | push                eax
            //   55                   | push                ebp
            //   e8????????           |                     

        $sequence_6 = { 33c0 5e 83c414 c3 33c9 50 }
            // n = 6, score = 200
            //   33c0                 | xor                 eax, eax
            //   5e                   | pop                 esi
            //   83c414               | add                 esp, 0x14
            //   c3                   | ret                 
            //   33c9                 | xor                 ecx, ecx
            //   50                   | push                eax

        $sequence_7 = { 8b842424020000 56 6a06 6a01 }
            // n = 4, score = 200
            //   8b842424020000       | mov                 eax, dword ptr [esp + 0x224]
            //   56                   | push                esi
            //   6a06                 | push                6
            //   6a01                 | push                1

        $sequence_8 = { 85c0 741e 8b442420 3bc3 7416 03f8 8b44241c }
            // n = 7, score = 200
            //   85c0                 | test                eax, eax
            //   741e                 | je                  0x20
            //   8b442420             | mov                 eax, dword ptr [esp + 0x20]
            //   3bc3                 | cmp                 eax, ebx
            //   7416                 | je                  0x18
            //   03f8                 | add                 edi, eax
            //   8b44241c             | mov                 eax, dword ptr [esp + 0x1c]

        $sequence_9 = { 88442418 88442419 88442425 88442426 8d442428 }
            // n = 5, score = 200
            //   88442418             | mov                 byte ptr [esp + 0x18], al
            //   88442419             | mov                 byte ptr [esp + 0x19], al
            //   88442425             | mov                 byte ptr [esp + 0x25], al
            //   88442426             | mov                 byte ptr [esp + 0x26], al
            //   8d442428             | lea                 eax, dword ptr [esp + 0x28]

    condition:
        7 of them and filesize < 221184
}