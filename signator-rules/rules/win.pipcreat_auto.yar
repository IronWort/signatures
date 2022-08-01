rule win_pipcreat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.pipcreat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.pipcreat"
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
        $sequence_0 = { 50 ffd6 85c0 751b 8d851cfeffff c7851cfeffff14010000 }
            // n = 6, score = 100
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   85c0                 | test                eax, eax
            //   751b                 | jne                 0x1d
            //   8d851cfeffff         | lea                 eax, dword ptr [ebp - 0x1e4]
            //   c7851cfeffff14010000     | mov    dword ptr [ebp - 0x1e4], 0x114

        $sequence_1 = { 85c0 740c 6a10 ff750c }
            // n = 4, score = 100
            //   85c0                 | test                eax, eax
            //   740c                 | je                  0xe
            //   6a10                 | push                0x10
            //   ff750c               | push                dword ptr [ebp + 0xc]

        $sequence_2 = { 5e 81c438020000 c3 8d44240c }
            // n = 4, score = 100
            //   5e                   | pop                 esi
            //   81c438020000         | add                 esp, 0x238
            //   c3                   | ret                 
            //   8d44240c             | lea                 eax, dword ptr [esp + 0xc]

        $sequence_3 = { c20400 55 8bec b804300000 e8???????? 53 56 }
            // n = 7, score = 100
            //   c20400               | ret                 4
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   b804300000           | mov                 eax, 0x3004
            //   e8????????           |                     
            //   53                   | push                ebx
            //   56                   | push                esi

        $sequence_4 = { 8d8528ffffff 6a7f 50 8d8528feffff 6aff }
            // n = 5, score = 100
            //   8d8528ffffff         | lea                 eax, dword ptr [ebp - 0xd8]
            //   6a7f                 | push                0x7f
            //   50                   | push                eax
            //   8d8528feffff         | lea                 eax, dword ptr [ebp - 0x1d8]
            //   6aff                 | push                -1

        $sequence_5 = { a1???????? 83f803 7405 83f801 75ea 6a02 }
            // n = 6, score = 100
            //   a1????????           |                     
            //   83f803               | cmp                 eax, 3
            //   7405                 | je                  7
            //   83f801               | cmp                 eax, 1
            //   75ea                 | jne                 0xffffffec
            //   6a02                 | push                2

        $sequence_6 = { ffd6 ff35???????? ff15???????? 6a64 ffd6 }
            // n = 5, score = 100
            //   ffd6                 | call                esi
            //   ff35????????         |                     
            //   ff15????????         |                     
            //   6a64                 | push                0x64
            //   ffd6                 | call                esi

        $sequence_7 = { 33db 57 8d85f8efffff 53 50 }
            // n = 5, score = 100
            //   33db                 | xor                 ebx, ebx
            //   57                   | push                edi
            //   8d85f8efffff         | lea                 eax, dword ptr [ebp - 0x1008]
            //   53                   | push                ebx
            //   50                   | push                eax

        $sequence_8 = { 57 50 ff75f4 ff15???????? 395dfc }
            // n = 5, score = 100
            //   57                   | push                edi
            //   50                   | push                eax
            //   ff75f4               | push                dword ptr [ebp - 0xc]
            //   ff15????????         |                     
            //   395dfc               | cmp                 dword ptr [ebp - 4], ebx

        $sequence_9 = { 685c410010 50 ffd6 59 59 83bd20feffff06 7510 }
            // n = 7, score = 100
            //   685c410010           | push                0x1000415c
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   83bd20feffff06       | cmp                 dword ptr [ebp - 0x1e0], 6
            //   7510                 | jne                 0x12

    condition:
        7 of them and filesize < 65536
}