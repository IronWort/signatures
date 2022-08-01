rule win_royal_dns_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.royal_dns."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.royal_dns"
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
        $sequence_0 = { 8b8db0fcffff be50000000 56 51 8d95d9feffff }
            // n = 5, score = 100
            //   8b8db0fcffff         | mov                 ecx, dword ptr [ebp - 0x350]
            //   be50000000           | mov                 esi, 0x50
            //   56                   | push                esi
            //   51                   | push                ecx
            //   8d95d9feffff         | lea                 edx, dword ptr [ebp - 0x127]

        $sequence_1 = { 33ff 33c9 33f6 84db 744c 90 }
            // n = 6, score = 100
            //   33ff                 | xor                 edi, edi
            //   33c9                 | xor                 ecx, ecx
            //   33f6                 | xor                 esi, esi
            //   84db                 | test                bl, bl
            //   744c                 | je                  0x4e
            //   90                   | nop                 

        $sequence_2 = { 5b c3 8d4701 5f c1e90a 5e }
            // n = 6, score = 100
            //   5b                   | pop                 ebx
            //   c3                   | ret                 
            //   8d4701               | lea                 eax, dword ptr [edi + 1]
            //   5f                   | pop                 edi
            //   c1e90a               | shr                 ecx, 0xa
            //   5e                   | pop                 esi

        $sequence_3 = { 83c40c 89bd84f1ffff eb31 8d85b1fcffff 50 8bc7 8bce }
            // n = 7, score = 100
            //   83c40c               | add                 esp, 0xc
            //   89bd84f1ffff         | mov                 dword ptr [ebp - 0xe7c], edi
            //   eb31                 | jmp                 0x33
            //   8d85b1fcffff         | lea                 eax, dword ptr [ebp - 0x34f]
            //   50                   | push                eax
            //   8bc7                 | mov                 eax, edi
            //   8bce                 | mov                 ecx, esi

        $sequence_4 = { 85f6 7464 8b95e0fdffff 6830750000 }
            // n = 4, score = 100
            //   85f6                 | test                esi, esi
            //   7464                 | je                  0x66
            //   8b95e0fdffff         | mov                 edx, dword ptr [ebp - 0x220]
            //   6830750000           | push                0x7530

        $sequence_5 = { 8bce 8b7b0b e8???????? 83c40c 83f801 7536 8b5305 }
            // n = 7, score = 100
            //   8bce                 | mov                 ecx, esi
            //   8b7b0b               | mov                 edi, dword ptr [ebx + 0xb]
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   83f801               | cmp                 eax, 1
            //   7536                 | jne                 0x38
            //   8b5305               | mov                 edx, dword ptr [ebx + 5]

        $sequence_6 = { 33c0 66890437 8b4510 5f 5e 8d5001 5b }
            // n = 7, score = 100
            //   33c0                 | xor                 eax, eax
            //   66890437             | mov                 word ptr [edi + esi], ax
            //   8b4510               | mov                 eax, dword ptr [ebp + 0x10]
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   8d5001               | lea                 edx, dword ptr [eax + 1]
            //   5b                   | pop                 ebx

        $sequence_7 = { 8bf0 85f6 7464 8b95e0fdffff 6830750000 52 }
            // n = 6, score = 100
            //   8bf0                 | mov                 esi, eax
            //   85f6                 | test                esi, esi
            //   7464                 | je                  0x66
            //   8b95e0fdffff         | mov                 edx, dword ptr [ebp - 0x220]
            //   6830750000           | push                0x7530
            //   52                   | push                edx

        $sequence_8 = { f7f1 8d95f0feffff 68???????? 52 8bf8 }
            // n = 5, score = 100
            //   f7f1                 | div                 ecx
            //   8d95f0feffff         | lea                 edx, dword ptr [ebp - 0x110]
            //   68????????           |                     
            //   52                   | push                edx
            //   8bf8                 | mov                 edi, eax

        $sequence_9 = { 33c9 33f6 83c703 eb03 }
            // n = 4, score = 100
            //   33c9                 | xor                 ecx, ecx
            //   33f6                 | xor                 esi, esi
            //   83c703               | add                 edi, 3
            //   eb03                 | jmp                 5

    condition:
        7 of them and filesize < 204800
}