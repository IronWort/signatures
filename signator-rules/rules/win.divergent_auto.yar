rule win_divergent_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.divergent."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.divergent"
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
        $sequence_0 = { e8???????? 59 e8???????? 85c0 75f0 c3 }
            // n = 6, score = 300
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   75f0                 | jne                 0xfffffff2
            //   c3                   | ret                 

        $sequence_1 = { 68???????? 50 e8???????? 83c414 47 }
            // n = 5, score = 300
            //   68????????           |                     
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c414               | add                 esp, 0x14
            //   47                   | inc                 edi

        $sequence_2 = { ff15???????? 85c0 752f ff75fc ff15???????? ff7518 ff7514 }
            // n = 7, score = 300
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   752f                 | jne                 0x31
            //   ff75fc               | push                dword ptr [ebp - 4]
            //   ff15????????         |                     
            //   ff7518               | push                dword ptr [ebp + 0x18]
            //   ff7514               | push                dword ptr [ebp + 0x14]

        $sequence_3 = { 59 5b 85c0 7414 57 56 }
            // n = 6, score = 300
            //   59                   | pop                 ecx
            //   5b                   | pop                 ebx
            //   85c0                 | test                eax, eax
            //   7414                 | je                  0x16
            //   57                   | push                edi
            //   56                   | push                esi

        $sequence_4 = { 50 8945f0 e8???????? 8b750c 8bd8 68???????? 56 }
            // n = 7, score = 300
            //   50                   | push                eax
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   e8????????           |                     
            //   8b750c               | mov                 esi, dword ptr [ebp + 0xc]
            //   8bd8                 | mov                 ebx, eax
            //   68????????           |                     
            //   56                   | push                esi

        $sequence_5 = { c745f4656d3269 c745f865763169 e8???????? 33c0 83c41c 668945e0 }
            // n = 6, score = 300
            //   c745f4656d3269       | mov                 dword ptr [ebp - 0xc], 0x69326d65
            //   c745f865763169       | mov                 dword ptr [ebp - 8], 0x69317665
            //   e8????????           |                     
            //   33c0                 | xor                 eax, eax
            //   83c41c               | add                 esp, 0x1c
            //   668945e0             | mov                 word ptr [ebp - 0x20], ax

        $sequence_6 = { eb1d 6a05 ff36 68???????? e8???????? }
            // n = 5, score = 300
            //   eb1d                 | jmp                 0x1f
            //   6a05                 | push                5
            //   ff36                 | push                dword ptr [esi]
            //   68????????           |                     
            //   e8????????           |                     

        $sequence_7 = { 6a04 8d45f4 50 6a12 ff75f8 ff15???????? 85c0 }
            // n = 7, score = 300
            //   6a04                 | push                4
            //   8d45f4               | lea                 eax, dword ptr [ebp - 0xc]
            //   50                   | push                eax
            //   6a12                 | push                0x12
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_8 = { e8???????? 8bf8 57 e8???????? 59 8945e8 33f6 }
            // n = 7, score = 300
            //   e8????????           |                     
            //   8bf8                 | mov                 edi, eax
            //   57                   | push                edi
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   8945e8               | mov                 dword ptr [ebp - 0x18], eax
            //   33f6                 | xor                 esi, esi

        $sequence_9 = { 8be5 5d c3 55 8bec 64a118000000 57 }
            // n = 7, score = 300
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   64a118000000         | mov                 eax, dword ptr fs:[0x18]
            //   57                   | push                edi

    condition:
        7 of them and filesize < 212992
}