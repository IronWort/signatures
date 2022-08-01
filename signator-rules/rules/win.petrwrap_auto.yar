rule win_petrwrap_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.petrwrap."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.petrwrap"
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
        $sequence_0 = { 237c2424 f7d2 23542414 33f9 33d0 8b44244c 03ef }
            // n = 7, score = 100
            //   237c2424             | and                 edi, dword ptr [esp + 0x24]
            //   f7d2                 | not                 edx
            //   23542414             | and                 edx, dword ptr [esp + 0x14]
            //   33f9                 | xor                 edi, ecx
            //   33d0                 | xor                 edx, eax
            //   8b44244c             | mov                 eax, dword ptr [esp + 0x4c]
            //   03ef                 | add                 ebp, edi

        $sequence_1 = { 896c2454 e8???????? 8b5c2468 8b7c246c 8b742470 89442430 6a07 }
            // n = 7, score = 100
            //   896c2454             | mov                 dword ptr [esp + 0x54], ebp
            //   e8????????           |                     
            //   8b5c2468             | mov                 ebx, dword ptr [esp + 0x68]
            //   8b7c246c             | mov                 edi, dword ptr [esp + 0x6c]
            //   8b742470             | mov                 esi, dword ptr [esp + 0x70]
            //   89442430             | mov                 dword ptr [esp + 0x30], eax
            //   6a07                 | push                7

        $sequence_2 = { 317c2440 8b44247c 23442454 33f2 33442474 8b542440 }
            // n = 6, score = 100
            //   317c2440             | xor                 dword ptr [esp + 0x40], edi
            //   8b44247c             | mov                 eax, dword ptr [esp + 0x7c]
            //   23442454             | and                 eax, dword ptr [esp + 0x54]
            //   33f2                 | xor                 esi, edx
            //   33442474             | xor                 eax, dword ptr [esp + 0x74]
            //   8b542440             | mov                 edx, dword ptr [esp + 0x40]

        $sequence_3 = { 56 57 8b7c2428 33ed 8d5501 396f04 }
            // n = 6, score = 100
            //   56                   | push                esi
            //   57                   | push                edi
            //   8b7c2428             | mov                 edi, dword ptr [esp + 0x28]
            //   33ed                 | xor                 ebp, ebp
            //   8d5501               | lea                 edx, dword ptr [ebp + 1]
            //   396f04               | cmp                 dword ptr [edi + 4], ebp

        $sequence_4 = { 0facc80e 0bd0 8b442454 c1e90e 0bf9 8b4c2430 234c2440 }
            // n = 7, score = 100
            //   0facc80e             | shrd                eax, ecx, 0xe
            //   0bd0                 | or                  edx, eax
            //   8b442454             | mov                 eax, dword ptr [esp + 0x54]
            //   c1e90e               | shr                 ecx, 0xe
            //   0bf9                 | or                  edi, ecx
            //   8b4c2430             | mov                 ecx, dword ptr [esp + 0x30]
            //   234c2440             | and                 ecx, dword ptr [esp + 0x40]

        $sequence_5 = { 741d 57 51 ff742428 ff742428 ff742428 ff742428 }
            // n = 7, score = 100
            //   741d                 | je                  0x1f
            //   57                   | push                edi
            //   51                   | push                ecx
            //   ff742428             | push                dword ptr [esp + 0x28]
            //   ff742428             | push                dword ptr [esp + 0x28]
            //   ff742428             | push                dword ptr [esp + 0x28]
            //   ff742428             | push                dword ptr [esp + 0x28]

        $sequence_6 = { 8bca 8b54240c 56 8902 8b4504 f723 57 }
            // n = 7, score = 100
            //   8bca                 | mov                 ecx, edx
            //   8b54240c             | mov                 edx, dword ptr [esp + 0xc]
            //   56                   | push                esi
            //   8902                 | mov                 dword ptr [edx], eax
            //   8b4504               | mov                 eax, dword ptr [ebp + 4]
            //   f723                 | mul                 dword ptr [ebx]
            //   57                   | push                edi

        $sequence_7 = { 394304 7fef 8b5304 3bd6 7f2b 8b442438 }
            // n = 6, score = 100
            //   394304               | cmp                 dword ptr [ebx + 4], eax
            //   7fef                 | jg                  0xfffffff1
            //   8b5304               | mov                 edx, dword ptr [ebx + 4]
            //   3bd6                 | cmp                 edx, esi
            //   7f2b                 | jg                  0x2d
            //   8b442438             | mov                 eax, dword ptr [esp + 0x38]

        $sequence_8 = { 5e 33c0 5d c3 8b4e74 3b4e78 }
            // n = 6, score = 100
            //   5e                   | pop                 esi
            //   33c0                 | xor                 eax, eax
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   8b4e74               | mov                 ecx, dword ptr [esi + 0x74]
            //   3b4e78               | cmp                 ecx, dword ptr [esi + 0x78]

        $sequence_9 = { 50 50 8b8180000000 56 ffd0 83c414 85c0 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   50                   | push                eax
            //   8b8180000000         | mov                 eax, dword ptr [ecx + 0x80]
            //   56                   | push                esi
            //   ffd0                 | call                eax
            //   83c414               | add                 esp, 0x14
            //   85c0                 | test                eax, eax

    condition:
        7 of them and filesize < 1024000
}