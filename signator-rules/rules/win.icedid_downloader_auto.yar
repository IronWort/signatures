rule win_icedid_downloader_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.icedid_downloader."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.icedid_downloader"
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
        $sequence_0 = { 59 59 8d442440 50 ffd3 8b4c2414 8bf8 }
            // n = 7, score = 400
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   8d442440             | lea                 eax, dword ptr [esp + 0x40]
            //   50                   | push                eax
            //   ffd3                 | call                ebx
            //   8b4c2414             | mov                 ecx, dword ptr [esp + 0x14]
            //   8bf8                 | mov                 edi, eax

        $sequence_1 = { 89442434 ffd3 50 8d442428 50 ff742438 ff15???????? }
            // n = 7, score = 400
            //   89442434             | mov                 dword ptr [esp + 0x34], eax
            //   ffd3                 | call                ebx
            //   50                   | push                eax
            //   8d442428             | lea                 eax, dword ptr [esp + 0x28]
            //   50                   | push                eax
            //   ff742438             | push                dword ptr [esp + 0x38]
            //   ff15????????         |                     

        $sequence_2 = { e8???????? 85c0 7847 395df4 7442 8d45f8 50 }
            // n = 7, score = 400
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7847                 | js                  0x49
            //   395df4               | cmp                 dword ptr [ebp - 0xc], ebx
            //   7442                 | je                  0x44
            //   8d45f8               | lea                 eax, dword ptr [ebp - 8]
            //   50                   | push                eax

        $sequence_3 = { 5e 33ff 894568 56 }
            // n = 4, score = 400
            //   5e                   | pop                 esi
            //   33ff                 | xor                 edi, edi
            //   894568               | mov                 dword ptr [ebp + 0x68], eax
            //   56                   | push                esi

        $sequence_4 = { 8bfc 8b08 ff7508 a5 68???????? 50 }
            // n = 6, score = 400
            //   8bfc                 | mov                 edi, esp
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   ff7508               | push                dword ptr [ebp + 8]
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]
            //   68????????           |                     
            //   50                   | push                eax

        $sequence_5 = { 50 6a08 6aff 885c241c ff15???????? 85c0 0f840f010000 }
            // n = 7, score = 400
            //   50                   | push                eax
            //   6a08                 | push                8
            //   6aff                 | push                -1
            //   885c241c             | mov                 byte ptr [esp + 0x1c], bl
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   0f840f010000         | je                  0x115

        $sequence_6 = { 50 8d85ccfbffff 50 e8???????? 83c40c 85c0 }
            // n = 6, score = 400
            //   50                   | push                eax
            //   8d85ccfbffff         | lea                 eax, dword ptr [ebp - 0x434]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   85c0                 | test                eax, eax

        $sequence_7 = { 56 ff7578 ff7574 51 ff5024 }
            // n = 5, score = 400
            //   56                   | push                esi
            //   ff7578               | push                dword ptr [ebp + 0x78]
            //   ff7574               | push                dword ptr [ebp + 0x74]
            //   51                   | push                ecx
            //   ff5024               | call                dword ptr [eax + 0x24]

        $sequence_8 = { ffd7 8d842494000000 896c2410 50 68???????? e8???????? 8d44241c }
            // n = 7, score = 400
            //   ffd7                 | call                edi
            //   8d842494000000       | lea                 eax, dword ptr [esp + 0x94]
            //   896c2410             | mov                 dword ptr [esp + 0x10], ebp
            //   50                   | push                eax
            //   68????????           |                     
            //   e8????????           |                     
            //   8d44241c             | lea                 eax, dword ptr [esp + 0x1c]

        $sequence_9 = { 53 8d45f0 66c745e80010 50 33db 6800000002 ff7508 }
            // n = 7, score = 400
            //   53                   | push                ebx
            //   8d45f0               | lea                 eax, dword ptr [ebp - 0x10]
            //   66c745e80010         | mov                 word ptr [ebp - 0x18], 0x1000
            //   50                   | push                eax
            //   33db                 | xor                 ebx, ebx
            //   6800000002           | push                0x2000000
            //   ff7508               | push                dword ptr [ebp + 8]

    condition:
        7 of them and filesize < 40960
}