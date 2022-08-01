rule win_karagany_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.karagany."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.karagany"
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
        $sequence_0 = { 8945d8 8945e0 8945e8 8945ec 8945f4 }
            // n = 5, score = 400
            //   8945d8               | mov                 dword ptr [ebp - 0x28], eax
            //   8945e0               | mov                 dword ptr [ebp - 0x20], eax
            //   8945e8               | mov                 dword ptr [ebp - 0x18], eax
            //   8945ec               | mov                 dword ptr [ebp - 0x14], eax
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax

        $sequence_1 = { 56 8b35???????? 57 8bf8 6a03 57 ffd6 }
            // n = 7, score = 400
            //   56                   | push                esi
            //   8b35????????         |                     
            //   57                   | push                edi
            //   8bf8                 | mov                 edi, eax
            //   6a03                 | push                3
            //   57                   | push                edi
            //   ffd6                 | call                esi

        $sequence_2 = { 68???????? 8d85a4fdffff 50 ffd6 68???????? }
            // n = 5, score = 400
            //   68????????           |                     
            //   8d85a4fdffff         | lea                 eax, dword ptr [ebp - 0x25c]
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   68????????           |                     

        $sequence_3 = { 8b35???????? 57 8bf8 6a03 }
            // n = 4, score = 400
            //   8b35????????         |                     
            //   57                   | push                edi
            //   8bf8                 | mov                 edi, eax
            //   6a03                 | push                3

        $sequence_4 = { 8d85a4fdffff 50 ffd6 68???????? }
            // n = 4, score = 400
            //   8d85a4fdffff         | lea                 eax, dword ptr [ebp - 0x25c]
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   68????????           |                     

        $sequence_5 = { 83c40c 68???????? 8d85a4fdffff 50 }
            // n = 4, score = 400
            //   83c40c               | add                 esp, 0xc
            //   68????????           |                     
            //   8d85a4fdffff         | lea                 eax, dword ptr [ebp - 0x25c]
            //   50                   | push                eax

        $sequence_6 = { 6a40 6800300000 6800000300 6a00 ff15???????? }
            // n = 5, score = 400
            //   6a40                 | push                0x40
            //   6800300000           | push                0x3000
            //   6800000300           | push                0x30000
            //   6a00                 | push                0
            //   ff15????????         |                     

        $sequence_7 = { 8b35???????? 57 8bf8 6a03 57 }
            // n = 5, score = 400
            //   8b35????????         |                     
            //   57                   | push                edi
            //   8bf8                 | mov                 edi, eax
            //   6a03                 | push                3
            //   57                   | push                edi

        $sequence_8 = { ff15???????? 6a00 53 68???????? }
            // n = 4, score = 400
            //   ff15????????         |                     
            //   6a00                 | push                0
            //   53                   | push                ebx
            //   68????????           |                     

        $sequence_9 = { 57 8bf8 6a03 57 }
            // n = 4, score = 400
            //   57                   | push                edi
            //   8bf8                 | mov                 edi, eax
            //   6a03                 | push                3
            //   57                   | push                edi

    condition:
        7 of them and filesize < 180224
}