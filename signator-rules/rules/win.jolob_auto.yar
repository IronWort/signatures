rule win_jolob_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.jolob."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.jolob"
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
        $sequence_0 = { 83c610 56 895d00 ff15???????? 5f 5d }
            // n = 6, score = 300
            //   83c610               | add                 esi, 0x10
            //   56                   | push                esi
            //   895d00               | mov                 dword ptr [ebp], ebx
            //   ff15????????         |                     
            //   5f                   | pop                 edi
            //   5d                   | pop                 ebp

        $sequence_1 = { 8bf0 33c0 394508 7504 33c0 }
            // n = 5, score = 300
            //   8bf0                 | mov                 esi, eax
            //   33c0                 | xor                 eax, eax
            //   394508               | cmp                 dword ptr [ebp + 8], eax
            //   7504                 | jne                 6
            //   33c0                 | xor                 eax, eax

        $sequence_2 = { 39450c 740b ff45fc 8b45fc 3b4618 }
            // n = 5, score = 300
            //   39450c               | cmp                 dword ptr [ebp + 0xc], eax
            //   740b                 | je                  0xd
            //   ff45fc               | inc                 dword ptr [ebp - 4]
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   3b4618               | cmp                 eax, dword ptr [esi + 0x18]

        $sequence_3 = { 58 48 c644041400 75f8 8d442420 50 ff730c }
            // n = 7, score = 300
            //   58                   | pop                 eax
            //   48                   | dec                 eax
            //   c644041400           | mov                 byte ptr [esp + eax + 0x14], 0
            //   75f8                 | jne                 0xfffffffa
            //   8d442420             | lea                 eax, dword ptr [esp + 0x20]
            //   50                   | push                eax
            //   ff730c               | push                dword ptr [ebx + 0xc]

        $sequence_4 = { 8b8b1c080000 8d7e10 57 8945f0 c745f467452301 8975ec e8???????? }
            // n = 7, score = 300
            //   8b8b1c080000         | mov                 ecx, dword ptr [ebx + 0x81c]
            //   8d7e10               | lea                 edi, dword ptr [esi + 0x10]
            //   57                   | push                edi
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   c745f467452301       | mov                 dword ptr [ebp - 0xc], 0x1234567
            //   8975ec               | mov                 dword ptr [ebp - 0x14], esi
            //   e8????????           |                     

        $sequence_5 = { 894e3c 895804 897dfc 397e30 761a 6a1c }
            // n = 6, score = 300
            //   894e3c               | mov                 dword ptr [esi + 0x3c], ecx
            //   895804               | mov                 dword ptr [eax + 4], ebx
            //   897dfc               | mov                 dword ptr [ebp - 4], edi
            //   397e30               | cmp                 dword ptr [esi + 0x30], edi
            //   761a                 | jbe                 0x1c
            //   6a1c                 | push                0x1c

        $sequence_6 = { 57 ffd6 ff7510 8945f8 c645f701 c645f405 c645f501 }
            // n = 7, score = 300
            //   57                   | push                edi
            //   ffd6                 | call                esi
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   c645f701             | mov                 byte ptr [ebp - 9], 1
            //   c645f405             | mov                 byte ptr [ebp - 0xc], 5
            //   c645f501             | mov                 byte ptr [ebp - 0xb], 1

        $sequence_7 = { 8bec 51 53 56 33f6 c645ff00 33db }
            // n = 7, score = 300
            //   8bec                 | mov                 ebp, esp
            //   51                   | push                ecx
            //   53                   | push                ebx
            //   56                   | push                esi
            //   33f6                 | xor                 esi, esi
            //   c645ff00             | mov                 byte ptr [ebp - 1], 0
            //   33db                 | xor                 ebx, ebx

        $sequence_8 = { c1f803 46 2bf0 8d4ddc e8???????? 83471008 8b7f10 }
            // n = 7, score = 300
            //   c1f803               | sar                 eax, 3
            //   46                   | inc                 esi
            //   2bf0                 | sub                 esi, eax
            //   8d4ddc               | lea                 ecx, dword ptr [ebp - 0x24]
            //   e8????????           |                     
            //   83471008             | add                 dword ptr [edi + 0x10], 8
            //   8b7f10               | mov                 edi, dword ptr [edi + 0x10]

        $sequence_9 = { ff15???????? 8d45f0 50 8d5e04 e8???????? ff36 }
            // n = 6, score = 300
            //   ff15????????         |                     
            //   8d45f0               | lea                 eax, dword ptr [ebp - 0x10]
            //   50                   | push                eax
            //   8d5e04               | lea                 ebx, dword ptr [esi + 4]
            //   e8????????           |                     
            //   ff36                 | push                dword ptr [esi]

    condition:
        7 of them and filesize < 196608
}