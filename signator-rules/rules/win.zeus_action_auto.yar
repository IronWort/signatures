rule win_zeus_action_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.zeus_action."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.zeus_action"
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
        $sequence_0 = { 3bd0 72f4 eb2e 48 3bd0 7321 8d3c9598010000 }
            // n = 7, score = 300
            //   3bd0                 | cmp                 edx, eax
            //   72f4                 | jb                  0xfffffff6
            //   eb2e                 | jmp                 0x30
            //   48                   | dec                 eax
            //   3bd0                 | cmp                 edx, eax
            //   7321                 | jae                 0x23
            //   8d3c9598010000       | lea                 edi, dword ptr [edx*4 + 0x198]

        $sequence_1 = { 3c20 0f8529ffffff ff7518 ff7514 ff7510 ff750c 51 }
            // n = 7, score = 300
            //   3c20                 | cmp                 al, 0x20
            //   0f8529ffffff         | jne                 0xffffff2f
            //   ff7518               | push                dword ptr [ebp + 0x18]
            //   ff7514               | push                dword ptr [ebp + 0x14]
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   51                   | push                ecx

        $sequence_2 = { ebe8 817e0800000100 75df 8b7e0c 85ff 74d8 8b07 }
            // n = 7, score = 300
            //   ebe8                 | jmp                 0xffffffea
            //   817e0800000100       | cmp                 dword ptr [esi + 8], 0x10000
            //   75df                 | jne                 0xffffffe1
            //   8b7e0c               | mov                 edi, dword ptr [esi + 0xc]
            //   85ff                 | test                edi, edi
            //   74d8                 | je                  0xffffffda
            //   8b07                 | mov                 eax, dword ptr [edi]

        $sequence_3 = { 56 57 ff7508 8d7dfc e8???????? 59 8945f8 }
            // n = 7, score = 300
            //   56                   | push                esi
            //   57                   | push                edi
            //   ff7508               | push                dword ptr [ebp + 8]
            //   8d7dfc               | lea                 edi, dword ptr [ebp - 4]
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   8945f8               | mov                 dword ptr [ebp - 8], eax

        $sequence_4 = { 668945fc 6a06 8d45f8 50 56 e8???????? 83c40c }
            // n = 7, score = 300
            //   668945fc             | mov                 word ptr [ebp - 4], ax
            //   6a06                 | push                6
            //   8d45f8               | lea                 eax, dword ptr [ebp - 8]
            //   50                   | push                eax
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc

        $sequence_5 = { eb28 8b45f4 56 8b08 68???????? 6a00 6a00 }
            // n = 7, score = 300
            //   eb28                 | jmp                 0x2a
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   56                   | push                esi
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   68????????           |                     
            //   6a00                 | push                0
            //   6a00                 | push                0

        $sequence_6 = { 72f4 3bc7 7475 b82c050000 e8???????? 8bd8 3bdf }
            // n = 7, score = 300
            //   72f4                 | jb                  0xfffffff6
            //   3bc7                 | cmp                 eax, edi
            //   7475                 | je                  0x77
            //   b82c050000           | mov                 eax, 0x52c
            //   e8????????           |                     
            //   8bd8                 | mov                 ebx, eax
            //   3bdf                 | cmp                 ebx, edi

        $sequence_7 = { 50 0fb74582 50 0fb74580 2dd0070000 50 8d859cfdffff }
            // n = 7, score = 300
            //   50                   | push                eax
            //   0fb74582             | movzx               eax, word ptr [ebp - 0x7e]
            //   50                   | push                eax
            //   0fb74580             | movzx               eax, word ptr [ebp - 0x80]
            //   2dd0070000           | sub                 eax, 0x7d0
            //   50                   | push                eax
            //   8d859cfdffff         | lea                 eax, dword ptr [ebp - 0x264]

        $sequence_8 = { 8a1c06 8b4508 0a1c02 8b450c 8b5514 8a480c 0fb74008 }
            // n = 7, score = 300
            //   8a1c06               | mov                 bl, byte ptr [esi + eax]
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   0a1c02               | or                  bl, byte ptr [edx + eax]
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   8b5514               | mov                 edx, dword ptr [ebp + 0x14]
            //   8a480c               | mov                 cl, byte ptr [eax + 0xc]
            //   0fb74008             | movzx               eax, word ptr [eax + 8]

        $sequence_9 = { ff15???????? 57 6a00 ff15???????? 66837dca18 7507 6a20 }
            // n = 7, score = 300
            //   ff15????????         |                     
            //   57                   | push                edi
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   66837dca18           | cmp                 word ptr [ebp - 0x36], 0x18
            //   7507                 | jne                 9
            //   6a20                 | push                0x20

    condition:
        7 of them and filesize < 827392
}