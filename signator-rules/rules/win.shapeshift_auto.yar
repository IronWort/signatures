rule win_shapeshift_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.shapeshift."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.shapeshift"
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
        $sequence_0 = { ffd6 8b3d???????? 6a00 6a00 68f5000000 50 ffd7 }
            // n = 7, score = 100
            //   ffd6                 | call                esi
            //   8b3d????????         |                     
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   68f5000000           | push                0xf5
            //   50                   | push                eax
            //   ffd7                 | call                edi

        $sequence_1 = { 68f0f1ffff b9???????? e8???????? c705????????c0f44100 33c0 }
            // n = 5, score = 100
            //   68f0f1ffff           | push                0xfffff1f0
            //   b9????????           |                     
            //   e8????????           |                     
            //   c705????????c0f44100     |     
            //   33c0                 | xor                 eax, eax

        $sequence_2 = { e8???????? 8b404c 83b8a800000000 7512 8b04bd38054200 807c302900 }
            // n = 6, score = 100
            //   e8????????           |                     
            //   8b404c               | mov                 eax, dword ptr [eax + 0x4c]
            //   83b8a800000000       | cmp                 dword ptr [eax + 0xa8], 0
            //   7512                 | jne                 0x14
            //   8b04bd38054200       | mov                 eax, dword ptr [edi*4 + 0x420538]
            //   807c302900           | cmp                 byte ptr [eax + esi + 0x29], 0

        $sequence_3 = { 85c0 0f8440020000 8b3d???????? 6a00 6a00 6a03 }
            // n = 6, score = 100
            //   85c0                 | test                eax, eax
            //   0f8440020000         | je                  0x246
            //   8b3d????????         |                     
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a03                 | push                3

        $sequence_4 = { 8d95f8fdffff e8???????? 83c40c 8bd3 }
            // n = 4, score = 100
            //   8d95f8fdffff         | lea                 edx, dword ptr [ebp - 0x208]
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8bd3                 | mov                 edx, ebx

        $sequence_5 = { 7533 68???????? 8d44243c c744243c04000000 50 8d44241c c744241c00000000 }
            // n = 7, score = 100
            //   7533                 | jne                 0x35
            //   68????????           |                     
            //   8d44243c             | lea                 eax, dword ptr [esp + 0x3c]
            //   c744243c04000000     | mov                 dword ptr [esp + 0x3c], 4
            //   50                   | push                eax
            //   8d44241c             | lea                 eax, dword ptr [esp + 0x1c]
            //   c744241c00000000     | mov                 dword ptr [esp + 0x1c], 0

        $sequence_6 = { 50 ffd7 51 8d85f8feffff 50 ff15???????? 8bc8 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   ffd7                 | call                edi
            //   51                   | push                ecx
            //   8d85f8feffff         | lea                 eax, dword ptr [ebp - 0x108]
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8bc8                 | mov                 ecx, eax

        $sequence_7 = { 8b542428 8d4c2444 57 e8???????? 8b442424 }
            // n = 5, score = 100
            //   8b542428             | mov                 edx, dword ptr [esp + 0x28]
            //   8d4c2444             | lea                 ecx, dword ptr [esp + 0x44]
            //   57                   | push                edi
            //   e8????????           |                     
            //   8b442424             | mov                 eax, dword ptr [esp + 0x24]

    condition:
        7 of them and filesize < 303104
}