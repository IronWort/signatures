rule win_equationdrug_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.equationdrug."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.equationdrug"
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
        $sequence_0 = { 8d4c2404 e8???????? 8b442430 8b4c242c 50 51 }
            // n = 6, score = 100
            //   8d4c2404             | lea                 ecx, dword ptr [esp + 4]
            //   e8????????           |                     
            //   8b442430             | mov                 eax, dword ptr [esp + 0x30]
            //   8b4c242c             | mov                 ecx, dword ptr [esp + 0x2c]
            //   50                   | push                eax
            //   51                   | push                ecx

        $sequence_1 = { 8b4c242c 8b542410 8d4411f8 8944242c 40 3bc6 0f8244ffffff }
            // n = 7, score = 100
            //   8b4c242c             | mov                 ecx, dword ptr [esp + 0x2c]
            //   8b542410             | mov                 edx, dword ptr [esp + 0x10]
            //   8d4411f8             | lea                 eax, dword ptr [ecx + edx - 8]
            //   8944242c             | mov                 dword ptr [esp + 0x2c], eax
            //   40                   | inc                 eax
            //   3bc6                 | cmp                 eax, esi
            //   0f8244ffffff         | jb                  0xffffff4a

        $sequence_2 = { 50 8d4c2428 e8???????? 8d4c241c c78424a800000002000000 e8???????? 84c0 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   8d4c2428             | lea                 ecx, dword ptr [esp + 0x28]
            //   e8????????           |                     
            //   8d4c241c             | lea                 ecx, dword ptr [esp + 0x1c]
            //   c78424a800000002000000     | mov    dword ptr [esp + 0xa8], 2
            //   e8????????           |                     
            //   84c0                 | test                al, al

        $sequence_3 = { 8bf1 57 55 8d4c2418 e8???????? }
            // n = 5, score = 100
            //   8bf1                 | mov                 esi, ecx
            //   57                   | push                edi
            //   55                   | push                ebp
            //   8d4c2418             | lea                 ecx, dword ptr [esp + 0x18]
            //   e8????????           |                     

        $sequence_4 = { f3a5 50 8bcb e8???????? 8b94240a010000 8b8c2408010000 8bf2 }
            // n = 7, score = 100
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   50                   | push                eax
            //   8bcb                 | mov                 ecx, ebx
            //   e8????????           |                     
            //   8b94240a010000       | mov                 edx, dword ptr [esp + 0x10a]
            //   8b8c2408010000       | mov                 ecx, dword ptr [esp + 0x108]
            //   8bf2                 | mov                 esi, edx

        $sequence_5 = { 8b442414 668b510c 8bc8 03f2 33d2 f3a6 7510 }
            // n = 7, score = 100
            //   8b442414             | mov                 eax, dword ptr [esp + 0x14]
            //   668b510c             | mov                 dx, word ptr [ecx + 0xc]
            //   8bc8                 | mov                 ecx, eax
            //   03f2                 | add                 esi, edx
            //   33d2                 | xor                 edx, edx
            //   f3a6                 | repe cmpsb          byte ptr [esi], byte ptr es:[edi]
            //   7510                 | jne                 0x12

        $sequence_6 = { 83c610 8d4c2404 56 e8???????? 8d4c2404 c784242802000000000000 e8???????? }
            // n = 7, score = 100
            //   83c610               | add                 esi, 0x10
            //   8d4c2404             | lea                 ecx, dword ptr [esp + 4]
            //   56                   | push                esi
            //   e8????????           |                     
            //   8d4c2404             | lea                 ecx, dword ptr [esp + 4]
            //   c784242802000000000000     | mov    dword ptr [esp + 0x228], 0
            //   e8????????           |                     

        $sequence_7 = { 03c1 3bc5 89442420 7d02 33c0 c1e002 50 }
            // n = 7, score = 100
            //   03c1                 | add                 eax, ecx
            //   3bc5                 | cmp                 eax, ebp
            //   89442420             | mov                 dword ptr [esp + 0x20], eax
            //   7d02                 | jge                 4
            //   33c0                 | xor                 eax, eax
            //   c1e002               | shl                 eax, 2
            //   50                   | push                eax

        $sequence_8 = { 8b442418 50 51 8bce e8???????? }
            // n = 5, score = 100
            //   8b442418             | mov                 eax, dword ptr [esp + 0x18]
            //   50                   | push                eax
            //   51                   | push                ecx
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     

        $sequence_9 = { 33c0 c644241a2e 8854241c f3a6 7404 88442413 8a442413 }
            // n = 7, score = 100
            //   33c0                 | xor                 eax, eax
            //   c644241a2e           | mov                 byte ptr [esp + 0x1a], 0x2e
            //   8854241c             | mov                 byte ptr [esp + 0x1c], dl
            //   f3a6                 | repe cmpsb          byte ptr [esi], byte ptr es:[edi]
            //   7404                 | je                  6
            //   88442413             | mov                 byte ptr [esp + 0x13], al
            //   8a442413             | mov                 al, byte ptr [esp + 0x13]

    condition:
        7 of them and filesize < 449536
}