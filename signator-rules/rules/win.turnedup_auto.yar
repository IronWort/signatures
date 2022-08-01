rule win_turnedup_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.turnedup."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.turnedup"
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
        $sequence_0 = { 884605 eb06 c70600000000 c6460401 807e0530 7556 }
            // n = 6, score = 400
            //   884605               | mov                 byte ptr [esi + 5], al
            //   eb06                 | jmp                 8
            //   c70600000000         | mov                 dword ptr [esi], 0
            //   c6460401             | mov                 byte ptr [esi + 4], 1
            //   807e0530             | cmp                 byte ptr [esi + 5], 0x30
            //   7556                 | jne                 0x58

        $sequence_1 = { 7418 8b35???????? 85f6 740e a3???????? e8???????? b001 }
            // n = 7, score = 400
            //   7418                 | je                  0x1a
            //   8b35????????         |                     
            //   85f6                 | test                esi, esi
            //   740e                 | je                  0x10
            //   a3????????           |                     
            //   e8????????           |                     
            //   b001                 | mov                 al, 1

        $sequence_2 = { 8b4608 57 8b7e0c 037e10 }
            // n = 4, score = 400
            //   8b4608               | mov                 eax, dword ptr [esi + 8]
            //   57                   | push                edi
            //   8b7e0c               | mov                 edi, dword ptr [esi + 0xc]
            //   037e10               | add                 edi, dword ptr [esi + 0x10]

        $sequence_3 = { 83c404 837ddc10 8b45c8 7303 8d45c8 8b55a8 50 }
            // n = 7, score = 400
            //   83c404               | add                 esp, 4
            //   837ddc10             | cmp                 dword ptr [ebp - 0x24], 0x10
            //   8b45c8               | mov                 eax, dword ptr [ebp - 0x38]
            //   7303                 | jae                 5
            //   8d45c8               | lea                 eax, dword ptr [ebp - 0x38]
            //   8b55a8               | mov                 edx, dword ptr [ebp - 0x58]
            //   50                   | push                eax

        $sequence_4 = { 894dbc 43 8b0e c645c301 85c9 7433 8b5120 }
            // n = 7, score = 400
            //   894dbc               | mov                 dword ptr [ebp - 0x44], ecx
            //   43                   | inc                 ebx
            //   8b0e                 | mov                 ecx, dword ptr [esi]
            //   c645c301             | mov                 byte ptr [ebp - 0x3d], 1
            //   85c9                 | test                ecx, ecx
            //   7433                 | je                  0x35
            //   8b5120               | mov                 edx, dword ptr [ecx + 0x20]

        $sequence_5 = { 75f9 2bc2 50 8d5598 52 8bce e8???????? }
            // n = 7, score = 400
            //   75f9                 | jne                 0xfffffffb
            //   2bc2                 | sub                 eax, edx
            //   50                   | push                eax
            //   8d5598               | lea                 edx, dword ptr [ebp - 0x68]
            //   52                   | push                edx
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     

        $sequence_6 = { 7405 884305 eb06 c70300000000 c6430401 8a4b05 884dbb }
            // n = 7, score = 400
            //   7405                 | je                  7
            //   884305               | mov                 byte ptr [ebx + 5], al
            //   eb06                 | jmp                 8
            //   c70300000000         | mov                 dword ptr [ebx], 0
            //   c6430401             | mov                 byte ptr [ebx + 4], 1
            //   8a4b05               | mov                 cl, byte ptr [ebx + 5]
            //   884dbb               | mov                 byte ptr [ebp - 0x45], cl

        $sequence_7 = { 46 8945bc 8975b0 8b55f4 8b45e0 }
            // n = 5, score = 400
            //   46                   | inc                 esi
            //   8945bc               | mov                 dword ptr [ebp - 0x44], eax
            //   8975b0               | mov                 dword ptr [ebp - 0x50], esi
            //   8b55f4               | mov                 edx, dword ptr [ebp - 0xc]
            //   8b45e0               | mov                 eax, dword ptr [ebp - 0x20]

        $sequence_8 = { e8???????? 8b4704 83f8ff 7304 40 894704 8d4c242c }
            // n = 7, score = 400
            //   e8????????           |                     
            //   8b4704               | mov                 eax, dword ptr [edi + 4]
            //   83f8ff               | cmp                 eax, -1
            //   7304                 | jae                 6
            //   40                   | inc                 eax
            //   894704               | mov                 dword ptr [edi + 4], eax
            //   8d4c242c             | lea                 ecx, dword ptr [esp + 0x2c]

        $sequence_9 = { 55 8bec 8b4610 83ec10 }
            // n = 4, score = 400
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   8b4610               | mov                 eax, dword ptr [esi + 0x10]
            //   83ec10               | sub                 esp, 0x10

    condition:
        7 of them and filesize < 892928
}