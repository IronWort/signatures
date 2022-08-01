rule win_mailto_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.mailto."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.mailto"
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
        $sequence_0 = { 50 8d8424d8000000 50 e8???????? 6a48 8d842498000000 6a00 }
            // n = 7, score = 400
            //   50                   | push                eax
            //   8d8424d8000000       | lea                 eax, dword ptr [esp + 0xd8]
            //   50                   | push                eax
            //   e8????????           |                     
            //   6a48                 | push                0x48
            //   8d842498000000       | lea                 eax, dword ptr [esp + 0x98]
            //   6a00                 | push                0

        $sequence_1 = { ff7714 8b4030 ffd0 8b7c2428 83c418 ff442418 83c720 }
            // n = 7, score = 400
            //   ff7714               | push                dword ptr [edi + 0x14]
            //   8b4030               | mov                 eax, dword ptr [eax + 0x30]
            //   ffd0                 | call                eax
            //   8b7c2428             | mov                 edi, dword ptr [esp + 0x28]
            //   83c418               | add                 esp, 0x18
            //   ff442418             | inc                 dword ptr [esp + 0x18]
            //   83c720               | add                 edi, 0x20

        $sequence_2 = { f60710 741e ff742424 e8???????? 83c404 85c0 740e }
            // n = 7, score = 400
            //   f60710               | test                byte ptr [edi], 0x10
            //   741e                 | je                  0x20
            //   ff742424             | push                dword ptr [esp + 0x24]
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   85c0                 | test                eax, eax
            //   740e                 | je                  0x10

        $sequence_3 = { 85ff 7457 8b6c2428 85ed 744f 8b473c 03c7 }
            // n = 7, score = 400
            //   85ff                 | test                edi, edi
            //   7457                 | je                  0x59
            //   8b6c2428             | mov                 ebp, dword ptr [esp + 0x28]
            //   85ed                 | test                ebp, ebp
            //   744f                 | je                  0x51
            //   8b473c               | mov                 eax, dword ptr [edi + 0x3c]
            //   03c7                 | add                 eax, edi

        $sequence_4 = { 5e 5d 83c424 c3 5e 33c0 }
            // n = 6, score = 400
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp
            //   83c424               | add                 esp, 0x24
            //   c3                   | ret                 
            //   5e                   | pop                 esi
            //   33c0                 | xor                 eax, eax

        $sequence_5 = { 83780400 740a e8???????? 8b4044 eb08 }
            // n = 5, score = 400
            //   83780400             | cmp                 dword ptr [eax + 4], 0
            //   740a                 | je                  0xc
            //   e8????????           |                     
            //   8b4044               | mov                 eax, dword ptr [eax + 0x44]
            //   eb08                 | jmp                 0xa

        $sequence_6 = { e8???????? 6898000000 8d842414020000 6a00 50 e8???????? 8d8424e4030000 }
            // n = 7, score = 400
            //   e8????????           |                     
            //   6898000000           | push                0x98
            //   8d842414020000       | lea                 eax, dword ptr [esp + 0x214]
            //   6a00                 | push                0
            //   50                   | push                eax
            //   e8????????           |                     
            //   8d8424e4030000       | lea                 eax, dword ptr [esp + 0x3e4]

        $sequence_7 = { c1c60c 03c6 03ac2498000000 89442448 33c2 c1c008 89442440 }
            // n = 7, score = 400
            //   c1c60c               | rol                 esi, 0xc
            //   03c6                 | add                 eax, esi
            //   03ac2498000000       | add                 ebp, dword ptr [esp + 0x98]
            //   89442448             | mov                 dword ptr [esp + 0x48], eax
            //   33c2                 | xor                 eax, edx
            //   c1c008               | rol                 eax, 8
            //   89442440             | mov                 dword ptr [esp + 0x40], eax

        $sequence_8 = { 8d0413 3bc8 0f83bd000000 8d1c39 85db 74c3 a1???????? }
            // n = 7, score = 400
            //   8d0413               | lea                 eax, dword ptr [ebx + edx]
            //   3bc8                 | cmp                 ecx, eax
            //   0f83bd000000         | jae                 0xc3
            //   8d1c39               | lea                 ebx, dword ptr [ecx + edi]
            //   85db                 | test                ebx, ebx
            //   74c3                 | je                  0xffffffc5
            //   a1????????           |                     

        $sequence_9 = { 89542420 8bc1 895c2434 c1e010 23c8 8bc1 }
            // n = 6, score = 400
            //   89542420             | mov                 dword ptr [esp + 0x20], edx
            //   8bc1                 | mov                 eax, ecx
            //   895c2434             | mov                 dword ptr [esp + 0x34], ebx
            //   c1e010               | shl                 eax, 0x10
            //   23c8                 | and                 ecx, eax
            //   8bc1                 | mov                 eax, ecx

    condition:
        7 of them and filesize < 180224
}