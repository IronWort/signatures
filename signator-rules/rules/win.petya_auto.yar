rule win_petya_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.petya."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.petya"
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
        $sequence_0 = { ff7618 8d957cfeffff 8bca e8???????? }
            // n = 4, score = 600
            //   ff7618               | push                dword ptr [esi + 0x18]
            //   8d957cfeffff         | lea                 edx, dword ptr [ebp - 0x184]
            //   8bca                 | mov                 ecx, edx
            //   e8????????           |                     

        $sequence_1 = { 83c303 c1eb02 57 33ff 3b750c }
            // n = 5, score = 600
            //   83c303               | add                 ebx, 3
            //   c1eb02               | shr                 ebx, 2
            //   57                   | push                edi
            //   33ff                 | xor                 edi, edi
            //   3b750c               | cmp                 esi, dword ptr [ebp + 0xc]

        $sequence_2 = { 57 33ff 3b750c 0f47d9 85db 7410 8b06 }
            // n = 7, score = 600
            //   57                   | push                edi
            //   33ff                 | xor                 edi, edi
            //   3b750c               | cmp                 esi, dword ptr [ebp + 0xc]
            //   0f47d9               | cmova               ebx, ecx
            //   85db                 | test                ebx, ebx
            //   7410                 | je                  0x12
            //   8b06                 | mov                 eax, dword ptr [esi]

        $sequence_3 = { 33ff 8d0486 8bd8 2bde 83c303 c1eb02 }
            // n = 6, score = 600
            //   33ff                 | xor                 edi, edi
            //   8d0486               | lea                 eax, dword ptr [esi + eax*4]
            //   8bd8                 | mov                 ebx, eax
            //   2bde                 | sub                 ebx, esi
            //   83c303               | add                 ebx, 3
            //   c1eb02               | shr                 ebx, 2

        $sequence_4 = { 0f42f2 6a04 56 e8???????? 8bd8 }
            // n = 5, score = 600
            //   0f42f2               | cmovb               esi, edx
            //   6a04                 | push                4
            //   56                   | push                esi
            //   e8????????           |                     
            //   8bd8                 | mov                 ebx, eax

        $sequence_5 = { 33c9 56 8b7508 2bde }
            // n = 4, score = 600
            //   33c9                 | xor                 ecx, ecx
            //   56                   | push                esi
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   2bde                 | sub                 ebx, esi

        $sequence_6 = { 53 33db 8b4e74 03cb e8???????? 47 83c324 }
            // n = 7, score = 600
            //   53                   | push                ebx
            //   33db                 | xor                 ebx, ebx
            //   8b4e74               | mov                 ecx, dword ptr [esi + 0x74]
            //   03cb                 | add                 ecx, ebx
            //   e8????????           |                     
            //   47                   | inc                 edi
            //   83c324               | add                 ebx, 0x24

        $sequence_7 = { 0fa4df03 c1e818 884c242c 8bc6 }
            // n = 4, score = 600
            //   0fa4df03             | shld                edi, ebx, 3
            //   c1e818               | shr                 eax, 0x18
            //   884c242c             | mov                 byte ptr [esp + 0x2c], cl
            //   8bc6                 | mov                 eax, esi

        $sequence_8 = { 0facc118 0fa4df03 c1e818 884c242c }
            // n = 4, score = 600
            //   0facc118             | shrd                ecx, eax, 0x18
            //   0fa4df03             | shld                edi, ebx, 3
            //   c1e818               | shr                 eax, 0x18
            //   884c242c             | mov                 byte ptr [esp + 0x2c], cl

        $sequence_9 = { c1eb09 0bd8 8b44241c 8bf0 0facc812 c1e60e c1e912 }
            // n = 7, score = 600
            //   c1eb09               | shr                 ebx, 9
            //   0bd8                 | or                  ebx, eax
            //   8b44241c             | mov                 eax, dword ptr [esp + 0x1c]
            //   8bf0                 | mov                 esi, eax
            //   0facc812             | shrd                eax, ecx, 0x12
            //   c1e60e               | shl                 esi, 0xe
            //   c1e912               | shr                 ecx, 0x12

    condition:
        7 of them and filesize < 229376
}