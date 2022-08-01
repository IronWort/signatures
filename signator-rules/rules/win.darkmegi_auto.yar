rule win_darkmegi_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.darkmegi."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.darkmegi"
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
        $sequence_0 = { 8b35???????? 6810270000 ffd6 68???????? 68???????? 6802000080 e8???????? }
            // n = 7, score = 100
            //   8b35????????         |                     
            //   6810270000           | push                0x2710
            //   ffd6                 | call                esi
            //   68????????           |                     
            //   68????????           |                     
            //   6802000080           | push                0x80000002
            //   e8????????           |                     

        $sequence_1 = { 8d442460 52 50 8d4c2468 6a50 51 }
            // n = 6, score = 100
            //   8d442460             | lea                 eax, dword ptr [esp + 0x60]
            //   52                   | push                edx
            //   50                   | push                eax
            //   8d4c2468             | lea                 ecx, dword ptr [esp + 0x68]
            //   6a50                 | push                0x50
            //   51                   | push                ecx

        $sequence_2 = { ff15???????? 8bf8 83ffff 751b 6800800000 }
            // n = 5, score = 100
            //   ff15????????         |                     
            //   8bf8                 | mov                 edi, eax
            //   83ffff               | cmp                 edi, -1
            //   751b                 | jne                 0x1d
            //   6800800000           | push                0x8000

        $sequence_3 = { 25ffff0000 3bf8 7cd1 8b442410 }
            // n = 4, score = 100
            //   25ffff0000           | and                 eax, 0xffff
            //   3bf8                 | cmp                 edi, eax
            //   7cd1                 | jl                  0xffffffd3
            //   8b442410             | mov                 eax, dword ptr [esp + 0x10]

        $sequence_4 = { f7d1 49 6a01 8dbc0ca9030000 ffd6 }
            // n = 5, score = 100
            //   f7d1                 | not                 ecx
            //   49                   | dec                 ecx
            //   6a01                 | push                1
            //   8dbc0ca9030000       | lea                 edi, dword ptr [esp + ecx + 0x3a9]
            //   ffd6                 | call                esi

        $sequence_5 = { 8d4c2420 89b43c28010000 8d9424a4030000 83c60a 51 52 56 }
            // n = 7, score = 100
            //   8d4c2420             | lea                 ecx, dword ptr [esp + 0x20]
            //   89b43c28010000       | mov                 dword ptr [esp + edi + 0x128], esi
            //   8d9424a4030000       | lea                 edx, dword ptr [esp + 0x3a4]
            //   83c60a               | add                 esi, 0xa
            //   51                   | push                ecx
            //   52                   | push                edx
            //   56                   | push                esi

        $sequence_6 = { 50 ffd5 6685c0 762f 8b442410 47 8d0c40 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   ffd5                 | call                ebp
            //   6685c0               | test                ax, ax
            //   762f                 | jbe                 0x31
            //   8b442410             | mov                 eax, dword ptr [esp + 0x10]
            //   47                   | inc                 edi
            //   8d0c40               | lea                 ecx, dword ptr [eax + eax*2]

        $sequence_7 = { 3cc0 7223 33db 25ff000000 }
            // n = 4, score = 100
            //   3cc0                 | cmp                 al, 0xc0
            //   7223                 | jb                  0x25
            //   33db                 | xor                 ebx, ebx
            //   25ff000000           | and                 eax, 0xff

        $sequence_8 = { 33c0 5b 81c47c0a0000 c3 8b1d???????? 57 }
            // n = 6, score = 100
            //   33c0                 | xor                 eax, eax
            //   5b                   | pop                 ebx
            //   81c47c0a0000         | add                 esp, 0xa7c
            //   c3                   | ret                 
            //   8b1d????????         |                     
            //   57                   | push                edi

        $sequence_9 = { c3 e8???????? 8b0cf59c8cb402 5e }
            // n = 4, score = 100
            //   c3                   | ret                 
            //   e8????????           |                     
            //   8b0cf59c8cb402       | mov                 ecx, dword ptr [esi*8 + 0x2b48c9c]
            //   5e                   | pop                 esi

    condition:
        7 of them and filesize < 90304
}