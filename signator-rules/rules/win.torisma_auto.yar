rule win_torisma_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.torisma."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.torisma"
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
        $sequence_0 = { 488b4c2450 8b4964 c1e916 83e101 33c1 488b4c2450 }
            // n = 6, score = 100
            //   488b4c2450           | dec                 eax
            //   8b4964               | mov                 ecx, dword ptr [esp + 0x50]
            //   c1e916               | mov                 ecx, dword ptr [ecx + 0x68]
            //   83e101               | shr                 ecx, 0x16
            //   33c1                 | and                 ecx, 1
            //   488b4c2450           | xor                 eax, ecx

        $sequence_1 = { 33c1 83f001 c1e009 8b0c24 33c8 8bc1 890424 }
            // n = 7, score = 100
            //   33c1                 | dec                 eax
            //   83f001               | mov                 ebx, ecx
            //   c1e009               | dec                 eax
            //   8b0c24               | lea                 ecx, dword ptr [0x103c0]
            //   33c8                 | dec                 eax
            //   8bc1                 | cmp                 ebx, ecx
            //   890424               | jb                  0x150b

        $sequence_2 = { 488b4810 ff15???????? 48837c242000 741d 488b442420 4889442430 488b4c2430 }
            // n = 7, score = 100
            //   488b4810             | mov                 edi, dword ptr [esp + 0x60]
            //   ff15????????         |                     
            //   48837c242000         | sub                 edi, 0xa
            //   741d                 | and                 edi, 0x1f
            //   488b442420           | sub                 edi, 0xa
            //   4889442430           | and                 edi, 0x1f
            //   488b4c2430           | dec                 esp

        $sequence_3 = { 4c89442418 4889542410 48894c2408 57 4883ec60 c744242000000000 488b442478 }
            // n = 7, score = 100
            //   4c89442418           | mov                 edx, edx
            //   4889542410           | dec                 esp
            //   48894c2408           | mov                 eax, dword ptr [esp + 0x10]
            //   57                   | inc                 ebp
            //   4883ec60             | mov                 eax, dword ptr [eax]
            //   c744242000000000     | inc                 ecx
            //   488b442478           | and                 eax, 1

        $sequence_4 = { d1e9 83e101 33c1 83f001 c1e008 8b0c24 33c8 }
            // n = 7, score = 100
            //   d1e9                 | lea                 edx, dword ptr [0xb41e]
            //   83e101               | dec                 eax
            //   33c1                 | mov                 ecx, eax
            //   83f001               | dec                 eax
            //   c1e008               | test                eax, eax
            //   8b0c24               | je                  0x1557
            //   33c8                 | dec                 eax

        $sequence_5 = { c68424ff000000b0 c684240001000020 c6842401010000de c684240201000007 c6842403010000e8 c684240401000085 c68424050100008c }
            // n = 7, score = 100
            //   c68424ff000000b0     | jmp                 0x495
            //   c684240001000020     | dec                 eax
            //   c6842401010000de     | cmp                 dword ptr [esp + 0xa0], 0
            //   c684240201000007     | je                  0x4ab
            //   c6842403010000e8     | dec                 eax
            //   c684240401000085     | mov                 ecx, dword ptr [esp + 0xa0]
            //   c68424050100008c     | dec                 eax

        $sequence_6 = { 0fb60401 c1e010 8b4c2420 03c8 8bc1 89442420 8b442424 }
            // n = 7, score = 100
            //   0fb60401             | mov                 dword ptr [esp + 0x40], eax
            //   c1e010               | dec                 eax
            //   8b4c2420             | mov                 edi, dword ptr [esp + 0x40]
            //   03c8                 | xor                 eax, eax
            //   8bc1                 | mov                 ecx, 0x400
            //   89442420             | rep stosb           byte ptr es:[edi], al
            //   8b442424             | dec                 eax

        $sequence_7 = { 48894c2408 4883ec18 c744240800000000 488b442428 48890424 48837c242800 7428 }
            // n = 7, score = 100
            //   48894c2408           | jmp                 0
            //   4883ec18             | mov                 dword ptr [esp + 0x68], 0x1070
            //   c744240800000000     | mov                 eax, dword ptr [esp + 0x68]
            //   488b442428           | je                  0x4a
            //   48890424             | dec                 eax
            //   48837c242800         | mov                 eax, dword ptr [esp + 0x28]
            //   7428                 | dec                 eax

        $sequence_8 = { 418b3cb8 83e71f 4c8b842470010000 400fb6cf 418b1490 d3ea 8bca }
            // n = 7, score = 100
            //   418b3cb8             | lea                 edx, dword ptr [0x121cd]
            //   83e71f               | inc                 ecx
            //   4c8b842470010000     | mov                 eax, 0x40
            //   400fb6cf             | dec                 eax
            //   418b1490             | lea                 edx, dword ptr [ebp + 0x10]
            //   d3ea                 | dec                 eax
            //   8bca                 | mov                 ecx, edi

        $sequence_9 = { 488d1541ef0000 413bc6 7428 83f8fe 7423 4c63c0 4c8d0dfdd8feff }
            // n = 7, score = 100
            //   488d1541ef0000       | dec                 esp
            //   413bc6               | mov                 eax, dword ptr [esp + 0x170]
            //   7428                 | inc                 eax
            //   83f8fe               | movzx               ecx, bh
            //   7423                 | inc                 ecx
            //   4c63c0               | mov                 edx, dword ptr [eax + edx*4 - 4]
            //   4c8d0dfdd8feff       | shr                 edx, cl

    condition:
        7 of them and filesize < 322560
}