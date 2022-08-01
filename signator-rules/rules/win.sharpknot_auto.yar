rule win_sharpknot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.sharpknot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.sharpknot"
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
        $sequence_0 = { 7403 885801 bf???????? 83c9ff 33c0 8d542464 f2ae }
            // n = 7, score = 100
            //   7403                 | je                  5
            //   885801               | mov                 byte ptr [eax + 1], bl
            //   bf????????           |                     
            //   83c9ff               | or                  ecx, 0xffffffff
            //   33c0                 | xor                 eax, eax
            //   8d542464             | lea                 edx, dword ptr [esp + 0x64]
            //   f2ae                 | repne scasb         al, byte ptr es:[edi]

        $sequence_1 = { 50 ffd3 8be8 83fdff 0f8421010000 8b9c2464040000 }
            // n = 6, score = 100
            //   50                   | push                eax
            //   ffd3                 | call                ebx
            //   8be8                 | mov                 ebp, eax
            //   83fdff               | cmp                 ebp, -1
            //   0f8421010000         | je                  0x127
            //   8b9c2464040000       | mov                 ebx, dword ptr [esp + 0x464]

        $sequence_2 = { 53 56 6a24 50 57 }
            // n = 5, score = 100
            //   53                   | push                ebx
            //   56                   | push                esi
            //   6a24                 | push                0x24
            //   50                   | push                eax
            //   57                   | push                edi

        $sequence_3 = { 6a69 52 e8???????? 83c448 }
            // n = 4, score = 100
            //   6a69                 | push                0x69
            //   52                   | push                edx
            //   e8????????           |                     
            //   83c448               | add                 esp, 0x48

        $sequence_4 = { 03d1 83fa01 0f83b3000000 8bcb e8???????? 83f801 }
            // n = 6, score = 100
            //   03d1                 | add                 edx, ecx
            //   83fa01               | cmp                 edx, 1
            //   0f83b3000000         | jae                 0xb9
            //   8bcb                 | mov                 ecx, ebx
            //   e8????????           |                     
            //   83f801               | cmp                 eax, 1

        $sequence_5 = { 40 897304 8d0440 8d0cc6 8b742410 894b08 e9???????? }
            // n = 7, score = 100
            //   40                   | inc                 eax
            //   897304               | mov                 dword ptr [ebx + 4], esi
            //   8d0440               | lea                 eax, dword ptr [eax + eax*2]
            //   8d0cc6               | lea                 ecx, dword ptr [esi + eax*8]
            //   8b742410             | mov                 esi, dword ptr [esp + 0x10]
            //   894b08               | mov                 dword ptr [ebx + 8], ecx
            //   e9????????           |                     

        $sequence_6 = { c1fa02 8bca c1e91f 03d1 83fa01 }
            // n = 5, score = 100
            //   c1fa02               | sar                 edx, 2
            //   8bca                 | mov                 ecx, edx
            //   c1e91f               | shr                 ecx, 0x1f
            //   03d1                 | add                 edx, ecx
            //   83fa01               | cmp                 edx, 1

        $sequence_7 = { 6a00 56 ff15???????? 8d4c2448 }
            // n = 4, score = 100
            //   6a00                 | push                0
            //   56                   | push                esi
            //   ff15????????         |                     
            //   8d4c2448             | lea                 ecx, dword ptr [esp + 0x48]

        $sequence_8 = { c21000 8b15???????? 8b4204 80382d 0f84b7000000 893d???????? }
            // n = 6, score = 100
            //   c21000               | ret                 0x10
            //   8b15????????         |                     
            //   8b4204               | mov                 eax, dword ptr [edx + 4]
            //   80382d               | cmp                 byte ptr [eax], 0x2d
            //   0f84b7000000         | je                  0xbd
            //   893d????????         |                     

        $sequence_9 = { 5e b801000000 5b c3 ff15???????? 56 ffd3 }
            // n = 7, score = 100
            //   5e                   | pop                 esi
            //   b801000000           | mov                 eax, 1
            //   5b                   | pop                 ebx
            //   c3                   | ret                 
            //   ff15????????         |                     
            //   56                   | push                esi
            //   ffd3                 | call                ebx

    condition:
        7 of them and filesize < 1032192
}