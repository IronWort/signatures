rule win_zerot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.zerot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.zerot"
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
        $sequence_0 = { 740a 50 ffd7 c7460c00000000 f6450801 740e 68f4000000 }
            // n = 7, score = 200
            //   740a                 | je                  0xc
            //   50                   | push                eax
            //   ffd7                 | call                edi
            //   c7460c00000000       | mov                 dword ptr [esi + 0xc], 0
            //   f6450801             | test                byte ptr [ebp + 8], 1
            //   740e                 | je                  0x10
            //   68f4000000           | push                0xf4

        $sequence_1 = { 8d8554ffffff 6880000000 50 e8???????? 83c41c 8d854cfeffff }
            // n = 6, score = 200
            //   8d8554ffffff         | lea                 eax, dword ptr [ebp - 0xac]
            //   6880000000           | push                0x80
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c41c               | add                 esp, 0x1c
            //   8d854cfeffff         | lea                 eax, dword ptr [ebp - 0x1b4]

        $sequence_2 = { ffd6 8b8d74f6ffff 41 03c1 }
            // n = 4, score = 200
            //   ffd6                 | call                esi
            //   8b8d74f6ffff         | mov                 ecx, dword ptr [ebp - 0x98c]
            //   41                   | inc                 ecx
            //   03c1                 | add                 eax, ecx

        $sequence_3 = { 0f847a030000 57 8d8528fdffff 50 68???????? }
            // n = 5, score = 200
            //   0f847a030000         | je                  0x380
            //   57                   | push                edi
            //   8d8528fdffff         | lea                 eax, dword ptr [ebp - 0x2d8]
            //   50                   | push                eax
            //   68????????           |                     

        $sequence_4 = { ff760c e8???????? ff35???????? e8???????? 8b45ec 50 }
            // n = 6, score = 200
            //   ff760c               | push                dword ptr [esi + 0xc]
            //   e8????????           |                     
            //   ff35????????         |                     
            //   e8????????           |                     
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   50                   | push                eax

        $sequence_5 = { 6800010000 8d85fcfeffff 6a00 50 e8???????? 83c408 }
            // n = 6, score = 200
            //   6800010000           | push                0x100
            //   8d85fcfeffff         | lea                 eax, dword ptr [ebp - 0x104]
            //   6a00                 | push                0
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c408               | add                 esp, 8

        $sequence_6 = { 85c0 755e ff15???????? 8d857cffffff 50 ffd6 }
            // n = 6, score = 200
            //   85c0                 | test                eax, eax
            //   755e                 | jne                 0x60
            //   ff15????????         |                     
            //   8d857cffffff         | lea                 eax, dword ptr [ebp - 0x84]
            //   50                   | push                eax
            //   ffd6                 | call                esi

        $sequence_7 = { 0f1f440000 8b460c 8a44082a 2401 88040a 41 3bcf }
            // n = 7, score = 200
            //   0f1f440000           | nop                 dword ptr [eax + eax]
            //   8b460c               | mov                 eax, dword ptr [esi + 0xc]
            //   8a44082a             | mov                 al, byte ptr [eax + ecx + 0x2a]
            //   2401                 | and                 al, 1
            //   88040a               | mov                 byte ptr [edx + ecx], al
            //   41                   | inc                 ecx
            //   3bcf                 | cmp                 ecx, edi

        $sequence_8 = { 6a00 6a00 6a00 6a00 ff15???????? 57 }
            // n = 6, score = 200
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   57                   | push                edi

        $sequence_9 = { ffd6 57 ffd6 6a00 ff15???????? 6a00 }
            // n = 6, score = 200
            //   ffd6                 | call                esi
            //   57                   | push                edi
            //   ffd6                 | call                esi
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   6a00                 | push                0

    condition:
        7 of them and filesize < 303104
}