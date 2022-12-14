rule win_newcore_rat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.newcore_rat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.newcore_rat"
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
        $sequence_0 = { 51 e8???????? 83c40c 8bce e8???????? e9???????? 8d8c2484040000 }
            // n = 7, score = 100
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   e9????????           |                     
            //   8d8c2484040000       | lea                 ecx, dword ptr [esp + 0x484]

        $sequence_1 = { 51 8d542450 52 50 895c2424 ffd7 85c0 }
            // n = 7, score = 100
            //   51                   | push                ecx
            //   8d542450             | lea                 edx, dword ptr [esp + 0x50]
            //   52                   | push                edx
            //   50                   | push                eax
            //   895c2424             | mov                 dword ptr [esp + 0x24], ebx
            //   ffd7                 | call                edi
            //   85c0                 | test                eax, eax

        $sequence_2 = { 53 8d94247c080000 52 68???????? }
            // n = 4, score = 100
            //   53                   | push                ebx
            //   8d94247c080000       | lea                 edx, dword ptr [esp + 0x87c]
            //   52                   | push                edx
            //   68????????           |                     

        $sequence_3 = { 0437 eb02 0430 0fb64c1452 88445417 8bc1 }
            // n = 6, score = 100
            //   0437                 | add                 al, 0x37
            //   eb02                 | jmp                 4
            //   0430                 | add                 al, 0x30
            //   0fb64c1452           | movzx               ecx, byte ptr [esp + edx + 0x52]
            //   88445417             | mov                 byte ptr [esp + edx*2 + 0x17], al
            //   8bc1                 | mov                 eax, ecx

        $sequence_4 = { 0430 0fb64c2428 88442447 8bc1 c1e804 83f809 7e04 }
            // n = 7, score = 100
            //   0430                 | add                 al, 0x30
            //   0fb64c2428           | movzx               ecx, byte ptr [esp + 0x28]
            //   88442447             | mov                 byte ptr [esp + 0x47], al
            //   8bc1                 | mov                 eax, ecx
            //   c1e804               | shr                 eax, 4
            //   83f809               | cmp                 eax, 9
            //   7e04                 | jle                 6

        $sequence_5 = { e8???????? 59 8945e4 8b7508 c7465cc01b0310 33ff }
            // n = 6, score = 100
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   8945e4               | mov                 dword ptr [ebp - 0x1c], eax
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   c7465cc01b0310       | mov                 dword ptr [esi + 0x5c], 0x10031bc0
            //   33ff                 | xor                 edi, edi

        $sequence_6 = { eb02 0430 0fb64c2420 88442433 8bc1 c1e804 }
            // n = 6, score = 100
            //   eb02                 | jmp                 4
            //   0430                 | add                 al, 0x30
            //   0fb64c2420           | movzx               ecx, byte ptr [esp + 0x20]
            //   88442433             | mov                 byte ptr [esp + 0x33], al
            //   8bc1                 | mov                 eax, ecx
            //   c1e804               | shr                 eax, 4

        $sequence_7 = { 0f8580030000 8d442410 50 8d4c2418 e8???????? }
            // n = 5, score = 100
            //   0f8580030000         | jne                 0x386
            //   8d442410             | lea                 eax, dword ptr [esp + 0x10]
            //   50                   | push                eax
            //   8d4c2418             | lea                 ecx, dword ptr [esp + 0x18]
            //   e8????????           |                     

        $sequence_8 = { c644244c00 8944244d 89442451 88442455 e8???????? 6a63 }
            // n = 6, score = 100
            //   c644244c00           | mov                 byte ptr [esp + 0x4c], 0
            //   8944244d             | mov                 dword ptr [esp + 0x4d], eax
            //   89442451             | mov                 dword ptr [esp + 0x51], eax
            //   88442455             | mov                 byte ptr [esp + 0x55], al
            //   e8????????           |                     
            //   6a63                 | push                0x63

        $sequence_9 = { 033485c0cd0310 c745e401000000 33db 395e08 }
            // n = 4, score = 100
            //   033485c0cd0310       | add                 esi, dword ptr [eax*4 + 0x1003cdc0]
            //   c745e401000000       | mov                 dword ptr [ebp - 0x1c], 1
            //   33db                 | xor                 ebx, ebx
            //   395e08               | cmp                 dword ptr [esi + 8], ebx

    condition:
        7 of them and filesize < 581632
}