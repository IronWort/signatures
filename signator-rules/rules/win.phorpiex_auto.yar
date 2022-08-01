rule win_phorpiex_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.phorpiex."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.phorpiex"
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
        $sequence_0 = { ff15???????? 85c0 740f 6a07 }
            // n = 4, score = 1100
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   740f                 | je                  0x11
            //   6a07                 | push                7

        $sequence_1 = { 6a00 ff15???????? ff15???????? 50 e8???????? }
            // n = 5, score = 1100
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   ff15????????         |                     
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_2 = { ff15???????? 85c0 741f 6880000000 }
            // n = 4, score = 1000
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   741f                 | je                  0x21
            //   6880000000           | push                0x80

        $sequence_3 = { 6a20 6a00 6a00 6a00 8b5508 52 6a00 }
            // n = 7, score = 900
            //   6a20                 | push                0x20
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   8b5508               | mov                 edx, dword ptr [ebp + 8]
            //   52                   | push                edx
            //   6a00                 | push                0

        $sequence_4 = { e8???????? 99 b930750000 f7f9 }
            // n = 4, score = 900
            //   e8????????           |                     
            //   99                   | cdq                 
            //   b930750000           | mov                 ecx, 0x7530
            //   f7f9                 | idiv                ecx

        $sequence_5 = { e8???????? 83c410 6a00 6a02 6a02 }
            // n = 5, score = 900
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   6a00                 | push                0
            //   6a02                 | push                2
            //   6a02                 | push                2

        $sequence_6 = { 52 ff15???????? 6a00 6a00 6a00 6a00 68???????? }
            // n = 7, score = 800
            //   52                   | push                edx
            //   ff15????????         |                     
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   68????????           |                     

        $sequence_7 = { e8???????? 99 b90d000000 f7f9 }
            // n = 4, score = 800
            //   e8????????           |                     
            //   99                   | cdq                 
            //   b90d000000           | mov                 ecx, 0xd
            //   f7f9                 | idiv                ecx

        $sequence_8 = { e8???????? 83c404 e8???????? e8???????? ff15???????? 6a00 }
            // n = 6, score = 800
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   e8????????           |                     
            //   e8????????           |                     
            //   ff15????????         |                     
            //   6a00                 | push                0

        $sequence_9 = { 6a01 ff15???????? ff15???????? b001 }
            // n = 4, score = 700
            //   6a01                 | push                1
            //   ff15????????         |                     
            //   ff15????????         |                     
            //   b001                 | mov                 al, 1

        $sequence_10 = { ff15???????? 85c0 7522 6a00 }
            // n = 4, score = 700
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7522                 | jne                 0x24
            //   6a00                 | push                0

        $sequence_11 = { 52 683f000f00 6a00 68???????? 6802000080 ff15???????? 85c0 }
            // n = 7, score = 700
            //   52                   | push                edx
            //   683f000f00           | push                0xf003f
            //   6a00                 | push                0
            //   68????????           |                     
            //   6802000080           | push                0x80000002
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_12 = { 6a00 6a00 6a00 6a08 68???????? 6a00 68???????? }
            // n = 7, score = 700
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a08                 | push                8
            //   68????????           |                     
            //   6a00                 | push                0
            //   68????????           |                     

        $sequence_13 = { 6a00 682a800000 6a00 ff15???????? }
            // n = 4, score = 700
            //   6a00                 | push                0
            //   682a800000           | push                0x802a
            //   6a00                 | push                0
            //   ff15????????         |                     

        $sequence_14 = { 68???????? ff15???????? 8d85f8fdffff 50 68???????? }
            // n = 5, score = 700
            //   68????????           |                     
            //   ff15????????         |                     
            //   8d85f8fdffff         | lea                 eax, dword ptr [ebp - 0x208]
            //   50                   | push                eax
            //   68????????           |                     

        $sequence_15 = { ff15???????? 6a00 ff15???????? 85c0 7418 ff15???????? }
            // n = 6, score = 700
            //   ff15????????         |                     
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7418                 | je                  0x1a
            //   ff15????????         |                     

        $sequence_16 = { 837dfc19 7206 837dfc2d 7607 }
            // n = 4, score = 600
            //   837dfc19             | cmp                 dword ptr [ebp - 4], 0x19
            //   7206                 | jb                  8
            //   837dfc2d             | cmp                 dword ptr [ebp - 4], 0x2d
            //   7607                 | jbe                 9

        $sequence_17 = { 81c210270000 52 e8???????? 99 }
            // n = 4, score = 600
            //   81c210270000         | add                 edx, 0x2710
            //   52                   | push                edx
            //   e8????????           |                     
            //   99                   | cdq                 

        $sequence_18 = { 6a21 50 e8???????? c60000 }
            // n = 4, score = 500
            //   6a21                 | push                0x21
            //   50                   | push                eax
            //   e8????????           |                     
            //   c60000               | mov                 byte ptr [eax], 0

        $sequence_19 = { 7504 83c8ff c3 8b542404 }
            // n = 4, score = 500
            //   7504                 | jne                 6
            //   83c8ff               | or                  eax, 0xffffffff
            //   c3                   | ret                 
            //   8b542404             | mov                 edx, dword ptr [esp + 4]

        $sequence_20 = { ff15???????? 3db7000000 7508 6a00 ff15???????? 6804010000 }
            // n = 6, score = 500
            //   ff15????????         |                     
            //   3db7000000           | cmp                 eax, 0xb7
            //   7508                 | jne                 0xa
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   6804010000           | push                0x104

        $sequence_21 = { 50 e8???????? 59 59 85c0 7573 }
            // n = 6, score = 500
            //   50                   | push                eax
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   85c0                 | test                eax, eax
            //   7573                 | jne                 0x75

        $sequence_22 = { 84c9 75de eb0a 85ff 740e 803e00 7401 }
            // n = 7, score = 400
            //   84c9                 | test                cl, cl
            //   75de                 | jne                 0xffffffe0
            //   eb0a                 | jmp                 0xc
            //   85ff                 | test                edi, edi
            //   740e                 | je                  0x10
            //   803e00               | cmp                 byte ptr [esi], 0
            //   7401                 | je                  3

        $sequence_23 = { e8???????? 83c40c e8???????? 99 b960ea0000 }
            // n = 5, score = 400
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   e8????????           |                     
            //   99                   | cdq                 
            //   b960ea0000           | mov                 ecx, 0xea60

        $sequence_24 = { 8d7301 7503 5e 5b c3 8a0e 80f930 }
            // n = 7, score = 400
            //   8d7301               | lea                 esi, dword ptr [ebx + 1]
            //   7503                 | jne                 5
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   c3                   | ret                 
            //   8a0e                 | mov                 cl, byte ptr [esi]
            //   80f930               | cmp                 cl, 0x30

        $sequence_25 = { 50 e8???????? 83c410 e8???????? 99 }
            // n = 5, score = 400
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   e8????????           |                     
            //   99                   | cdq                 

        $sequence_26 = { 40 84c9 75f9 2bc2 50 8d54242c }
            // n = 6, score = 400
            //   40                   | inc                 eax
            //   84c9                 | test                cl, cl
            //   75f9                 | jne                 0xfffffffb
            //   2bc2                 | sub                 eax, edx
            //   50                   | push                eax
            //   8d54242c             | lea                 edx, dword ptr [esp + 0x2c]

        $sequence_27 = { 57 68e8030000 ff15???????? e8???????? be???????? }
            // n = 5, score = 300
            //   57                   | push                edi
            //   68e8030000           | push                0x3e8
            //   ff15????????         |                     
            //   e8????????           |                     
            //   be????????           |                     

        $sequence_28 = { 50 8d45ec 50 6805000020 }
            // n = 4, score = 300
            //   50                   | push                eax
            //   8d45ec               | lea                 eax, dword ptr [ebp - 0x14]
            //   50                   | push                eax
            //   6805000020           | push                0x20000005

        $sequence_29 = { 40 41 663bc2 72f7 53 33c0 }
            // n = 6, score = 300
            //   40                   | inc                 eax
            //   41                   | inc                 ecx
            //   663bc2               | cmp                 ax, dx
            //   72f7                 | jb                  0xfffffff9
            //   53                   | push                ebx
            //   33c0                 | xor                 eax, eax

    condition:
        7 of them and filesize < 2490368
}