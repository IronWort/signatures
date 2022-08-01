rule elf_bashlite_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects elf.bashlite."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/elf.bashlite"
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
        $sequence_0 = { 21d0 3345fc c9 c3 }
            // n = 4, score = 300
            //   21d0                 | mov                 eax, dword ptr [ebp - 0x10]
            //   3345fc               | mov                 word ptr [eax + 0xa], dx
            //   c9                   | mov                 eax, dword ptr [ebp - 0x3c]
            //   c3                   | movzx               edx, ax

        $sequence_1 = { 750c c785ecefffff01000000 eb0a c785ecefffff00000000 8b85ecefffff c9 c3 }
            // n = 7, score = 300
            //   750c                 | jbe                 0x109
            //   c785ecefffff01000000     | inc    ebp
            //   eb0a                 | xor                 edi, edi
            //   c785ecefffff00000000     | cmp    byte ptr [ecx], 0x30
            //   8b85ecefffff         | dec                 eax
            //   c9                   | mov                 edx, ecx
            //   c3                   | je                  0x188

        $sequence_2 = { eb0a c785ecefffff00000000 8b85ecefffff c9 c3 55 }
            // n = 6, score = 300
            //   eb0a                 | cmovb               esi, eax
            //   c785ecefffff00000000     | dec    eax
            //   8b85ecefffff         | mov                 eax, edi
            //   c9                   | dec                 eax
            //   c3                   | lea                 eax, dword ptr [ebp - 0x60]
            //   55                   | dec                 eax

        $sequence_3 = { c1f802 89c2 89d0 01c0 }
            // n = 4, score = 300
            //   c1f802               | mov                 eax, dword ptr [eax + edx*8]
            //   89c2                 | and                 eax, 0x1f
            //   89d0                 | bts                 dword ptr [ebp + ecx*4 - 0xc0], eax
            //   01c0                 | mov                 dword ptr [ebp - 0xc8], 0

        $sequence_4 = { f7d0 21d0 3345fc c9 c3 }
            // n = 5, score = 300
            //   f7d0                 | mov                 esi, 0
            //   21d0                 | mov                 dword ptr [ebp - 0x2c], eax
            //   3345fc               | cmp                 dword ptr [ebp - 0x2c], 1
            //   c9                   | jne                 0x4e4
            //   c3                   | mov                 esi, 0

        $sequence_5 = { 89c2 89d0 c1e81f 01d0 d1f8 }
            // n = 5, score = 300
            //   89c2                 | jne                 0xa5b
            //   89d0                 | dec                 eax
            //   c1e81f               | inc                 eax
            //   01d0                 | cmp                 byte ptr [eax], 0x25
            //   d1f8                 | je                  0xa5b

        $sequence_6 = { f7d0 21d0 3345fc c9 c3 55 }
            // n = 6, score = 300
            //   f7d0                 | mov                 edx, 0x10
            //   21d0                 | cmp                 eax, -1
            //   3345fc               | jmp                 0x5ce
            //   c9                   | mov                 ecx, esi
            //   c3                   | jmp                 0x5bf
            //   55                   | mov                 eax, edx

        $sequence_7 = { 31c0 eb19 e8???????? c70016000000 }
            // n = 4, score = 300
            //   31c0                 | mov                 byte ptr [ebp - 0x1f], al
            //   eb19                 | sub                 edx, eax
            //   e8????????           |                     
            //   c70016000000         | mov                 dword ptr [ebp - 0x3c], edx

        $sequence_8 = { eb19 e8???????? c70016000000 e8???????? c70016000000 83c8ff }
            // n = 6, score = 300
            //   eb19                 | add                 dword ptr [ebp - 0x1c], eax
            //   e8????????           |                     
            //   c70016000000         | sub                 esp, 4
            //   e8????????           |                     
            //   c70016000000         | push                3
            //   83c8ff               | push                dword ptr [ebp - 0x10]

        $sequence_9 = { eb0d e8???????? c70061000000 31d2 }
            // n = 4, score = 300
            //   eb0d                 | jmp                 0x4a
            //   e8????????           |                     
            //   c70061000000         | xor                 eax, eax
            //   31d2                 | dec                 eax

    condition:
        7 of them and filesize < 274018
}