rule win_lodeinfo_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.lodeinfo."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.lodeinfo"
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
        $sequence_0 = { 8b460c 85c0 740f 8b55fc 51 53 }
            // n = 6, score = 200
            //   8b460c               | mov                 eax, dword ptr [esi + 0xc]
            //   85c0                 | test                eax, eax
            //   740f                 | je                  0x11
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   51                   | push                ecx
            //   53                   | push                ebx

        $sequence_1 = { c7837001000000000000 e9???????? ba???????? 8bcf e8???????? 84c0 0f8481000000 }
            // n = 7, score = 200
            //   c7837001000000000000     | mov    dword ptr [ebx + 0x170], 0
            //   e9????????           |                     
            //   ba????????           |                     
            //   8bcf                 | mov                 ecx, edi
            //   e8????????           |                     
            //   84c0                 | test                al, al
            //   0f8481000000         | je                  0x87

        $sequence_2 = { 8d0c40 8b4510 8d1448 8a02 8a4a01 8845fe 884d1b }
            // n = 7, score = 200
            //   8d0c40               | lea                 ecx, dword ptr [eax + eax*2]
            //   8b4510               | mov                 eax, dword ptr [ebp + 0x10]
            //   8d1448               | lea                 edx, dword ptr [eax + ecx*2]
            //   8a02                 | mov                 al, byte ptr [edx]
            //   8a4a01               | mov                 cl, byte ptr [edx + 1]
            //   8845fe               | mov                 byte ptr [ebp - 2], al
            //   884d1b               | mov                 byte ptr [ebp + 0x1b], cl

        $sequence_3 = { ff75bc e8???????? 83c404 ff75c0 e8???????? 83c404 ff75f4 }
            // n = 7, score = 200
            //   ff75bc               | push                dword ptr [ebp - 0x44]
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   ff75c0               | push                dword ptr [ebp - 0x40]
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   ff75f4               | push                dword ptr [ebp - 0xc]

        $sequence_4 = { 57 8955d4 894dd8 8b560c }
            // n = 4, score = 200
            //   57                   | push                edi
            //   8955d4               | mov                 dword ptr [ebp - 0x2c], edx
            //   894dd8               | mov                 dword ptr [ebp - 0x28], ecx
            //   8b560c               | mov                 edx, dword ptr [esi + 0xc]

        $sequence_5 = { 8855f3 99 33c2 0fb6f9 2bc2 884df2 0fb7c0 }
            // n = 7, score = 200
            //   8855f3               | mov                 byte ptr [ebp - 0xd], dl
            //   99                   | cdq                 
            //   33c2                 | xor                 eax, edx
            //   0fb6f9               | movzx               edi, cl
            //   2bc2                 | sub                 eax, edx
            //   884df2               | mov                 byte ptr [ebp - 0xe], cl
            //   0fb7c0               | movzx               eax, ax

        $sequence_6 = { e8???????? 83c404 ba???????? ff7674 51 b9???????? e8???????? }
            // n = 7, score = 200
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   ba????????           |                     
            //   ff7674               | push                dword ptr [esi + 0x74]
            //   51                   | push                ecx
            //   b9????????           |                     
            //   e8????????           |                     

        $sequence_7 = { 03c8 0fb64606 c1e108 03c8 0fb64607 c1e108 }
            // n = 6, score = 200
            //   03c8                 | add                 ecx, eax
            //   0fb64606             | movzx               eax, byte ptr [esi + 6]
            //   c1e108               | shl                 ecx, 8
            //   03c8                 | add                 ecx, eax
            //   0fb64607             | movzx               eax, byte ptr [esi + 7]
            //   c1e108               | shl                 ecx, 8

        $sequence_8 = { 8b4e48 8945fc 8d0c8d04000000 51 ff7650 e8???????? 8b4e48 }
            // n = 7, score = 200
            //   8b4e48               | mov                 ecx, dword ptr [esi + 0x48]
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8d0c8d04000000       | lea                 ecx, dword ptr [ecx*4 + 4]
            //   51                   | push                ecx
            //   ff7650               | push                dword ptr [esi + 0x50]
            //   e8????????           |                     
            //   8b4e48               | mov                 ecx, dword ptr [esi + 0x48]

        $sequence_9 = { 33f6 85ff 740e 0f1f00 803c3000 7405 }
            // n = 6, score = 200
            //   33f6                 | xor                 esi, esi
            //   85ff                 | test                edi, edi
            //   740e                 | je                  0x10
            //   0f1f00               | nop                 dword ptr [eax]
            //   803c3000             | cmp                 byte ptr [eax + esi], 0
            //   7405                 | je                  7

    condition:
        7 of them and filesize < 712704
}