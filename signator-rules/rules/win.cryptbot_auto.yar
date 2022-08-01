rule win_cryptbot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.cryptbot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.cryptbot"
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
        $sequence_0 = { 33c0 85ed 0f94c0 8be8 }
            // n = 4, score = 700
            //   33c0                 | xor                 eax, eax
            //   85ed                 | test                ebp, ebp
            //   0f94c0               | sete                al
            //   8be8                 | mov                 ebp, eax

        $sequence_1 = { e8???????? 85c0 750f b955960100 e8???????? e9???????? }
            // n = 6, score = 600
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   750f                 | jne                 0x11
            //   b955960100           | mov                 ecx, 0x19655
            //   e8????????           |                     
            //   e9????????           |                     

        $sequence_2 = { 7211 c705????????01000000 e8???????? eb07 8325????????00 }
            // n = 5, score = 600
            //   7211                 | jb                  0x13
            //   c705????????01000000     |     
            //   e8????????           |                     
            //   eb07                 | jmp                 9
            //   8325????????00       |                     

        $sequence_3 = { e8???????? 85c0 750c b961030200 e8???????? }
            // n = 5, score = 600
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   750c                 | jne                 0xe
            //   b961030200           | mov                 ecx, 0x20361
            //   e8????????           |                     

        $sequence_4 = { e8???????? 85c0 750e b9ca070200 }
            // n = 4, score = 600
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   750e                 | jne                 0x10
            //   b9ca070200           | mov                 ecx, 0x207ca

        $sequence_5 = { 0f9cc0 eb02 32c0 84c0 }
            // n = 4, score = 600
            //   0f9cc0               | setl                al
            //   eb02                 | jmp                 4
            //   32c0                 | xor                 al, al
            //   84c0                 | test                al, al

        $sequence_6 = { 33c0 eb0a b917d90000 e8???????? }
            // n = 4, score = 600
            //   33c0                 | xor                 eax, eax
            //   eb0a                 | jmp                 0xc
            //   b917d90000           | mov                 ecx, 0xd917
            //   e8????????           |                     

        $sequence_7 = { e8???????? 84c0 7514 b800000002 e9???????? }
            // n = 5, score = 600
            //   e8????????           |                     
            //   84c0                 | test                al, al
            //   7514                 | jne                 0x16
            //   b800000002           | mov                 eax, 0x2000000
            //   e9????????           |                     

        $sequence_8 = { 0f95c1 660fa3d0 0f92c0 84c8 }
            // n = 4, score = 400
            //   0f95c1               | setne               cl
            //   660fa3d0             | bt                  ax, dx
            //   0f92c0               | setb                al
            //   84c8                 | test                al, cl

        $sequence_9 = { 2403 80e110 8ad1 3c02 7509 }
            // n = 5, score = 400
            //   2403                 | and                 al, 3
            //   80e110               | and                 cl, 0x10
            //   8ad1                 | mov                 dl, cl
            //   3c02                 | cmp                 al, 2
            //   7509                 | jne                 0xb

        $sequence_10 = { 744e 0fb74802 83e103 3bcb }
            // n = 4, score = 400
            //   744e                 | je                  0x50
            //   0fb74802             | movzx               ecx, word ptr [eax + 2]
            //   83e103               | and                 ecx, 3
            //   3bcb                 | cmp                 ecx, ebx

        $sequence_11 = { 8d44240c 8bea 57 50 33d2 }
            // n = 5, score = 400
            //   8d44240c             | lea                 eax, dword ptr [esp + 0xc]
            //   8bea                 | mov                 ebp, edx
            //   57                   | push                edi
            //   50                   | push                eax
            //   33d2                 | xor                 edx, edx

        $sequence_12 = { 8d4602 56 50 e8???????? 8b4c241c 83c40c }
            // n = 6, score = 400
            //   8d4602               | lea                 eax, dword ptr [esi + 2]
            //   56                   | push                esi
            //   50                   | push                eax
            //   e8????????           |                     
            //   8b4c241c             | mov                 ecx, dword ptr [esp + 0x1c]
            //   83c40c               | add                 esp, 0xc

        $sequence_13 = { 8d442410 56 56 50 56 8bf9 89742420 }
            // n = 7, score = 400
            //   8d442410             | lea                 eax, dword ptr [esp + 0x10]
            //   56                   | push                esi
            //   56                   | push                esi
            //   50                   | push                eax
            //   56                   | push                esi
            //   8bf9                 | mov                 edi, ecx
            //   89742420             | mov                 dword ptr [esp + 0x20], esi

        $sequence_14 = { 8d4604 896e08 50 6a00 }
            // n = 4, score = 400
            //   8d4604               | lea                 eax, dword ptr [esi + 4]
            //   896e08               | mov                 dword ptr [esi + 8], ebp
            //   50                   | push                eax
            //   6a00                 | push                0

    condition:
        7 of them and filesize < 11116544
}