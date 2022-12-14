rule win_linseningsvr_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.linseningsvr."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.linseningsvr"
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
        $sequence_0 = { 84d2 7425 0fb6d2 f682818c400004 }
            // n = 4, score = 100
            //   84d2                 | test                dl, dl
            //   7425                 | je                  0x27
            //   0fb6d2               | movzx               edx, dl
            //   f682818c400004       | test                byte ptr [edx + 0x408c81], 4

        $sequence_1 = { 81c4cc0d0000 c3 ff15???????? 5f 5e }
            // n = 5, score = 100
            //   81c4cc0d0000         | add                 esp, 0xdcc
            //   c3                   | ret                 
            //   ff15????????         |                     
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_2 = { 8dbc24dc090000 c1e902 f3a5 8bc8 33c0 }
            // n = 5, score = 100
            //   8dbc24dc090000       | lea                 edi, dword ptr [esp + 0x9dc]
            //   c1e902               | shr                 ecx, 2
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   8bc8                 | mov                 ecx, eax
            //   33c0                 | xor                 eax, eax

        $sequence_3 = { 89442419 885c2418 8944241d 89442421 6689442425 88442427 }
            // n = 6, score = 100
            //   89442419             | mov                 dword ptr [esp + 0x19], eax
            //   885c2418             | mov                 byte ptr [esp + 0x18], bl
            //   8944241d             | mov                 dword ptr [esp + 0x1d], eax
            //   89442421             | mov                 dword ptr [esp + 0x21], eax
            //   6689442425           | mov                 word ptr [esp + 0x25], ax
            //   88442427             | mov                 byte ptr [esp + 0x27], al

        $sequence_4 = { 7425 0fb6d2 f682818c400004 740c ff01 85f6 }
            // n = 6, score = 100
            //   7425                 | je                  0x27
            //   0fb6d2               | movzx               edx, dl
            //   f682818c400004       | test                byte ptr [edx + 0x408c81], 4
            //   740c                 | je                  0xe
            //   ff01                 | inc                 dword ptr [ecx]
            //   85f6                 | test                esi, esi

        $sequence_5 = { 83c40c c3 53 56 be???????? 57 }
            // n = 6, score = 100
            //   83c40c               | add                 esp, 0xc
            //   c3                   | ret                 
            //   53                   | push                ebx
            //   56                   | push                esi
            //   be????????           |                     
            //   57                   | push                edi

        $sequence_6 = { 83e61f 8b0485c08d4000 8b04f0 83f8ff 7404 }
            // n = 5, score = 100
            //   83e61f               | and                 esi, 0x1f
            //   8b0485c08d4000       | mov                 eax, dword ptr [eax*4 + 0x408dc0]
            //   8b04f0               | mov                 eax, dword ptr [eax + esi*8]
            //   83f8ff               | cmp                 eax, -1
            //   7404                 | je                  6

        $sequence_7 = { 8088????????20 8a9405ecfcffff ebe3 80a0808b400000 40 41 41 }
            // n = 7, score = 100
            //   8088????????20       |                     
            //   8a9405ecfcffff       | mov                 dl, byte ptr [ebp + eax - 0x314]
            //   ebe3                 | jmp                 0xffffffe5
            //   80a0808b400000       | and                 byte ptr [eax + 0x408b80], 0
            //   40                   | inc                 eax
            //   41                   | inc                 ecx
            //   41                   | inc                 ecx

        $sequence_8 = { 56 66895c2448 6689442456 ff15???????? 8bd8 83fbff 74bc }
            // n = 7, score = 100
            //   56                   | push                esi
            //   66895c2448           | mov                 word ptr [esp + 0x48], bx
            //   6689442456           | mov                 word ptr [esp + 0x56], ax
            //   ff15????????         |                     
            //   8bd8                 | mov                 ebx, eax
            //   83fbff               | cmp                 ebx, -1
            //   74bc                 | je                  0xffffffbe

        $sequence_9 = { 50 53 ffd5 85c0 0f84fe010000 83f8ff 0f84f5010000 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   53                   | push                ebx
            //   ffd5                 | call                ebp
            //   85c0                 | test                eax, eax
            //   0f84fe010000         | je                  0x204
            //   83f8ff               | cmp                 eax, -1
            //   0f84f5010000         | je                  0x1fb

    condition:
        7 of them and filesize < 81360
}