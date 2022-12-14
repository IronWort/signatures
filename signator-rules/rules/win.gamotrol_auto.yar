rule win_gamotrol_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.gamotrol."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.gamotrol"
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
        $sequence_0 = { 885de3 c645e441 ff15???????? 8d4dd8 51 68???????? }
            // n = 6, score = 100
            //   885de3               | mov                 byte ptr [ebp - 0x1d], bl
            //   c645e441             | mov                 byte ptr [ebp - 0x1c], 0x41
            //   ff15????????         |                     
            //   8d4dd8               | lea                 ecx, dword ptr [ebp - 0x28]
            //   51                   | push                ecx
            //   68????????           |                     

        $sequence_1 = { 33c0 40 5e c3 e9???????? 6aff }
            // n = 6, score = 100
            //   33c0                 | xor                 eax, eax
            //   40                   | inc                 eax
            //   5e                   | pop                 esi
            //   c3                   | ret                 
            //   e9????????           |                     
            //   6aff                 | push                -1

        $sequence_2 = { 8ac2 2c20 3c58 7711 0fbec2 0fb68000ec2e00 }
            // n = 6, score = 100
            //   8ac2                 | mov                 al, dl
            //   2c20                 | sub                 al, 0x20
            //   3c58                 | cmp                 al, 0x58
            //   7711                 | ja                  0x13
            //   0fbec2               | movsx               eax, dl
            //   0fb68000ec2e00       | movzx               eax, byte ptr [eax + 0x2eec00]

        $sequence_3 = { 0fbe84c120ec2e00 6a07 c1f804 59 3bc1 89458c }
            // n = 6, score = 100
            //   0fbe84c120ec2e00     | movsx               eax, byte ptr [ecx + eax*8 + 0x2eec20]
            //   6a07                 | push                7
            //   c1f804               | sar                 eax, 4
            //   59                   | pop                 ecx
            //   3bc1                 | cmp                 eax, ecx
            //   89458c               | mov                 dword ptr [ebp - 0x74], eax

        $sequence_4 = { 8be5 90 5d 6803010000 }
            // n = 4, score = 100
            //   8be5                 | mov                 esp, ebp
            //   90                   | nop                 
            //   5d                   | pop                 ebp
            //   6803010000           | push                0x103

        $sequence_5 = { 8888c8502f00 40 ebe9 33c0 8945e4 3d00010000 7d10 }
            // n = 7, score = 100
            //   8888c8502f00         | mov                 byte ptr [eax + 0x2f50c8], cl
            //   40                   | inc                 eax
            //   ebe9                 | jmp                 0xffffffeb
            //   33c0                 | xor                 eax, eax
            //   8945e4               | mov                 dword ptr [ebp - 0x1c], eax
            //   3d00010000           | cmp                 eax, 0x100
            //   7d10                 | jge                 0x12

        $sequence_6 = { 5d 8bb53cfaffff 6a05 68???????? 8d8d4cfeffff 51 }
            // n = 6, score = 100
            //   5d                   | pop                 ebp
            //   8bb53cfaffff         | mov                 esi, dword ptr [ebp - 0x5c4]
            //   6a05                 | push                5
            //   68????????           |                     
            //   8d8d4cfeffff         | lea                 ecx, dword ptr [ebp - 0x1b4]
            //   51                   | push                ecx

        $sequence_7 = { 8b442404 33c9 3b04cd304a2f00 7412 }
            // n = 4, score = 100
            //   8b442404             | mov                 eax, dword ptr [esp + 4]
            //   33c9                 | xor                 ecx, ecx
            //   3b04cd304a2f00       | cmp                 eax, dword ptr [ecx*8 + 0x2f4a30]
            //   7412                 | je                  0x14

        $sequence_8 = { 5d 85c0 7709 33c0 5f 5e }
            // n = 6, score = 100
            //   5d                   | pop                 ebp
            //   85c0                 | test                eax, eax
            //   7709                 | ja                  0xb
            //   33c0                 | xor                 eax, eax
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_9 = { 90 8be5 5d 8b4de4 51 ffd0 90 }
            // n = 7, score = 100
            //   90                   | nop                 
            //   8be5                 | mov                 esp, ebp
            //   5d                   | pop                 ebp
            //   8b4de4               | mov                 ecx, dword ptr [ebp - 0x1c]
            //   51                   | push                ecx
            //   ffd0                 | call                eax
            //   90                   | nop                 

    condition:
        7 of them and filesize < 376832
}