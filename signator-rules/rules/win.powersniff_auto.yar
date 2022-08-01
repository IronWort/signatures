rule win_powersniff_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.powersniff."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.powersniff"
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
        $sequence_0 = { 56 6a00 ffd7 50 ff15???????? ff75fc 6a08 }
            // n = 7, score = 100
            //   56                   | push                esi
            //   6a00                 | push                0
            //   ffd7                 | call                edi
            //   50                   | push                eax
            //   ff15????????         |                     
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   6a08                 | push                8

        $sequence_1 = { 8b0c8d90600010 33148d90800010 0fb648fc 8b0c8d90600010 }
            // n = 4, score = 100
            //   8b0c8d90600010       | mov                 ecx, dword ptr [ecx*4 + 0x10006090]
            //   33148d90800010       | xor                 edx, dword ptr [ecx*4 + 0x10008090]
            //   0fb648fc             | movzx               ecx, byte ptr [eax - 4]
            //   8b0c8d90600010       | mov                 ecx, dword ptr [ecx*4 + 0x10006090]

        $sequence_2 = { 53 56 8b35???????? 57 8d85d8fdffff 50 33db }
            // n = 7, score = 100
            //   53                   | push                ebx
            //   56                   | push                esi
            //   8b35????????         |                     
            //   57                   | push                edi
            //   8d85d8fdffff         | lea                 eax, dword ptr [ebp - 0x228]
            //   50                   | push                eax
            //   33db                 | xor                 ebx, ebx

        $sequence_3 = { 337008 c1eb10 8975f8 0fb6f3 8b5dfc c1eb08 c1ea18 }
            // n = 7, score = 100
            //   337008               | xor                 esi, dword ptr [eax + 8]
            //   c1eb10               | shr                 ebx, 0x10
            //   8975f8               | mov                 dword ptr [ebp - 8], esi
            //   0fb6f3               | movzx               esi, bl
            //   8b5dfc               | mov                 ebx, dword ptr [ebp - 4]
            //   c1eb08               | shr                 ebx, 8
            //   c1ea18               | shr                 edx, 0x18

        $sequence_4 = { 68???????? ffd6 85c0 7562 68???????? ffd6 }
            // n = 6, score = 100
            //   68????????           |                     
            //   ffd6                 | call                esi
            //   85c0                 | test                eax, eax
            //   7562                 | jne                 0x64
            //   68????????           |                     
            //   ffd6                 | call                esi

        $sequence_5 = { eb0d ff15???????? 8945fc 85c0 7516 83c314 837b1000 }
            // n = 7, score = 100
            //   eb0d                 | jmp                 0xf
            //   ff15????????         |                     
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   85c0                 | test                eax, eax
            //   7516                 | jne                 0x18
            //   83c314               | add                 ebx, 0x14
            //   837b1000             | cmp                 dword ptr [ebx + 0x10], 0

        $sequence_6 = { 8d742410 e8???????? 837c240c00 743b 817c240cd2100000 7431 be???????? }
            // n = 7, score = 100
            //   8d742410             | lea                 esi, dword ptr [esp + 0x10]
            //   e8????????           |                     
            //   837c240c00           | cmp                 dword ptr [esp + 0xc], 0
            //   743b                 | je                  0x3d
            //   817c240cd2100000     | cmp                 dword ptr [esp + 0xc], 0x10d2
            //   7431                 | je                  0x33
            //   be????????           |                     

        $sequence_7 = { 0fb6f3 8b5dfc 8b34b590800010 c1eb18 33349d90780010 8bdf c1eb10 }
            // n = 7, score = 100
            //   0fb6f3               | movzx               esi, bl
            //   8b5dfc               | mov                 ebx, dword ptr [ebp - 4]
            //   8b34b590800010       | mov                 esi, dword ptr [esi*4 + 0x10008090]
            //   c1eb18               | shr                 ebx, 0x18
            //   33349d90780010       | xor                 esi, dword ptr [ebx*4 + 0x10007890]
            //   8bdf                 | mov                 ebx, edi
            //   c1eb10               | shr                 ebx, 0x10

        $sequence_8 = { 56 6820020000 6a20 6a02 8d45e4 50 c645e400 }
            // n = 7, score = 100
            //   56                   | push                esi
            //   6820020000           | push                0x220
            //   6a20                 | push                0x20
            //   6a02                 | push                2
            //   8d45e4               | lea                 eax, dword ptr [ebp - 0x1c]
            //   50                   | push                eax
            //   c645e400             | mov                 byte ptr [ebp - 0x1c], 0

        $sequence_9 = { 8d45fc 50 ff75fc 56 6a4c }
            // n = 5, score = 100
            //   8d45fc               | lea                 eax, dword ptr [ebp - 4]
            //   50                   | push                eax
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   56                   | push                esi
            //   6a4c                 | push                0x4c

    condition:
        7 of them and filesize < 90112
}