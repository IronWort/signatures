rule win_albaniiutas_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.albaniiutas."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.albaniiutas"
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
        $sequence_0 = { 8365c800 c745cc0d780010 a1???????? 8d4dc8 33c1 }
            // n = 5, score = 100
            //   8365c800             | and                 dword ptr [ebp - 0x38], 0
            //   c745cc0d780010       | mov                 dword ptr [ebp - 0x34], 0x1000780d
            //   a1????????           |                     
            //   8d4dc8               | lea                 ecx, dword ptr [ebp - 0x38]
            //   33c1                 | xor                 eax, ecx

        $sequence_1 = { 33c0 40 e9???????? 8365c800 c745cc0d780010 a1???????? }
            // n = 6, score = 100
            //   33c0                 | xor                 eax, eax
            //   40                   | inc                 eax
            //   e9????????           |                     
            //   8365c800             | and                 dword ptr [ebp - 0x38], 0
            //   c745cc0d780010       | mov                 dword ptr [ebp - 0x34], 0x1000780d
            //   a1????????           |                     

        $sequence_2 = { eb2f 8b5d08 c743183c1c0110 eb1c }
            // n = 4, score = 100
            //   eb2f                 | jmp                 0x31
            //   8b5d08               | mov                 ebx, dword ptr [ebp + 8]
            //   c743183c1c0110       | mov                 dword ptr [ebx + 0x18], 0x10011c3c
            //   eb1c                 | jmp                 0x1e

        $sequence_3 = { 5e 5d c3 e8???????? 85c0 0f8442230000 }
            // n = 6, score = 100
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   0f8442230000         | je                  0x2348

        $sequence_4 = { eb08 8b55f8 83c202 03c2 }
            // n = 4, score = 100
            //   eb08                 | jmp                 0xa
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]
            //   83c202               | add                 edx, 2
            //   03c2                 | add                 eax, edx

        $sequence_5 = { c1e918 0fb6c0 33148dc01c0110 331485c0280110 8bc2 4e }
            // n = 6, score = 100
            //   c1e918               | shr                 ecx, 0x18
            //   0fb6c0               | movzx               eax, al
            //   33148dc01c0110       | xor                 edx, dword ptr [ecx*4 + 0x10011cc0]
            //   331485c0280110       | xor                 edx, dword ptr [eax*4 + 0x100128c0]
            //   8bc2                 | mov                 eax, edx
            //   4e                   | dec                 esi

        $sequence_6 = { 8b4d0c 8901 33c0 40 e9???????? 8365c800 c745cc0d780010 }
            // n = 7, score = 100
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   8901                 | mov                 dword ptr [ecx], eax
            //   33c0                 | xor                 eax, eax
            //   40                   | inc                 eax
            //   e9????????           |                     
            //   8365c800             | and                 dword ptr [ebp - 0x38], 0
            //   c745cc0d780010       | mov                 dword ptr [ebp - 0x34], 0x1000780d

        $sequence_7 = { 8d795c 897dc0 8b7df0 ff248598410010 }
            // n = 4, score = 100
            //   8d795c               | lea                 edi, dword ptr [ecx + 0x5c]
            //   897dc0               | mov                 dword ptr [ebp - 0x40], edi
            //   8b7df0               | mov                 edi, dword ptr [ebp - 0x10]
            //   ff248598410010       | jmp                 dword ptr [eax*4 + 0x10004198]

        $sequence_8 = { 0f848b000000 8b460c 8d048504000000 50 }
            // n = 4, score = 100
            //   0f848b000000         | je                  0x91
            //   8b460c               | mov                 eax, dword ptr [esi + 0xc]
            //   8d048504000000       | lea                 eax, dword ptr [eax*4 + 4]
            //   50                   | push                eax

        $sequence_9 = { 8b5d08 8b45f0 c74318581c0110 eb0a 8b5d08 c74318701c0110 8b55f4 }
            // n = 7, score = 100
            //   8b5d08               | mov                 ebx, dword ptr [ebp + 8]
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]
            //   c74318581c0110       | mov                 dword ptr [ebx + 0x18], 0x10011c58
            //   eb0a                 | jmp                 0xc
            //   8b5d08               | mov                 ebx, dword ptr [ebp + 8]
            //   c74318701c0110       | mov                 dword ptr [ebx + 0x18], 0x10011c70
            //   8b55f4               | mov                 edx, dword ptr [ebp - 0xc]

    condition:
        7 of them and filesize < 566272
}