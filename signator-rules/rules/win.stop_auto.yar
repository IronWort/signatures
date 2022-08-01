rule win_stop_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.stop."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.stop"
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
        $sequence_0 = { 6a00 ff15???????? 33c9 894604 }
            // n = 4, score = 400
            //   6a00                 | push                0
            //   ff15????????         |                     
            //   33c9                 | xor                 ecx, ecx
            //   894604               | mov                 dword ptr [esi + 4], eax

        $sequence_1 = { ff750c ff7508 ffd0 5d c3 8b0d???????? }
            // n = 6, score = 400
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   ff7508               | push                dword ptr [ebp + 8]
            //   ffd0                 | call                eax
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   8b0d????????         |                     

        $sequence_2 = { 85c0 75e8 6a0a ff7304 }
            // n = 4, score = 400
            //   85c0                 | test                eax, eax
            //   75e8                 | jne                 0xffffffea
            //   6a0a                 | push                0xa
            //   ff7304               | push                dword ptr [ebx + 4]

        $sequence_3 = { ffd0 5d c3 8b0d???????? 33d2 }
            // n = 5, score = 400
            //   ffd0                 | call                eax
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   8b0d????????         |                     
            //   33d2                 | xor                 edx, edx

        $sequence_4 = { ffd0 5d c3 8b0d???????? }
            // n = 4, score = 400
            //   ffd0                 | call                eax
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   8b0d????????         |                     

        $sequence_5 = { 85c0 75e8 6a0a ff7304 ff15???????? 3d02010000 74c4 }
            // n = 7, score = 400
            //   85c0                 | test                eax, eax
            //   75e8                 | jne                 0xffffffea
            //   6a0a                 | push                0xa
            //   ff7304               | push                dword ptr [ebx + 4]
            //   ff15????????         |                     
            //   3d02010000           | cmp                 eax, 0x102
            //   74c4                 | je                  0xffffffc6

        $sequence_6 = { eb14 8bce 8d5902 668b01 83c102 }
            // n = 5, score = 400
            //   eb14                 | jmp                 0x16
            //   8bce                 | mov                 ecx, esi
            //   8d5902               | lea                 ebx, dword ptr [ecx + 2]
            //   668b01               | mov                 ax, word ptr [ecx]
            //   83c102               | add                 ecx, 2

        $sequence_7 = { ffd6 85c0 75e8 6a0a ff7304 }
            // n = 5, score = 400
            //   ffd6                 | call                esi
            //   85c0                 | test                eax, eax
            //   75e8                 | jne                 0xffffffea
            //   6a0a                 | push                0xa
            //   ff7304               | push                dword ptr [ebx + 4]

        $sequence_8 = { 50 6a00 6a00 6a48 6a00 }
            // n = 5, score = 400
            //   50                   | push                eax
            //   6a00                 | push                0
            //   6a00                 | push                0
            //   6a48                 | push                0x48
            //   6a00                 | push                0

        $sequence_9 = { 85c0 75e2 6a64 ff15???????? ffd3 }
            // n = 5, score = 400
            //   85c0                 | test                eax, eax
            //   75e2                 | jne                 0xffffffe4
            //   6a64                 | push                0x64
            //   ff15????????         |                     
            //   ffd3                 | call                ebx

    condition:
        7 of them and filesize < 6029312
}