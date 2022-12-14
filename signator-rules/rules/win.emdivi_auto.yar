rule win_emdivi_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.emdivi."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.emdivi"
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
        $sequence_0 = { 50 e8???????? 8b45ec 8b4de4 83c40c 83c308 8904b1 }
            // n = 7, score = 300
            //   50                   | push                eax
            //   e8????????           |                     
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   8b4de4               | mov                 ecx, dword ptr [ebp - 0x1c]
            //   83c40c               | add                 esp, 0xc
            //   83c308               | add                 ebx, 8
            //   8904b1               | mov                 dword ptr [ecx + esi*4], eax

        $sequence_1 = { 8945e8 8d44b9fc 8b18 4f 8945ec 895df4 }
            // n = 6, score = 300
            //   8945e8               | mov                 dword ptr [ebp - 0x18], eax
            //   8d44b9fc             | lea                 eax, dword ptr [ecx + edi*4 - 4]
            //   8b18                 | mov                 ebx, dword ptr [eax]
            //   4f                   | dec                 edi
            //   8945ec               | mov                 dword ptr [ebp - 0x14], eax
            //   895df4               | mov                 dword ptr [ebp - 0xc], ebx

        $sequence_2 = { 7476 53 53 53 53 53 e8???????? }
            // n = 7, score = 300
            //   7476                 | je                  0x78
            //   53                   | push                ebx
            //   53                   | push                ebx
            //   53                   | push                ebx
            //   53                   | push                ebx
            //   53                   | push                ebx
            //   e8????????           |                     

        $sequence_3 = { 8945f4 8b45e0 83c40c 40 8945f8 8b45dc 8945fc }
            // n = 7, score = 300
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   8b45e0               | mov                 eax, dword ptr [ebp - 0x20]
            //   83c40c               | add                 esp, 0xc
            //   40                   | inc                 eax
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   8b45dc               | mov                 eax, dword ptr [ebp - 0x24]
            //   8945fc               | mov                 dword ptr [ebp - 4], eax

        $sequence_4 = { 3345fc c1ef03 c1e304 83e203 }
            // n = 4, score = 300
            //   3345fc               | xor                 eax, dword ptr [ebp - 4]
            //   c1ef03               | shr                 edi, 3
            //   c1e304               | shl                 ebx, 4
            //   83e203               | and                 edx, 3

        $sequence_5 = { c9 c3 83c8ff ebf6 55 8bec 807d0880 }
            // n = 7, score = 300
            //   c9                   | leave               
            //   c3                   | ret                 
            //   83c8ff               | or                  eax, 0xffffffff
            //   ebf6                 | jmp                 0xfffffff8
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   807d0880             | cmp                 byte ptr [ebp + 8], 0x80

        $sequence_6 = { 8d45f0 68???????? 50 e8???????? 8b45ec 8b4de4 83c40c }
            // n = 7, score = 300
            //   8d45f0               | lea                 eax, dword ptr [ebp - 0x10]
            //   68????????           |                     
            //   50                   | push                eax
            //   e8????????           |                     
            //   8b45ec               | mov                 eax, dword ptr [ebp - 0x14]
            //   8b4de4               | mov                 ecx, dword ptr [ebp - 0x1c]
            //   83c40c               | add                 esp, 0xc

        $sequence_7 = { eb04 2bc8 03ca 880c32 42 3bd0 72e5 }
            // n = 7, score = 300
            //   eb04                 | jmp                 6
            //   2bc8                 | sub                 ecx, eax
            //   03ca                 | add                 ecx, edx
            //   880c32               | mov                 byte ptr [edx + esi], cl
            //   42                   | inc                 edx
            //   3bd0                 | cmp                 edx, eax
            //   72e5                 | jb                  0xffffffe7

        $sequence_8 = { 83c8ff 5d c3 33c9 8808 }
            // n = 5, score = 300
            //   83c8ff               | or                  eax, 0xffffffff
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   33c9                 | xor                 ecx, ecx
            //   8808                 | mov                 byte ptr [eax], cl

        $sequence_9 = { 881f 59 47 807df43d 59 742b }
            // n = 6, score = 300
            //   881f                 | mov                 byte ptr [edi], bl
            //   59                   | pop                 ecx
            //   47                   | inc                 edi
            //   807df43d             | cmp                 byte ptr [ebp - 0xc], 0x3d
            //   59                   | pop                 ecx
            //   742b                 | je                  0x2d

    condition:
        7 of them and filesize < 581632
}