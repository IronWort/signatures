rule win_pitou_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.pitou."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.pitou"
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
        $sequence_0 = { c1e305 03c3 8bda c1eb02 03c3 33d0 }
            // n = 6, score = 700
            //   c1e305               | mov                 byte ptr [ebp - 4], dl
            //   03c3                 | mov                 byte ptr [esi + 0xa], dl
            //   8bda                 | mov                 dl, al
            //   c1eb02               | mov                 byte ptr [esi + 9], al
            //   03c3                 | and                 dl, 7
            //   33d0                 | shr                 dl, 6

        $sequence_1 = { ac 8bda c1e305 03c3 }
            // n = 4, score = 700
            //   ac                   | sbb                 bh, byte ptr [edi + 0x3e69f3af]
            //   8bda                 | pop                 es
            //   c1e305               | test                eax, 0x16129511
            //   03c3                 | stosd               dword ptr es:[edi], eax

        $sequence_2 = { 8bda c1e305 03c3 8bda c1eb02 }
            // n = 5, score = 700
            //   8bda                 | mov                 word ptr [edi + 0x3e], dx
            //   c1e305               | cmp                 eax, ecx
            //   03c3                 | jb                  0xffff7a6a
            //   8bda                 | mov                 ecx, dword ptr [edi + 0x64]
            //   c1eb02               | xor                 edx, edx

        $sequence_3 = { 8acc 80e103 8aec c0ed03 }
            // n = 4, score = 700
            //   8acc                 | add                 ebx, 2
            //   80e103               | cmp                 dl, 1
            //   8aec                 | ja                  0xaa1a
            //   c0ed03               | mov                 al, byte ptr [ebx + 8]

        $sequence_4 = { 80f457 8acc 80e103 8aec }
            // n = 4, score = 700
            //   80f457               | xor                 dword ptr [ebx], ecx
            //   8acc                 | add                 esp, dword ptr [ebx + 0x29c9df1e]
            //   80e103               | imul                eax, dword ptr [ebx], 0x5a3316da
            //   8aec                 | adc                 dword ptr [ebx], eax

        $sequence_5 = { 80e703 c0eb05 80e303 80ff00 }
            // n = 4, score = 700
            //   80e703               | imul                eax, dword ptr [esi], 0x3311da03
            //   c0eb05               | scasd               eax, dword ptr es:[edi]
            //   80e303               | push                edi
            //   80ff00               | imul                eax, dword ptr [ebx], 0x7662fa3

        $sequence_6 = { c1e305 03c3 8bda c1eb02 }
            // n = 4, score = 700
            //   c1e305               | mov                 eax, dword ptr [edi + 0xc]
            //   03c3                 | shr                 ecx, 8
            //   8bda                 | shl                 eax, 0x10
            //   c1eb02               | or                  ebx, eax

        $sequence_7 = { 8a6201 80f457 8acc 80e103 8aec c0ed03 80e507 }
            // n = 7, score = 700
            //   8a6201               | jne                 0xffff9679
            //   80f457               | jne                 0xffff9673
            //   8acc                 | mov                 dword ptr [esp + 0x20], ebx
            //   80e103               | dec                 eax
            //   8aec                 | mov                 ecx, dword ptr [ebp + 0x38]
            //   c0ed03               | cmp                 dword ptr [ebp + 0x28], esi
            //   80e507               | je                  0x260c

        $sequence_8 = { 8bda c1e305 03c3 8bda c1eb02 03c3 33d0 }
            // n = 7, score = 700
            //   8bda                 | jne                 0x9980
            //   c1e305               | mov                 cx, word ptr [esi]
            //   03c3                 | mov                 dx, word ptr [esi + 2]
            //   8bda                 | rol                 cx, 8
            //   c1eb02               | mov                 eax, ebx
            //   03c3                 | test                al, al
            //   33d0                 | jne                 0x9c

        $sequence_9 = { 03c3 8bda c1eb02 03c3 }
            // n = 4, score = 700
            //   03c3                 | sar                 eax, 3
            //   8bda                 | movzx               edx, ax
            //   c1eb02               | mov                 dword ptr [ebp - 0xc], 0x14
            //   03c3                 | add                 eax, edx

    condition:
        7 of them and filesize < 1106944
}