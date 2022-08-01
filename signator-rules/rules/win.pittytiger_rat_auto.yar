rule win_pittytiger_rat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.pittytiger_rat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.pittytiger_rat"
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
        $sequence_0 = { 8dbdf1efffff 33f6 f3ab 66ab }
            // n = 4, score = 100
            //   8dbdf1efffff         | lea                 edi, dword ptr [ebp - 0x100f]
            //   33f6                 | xor                 esi, esi
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   66ab                 | stosw               word ptr es:[edi], ax

        $sequence_1 = { 50 ff750c ff7508 e8???????? 8b1b 83c430 }
            // n = 6, score = 100
            //   50                   | push                eax
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     
            //   8b1b                 | mov                 ebx, dword ptr [ebx]
            //   83c430               | add                 esp, 0x30

        $sequence_2 = { 8b5d0c e9???????? 55 8bec 83ec64 }
            // n = 5, score = 100
            //   8b5d0c               | mov                 ebx, dword ptr [ebp + 0xc]
            //   e9????????           |                     
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   83ec64               | sub                 esp, 0x64

        $sequence_3 = { be04010000 33ff 50 56 897dfc }
            // n = 5, score = 100
            //   be04010000           | mov                 esi, 0x104
            //   33ff                 | xor                 edi, edi
            //   50                   | push                eax
            //   56                   | push                esi
            //   897dfc               | mov                 dword ptr [ebp - 4], edi

        $sequence_4 = { f3ab 66ab be00010000 aa 56 8d85d0fdffff }
            // n = 6, score = 100
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax
            //   66ab                 | stosw               word ptr es:[edi], ax
            //   be00010000           | mov                 esi, 0x100
            //   aa                   | stosb               byte ptr es:[edi], al
            //   56                   | push                esi
            //   8d85d0fdffff         | lea                 eax, dword ptr [ebp - 0x230]

        $sequence_5 = { ffd6 68???????? 8bf8 ff75f8 ffd6 3bfb 8945f0 }
            // n = 7, score = 100
            //   ffd6                 | call                esi
            //   68????????           |                     
            //   8bf8                 | mov                 edi, eax
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   ffd6                 | call                esi
            //   3bfb                 | cmp                 edi, ebx
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax

        $sequence_6 = { ff75ec ff15???????? 3bc3 894514 0f840a010000 53 68???????? }
            // n = 7, score = 100
            //   ff75ec               | push                dword ptr [ebp - 0x14]
            //   ff15????????         |                     
            //   3bc3                 | cmp                 eax, ebx
            //   894514               | mov                 dword ptr [ebp + 0x14], eax
            //   0f840a010000         | je                  0x110
            //   53                   | push                ebx
            //   68????????           |                     

        $sequence_7 = { 3bc3 a3???????? 74d1 8d459c c745a46c654145 }
            // n = 5, score = 100
            //   3bc3                 | cmp                 eax, ebx
            //   a3????????           |                     
            //   74d1                 | je                  0xffffffd3
            //   8d459c               | lea                 eax, dword ptr [ebp - 0x64]
            //   c745a46c654145       | mov                 dword ptr [ebp - 0x5c], 0x4541656c

        $sequence_8 = { 83f8ff 8945fc 7504 33c0 eb30 6a02 }
            // n = 6, score = 100
            //   83f8ff               | cmp                 eax, -1
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   7504                 | jne                 6
            //   33c0                 | xor                 eax, eax
            //   eb30                 | jmp                 0x32
            //   6a02                 | push                2

        $sequence_9 = { 53 56 57 33db 68???????? 895df4 ff15???????? }
            // n = 7, score = 100
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   33db                 | xor                 ebx, ebx
            //   68????????           |                     
            //   895df4               | mov                 dword ptr [ebp - 0xc], ebx
            //   ff15????????         |                     

    condition:
        7 of them and filesize < 2162688
}