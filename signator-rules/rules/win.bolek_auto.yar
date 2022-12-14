rule win_bolek_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.bolek."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.bolek"
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
        $sequence_0 = { ff750c 56 e8???????? ebed 68???????? ebb5 ff763c }
            // n = 7, score = 600
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   56                   | push                esi
            //   e8????????           |                     
            //   ebed                 | jmp                 0xffffffef
            //   68????????           |                     
            //   ebb5                 | jmp                 0xffffffb7
            //   ff763c               | push                dword ptr [esi + 0x3c]

        $sequence_1 = { ff74241c 68???????? 56 53 e8???????? 83c414 e9???????? }
            // n = 7, score = 600
            //   ff74241c             | push                dword ptr [esp + 0x1c]
            //   68????????           |                     
            //   56                   | push                esi
            //   53                   | push                ebx
            //   e8????????           |                     
            //   83c414               | add                 esp, 0x14
            //   e9????????           |                     

        $sequence_2 = { 895c2478 8bd8 0facc813 c1e30d 0bf8 c1e913 8b442470 }
            // n = 7, score = 600
            //   895c2478             | mov                 dword ptr [esp + 0x78], ebx
            //   8bd8                 | mov                 ebx, eax
            //   0facc813             | shrd                eax, ecx, 0x13
            //   c1e30d               | shl                 ebx, 0xd
            //   0bf8                 | or                  edi, eax
            //   c1e913               | shr                 ecx, 0x13
            //   8b442470             | mov                 eax, dword ptr [esp + 0x70]

        $sequence_3 = { 8b8548fdffff 3b4704 77ee 8b5668 8d8544fdffff 50 8b4608 }
            // n = 7, score = 600
            //   8b8548fdffff         | mov                 eax, dword ptr [ebp - 0x2b8]
            //   3b4704               | cmp                 eax, dword ptr [edi + 4]
            //   77ee                 | ja                  0xfffffff0
            //   8b5668               | mov                 edx, dword ptr [esi + 0x68]
            //   8d8544fdffff         | lea                 eax, dword ptr [ebp - 0x2bc]
            //   50                   | push                eax
            //   8b4608               | mov                 eax, dword ptr [esi + 8]

        $sequence_4 = { ff75fc ff15???????? 8b45f4 50 8b08 ff5108 8b45f0 }
            // n = 7, score = 600
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ff15????????         |                     
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   50                   | push                eax
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   ff5108               | call                dword ptr [ecx + 8]
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]

        $sequence_5 = { e8???????? 8806 46 fe07 59 81fbff000000 7506 }
            // n = 7, score = 600
            //   e8????????           |                     
            //   8806                 | mov                 byte ptr [esi], al
            //   46                   | inc                 esi
            //   fe07                 | inc                 byte ptr [edi]
            //   59                   | pop                 ecx
            //   81fbff000000         | cmp                 ebx, 0xff
            //   7506                 | jne                 8

        $sequence_6 = { ffb42430010000 ffb42430010000 e8???????? 8bf8 83c41c 897c240c 85ff }
            // n = 7, score = 600
            //   ffb42430010000       | push                dword ptr [esp + 0x130]
            //   ffb42430010000       | push                dword ptr [esp + 0x130]
            //   e8????????           |                     
            //   8bf8                 | mov                 edi, eax
            //   83c41c               | add                 esp, 0x1c
            //   897c240c             | mov                 dword ptr [esp + 0xc], edi
            //   85ff                 | test                edi, edi

        $sequence_7 = { f76d10 03c8 8b4540 13f2 f76d18 03c8 8b4528 }
            // n = 7, score = 600
            //   f76d10               | imul                dword ptr [ebp + 0x10]
            //   03c8                 | add                 ecx, eax
            //   8b4540               | mov                 eax, dword ptr [ebp + 0x40]
            //   13f2                 | adc                 esi, edx
            //   f76d18               | imul                dword ptr [ebp + 0x18]
            //   03c8                 | add                 ecx, eax
            //   8b4528               | mov                 eax, dword ptr [ebp + 0x28]

        $sequence_8 = { 85d2 750d 53 be360200c0 e8???????? eb16 8b442418 }
            // n = 7, score = 600
            //   85d2                 | test                edx, edx
            //   750d                 | jne                 0xf
            //   53                   | push                ebx
            //   be360200c0           | mov                 esi, 0xc0000236
            //   e8????????           |                     
            //   eb16                 | jmp                 0x18
            //   8b442418             | mov                 eax, dword ptr [esp + 0x18]

        $sequence_9 = { 57 8d45d0 50 ff7608 e8???????? 83c410 3bc7 }
            // n = 7, score = 600
            //   57                   | push                edi
            //   8d45d0               | lea                 eax, dword ptr [ebp - 0x30]
            //   50                   | push                eax
            //   ff7608               | push                dword ptr [esi + 8]
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   3bc7                 | cmp                 eax, edi

    condition:
        7 of them and filesize < 892928
}