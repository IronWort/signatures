rule win_collectorgoomba_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.collectorgoomba."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.collectorgoomba"
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
        $sequence_0 = { e9???????? c745ec05000000 e9???????? 6a14 58 6bc0ff 8b4dfc }
            // n = 7, score = 200
            //   e9????????           |                     
            //   c745ec05000000       | mov                 dword ptr [ebp - 0x14], 5
            //   e9????????           |                     
            //   6a14                 | push                0x14
            //   58                   | pop                 eax
            //   6bc0ff               | imul                eax, eax, -1
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]

        $sequence_1 = { 8b4508 8b8048010000 8945f8 8b4508 8b4d0c 8b8948010000 898848010000 }
            // n = 7, score = 200
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8b8048010000         | mov                 eax, dword ptr [eax + 0x148]
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8b4d0c               | mov                 ecx, dword ptr [ebp + 0xc]
            //   8b8948010000         | mov                 ecx, dword ptr [ecx + 0x148]
            //   898848010000         | mov                 dword ptr [eax + 0x148], ecx

        $sequence_2 = { ff7004 ff15???????? 8945fc 837dfc00 741a 837df800 7614 }
            // n = 7, score = 200
            //   ff7004               | push                dword ptr [eax + 4]
            //   ff15????????         |                     
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   837dfc00             | cmp                 dword ptr [ebp - 4], 0
            //   741a                 | je                  0x1c
            //   837df800             | cmp                 dword ptr [ebp - 8], 0
            //   7614                 | jbe                 0x16

        $sequence_3 = { 8bec 83ec10 8b4508 8b400c 83e010 7509 c745f401000000 }
            // n = 7, score = 200
            //   8bec                 | mov                 ebp, esp
            //   83ec10               | sub                 esp, 0x10
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8b400c               | mov                 eax, dword ptr [eax + 0xc]
            //   83e010               | and                 eax, 0x10
            //   7509                 | jne                 0xb
            //   c745f401000000       | mov                 dword ptr [ebp - 0xc], 1

        $sequence_4 = { 8b45f8 8b4020 3b45fc 750c 8b45f8 8b4dfc 8b4920 }
            // n = 7, score = 200
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   8b4020               | mov                 eax, dword ptr [eax + 0x20]
            //   3b45fc               | cmp                 eax, dword ptr [ebp - 4]
            //   750c                 | jne                 0xe
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   8b4920               | mov                 ecx, dword ptr [ecx + 0x20]

        $sequence_5 = { ff75f0 e8???????? 59 8945d8 837de410 7246 8b45fc }
            // n = 7, score = 200
            //   ff75f0               | push                dword ptr [ebp - 0x10]
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   8945d8               | mov                 dword ptr [ebp - 0x28], eax
            //   837de410             | cmp                 dword ptr [ebp - 0x1c], 0x10
            //   7246                 | jb                  0x48
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]

        $sequence_6 = { c645fc5a 8d8d80f5ffff e8???????? c645fc54 8d8d68f5ffff e8???????? c705????????0a02090e }
            // n = 7, score = 200
            //   c645fc5a             | mov                 byte ptr [ebp - 4], 0x5a
            //   8d8d80f5ffff         | lea                 ecx, dword ptr [ebp - 0xa80]
            //   e8????????           |                     
            //   c645fc54             | mov                 byte ptr [ebp - 4], 0x54
            //   8d8d68f5ffff         | lea                 ecx, dword ptr [ebp - 0xa98]
            //   e8????????           |                     
            //   c705????????0a02090e     |     

        $sequence_7 = { 8b4de4 8b0488 8945a0 f20f2a45a0 8b45a0 c1e81f f20f5804c5b03d4900 }
            // n = 7, score = 200
            //   8b4de4               | mov                 ecx, dword ptr [ebp - 0x1c]
            //   8b0488               | mov                 eax, dword ptr [eax + ecx*4]
            //   8945a0               | mov                 dword ptr [ebp - 0x60], eax
            //   f20f2a45a0           | cvtsi2sd            xmm0, dword ptr [ebp - 0x60]
            //   8b45a0               | mov                 eax, dword ptr [ebp - 0x60]
            //   c1e81f               | shr                 eax, 0x1f
            //   f20f5804c5b03d4900     | addsd    xmm0, qword ptr [eax*8 + 0x493db0]

        $sequence_8 = { ff75f4 e8???????? 83c414 e9???????? 837de000 7511 837dc800 }
            // n = 7, score = 200
            //   ff75f4               | push                dword ptr [ebp - 0xc]
            //   e8????????           |                     
            //   83c414               | add                 esp, 0x14
            //   e9????????           |                     
            //   837de000             | cmp                 dword ptr [ebp - 0x20], 0
            //   7511                 | jne                 0x13
            //   837dc800             | cmp                 dword ptr [ebp - 0x38], 0

        $sequence_9 = { eb07 8b45fc 40 8945fc 837dfc2f 730b 8b45f8 }
            // n = 7, score = 200
            //   eb07                 | jmp                 9
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   40                   | inc                 eax
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   837dfc2f             | cmp                 dword ptr [ebp - 4], 0x2f
            //   730b                 | jae                 0xd
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]

    condition:
        7 of them and filesize < 1400832
}