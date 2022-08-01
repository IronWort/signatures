rule win_shadowhammer_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.shadowhammer."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.shadowhammer"
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
        $sequence_0 = { 8b75fc 8365f400 8365f800 6a0b 59 8d7dc8 f3a5 }
            // n = 7, score = 100
            //   8b75fc               | mov                 esi, dword ptr [ebp - 4]
            //   8365f400             | and                 dword ptr [ebp - 0xc], 0
            //   8365f800             | and                 dword ptr [ebp - 8], 0
            //   6a0b                 | push                0xb
            //   59                   | pop                 ecx
            //   8d7dc8               | lea                 edi, dword ptr [ebp - 0x38]
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]

        $sequence_1 = { 33db 57 66894590 8d8530fbffff 53 50 668955ca }
            // n = 7, score = 100
            //   33db                 | xor                 ebx, ebx
            //   57                   | push                edi
            //   66894590             | mov                 word ptr [ebp - 0x70], ax
            //   8d8530fbffff         | lea                 eax, dword ptr [ebp - 0x4d0]
            //   53                   | push                ebx
            //   50                   | push                eax
            //   668955ca             | mov                 word ptr [ebp - 0x36], dx

        $sequence_2 = { 68ec7b4000 ff15???????? 8bf8 85ff 7509 e8???????? }
            // n = 6, score = 100
            //   68ec7b4000           | push                0x407bec
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax
            //   85ff                 | test                edi, edi
            //   7509                 | jne                 0xb
            //   e8????????           |                     

        $sequence_3 = { 33c0 c3 8bff 55 8bec 683c714000 }
            // n = 6, score = 100
            //   33c0                 | xor                 eax, eax
            //   c3                   | ret                 
            //   8bff                 | mov                 edi, edi
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   683c714000           | push                0x40713c

        $sequence_4 = { 668945b2 8bc1 668945d4 8bc7 668945d6 58 }
            // n = 6, score = 100
            //   668945b2             | mov                 word ptr [ebp - 0x4e], ax
            //   8bc1                 | mov                 eax, ecx
            //   668945d4             | mov                 word ptr [ebp - 0x2c], ax
            //   8bc7                 | mov                 eax, edi
            //   668945d6             | mov                 word ptr [ebp - 0x2a], ax
            //   58                   | pop                 eax

        $sequence_5 = { 57 53 53 53 ff5640 85c0 }
            // n = 6, score = 100
            //   57                   | push                edi
            //   53                   | push                ebx
            //   53                   | push                ebx
            //   53                   | push                ebx
            //   ff5640               | call                dword ptr [esi + 0x40]
            //   85c0                 | test                eax, eax

        $sequence_6 = { 8b45f4 ff3430 ff75f0 e8???????? 59 }
            // n = 5, score = 100
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   ff3430               | push                dword ptr [eax + esi]
            //   ff75f0               | push                dword ptr [ebp - 0x10]
            //   e8????????           |                     
            //   59                   | pop                 ecx

        $sequence_7 = { 50 8d843d38fdffff 50 ff561c 8b45ec 83c40c ff4df8 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   8d843d38fdffff       | lea                 eax, dword ptr [ebp + edi - 0x2c8]
            //   50                   | push                eax
            //   ff561c               | call                dword ptr [esi + 0x1c]
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   83c40c               | add                 esp, 0xc
            //   ff4df8               | dec                 dword ptr [ebp - 8]

        $sequence_8 = { c3 33c0 648b0d00000000 817904f0604000 7510 8b510c 8b520c }
            // n = 7, score = 100
            //   c3                   | ret                 
            //   33c0                 | xor                 eax, eax
            //   648b0d00000000       | mov                 ecx, dword ptr fs:[0]
            //   817904f0604000       | cmp                 dword ptr [ecx + 4], 0x4060f0
            //   7510                 | jne                 0x12
            //   8b510c               | mov                 edx, dword ptr [ecx + 0xc]
            //   8b520c               | mov                 edx, dword ptr [edx + 0xc]

        $sequence_9 = { 0f86f1000000 6a10 8d8568ffffff 53 }
            // n = 4, score = 100
            //   0f86f1000000         | jbe                 0xf7
            //   6a10                 | push                0x10
            //   8d8568ffffff         | lea                 eax, dword ptr [ebp - 0x98]
            //   53                   | push                ebx

    condition:
        7 of them and filesize < 49152
}