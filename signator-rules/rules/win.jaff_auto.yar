rule win_jaff_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.jaff."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.jaff"
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
        $sequence_0 = { e8???????? 8b4df4 83c418 51 6a00 ff15???????? }
            // n = 6, score = 600
            //   e8????????           |                     
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]
            //   83c418               | add                 esp, 0x18
            //   51                   | push                ecx
            //   6a00                 | push                0
            //   ff15????????         |                     

        $sequence_1 = { 84c0 7504 84c9 7546 8b5704 3b55f0 753e }
            // n = 7, score = 600
            //   84c0                 | test                al, al
            //   7504                 | jne                 6
            //   84c9                 | test                cl, cl
            //   7546                 | jne                 0x48
            //   8b5704               | mov                 edx, dword ptr [edi + 4]
            //   3b55f0               | cmp                 edx, dword ptr [ebp - 0x10]
            //   753e                 | jne                 0x40

        $sequence_2 = { 7506 8bc8 eb02 8bca 40 3bc2 72ea }
            // n = 7, score = 600
            //   7506                 | jne                 8
            //   8bc8                 | mov                 ecx, eax
            //   eb02                 | jmp                 4
            //   8bca                 | mov                 ecx, edx
            //   40                   | inc                 eax
            //   3bc2                 | cmp                 eax, edx
            //   72ea                 | jb                  0xffffffec

        $sequence_3 = { 8b7d0c 8b07 83c002 50 6a08 ff15???????? 50 }
            // n = 7, score = 600
            //   8b7d0c               | mov                 edi, dword ptr [ebp + 0xc]
            //   8b07                 | mov                 eax, dword ptr [edi]
            //   83c002               | add                 eax, 2
            //   50                   | push                eax
            //   6a08                 | push                8
            //   ff15????????         |                     
            //   50                   | push                eax

        $sequence_4 = { 807df800 7504 c645e800 8d45dc 8d7dac 8d75cc }
            // n = 6, score = 600
            //   807df800             | cmp                 byte ptr [ebp - 8], 0
            //   7504                 | jne                 6
            //   c645e800             | mov                 byte ptr [ebp - 0x18], 0
            //   8d45dc               | lea                 eax, dword ptr [ebp - 0x24]
            //   8d7dac               | lea                 edi, dword ptr [ebp - 0x54]
            //   8d75cc               | lea                 esi, dword ptr [ebp - 0x34]

        $sequence_5 = { 8a400c 51 6a08 88460c ffd7 }
            // n = 5, score = 600
            //   8a400c               | mov                 al, byte ptr [eax + 0xc]
            //   51                   | push                ecx
            //   6a08                 | push                8
            //   88460c               | mov                 byte ptr [esi + 0xc], al
            //   ffd7                 | call                edi

        $sequence_6 = { 52 57 e8???????? 8b45a8 50 6a00 }
            // n = 6, score = 600
            //   52                   | push                edx
            //   57                   | push                edi
            //   e8????????           |                     
            //   8b45a8               | mov                 eax, dword ptr [ebp - 0x58]
            //   50                   | push                eax
            //   6a00                 | push                0

        $sequence_7 = { 837d0800 7460 837d0c00 745a 8b3e 8d45fc }
            // n = 6, score = 600
            //   837d0800             | cmp                 dword ptr [ebp + 8], 0
            //   7460                 | je                  0x62
            //   837d0c00             | cmp                 dword ptr [ebp + 0xc], 0
            //   745a                 | je                  0x5c
            //   8b3e                 | mov                 edi, dword ptr [esi]
            //   8d45fc               | lea                 eax, dword ptr [ebp - 4]

        $sequence_8 = { 8b7d0c 8b07 83c002 50 }
            // n = 4, score = 600
            //   8b7d0c               | mov                 edi, dword ptr [ebp + 0xc]
            //   8b07                 | mov                 eax, dword ptr [edi]
            //   83c002               | add                 eax, 2
            //   50                   | push                eax

        $sequence_9 = { e8???????? 8b45e8 50 6a00 ffd3 8b3d???????? 50 }
            // n = 7, score = 600
            //   e8????????           |                     
            //   8b45e8               | mov                 eax, dword ptr [ebp - 0x18]
            //   50                   | push                eax
            //   6a00                 | push                0
            //   ffd3                 | call                ebx
            //   8b3d????????         |                     
            //   50                   | push                eax

    condition:
        7 of them and filesize < 106496
}