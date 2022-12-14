rule win_gratem_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.gratem."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.gratem"
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
        $sequence_0 = { ffd5 85c0 0f84b2000000 817c2438c8000000 }
            // n = 4, score = 100
            //   ffd5                 | call                ebp
            //   85c0                 | test                eax, eax
            //   0f84b2000000         | je                  0xb8
            //   817c2438c8000000     | cmp                 dword ptr [esp + 0x38], 0xc8

        $sequence_1 = { 51 2bc6 50 8d0416 50 53 }
            // n = 6, score = 100
            //   51                   | push                ecx
            //   2bc6                 | sub                 eax, esi
            //   50                   | push                eax
            //   8d0416               | lea                 eax, dword ptr [esi + edx]
            //   50                   | push                eax
            //   53                   | push                ebx

        $sequence_2 = { 72d5 3bf0 8b74241c 7520 8b4c2440 8b542418 894114 }
            // n = 7, score = 100
            //   72d5                 | jb                  0xffffffd7
            //   3bf0                 | cmp                 esi, eax
            //   8b74241c             | mov                 esi, dword ptr [esp + 0x1c]
            //   7520                 | jne                 0x22
            //   8b4c2440             | mov                 ecx, dword ptr [esp + 0x40]
            //   8b542418             | mov                 edx, dword ptr [esp + 0x18]
            //   894114               | mov                 dword ptr [ecx + 0x14], eax

        $sequence_3 = { 57 8b3d???????? 6888130000 ffd7 e8???????? 85c0 74f0 }
            // n = 7, score = 100
            //   57                   | push                edi
            //   8b3d????????         |                     
            //   6888130000           | push                0x1388
            //   ffd7                 | call                edi
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   74f0                 | je                  0xfffffff2

        $sequence_4 = { 741f 0fb7c0 ba6bc10000 663bc2 0f8444010000 0fb7048d64bc4000 }
            // n = 6, score = 100
            //   741f                 | je                  0x21
            //   0fb7c0               | movzx               eax, ax
            //   ba6bc10000           | mov                 edx, 0xc16b
            //   663bc2               | cmp                 ax, dx
            //   0f8444010000         | je                  0x14a
            //   0fb7048d64bc4000     | movzx               eax, word ptr [ecx*4 + 0x40bc64]

        $sequence_5 = { 663bc2 0f8472010000 0fb7048d64bc4000 41 6685c0 75e4 }
            // n = 6, score = 100
            //   663bc2               | cmp                 ax, dx
            //   0f8472010000         | je                  0x178
            //   0fb7048d64bc4000     | movzx               eax, word ptr [ecx*4 + 0x40bc64]
            //   41                   | inc                 ecx
            //   6685c0               | test                ax, ax
            //   75e4                 | jne                 0xffffffe6

        $sequence_6 = { 5f 33c0 5d c3 33c0 85ed }
            // n = 6, score = 100
            //   5f                   | pop                 edi
            //   33c0                 | xor                 eax, eax
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   33c0                 | xor                 eax, eax
            //   85ed                 | test                ebp, ebp

        $sequence_7 = { bae0900000 663bc2 0f8428040000 0fb7048d64bc4000 }
            // n = 4, score = 100
            //   bae0900000           | mov                 edx, 0x90e0
            //   663bc2               | cmp                 ax, dx
            //   0f8428040000         | je                  0x42e
            //   0fb7048d64bc4000     | movzx               eax, word ptr [ecx*4 + 0x40bc64]

        $sequence_8 = { 8945e4 3d01010000 7d0d 8a4c181c 888830b24000 40 }
            // n = 6, score = 100
            //   8945e4               | mov                 dword ptr [ebp - 0x1c], eax
            //   3d01010000           | cmp                 eax, 0x101
            //   7d0d                 | jge                 0xf
            //   8a4c181c             | mov                 cl, byte ptr [eax + ebx + 0x1c]
            //   888830b24000         | mov                 byte ptr [eax + 0x40b230], cl
            //   40                   | inc                 eax

        $sequence_9 = { 8b4de0 8d0c8dc0d84000 8901 8305????????20 8d9000080000 eb2a c6400400 }
            // n = 7, score = 100
            //   8b4de0               | mov                 ecx, dword ptr [ebp - 0x20]
            //   8d0c8dc0d84000       | lea                 ecx, dword ptr [ecx*4 + 0x40d8c0]
            //   8901                 | mov                 dword ptr [ecx], eax
            //   8305????????20       |                     
            //   8d9000080000         | lea                 edx, dword ptr [eax + 0x800]
            //   eb2a                 | jmp                 0x2c
            //   c6400400             | mov                 byte ptr [eax + 4], 0

    condition:
        7 of them and filesize < 155648
}