rule win_badcall_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.badcall."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.badcall"
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
        $sequence_0 = { ffd3 85c0 0f858c000000 8b942424020000 55 52 }
            // n = 6, score = 300
            //   ffd3                 | call                ebx
            //   85c0                 | test                eax, eax
            //   0f858c000000         | jne                 0x92
            //   8b942424020000       | mov                 edx, dword ptr [esp + 0x224]
            //   55                   | push                ebp
            //   52                   | push                edx

        $sequence_1 = { ff15???????? c20400 c705????????01000000 a1???????? 68???????? 50 }
            // n = 6, score = 300
            //   ff15????????         |                     
            //   c20400               | ret                 4
            //   c705????????01000000     |     
            //   a1????????           |                     
            //   68????????           |                     
            //   50                   | push                eax

        $sequence_2 = { 52 e8???????? 83c40c 33c9 83f8ff 0f94c1 8bc1 }
            // n = 7, score = 300
            //   52                   | push                edx
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   33c9                 | xor                 ecx, ecx
            //   83f8ff               | cmp                 eax, -1
            //   0f94c1               | sete                cl
            //   8bc1                 | mov                 eax, ecx

        $sequence_3 = { 7434 83e803 7557 33c0 68???????? a3???????? }
            // n = 6, score = 300
            //   7434                 | je                  0x36
            //   83e803               | sub                 eax, 3
            //   7557                 | jne                 0x59
            //   33c0                 | xor                 eax, eax
            //   68????????           |                     
            //   a3????????           |                     

        $sequence_4 = { f7d1 49 be???????? 8bc1 8bd1 8d7c240c 89442408 }
            // n = 7, score = 300
            //   f7d1                 | not                 ecx
            //   49                   | dec                 ecx
            //   be????????           |                     
            //   8bc1                 | mov                 eax, ecx
            //   8bd1                 | mov                 edx, ecx
            //   8d7c240c             | lea                 edi, dword ptr [esp + 0xc]
            //   89442408             | mov                 dword ptr [esp + 8], eax

        $sequence_5 = { 7455 48 7434 83e803 }
            // n = 4, score = 300
            //   7455                 | je                  0x57
            //   48                   | dec                 eax
            //   7434                 | je                  0x36
            //   83e803               | sub                 eax, 3

        $sequence_6 = { a3???????? a3???????? a3???????? a1???????? 50 c705????????04000000 ff15???????? }
            // n = 7, score = 300
            //   a3????????           |                     
            //   a3????????           |                     
            //   a3????????           |                     
            //   a1????????           |                     
            //   50                   | push                eax
            //   c705????????04000000     |     
            //   ff15????????         |                     

        $sequence_7 = { 50 c705????????04000000 ff15???????? c20400 a1???????? 68???????? }
            // n = 6, score = 300
            //   50                   | push                eax
            //   c705????????04000000     |     
            //   ff15????????         |                     
            //   c20400               | ret                 4
            //   a1????????           |                     
            //   68????????           |                     

        $sequence_8 = { e8???????? 85c0 7615 8a4c2408 8a542420 3aca }
            // n = 6, score = 300
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7615                 | jbe                 0x17
            //   8a4c2408             | mov                 cl, byte ptr [esp + 8]
            //   8a542420             | mov                 dl, byte ptr [esp + 0x20]
            //   3aca                 | cmp                 cl, dl

        $sequence_9 = { 8d7e2c 8bcf e8???????? 8b4604 8bcf }
            // n = 5, score = 300
            //   8d7e2c               | lea                 edi, dword ptr [esi + 0x2c]
            //   8bcf                 | mov                 ecx, edi
            //   e8????????           |                     
            //   8b4604               | mov                 eax, dword ptr [esi + 4]
            //   8bcf                 | mov                 ecx, edi

        $sequence_10 = { 8d44240c 50 51 e8???????? f7d8 }
            // n = 5, score = 300
            //   8d44240c             | lea                 eax, dword ptr [esp + 0xc]
            //   50                   | push                eax
            //   51                   | push                ecx
            //   e8????????           |                     
            //   f7d8                 | neg                 eax

        $sequence_11 = { 85c0 7e06 03f0 3bf7 7ce1 33c0 }
            // n = 6, score = 300
            //   85c0                 | test                eax, eax
            //   7e06                 | jle                 8
            //   03f0                 | add                 esi, eax
            //   3bf7                 | cmp                 esi, edi
            //   7ce1                 | jl                  0xffffffe3
            //   33c0                 | xor                 eax, eax

        $sequence_12 = { 6a02 c744241801000000 8944241c c744242000000000 ff15???????? }
            // n = 5, score = 300
            //   6a02                 | push                2
            //   c744241801000000     | mov                 dword ptr [esp + 0x18], 1
            //   8944241c             | mov                 dword ptr [esp + 0x1c], eax
            //   c744242000000000     | mov                 dword ptr [esp + 0x20], 0
            //   ff15????????         |                     

        $sequence_13 = { 8b442404 48 7455 48 }
            // n = 4, score = 300
            //   8b442404             | mov                 eax, dword ptr [esp + 4]
            //   48                   | dec                 eax
            //   7455                 | je                  0x57
            //   48                   | dec                 eax

        $sequence_14 = { 81ec2c010000 85c0 7511 b800000100 a3???????? }
            // n = 5, score = 200
            //   81ec2c010000         | sub                 esp, 0x12c
            //   85c0                 | test                eax, eax
            //   7511                 | jne                 0x13
            //   b800000100           | mov                 eax, 0x10000
            //   a3????????           |                     

        $sequence_15 = { 5e 5d 5b 83c434 c3 837c2418fd }
            // n = 6, score = 200
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp
            //   5b                   | pop                 ebx
            //   83c434               | add                 esp, 0x34
            //   c3                   | ret                 
            //   837c2418fd           | cmp                 dword ptr [esp + 0x18], -3

    condition:
        7 of them and filesize < 483328
}