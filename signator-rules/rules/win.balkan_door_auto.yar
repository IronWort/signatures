rule win_balkan_door_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.balkan_door."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.balkan_door"
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
        $sequence_0 = { 7403 56 ffd7 5e 32c0 5f }
            // n = 6, score = 500
            //   7403                 | je                  5
            //   56                   | push                esi
            //   ffd7                 | call                edi
            //   5e                   | pop                 esi
            //   32c0                 | xor                 al, al
            //   5f                   | pop                 edi

        $sequence_1 = { 6a01 6a02 6a10 6a04 68???????? 68???????? }
            // n = 6, score = 500
            //   6a01                 | push                1
            //   6a02                 | push                2
            //   6a10                 | push                0x10
            //   6a04                 | push                4
            //   68????????           |                     
            //   68????????           |                     

        $sequence_2 = { e8???????? 83c404 8bbd3cefffff 6a00 }
            // n = 4, score = 500
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   8bbd3cefffff         | mov                 edi, dword ptr [ebp - 0x10c4]
            //   6a00                 | push                0

        $sequence_3 = { 6a00 50 57 6a00 6a16 ffb53cefffff ff15???????? }
            // n = 7, score = 500
            //   6a00                 | push                0
            //   50                   | push                eax
            //   57                   | push                edi
            //   6a00                 | push                0
            //   6a16                 | push                0x16
            //   ffb53cefffff         | push                dword ptr [ebp - 0x10c4]
            //   ff15????????         |                     

        $sequence_4 = { 85f6 740b 6a00 6a00 56 ff15???????? 57 }
            // n = 7, score = 500
            //   85f6                 | test                esi, esi
            //   740b                 | je                  0xd
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   56                   | push                esi
            //   ff15????????         |                     
            //   57                   | push                edi

        $sequence_5 = { 6a02 6a10 6a04 68???????? }
            // n = 4, score = 500
            //   6a02                 | push                2
            //   6a10                 | push                0x10
            //   6a04                 | push                4
            //   68????????           |                     

        $sequence_6 = { 8b85d8fdffff 8985ccfdffff 5f 5b 56 }
            // n = 5, score = 500
            //   8b85d8fdffff         | mov                 eax, dword ptr [ebp - 0x228]
            //   8985ccfdffff         | mov                 dword ptr [ebp - 0x234], eax
            //   5f                   | pop                 edi
            //   5b                   | pop                 ebx
            //   56                   | push                esi

        $sequence_7 = { 741a 8d85d0fdffff c785d0fdffff2c020000 50 56 }
            // n = 5, score = 500
            //   741a                 | je                  0x1c
            //   8d85d0fdffff         | lea                 eax, dword ptr [ebp - 0x230]
            //   c785d0fdffff2c020000     | mov    dword ptr [ebp - 0x230], 0x22c
            //   50                   | push                eax
            //   56                   | push                esi

        $sequence_8 = { 50 ffd7 85c0 741a 8d85d0fdffff }
            // n = 5, score = 500
            //   50                   | push                eax
            //   ffd7                 | call                edi
            //   85c0                 | test                eax, eax
            //   741a                 | je                  0x1c
            //   8d85d0fdffff         | lea                 eax, dword ptr [ebp - 0x230]

        $sequence_9 = { 6a00 56 ff15???????? 57 8b3d???????? ffd7 85f6 }
            // n = 7, score = 500
            //   6a00                 | push                0
            //   56                   | push                esi
            //   ff15????????         |                     
            //   57                   | push                edi
            //   8b3d????????         |                     
            //   ffd7                 | call                edi
            //   85f6                 | test                esi, esi

    condition:
        7 of them and filesize < 352256
}