rule win_sidewinder_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.sidewinder."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.sidewinder"
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
        $sequence_0 = { 0f8529010000 8d45e8 50 6a00 ff7518 6a00 8b4510 }
            // n = 7, score = 200
            //   0f8529010000         | jne                 0x12f
            //   8d45e8               | lea                 eax, dword ptr [ebp - 0x18]
            //   50                   | push                eax
            //   6a00                 | push                0
            //   ff7518               | push                dword ptr [ebp + 0x18]
            //   6a00                 | push                0
            //   8b4510               | mov                 eax, dword ptr [ebp + 0x10]

        $sequence_1 = { 8945dc 837ddc00 7d1a 6a20 68???????? ff35???????? ff75dc }
            // n = 7, score = 200
            //   8945dc               | mov                 dword ptr [ebp - 0x24], eax
            //   837ddc00             | cmp                 dword ptr [ebp - 0x24], 0
            //   7d1a                 | jge                 0x1c
            //   6a20                 | push                0x20
            //   68????????           |                     
            //   ff35????????         |                     
            //   ff75dc               | push                dword ptr [ebp - 0x24]

        $sequence_2 = { eb0b e8???????? 898564ffffff 8b4508 8b4064 8b4d08 8b4964 }
            // n = 7, score = 200
            //   eb0b                 | jmp                 0xd
            //   e8????????           |                     
            //   898564ffffff         | mov                 dword ptr [ebp - 0x9c], eax
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8b4064               | mov                 eax, dword ptr [eax + 0x64]
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   8b4964               | mov                 ecx, dword ptr [ecx + 0x64]

        $sequence_3 = { 50 e8???????? 898540ffffff c7459804000280 c745900a000000 c745a804000280 c745a00a000000 }
            // n = 7, score = 200
            //   50                   | push                eax
            //   e8????????           |                     
            //   898540ffffff         | mov                 dword ptr [ebp - 0xc0], eax
            //   c7459804000280       | mov                 dword ptr [ebp - 0x68], 0x80020004
            //   c745900a000000       | mov                 dword ptr [ebp - 0x70], 0xa
            //   c745a804000280       | mov                 dword ptr [ebp - 0x58], 0x80020004
            //   c745a00a000000       | mov                 dword ptr [ebp - 0x60], 0xa

        $sequence_4 = { 83a5f4feffff00 8b45c4 89853cffffff 8d8550ffffff 50 8b853cffffff 8b00 }
            // n = 7, score = 200
            //   83a5f4feffff00       | and                 dword ptr [ebp - 0x10c], 0
            //   8b45c4               | mov                 eax, dword ptr [ebp - 0x3c]
            //   89853cffffff         | mov                 dword ptr [ebp - 0xc4], eax
            //   8d8550ffffff         | lea                 eax, dword ptr [ebp - 0xb0]
            //   50                   | push                eax
            //   8b853cffffff         | mov                 eax, dword ptr [ebp - 0xc4]
            //   8b00                 | mov                 eax, dword ptr [eax]

        $sequence_5 = { e8???????? 8945d8 a1???????? 0345e4 50 }
            // n = 5, score = 200
            //   e8????????           |                     
            //   8945d8               | mov                 dword ptr [ebp - 0x28], eax
            //   a1????????           |                     
            //   0345e4               | add                 eax, dword ptr [ebp - 0x1c]
            //   50                   | push                eax

        $sequence_6 = { ff75e4 33c0 8b4508 668b403c 50 6aff 6820120000 }
            // n = 7, score = 200
            //   ff75e4               | push                dword ptr [ebp - 0x1c]
            //   33c0                 | xor                 eax, eax
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   668b403c             | mov                 ax, word ptr [eax + 0x3c]
            //   50                   | push                eax
            //   6aff                 | push                -1
            //   6820120000           | push                0x1220

        $sequence_7 = { 8d45d4 50 e8???????? 0fbf45ec 50 ff75d4 e8???????? }
            // n = 7, score = 200
            //   8d45d4               | lea                 eax, dword ptr [ebp - 0x2c]
            //   50                   | push                eax
            //   e8????????           |                     
            //   0fbf45ec             | movsx               eax, word ptr [ebp - 0x14]
            //   50                   | push                eax
            //   ff75d4               | push                dword ptr [ebp - 0x2c]
            //   e8????????           |                     

        $sequence_8 = { 8d45cc 50 68???????? e8???????? 8945c4 837dc400 7599 }
            // n = 7, score = 200
            //   8d45cc               | lea                 eax, dword ptr [ebp - 0x34]
            //   50                   | push                eax
            //   68????????           |                     
            //   e8????????           |                     
            //   8945c4               | mov                 dword ptr [ebp - 0x3c], eax
            //   837dc400             | cmp                 dword ptr [ebp - 0x3c], 0
            //   7599                 | jne                 0xffffff9b

        $sequence_9 = { 898568ffffff eb07 83a568ffffff00 837dd400 7519 8d45d4 }
            // n = 6, score = 200
            //   898568ffffff         | mov                 dword ptr [ebp - 0x98], eax
            //   eb07                 | jmp                 9
            //   83a568ffffff00       | and                 dword ptr [ebp - 0x98], 0
            //   837dd400             | cmp                 dword ptr [ebp - 0x2c], 0
            //   7519                 | jne                 0x1b
            //   8d45d4               | lea                 eax, dword ptr [ebp - 0x2c]

    condition:
        7 of them and filesize < 679936
}