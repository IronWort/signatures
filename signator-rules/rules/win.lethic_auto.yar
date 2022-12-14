rule win_lethic_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.lethic."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.lethic"
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
        $sequence_0 = { ebec 8b55fc 8b45f4 8b08 890a 8b55fc 8b02 }
            // n = 7, score = 1200
            //   ebec                 | jmp                 0xffffffee
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   890a                 | mov                 dword ptr [edx], ecx
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   8b02                 | mov                 eax, dword ptr [edx]

        $sequence_1 = { 894df8 8b55fc 3b55f8 7411 8b45fc c60000 8b4dfc }
            // n = 7, score = 1200
            //   894df8               | mov                 dword ptr [ebp - 8], ecx
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   3b55f8               | cmp                 edx, dword ptr [ebp - 8]
            //   7411                 | je                  0x13
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   c60000               | mov                 byte ptr [eax], 0
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]

        $sequence_2 = { 33c0 e9???????? 8b55f4 8b4218 50 }
            // n = 5, score = 1200
            //   33c0                 | xor                 eax, eax
            //   e9????????           |                     
            //   8b55f4               | mov                 edx, dword ptr [ebp - 0xc]
            //   8b4218               | mov                 eax, dword ptr [edx + 0x18]
            //   50                   | push                eax

        $sequence_3 = { 8bec 83ec0c 8b4508 8945f4 6838100000 }
            // n = 5, score = 1200
            //   8bec                 | mov                 ebp, esp
            //   83ec0c               | sub                 esp, 0xc
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   6838100000           | push                0x1038

        $sequence_4 = { 8b45fc 8b08 894dfc ebec 8b55fc 8b45f4 }
            // n = 6, score = 1200
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   894dfc               | mov                 dword ptr [ebp - 4], ecx
            //   ebec                 | jmp                 0xffffffee
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]

        $sequence_5 = { 8b45f4 8b08 890a 8b55fc }
            // n = 4, score = 1200
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   890a                 | mov                 dword ptr [edx], ecx
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]

        $sequence_6 = { 894804 8b55fc c7823410000001000000 6a10 8b450c 50 }
            // n = 6, score = 1200
            //   894804               | mov                 dword ptr [eax + 4], ecx
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   c7823410000001000000     | mov    dword ptr [edx + 0x1034], 1
            //   6a10                 | push                0x10
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   50                   | push                eax

        $sequence_7 = { ffd1 83f8ff 7513 8b55fc }
            // n = 4, score = 1200
            //   ffd1                 | call                ecx
            //   83f8ff               | cmp                 eax, -1
            //   7513                 | jne                 0x15
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]

        $sequence_8 = { 8b55fc 3b55f8 7411 8b45fc c60000 8b4dfc }
            // n = 6, score = 1200
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   3b55f8               | cmp                 edx, dword ptr [ebp - 8]
            //   7411                 | je                  0x13
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   c60000               | mov                 byte ptr [eax], 0
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]

        $sequence_9 = { 8b11 3b55f4 740a 8b45fc 8b08 894dfc }
            // n = 6, score = 1200
            //   8b11                 | mov                 edx, dword ptr [ecx]
            //   3b55f4               | cmp                 edx, dword ptr [ebp - 0xc]
            //   740a                 | je                  0xc
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   894dfc               | mov                 dword ptr [ebp - 4], ecx

    condition:
        7 of them and filesize < 81920
}