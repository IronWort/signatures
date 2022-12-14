rule win_breach_rat_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.breach_rat."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.breach_rat"
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
        $sequence_0 = { 777e 8d0476 c1e003 50 e8???????? 8bf8 }
            // n = 6, score = 200
            //   777e                 | ja                  0x80
            //   8d0476               | lea                 eax, dword ptr [esi + esi*2]
            //   c1e003               | shl                 eax, 3
            //   50                   | push                eax
            //   e8????????           |                     
            //   8bf8                 | mov                 edi, eax

        $sequence_1 = { ff15???????? 56 6a00 8bf8 ff15???????? 8bf0 ba0e000000 }
            // n = 7, score = 200
            //   ff15????????         |                     
            //   56                   | push                esi
            //   6a00                 | push                0
            //   8bf8                 | mov                 edi, eax
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   ba0e000000           | mov                 edx, 0xe

        $sequence_2 = { 88443124 eb34 80c980 884c3704 8b0c9df88c4400 8a443124 2482 }
            // n = 7, score = 200
            //   88443124             | mov                 byte ptr [ecx + esi + 0x24], al
            //   eb34                 | jmp                 0x36
            //   80c980               | or                  cl, 0x80
            //   884c3704             | mov                 byte ptr [edi + esi + 4], cl
            //   8b0c9df88c4400       | mov                 ecx, dword ptr [ebx*4 + 0x448cf8]
            //   8a443124             | mov                 al, byte ptr [ecx + esi + 0x24]
            //   2482                 | and                 al, 0x82

        $sequence_3 = { e8???????? c645fc00 83c404 8b4590 b301 }
            // n = 5, score = 200
            //   e8????????           |                     
            //   c645fc00             | mov                 byte ptr [ebp - 4], 0
            //   83c404               | add                 esp, 4
            //   8b4590               | mov                 eax, dword ptr [ebp - 0x70]
            //   b301                 | mov                 bl, 1

        $sequence_4 = { 50 64892500000000 83ec60 807d0800 7409 6a00 6a00 }
            // n = 7, score = 200
            //   50                   | push                eax
            //   64892500000000       | mov                 dword ptr fs:[0], esp
            //   83ec60               | sub                 esp, 0x60
            //   807d0800             | cmp                 byte ptr [ebp + 8], 0
            //   7409                 | je                  0xb
            //   6a00                 | push                0
            //   6a00                 | push                0

        $sequence_5 = { 68???????? 8d8db4f1ffff e8???????? 68???????? 8d85b4f1ffff c745fce6000000 50 }
            // n = 7, score = 200
            //   68????????           |                     
            //   8d8db4f1ffff         | lea                 ecx, dword ptr [ebp - 0xe4c]
            //   e8????????           |                     
            //   68????????           |                     
            //   8d85b4f1ffff         | lea                 eax, dword ptr [ebp - 0xe4c]
            //   c745fce6000000       | mov                 dword ptr [ebp - 4], 0xe6
            //   50                   | push                eax

        $sequence_6 = { e8???????? 68???????? 8d85ecfbffff c745fc5f000000 50 8bce e8???????? }
            // n = 7, score = 200
            //   e8????????           |                     
            //   68????????           |                     
            //   8d85ecfbffff         | lea                 eax, dword ptr [ebp - 0x414]
            //   c745fc5f000000       | mov                 dword ptr [ebp - 4], 0x5f
            //   50                   | push                eax
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     

        $sequence_7 = { e8???????? 68???????? 8d8584eeffff c745fcf7000000 50 8bce e8???????? }
            // n = 7, score = 200
            //   e8????????           |                     
            //   68????????           |                     
            //   8d8584eeffff         | lea                 eax, dword ptr [ebp - 0x117c]
            //   c745fcf7000000       | mov                 dword ptr [ebp - 4], 0xf7
            //   50                   | push                eax
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     

        $sequence_8 = { ff75ec e8???????? 8b5508 83c404 8b4de4 8b8680000000 52 }
            // n = 7, score = 200
            //   ff75ec               | push                dword ptr [ebp - 0x14]
            //   e8????????           |                     
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   83c404               | add                 esp, 4
            //   8b4de4               | mov                 ecx, dword ptr [ebp - 0x1c]
            //   8b8680000000         | mov                 eax, dword ptr [esi + 0x80]
            //   52                   | push                edx

        $sequence_9 = { 68???????? 8d854cedffff c745fc3e000000 50 8bce e8???????? 8bc8 }
            // n = 7, score = 200
            //   68????????           |                     
            //   8d854cedffff         | lea                 eax, dword ptr [ebp - 0x12b4]
            //   c745fc3e000000       | mov                 dword ptr [ebp - 4], 0x3e
            //   50                   | push                eax
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   8bc8                 | mov                 ecx, eax

    condition:
        7 of them and filesize < 645120
}