rule win_evilpony_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.evilpony."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.evilpony"
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
        $sequence_0 = { 8d4ffc 8d4304 51 50 8d85f0feffff }
            // n = 5, score = 200
            //   8d4ffc               | lea                 ecx, dword ptr [edi - 4]
            //   8d4304               | lea                 eax, dword ptr [ebx + 4]
            //   51                   | push                ecx
            //   50                   | push                eax
            //   8d85f0feffff         | lea                 eax, dword ptr [ebp - 0x110]

        $sequence_1 = { 85d2 740d ff7508 e8???????? 59 8bf0 eb02 }
            // n = 7, score = 200
            //   85d2                 | test                edx, edx
            //   740d                 | je                  0xf
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   8bf0                 | mov                 esi, eax
            //   eb02                 | jmp                 4

        $sequence_2 = { 85f6 744c 8d85e8feffff 50 ffb5f0feffff ff15???????? 85c0 }
            // n = 7, score = 200
            //   85f6                 | test                esi, esi
            //   744c                 | je                  0x4e
            //   8d85e8feffff         | lea                 eax, dword ptr [ebp - 0x118]
            //   50                   | push                eax
            //   ffb5f0feffff         | push                dword ptr [ebp - 0x110]
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_3 = { 57 56 e8???????? 50 ff7508 }
            // n = 5, score = 200
            //   57                   | push                edi
            //   56                   | push                esi
            //   e8????????           |                     
            //   50                   | push                eax
            //   ff7508               | push                dword ptr [ebp + 8]

        $sequence_4 = { e8???????? 83c40c ff750c 6a23 ff7508 e8???????? }
            // n = 6, score = 200
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   6a23                 | push                0x23
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     

        $sequence_5 = { 8b7dc0 8bd7 c1ca08 23d1 c1c708 23f8 0bd7 }
            // n = 7, score = 200
            //   8b7dc0               | mov                 edi, dword ptr [ebp - 0x40]
            //   8bd7                 | mov                 edx, edi
            //   c1ca08               | ror                 edx, 8
            //   23d1                 | and                 edx, ecx
            //   c1c708               | rol                 edi, 8
            //   23f8                 | and                 edi, eax
            //   0bd7                 | or                  edx, edi

        $sequence_6 = { 57 ff15???????? 33db 3bc3 7507 33c0 e9???????? }
            // n = 7, score = 200
            //   57                   | push                edi
            //   ff15????????         |                     
            //   33db                 | xor                 ebx, ebx
            //   3bc3                 | cmp                 eax, ebx
            //   7507                 | jne                 9
            //   33c0                 | xor                 eax, eax
            //   e9????????           |                     

        $sequence_7 = { c1e108 33c1 c1c010 eb02 33c0 5f c9 }
            // n = 7, score = 200
            //   c1e108               | shl                 ecx, 8
            //   33c1                 | xor                 eax, ecx
            //   c1c010               | rol                 eax, 0x10
            //   eb02                 | jmp                 4
            //   33c0                 | xor                 eax, eax
            //   5f                   | pop                 edi
            //   c9                   | leave               

        $sequence_8 = { 8d85fcfbffff 50 ffd7 85c0 75ba 56 }
            // n = 6, score = 200
            //   8d85fcfbffff         | lea                 eax, dword ptr [ebp - 0x404]
            //   50                   | push                eax
            //   ffd7                 | call                edi
            //   85c0                 | test                eax, eax
            //   75ba                 | jne                 0xffffffbc
            //   56                   | push                esi

        $sequence_9 = { e8???????? 59 393e 0f84ad000000 837c241c0d 740b }
            // n = 6, score = 200
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   393e                 | cmp                 dword ptr [esi], edi
            //   0f84ad000000         | je                  0xb3
            //   837c241c0d           | cmp                 dword ptr [esp + 0x1c], 0xd
            //   740b                 | je                  0xd

    condition:
        7 of them and filesize < 147456
}