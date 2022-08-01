rule win_unidentified_044_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.unidentified_044."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.unidentified_044"
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
        $sequence_0 = { fe05???????? a3???????? a0???????? 3ac3 7413 6aff 6a01 }
            // n = 7, score = 100
            //   fe05????????         |                     
            //   a3????????           |                     
            //   a0????????           |                     
            //   3ac3                 | cmp                 al, bl
            //   7413                 | je                  0x15
            //   6aff                 | push                -1
            //   6a01                 | push                1

        $sequence_1 = { 50 56 6a00 6a00 6816000048 57 ffd3 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   56                   | push                esi
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6816000048           | push                0x48000016
            //   57                   | push                edi
            //   ffd3                 | call                ebx

        $sequence_2 = { 8b0f 46 49 3bf1 728c 5d }
            // n = 6, score = 100
            //   8b0f                 | mov                 ecx, dword ptr [edi]
            //   46                   | inc                 esi
            //   49                   | dec                 ecx
            //   3bf1                 | cmp                 esi, ecx
            //   728c                 | jb                  0xffffff8e
            //   5d                   | pop                 ebp

        $sequence_3 = { 6a00 50 ffd6 b001 }
            // n = 4, score = 100
            //   6a00                 | push                0
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   b001                 | mov                 al, 1

        $sequence_4 = { 8b5704 50 895608 ff15???????? 8b4e10 8b15???????? 68c0d40100 }
            // n = 7, score = 100
            //   8b5704               | mov                 edx, dword ptr [edi + 4]
            //   50                   | push                eax
            //   895608               | mov                 dword ptr [esi + 8], edx
            //   ff15????????         |                     
            //   8b4e10               | mov                 ecx, dword ptr [esi + 0x10]
            //   8b15????????         |                     
            //   68c0d40100           | push                0x1d4c0

        $sequence_5 = { 0f843cffffff e8???????? 84c0 0f842fffffff 891d???????? e8???????? 5f }
            // n = 7, score = 100
            //   0f843cffffff         | je                  0xffffff42
            //   e8????????           |                     
            //   84c0                 | test                al, al
            //   0f842fffffff         | je                  0xffffff35
            //   891d????????         |                     
            //   e8????????           |                     
            //   5f                   | pop                 edi

        $sequence_6 = { 807c24125a 743e 8a4c2412 33c0 8d542418 52 }
            // n = 6, score = 100
            //   807c24125a           | cmp                 byte ptr [esp + 0x12], 0x5a
            //   743e                 | je                  0x40
            //   8a4c2412             | mov                 cl, byte ptr [esp + 0x12]
            //   33c0                 | xor                 eax, eax
            //   8d542418             | lea                 edx, dword ptr [esp + 0x18]
            //   52                   | push                edx

        $sequence_7 = { 3937 7407 8b7f0c 85ff 75f5 68???????? }
            // n = 6, score = 100
            //   3937                 | cmp                 dword ptr [edi], esi
            //   7407                 | je                  9
            //   8b7f0c               | mov                 edi, dword ptr [edi + 0xc]
            //   85ff                 | test                edi, edi
            //   75f5                 | jne                 0xfffffff7
            //   68????????           |                     

        $sequence_8 = { 8b442424 6a00 53 50 55 ffd7 3bc3 }
            // n = 7, score = 100
            //   8b442424             | mov                 eax, dword ptr [esp + 0x24]
            //   6a00                 | push                0
            //   53                   | push                ebx
            //   50                   | push                eax
            //   55                   | push                ebp
            //   ffd7                 | call                edi
            //   3bc3                 | cmp                 eax, ebx

        $sequence_9 = { 8a442407 3c05 7517 56 e8???????? 83c404 8ad8 }
            // n = 7, score = 100
            //   8a442407             | mov                 al, byte ptr [esp + 7]
            //   3c05                 | cmp                 al, 5
            //   7517                 | jne                 0x19
            //   56                   | push                esi
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   8ad8                 | mov                 bl, al

    condition:
        7 of them and filesize < 90112
}