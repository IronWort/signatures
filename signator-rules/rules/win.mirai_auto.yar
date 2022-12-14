rule win_mirai_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.mirai."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.mirai"
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
        $sequence_0 = { 896c2424 e8???????? 8b4c2410 51 8ad8 8b442418 55 }
            // n = 7, score = 100
            //   896c2424             | mov                 dword ptr [esp + 0x24], ebp
            //   e8????????           |                     
            //   8b4c2410             | mov                 ecx, dword ptr [esp + 0x10]
            //   51                   | push                ecx
            //   8ad8                 | mov                 bl, al
            //   8b442418             | mov                 eax, dword ptr [esp + 0x18]
            //   55                   | push                ebp

        $sequence_1 = { ff7008 ff15???????? 898554ffffff 83bd54ffffff00 7e23 ffb554ffffff 8d854cf7ffff }
            // n = 7, score = 100
            //   ff7008               | push                dword ptr [eax + 8]
            //   ff15????????         |                     
            //   898554ffffff         | mov                 dword ptr [ebp - 0xac], eax
            //   83bd54ffffff00       | cmp                 dword ptr [ebp - 0xac], 0
            //   7e23                 | jle                 0x25
            //   ffb554ffffff         | push                dword ptr [ebp - 0xac]
            //   8d854cf7ffff         | lea                 eax, dword ptr [ebp - 0x8b4]

        $sequence_2 = { ff15???????? 8b442428 50 55 e8???????? 83c408 e8???????? }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   8b442428             | mov                 eax, dword ptr [esp + 0x28]
            //   50                   | push                eax
            //   55                   | push                ebp
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   e8????????           |                     

        $sequence_3 = { ff45fc 83c708 53 894d14 e8???????? 8b5514 83c404 }
            // n = 7, score = 100
            //   ff45fc               | inc                 dword ptr [ebp - 4]
            //   83c708               | add                 edi, 8
            //   53                   | push                ebx
            //   894d14               | mov                 dword ptr [ebp + 0x14], ecx
            //   e8????????           |                     
            //   8b5514               | mov                 edx, dword ptr [ebp + 0x14]
            //   83c404               | add                 esp, 4

        $sequence_4 = { ffb0cc010000 ff15???????? 83f8ff 7512 6a12 8b45d4 8b00 }
            // n = 7, score = 100
            //   ffb0cc010000         | push                dword ptr [eax + 0x1cc]
            //   ff15????????         |                     
            //   83f8ff               | cmp                 eax, -1
            //   7512                 | jne                 0x14
            //   6a12                 | push                0x12
            //   8b45d4               | mov                 eax, dword ptr [ebp - 0x2c]
            //   8b00                 | mov                 eax, dword ptr [eax]

        $sequence_5 = { e8???????? ff75fc e8???????? 59 8b00 8945fc ff7508 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   ff7508               | push                dword ptr [ebp + 8]

        $sequence_6 = { c1c61e 8bee 8bf0 33742448 895c2420 33742440 896c2410 }
            // n = 7, score = 100
            //   c1c61e               | rol                 esi, 0x1e
            //   8bee                 | mov                 ebp, esi
            //   8bf0                 | mov                 esi, eax
            //   33742448             | xor                 esi, dword ptr [esp + 0x48]
            //   895c2420             | mov                 dword ptr [esp + 0x20], ebx
            //   33742440             | xor                 esi, dword ptr [esp + 0x40]
            //   896c2410             | mov                 dword ptr [esp + 0x10], ebp

        $sequence_7 = { ff7510 8b4dfc 83c128 e8???????? 8b45fc 8b4d14 894844 }
            // n = 7, score = 100
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   83c128               | add                 ecx, 0x28
            //   e8????????           |                     
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   8b4d14               | mov                 ecx, dword ptr [ebp + 0x14]
            //   894844               | mov                 dword ptr [eax + 0x44], ecx

        $sequence_8 = { ffb0a8000000 e8???????? 59 8945e8 837de800 755d 8b85c4efffff }
            // n = 7, score = 100
            //   ffb0a8000000         | push                dword ptr [eax + 0xa8]
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   8945e8               | mov                 dword ptr [ebp - 0x18], eax
            //   837de800             | cmp                 dword ptr [ebp - 0x18], 0
            //   755d                 | jne                 0x5f
            //   8b85c4efffff         | mov                 eax, dword ptr [ebp - 0x103c]

        $sequence_9 = { eb41 834e3002 eb3b 834e3004 eb35 095e30 eb30 }
            // n = 7, score = 100
            //   eb41                 | jmp                 0x43
            //   834e3002             | or                  dword ptr [esi + 0x30], 2
            //   eb3b                 | jmp                 0x3d
            //   834e3004             | or                  dword ptr [esi + 0x30], 4
            //   eb35                 | jmp                 0x37
            //   095e30               | or                  dword ptr [esi + 0x30], ebx
            //   eb30                 | jmp                 0x32

    condition:
        7 of them and filesize < 7086080
}