rule win_excalibur_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.excalibur."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.excalibur"
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
        $sequence_0 = { c70201000000 5f 33c0 85c9 5e }
            // n = 5, score = 100
            //   c70201000000         | mov                 dword ptr [edx], 1
            //   5f                   | pop                 edi
            //   33c0                 | xor                 eax, eax
            //   85c9                 | test                ecx, ecx
            //   5e                   | pop                 esi

        $sequence_1 = { 83c414 8bcf 8d5102 668b01 83c102 6685c0 }
            // n = 6, score = 100
            //   83c414               | add                 esp, 0x14
            //   8bcf                 | mov                 ecx, edi
            //   8d5102               | lea                 edx, dword ptr [ecx + 2]
            //   668b01               | mov                 ax, word ptr [ecx]
            //   83c102               | add                 ecx, 2
            //   6685c0               | test                ax, ax

        $sequence_2 = { ffd0 8b4d18 83c408 8901 85c0 74be 8b4df4 }
            // n = 7, score = 100
            //   ffd0                 | call                eax
            //   8b4d18               | mov                 ecx, dword ptr [ebp + 0x18]
            //   83c408               | add                 esp, 8
            //   8901                 | mov                 dword ptr [ecx], eax
            //   85c0                 | test                eax, eax
            //   74be                 | je                  0xffffffc0
            //   8b4df4               | mov                 ecx, dword ptr [ebp - 0xc]

        $sequence_3 = { 6685c0 75f5 2bcf 8b7df4 d1f9 51 52 }
            // n = 7, score = 100
            //   6685c0               | test                ax, ax
            //   75f5                 | jne                 0xfffffff7
            //   2bcf                 | sub                 ecx, edi
            //   8b7df4               | mov                 edi, dword ptr [ebp - 0xc]
            //   d1f9                 | sar                 ecx, 1
            //   51                   | push                ecx
            //   52                   | push                edx

        $sequence_4 = { 8bec a1???????? 85c0 0f842cfefeff ff7508 48 a3???????? }
            // n = 7, score = 100
            //   8bec                 | mov                 ebp, esp
            //   a1????????           |                     
            //   85c0                 | test                eax, eax
            //   0f842cfefeff         | je                  0xfffefe32
            //   ff7508               | push                dword ptr [ebp + 8]
            //   48                   | dec                 eax
            //   a3????????           |                     

        $sequence_5 = { c1e810 25ff000000 83c304 33948700040000 0fb6c1 c1e918 }
            // n = 6, score = 100
            //   c1e810               | shr                 eax, 0x10
            //   25ff000000           | and                 eax, 0xff
            //   83c304               | add                 ebx, 4
            //   33948700040000       | xor                 edx, dword ptr [edi + eax*4 + 0x400]
            //   0fb6c1               | movzx               eax, cl
            //   c1e918               | shr                 ecx, 0x18

        $sequence_6 = { b802000000 5b 5d c3 5f 5e b810000000 }
            // n = 7, score = 100
            //   b802000000           | mov                 eax, 2
            //   5b                   | pop                 ebx
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   b810000000           | mov                 eax, 0x10

        $sequence_7 = { 8b450c eb03 8b45f8 ff750c 2b03 83ec08 c1f802 }
            // n = 7, score = 100
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   eb03                 | jmp                 5
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   2b03                 | sub                 eax, dword ptr [ebx]
            //   83ec08               | sub                 esp, 8
            //   c1f802               | sar                 eax, 2

        $sequence_8 = { 8945c4 c745a800000000 c745ac00000000 c745b800000000 c745c000000000 e8???????? 85c0 }
            // n = 7, score = 100
            //   8945c4               | mov                 dword ptr [ebp - 0x3c], eax
            //   c745a800000000       | mov                 dword ptr [ebp - 0x58], 0
            //   c745ac00000000       | mov                 dword ptr [ebp - 0x54], 0
            //   c745b800000000       | mov                 dword ptr [ebp - 0x48], 0
            //   c745c000000000       | mov                 dword ptr [ebp - 0x40], 0
            //   e8????????           |                     
            //   85c0                 | test                eax, eax

        $sequence_9 = { 397e18 761e 33db 8d4900 8b4e0c 8b55fc 03cb }
            // n = 7, score = 100
            //   397e18               | cmp                 dword ptr [esi + 0x18], edi
            //   761e                 | jbe                 0x20
            //   33db                 | xor                 ebx, ebx
            //   8d4900               | lea                 ecx, dword ptr [ecx]
            //   8b4e0c               | mov                 ecx, dword ptr [esi + 0xc]
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   03cb                 | add                 ecx, ebx

    condition:
        7 of them and filesize < 1253376
}