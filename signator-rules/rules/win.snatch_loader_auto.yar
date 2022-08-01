rule win_snatch_loader_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.snatch_loader."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.snatch_loader"
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
        $sequence_0 = { 57 8bf9 85c0 7522 6a02 59 e8???????? }
            // n = 7, score = 600
            //   57                   | push                edi
            //   8bf9                 | mov                 edi, ecx
            //   85c0                 | test                eax, eax
            //   7522                 | jne                 0x24
            //   6a02                 | push                2
            //   59                   | pop                 ecx
            //   e8????????           |                     

        $sequence_1 = { 668945f4 83c002 668945f6 a1???????? 85c0 7522 33c9 }
            // n = 7, score = 600
            //   668945f4             | mov                 word ptr [ebp - 0xc], ax
            //   83c002               | add                 eax, 2
            //   668945f6             | mov                 word ptr [ebp - 0xa], ax
            //   a1????????           |                     
            //   85c0                 | test                eax, eax
            //   7522                 | jne                 0x24
            //   33c9                 | xor                 ecx, ecx

        $sequence_2 = { 53 56 57 ffd0 5f 85c0 7509 }
            // n = 7, score = 600
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   ffd0                 | call                eax
            //   5f                   | pop                 edi
            //   85c0                 | test                eax, eax
            //   7509                 | jne                 0xb

        $sequence_3 = { 57 8bfa 85c0 751d }
            // n = 4, score = 600
            //   57                   | push                edi
            //   8bfa                 | mov                 edi, edx
            //   85c0                 | test                eax, eax
            //   751d                 | jne                 0x1f

        $sequence_4 = { 33db bfe71edec0 895dfc e8???????? 8bf0 85f6 744b }
            // n = 7, score = 600
            //   33db                 | xor                 ebx, ebx
            //   bfe71edec0           | mov                 edi, 0xc0de1ee7
            //   895dfc               | mov                 dword ptr [ebp - 4], ebx
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   85f6                 | test                esi, esi
            //   744b                 | je                  0x4d

        $sequence_5 = { 57 6a00 56 ffd0 5f 5e 8be5 }
            // n = 7, score = 600
            //   57                   | push                edi
            //   6a00                 | push                0
            //   56                   | push                esi
            //   ffd0                 | call                eax
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   8be5                 | mov                 esp, ebp

        $sequence_6 = { 53 56 ffd0 85c0 8bce 0f457dfc }
            // n = 6, score = 600
            //   53                   | push                ebx
            //   56                   | push                esi
            //   ffd0                 | call                eax
            //   85c0                 | test                eax, eax
            //   8bce                 | mov                 ecx, esi
            //   0f457dfc             | cmovne              edi, dword ptr [ebp - 4]

        $sequence_7 = { 744b 33c0 66894606 a1???????? 85c0 7522 6a02 }
            // n = 7, score = 600
            //   744b                 | je                  0x4d
            //   33c0                 | xor                 eax, eax
            //   66894606             | mov                 word ptr [esi + 6], ax
            //   a1????????           |                     
            //   85c0                 | test                eax, eax
            //   7522                 | jne                 0x24
            //   6a02                 | push                2

        $sequence_8 = { 83c4f8 53 56 57 51 52 }
            // n = 6, score = 500
            //   83c4f8               | add                 esp, -8
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   51                   | push                ecx
            //   52                   | push                edx

        $sequence_9 = { 8bc2 034508 5a 59 5f 5e 5b }
            // n = 7, score = 500
            //   8bc2                 | mov                 eax, edx
            //   034508               | add                 eax, dword ptr [ebp + 8]
            //   5a                   | pop                 edx
            //   59                   | pop                 ecx
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx

        $sequence_10 = { 7440 3b45fc 773b 8b750c 8b7d10 037508 8bde }
            // n = 7, score = 500
            //   7440                 | je                  0x42
            //   3b45fc               | cmp                 eax, dword ptr [ebp - 4]
            //   773b                 | ja                  0x3d
            //   8b750c               | mov                 esi, dword ptr [ebp + 0xc]
            //   8b7d10               | mov                 edi, dword ptr [ebp + 0x10]
            //   037508               | add                 esi, dword ptr [ebp + 8]
            //   8bde                 | mov                 ebx, esi

        $sequence_11 = { 7514 41 3b4df8 72ee 8bc2 034508 5a }
            // n = 7, score = 500
            //   7514                 | jne                 0x16
            //   41                   | inc                 ecx
            //   3b4df8               | cmp                 ecx, dword ptr [ebp - 8]
            //   72ee                 | jb                  0xfffffff0
            //   8bc2                 | mov                 eax, edx
            //   034508               | add                 eax, dword ptr [ebp + 8]
            //   5a                   | pop                 edx

        $sequence_12 = { ab 5b 5e eb03 }
            // n = 4, score = 500
            //   ab                   | stosd               dword ptr es:[edi], eax
            //   5b                   | pop                 ebx
            //   5e                   | pop                 esi
            //   eb03                 | jmp                 5

        $sequence_13 = { 5f 59 5b 5a c9 c20c00 55 }
            // n = 7, score = 500
            //   5f                   | pop                 edi
            //   59                   | pop                 ecx
            //   5b                   | pop                 ebx
            //   5a                   | pop                 edx
            //   c9                   | leave               
            //   c20c00               | ret                 0xc
            //   55                   | push                ebp

        $sequence_14 = { 33db 93 5b c9 c20800 }
            // n = 5, score = 500
            //   33db                 | xor                 ebx, ebx
            //   93                   | xchg                eax, ebx
            //   5b                   | pop                 ebx
            //   c9                   | leave               
            //   c20800               | ret                 8

        $sequence_15 = { 52 ff750c e8???????? 8945fc 0bc0 7454 }
            // n = 6, score = 500
            //   52                   | push                edx
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   e8????????           |                     
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   0bc0                 | or                  eax, eax
            //   7454                 | je                  0x56

    condition:
        7 of them and filesize < 262144
}