rule win_virdetdoor_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.virdetdoor."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.virdetdoor"
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
        $sequence_0 = { 8bdf 8d45f8 8bce 50 8d55fc e8???????? 59 }
            // n = 7, score = 100
            //   8bdf                 | mov                 ebx, edi
            //   8d45f8               | lea                 eax, dword ptr [ebp - 8]
            //   8bce                 | mov                 ecx, esi
            //   50                   | push                eax
            //   8d55fc               | lea                 edx, dword ptr [ebp - 4]
            //   e8????????           |                     
            //   59                   | pop                 ecx

        $sequence_1 = { 8b441004 894308 33c0 894b0c eb79 837d1000 57 }
            // n = 7, score = 100
            //   8b441004             | mov                 eax, dword ptr [eax + edx + 4]
            //   894308               | mov                 dword ptr [ebx + 8], eax
            //   33c0                 | xor                 eax, eax
            //   894b0c               | mov                 dword ptr [ebx + 0xc], ecx
            //   eb79                 | jmp                 0x7b
            //   837d1000             | cmp                 dword ptr [ebp + 0x10], 0
            //   57                   | push                edi

        $sequence_2 = { 740c ff31 c6410400 ff15???????? c3 56 57 }
            // n = 7, score = 100
            //   740c                 | je                  0xe
            //   ff31                 | push                dword ptr [ecx]
            //   c6410400             | mov                 byte ptr [ecx + 4], 0
            //   ff15????????         |                     
            //   c3                   | ret                 
            //   56                   | push                esi
            //   57                   | push                edi

        $sequence_3 = { 83e801 0f850f020000 8b4d08 c6410105 }
            // n = 4, score = 100
            //   83e801               | sub                 eax, 1
            //   0f850f020000         | jne                 0x215
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   c6410105             | mov                 byte ptr [ecx + 1], 5

        $sequence_4 = { 6a20 8983a8020000 8d8300020000 6a00 50 ff15???????? 8b4df4 }
            // n = 7, score = 100
            //   6a20                 | push                0x20
            //   8983a8020000         | mov                 dword ptr [ebx + 0x2a8], eax
            //   8d8300020000         | lea                 eax, dword ptr [ebx + 0x200]
            //   6a00                 | push                0
            //   50                   | push                eax
            //   ff15????????         |                     
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]

        $sequence_5 = { ff25???????? ff25???????? ff25???????? ff25???????? c3 55 8bec }
            // n = 7, score = 100
            //   ff25????????         |                     
            //   ff25????????         |                     
            //   ff25????????         |                     
            //   ff25????????         |                     
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp

        $sequence_6 = { ff7508 50 e8???????? 83c40c 0f57c0 660f1345f8 8b7dfc }
            // n = 7, score = 100
            //   ff7508               | push                dword ptr [ebp + 8]
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   0f57c0               | xorps               xmm0, xmm0
            //   660f1345f8           | movlpd              qword ptr [ebp - 8], xmm0
            //   8b7dfc               | mov                 edi, dword ptr [ebp - 4]

        $sequence_7 = { 8bd9 894df4 8bd1 894df0 894dec 894de8 85ff }
            // n = 7, score = 100
            //   8bd9                 | mov                 ebx, ecx
            //   894df4               | mov                 dword ptr [ebp - 0xc], ecx
            //   8bd1                 | mov                 edx, ecx
            //   894df0               | mov                 dword ptr [ebp - 0x10], ecx
            //   894dec               | mov                 dword ptr [ebp - 0x14], ecx
            //   894de8               | mov                 dword ptr [ebp - 0x18], ecx
            //   85ff                 | test                edi, edi

        $sequence_8 = { 50 ff7718 ff15???????? 8bf0 }
            // n = 4, score = 100
            //   50                   | push                eax
            //   ff7718               | push                dword ptr [edi + 0x18]
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax

        $sequence_9 = { e8???????? 59 59 c7460401000000 8d8e80020000 }
            // n = 5, score = 100
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   c7460401000000       | mov                 dword ptr [esi + 4], 1
            //   8d8e80020000         | lea                 ecx, dword ptr [esi + 0x280]

    condition:
        7 of them and filesize < 106496
}