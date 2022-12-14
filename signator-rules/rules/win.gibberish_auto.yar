rule win_gibberish_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.gibberish."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.gibberish"
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
        $sequence_0 = { 8d8d60ffffff e8???????? c703???????? 8bc3 897b28 89732c e8???????? }
            // n = 7, score = 100
            //   8d8d60ffffff         | lea                 ecx, dword ptr [ebp - 0xa0]
            //   e8????????           |                     
            //   c703????????         |                     
            //   8bc3                 | mov                 eax, ebx
            //   897b28               | mov                 dword ptr [ebx + 0x28], edi
            //   89732c               | mov                 dword ptr [ebx + 0x2c], esi
            //   e8????????           |                     

        $sequence_1 = { e8???????? 50 68???????? 8d85f4fdffff 6804010000 50 ff15???????? }
            // n = 7, score = 100
            //   e8????????           |                     
            //   50                   | push                eax
            //   68????????           |                     
            //   8d85f4fdffff         | lea                 eax, dword ptr [ebp - 0x20c]
            //   6804010000           | push                0x104
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_2 = { 2bc6 50 52 6a00 e8???????? 8b4c2408 5e }
            // n = 7, score = 100
            //   2bc6                 | sub                 eax, esi
            //   50                   | push                eax
            //   52                   | push                edx
            //   6a00                 | push                0
            //   e8????????           |                     
            //   8b4c2408             | mov                 ecx, dword ptr [esp + 8]
            //   5e                   | pop                 esi

        $sequence_3 = { 57 8bf9 2bdf 83c307 c1eb03 3bfa }
            // n = 6, score = 100
            //   57                   | push                edi
            //   8bf9                 | mov                 edi, ecx
            //   2bdf                 | sub                 ebx, edi
            //   83c307               | add                 ebx, 7
            //   c1eb03               | shr                 ebx, 3
            //   3bfa                 | cmp                 edi, edx

        $sequence_4 = { 83c408 0f1045c0 8b4d88 f30f7e4dd0 83e1fd 8b45a0 }
            // n = 6, score = 100
            //   83c408               | add                 esp, 8
            //   0f1045c0             | movups              xmm0, xmmword ptr [ebp - 0x40]
            //   8b4d88               | mov                 ecx, dword ptr [ebp - 0x78]
            //   f30f7e4dd0           | movq                xmm1, qword ptr [ebp - 0x30]
            //   83e1fd               | and                 ecx, 0xfffffffd
            //   8b45a0               | mov                 eax, dword ptr [ebp - 0x60]

        $sequence_5 = { 83c223 2bc1 83c0fc 83f81f 0f879d52fdff 52 51 }
            // n = 7, score = 100
            //   83c223               | add                 edx, 0x23
            //   2bc1                 | sub                 eax, ecx
            //   83c0fc               | add                 eax, -4
            //   83f81f               | cmp                 eax, 0x1f
            //   0f879d52fdff         | ja                  0xfffd52a3
            //   52                   | push                edx
            //   51                   | push                ecx

        $sequence_6 = { e8???????? 83c43c c20c00 8bb014010000 53 8b06 3307 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c43c               | add                 esp, 0x3c
            //   c20c00               | ret                 0xc
            //   8bb014010000         | mov                 esi, dword ptr [eax + 0x114]
            //   53                   | push                ebx
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   3307                 | xor                 eax, dword ptr [edi]

        $sequence_7 = { 33442478 03ca 23442424 33442474 03c1 89442420 85ed }
            // n = 7, score = 100
            //   33442478             | xor                 eax, dword ptr [esp + 0x78]
            //   03ca                 | add                 ecx, edx
            //   23442424             | and                 eax, dword ptr [esp + 0x24]
            //   33442474             | xor                 eax, dword ptr [esp + 0x74]
            //   03c1                 | add                 eax, ecx
            //   89442420             | mov                 dword ptr [esp + 0x20], eax
            //   85ed                 | test                ebp, ebp

        $sequence_8 = { 8bce e8???????? 834dfcff a3???????? a1???????? 8db8c8340000 66391f }
            // n = 7, score = 100
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   834dfcff             | or                  dword ptr [ebp - 4], 0xffffffff
            //   a3????????           |                     
            //   a1????????           |                     
            //   8db8c8340000         | lea                 edi, dword ptr [eax + 0x34c8]
            //   66391f               | cmp                 word ptr [edi], bx

        $sequence_9 = { 83c404 ff7768 8d4dc8 c745fc00000000 50 e8???????? 68???????? }
            // n = 7, score = 100
            //   83c404               | add                 esp, 4
            //   ff7768               | push                dword ptr [edi + 0x68]
            //   8d4dc8               | lea                 ecx, dword ptr [ebp - 0x38]
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   50                   | push                eax
            //   e8????????           |                     
            //   68????????           |                     

    condition:
        7 of them and filesize < 1068032
}