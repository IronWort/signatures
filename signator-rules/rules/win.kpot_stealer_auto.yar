rule win_kpot_stealer_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.kpot_stealer."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.kpot_stealer"
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
        $sequence_0 = { 83f92f 7414 83f95c 740a 83f962 7560 c60008 }
            // n = 7, score = 500
            //   83f92f               | cmp                 ecx, 0x2f
            //   7414                 | je                  0x16
            //   83f95c               | cmp                 ecx, 0x5c
            //   740a                 | je                  0xc
            //   83f962               | cmp                 ecx, 0x62
            //   7560                 | jne                 0x62
            //   c60008               | mov                 byte ptr [eax], 8

        $sequence_1 = { 83c710 314df8 ff4d0c 0f85f7feffff e9???????? 83c770 c7450c08000000 }
            // n = 7, score = 500
            //   83c710               | add                 edi, 0x10
            //   314df8               | xor                 dword ptr [ebp - 8], ecx
            //   ff4d0c               | dec                 dword ptr [ebp + 0xc]
            //   0f85f7feffff         | jne                 0xfffffefd
            //   e9????????           |                     
            //   83c770               | add                 edi, 0x70
            //   c7450c08000000       | mov                 dword ptr [ebp + 0xc], 8

        $sequence_2 = { 23c6 33d0 03c0 33c8 8bc2 c1e808 33c1 }
            // n = 7, score = 500
            //   23c6                 | and                 eax, esi
            //   33d0                 | xor                 edx, eax
            //   03c0                 | add                 eax, eax
            //   33c8                 | xor                 ecx, eax
            //   8bc2                 | mov                 eax, edx
            //   c1e808               | shr                 eax, 8
            //   33c1                 | xor                 eax, ecx

        $sequence_3 = { 8d4408d0 42 8a1a 8945fc 8ac3 e8???????? }
            // n = 6, score = 500
            //   8d4408d0             | lea                 eax, dword ptr [eax + ecx - 0x30]
            //   42                   | inc                 edx
            //   8a1a                 | mov                 bl, byte ptr [edx]
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8ac3                 | mov                 al, bl
            //   e8????????           |                     

        $sequence_4 = { 53 56 33db c645ff00 395d08 7e23 }
            // n = 6, score = 500
            //   53                   | push                ebx
            //   56                   | push                esi
            //   33db                 | xor                 ebx, ebx
            //   c645ff00             | mov                 byte ptr [ebp - 1], 0
            //   395d08               | cmp                 dword ptr [ebp + 8], ebx
            //   7e23                 | jle                 0x25

        $sequence_5 = { 8906 85c0 740e 8b5604 }
            // n = 4, score = 500
            //   8906                 | mov                 dword ptr [esi], eax
            //   85c0                 | test                eax, eax
            //   740e                 | je                  0x10
            //   8b5604               | mov                 edx, dword ptr [esi + 4]

        $sequence_6 = { 50 ff7510 8b4508 8bcf e8???????? 8bc7 }
            // n = 6, score = 500
            //   50                   | push                eax
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   8bcf                 | mov                 ecx, edi
            //   e8????????           |                     
            //   8bc7                 | mov                 eax, edi

        $sequence_7 = { 753b 8b45f4 8b08 8d55f8 52 }
            // n = 5, score = 500
            //   753b                 | jne                 0x3d
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   8d55f8               | lea                 edx, dword ptr [ebp - 8]
            //   52                   | push                edx

        $sequence_8 = { 250f0f0f0f 33d0 c1e004 33c8 8bc2 }
            // n = 5, score = 500
            //   250f0f0f0f           | and                 eax, 0xf0f0f0f
            //   33d0                 | xor                 edx, eax
            //   c1e004               | shl                 eax, 4
            //   33c8                 | xor                 ecx, eax
            //   8bc2                 | mov                 eax, edx

        $sequence_9 = { c1e108 ff7514 0bc1 0fb64f02 ff7510 c1e110 }
            // n = 6, score = 500
            //   c1e108               | shl                 ecx, 8
            //   ff7514               | push                dword ptr [ebp + 0x14]
            //   0bc1                 | or                  eax, ecx
            //   0fb64f02             | movzx               ecx, byte ptr [edi + 2]
            //   ff7510               | push                dword ptr [ebp + 0x10]
            //   c1e110               | shl                 ecx, 0x10

    condition:
        7 of them and filesize < 219136
}