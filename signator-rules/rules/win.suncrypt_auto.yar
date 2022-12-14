rule win_suncrypt_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.suncrypt."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.suncrypt"
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
        $sequence_0 = { 56 57 ff15???????? 8bd8 bf41000000 0f1f8000000000 6683ff41 }
            // n = 7, score = 200
            //   56                   | push                esi
            //   57                   | push                edi
            //   ff15????????         |                     
            //   8bd8                 | mov                 ebx, eax
            //   bf41000000           | mov                 edi, 0x41
            //   0f1f8000000000       | nop                 dword ptr [eax]
            //   6683ff41             | cmp                 di, 0x41

        $sequence_1 = { 83f076 8845e9 8b45e0 0406 c645eb00 83f065 33d2 }
            // n = 7, score = 200
            //   83f076               | xor                 eax, 0x76
            //   8845e9               | mov                 byte ptr [ebp - 0x17], al
            //   8b45e0               | mov                 eax, dword ptr [ebp - 0x20]
            //   0406                 | add                 al, 6
            //   c645eb00             | mov                 byte ptr [ebp - 0x15], 0
            //   83f065               | xor                 eax, 0x65
            //   33d2                 | xor                 edx, edx

        $sequence_2 = { 83f901 7605 8bc6 5e 5d c3 33c0 }
            // n = 7, score = 200
            //   83f901               | cmp                 ecx, 1
            //   7605                 | jbe                 7
            //   8bc6                 | mov                 eax, esi
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   33c0                 | xor                 eax, eax

        $sequence_3 = { 8b5df8 83c420 8945f8 8b45f4 8945e4 8b45f0 }
            // n = 6, score = 200
            //   8b5df8               | mov                 ebx, dword ptr [ebp - 8]
            //   83c420               | add                 esp, 0x20
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   8945e4               | mov                 dword ptr [ebp - 0x1c], eax
            //   8b45f0               | mov                 eax, dword ptr [ebp - 0x10]

        $sequence_4 = { 894dc8 8b4df4 660f1f440000 83f840 7321 8b45c8 }
            // n = 6, score = 200
            //   894dc8               | mov                 dword ptr [ebp - 0x38], ecx
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]
            //   660f1f440000         | nop                 word ptr [eax + eax]
            //   83f840               | cmp                 eax, 0x40
            //   7321                 | jae                 0x23
            //   8b45c8               | mov                 eax, dword ptr [ebp - 0x38]

        $sequence_5 = { 0f1185a8feffff 0f1045a8 0f1185b8feffff e8???????? 8d8568ffffff }
            // n = 5, score = 200
            //   0f1185a8feffff       | movups              xmmword ptr [ebp - 0x158], xmm0
            //   0f1045a8             | movups              xmm0, xmmword ptr [ebp - 0x58]
            //   0f1185b8feffff       | movups              xmmword ptr [ebp - 0x148], xmm0
            //   e8????????           |                     
            //   8d8568ffffff         | lea                 eax, dword ptr [ebp - 0x98]

        $sequence_6 = { 8b4308 13f2 f76b40 03c8 8b4508 13f2 0fa4ce01 }
            // n = 7, score = 200
            //   8b4308               | mov                 eax, dword ptr [ebx + 8]
            //   13f2                 | adc                 esi, edx
            //   f76b40               | imul                dword ptr [ebx + 0x40]
            //   03c8                 | add                 ecx, eax
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   13f2                 | adc                 esi, edx
            //   0fa4ce01             | shld                esi, ecx, 1

        $sequence_7 = { 83f061 8845f0 8b45e8 0405 83f06d 8845f1 }
            // n = 6, score = 200
            //   83f061               | xor                 eax, 0x61
            //   8845f0               | mov                 byte ptr [ebp - 0x10], al
            //   8b45e8               | mov                 eax, dword ptr [ebp - 0x18]
            //   0405                 | add                 al, 5
            //   83f06d               | xor                 eax, 0x6d
            //   8845f1               | mov                 byte ptr [ebp - 0xf], al

        $sequence_8 = { 33c1 c1c008 8945ac 89856cffffff 8d0c02 8bc7 }
            // n = 6, score = 200
            //   33c1                 | xor                 eax, ecx
            //   c1c008               | rol                 eax, 8
            //   8945ac               | mov                 dword ptr [ebp - 0x54], eax
            //   89856cffffff         | mov                 dword ptr [ebp - 0x94], eax
            //   8d0c02               | lea                 ecx, dword ptr [edx + eax]
            //   8bc7                 | mov                 eax, edi

        $sequence_9 = { c685edfeffff2a 8a856cfeffff c685eefeffff00 0f1f840000000000 8a84156cfeffff 0fbe8d68feffff 0fbec0 }
            // n = 7, score = 200
            //   c685edfeffff2a       | mov                 byte ptr [ebp - 0x113], 0x2a
            //   8a856cfeffff         | mov                 al, byte ptr [ebp - 0x194]
            //   c685eefeffff00       | mov                 byte ptr [ebp - 0x112], 0
            //   0f1f840000000000     | nop                 dword ptr [eax + eax]
            //   8a84156cfeffff       | mov                 al, byte ptr [ebp + edx - 0x194]
            //   0fbe8d68feffff       | movsx               ecx, byte ptr [ebp - 0x198]
            //   0fbec0               | movsx               eax, al

    condition:
        7 of them and filesize < 172032
}