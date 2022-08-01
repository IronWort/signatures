rule win_ziyangrat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.ziyangrat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ziyangrat"
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
        $sequence_0 = { 66a5 8dbd74ffffff 83c9ff 33c0 }
            // n = 4, score = 200
            //   66a5                 | movsw               word ptr es:[edi], word ptr [esi]
            //   8dbd74ffffff         | lea                 edi, dword ptr [ebp - 0x8c]
            //   83c9ff               | or                  ecx, 0xffffffff
            //   33c0                 | xor                 eax, eax

        $sequence_1 = { 83c404 3bf1 8bf8 7e2a 8bd6 }
            // n = 5, score = 200
            //   83c404               | add                 esp, 4
            //   3bf1                 | cmp                 esi, ecx
            //   8bf8                 | mov                 edi, eax
            //   7e2a                 | jle                 0x2c
            //   8bd6                 | mov                 edx, esi

        $sequence_2 = { 51 25ffff0000 52 50 8d8c3480010000 68???????? }
            // n = 6, score = 200
            //   51                   | push                ecx
            //   25ffff0000           | and                 eax, 0xffff
            //   52                   | push                edx
            //   50                   | push                eax
            //   8d8c3480010000       | lea                 ecx, dword ptr [esp + esi + 0x180]
            //   68????????           |                     

        $sequence_3 = { 889e245d4100 8b4c241c 46 81e6ff0f0000 8d4101 25ff0f0000 }
            // n = 6, score = 200
            //   889e245d4100         | mov                 byte ptr [esi + 0x415d24], bl
            //   8b4c241c             | mov                 ecx, dword ptr [esp + 0x1c]
            //   46                   | inc                 esi
            //   81e6ff0f0000         | and                 esi, 0xfff
            //   8d4101               | lea                 eax, dword ptr [ecx + 1]
            //   25ff0f0000           | and                 eax, 0xfff

        $sequence_4 = { e8???????? 85c0 7d15 a1???????? }
            // n = 4, score = 200
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7d15                 | jge                 0x17
            //   a1????????           |                     

        $sequence_5 = { 51 52 8d84347c010000 68???????? 50 }
            // n = 5, score = 200
            //   51                   | push                ecx
            //   52                   | push                edx
            //   8d84347c010000       | lea                 eax, dword ptr [esp + esi + 0x17c]
            //   68????????           |                     
            //   50                   | push                eax

        $sequence_6 = { ffd3 5f 5e b801000000 5b c3 5f }
            // n = 7, score = 200
            //   ffd3                 | call                ebx
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   b801000000           | mov                 eax, 1
            //   5b                   | pop                 ebx
            //   c3                   | ret                 
            //   5f                   | pop                 edi

        $sequence_7 = { 51 8b4c2420 52 8b542422 }
            // n = 4, score = 200
            //   51                   | push                ecx
            //   8b4c2420             | mov                 ecx, dword ptr [esp + 0x20]
            //   52                   | push                edx
            //   8b542422             | mov                 edx, dword ptr [esp + 0x22]

        $sequence_8 = { 0f8fa1000000 833b00 7407 8b4c2424 880429 45 8887244d4100 }
            // n = 7, score = 200
            //   0f8fa1000000         | jg                  0xa7
            //   833b00               | cmp                 dword ptr [ebx], 0
            //   7407                 | je                  9
            //   8b4c2424             | mov                 ecx, dword ptr [esp + 0x24]
            //   880429               | mov                 byte ptr [ecx + ebp], al
            //   45                   | inc                 ebp
            //   8887244d4100         | mov                 byte ptr [edi + 0x414d24], al

        $sequence_9 = { ff15???????? bf???????? 83c9ff 33c0 8d942454050000 }
            // n = 5, score = 200
            //   ff15????????         |                     
            //   bf????????           |                     
            //   83c9ff               | or                  ecx, 0xffffffff
            //   33c0                 | xor                 eax, eax
            //   8d942454050000       | lea                 edx, dword ptr [esp + 0x554]

    condition:
        7 of them and filesize < 188416
}