rule win_hyperssl_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.hyperssl."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.hyperssl"
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
        $sequence_0 = { 0101 0100 0100 0100 }
            // n = 4, score = 200
            //   0101                 | add                 dword ptr [ecx], eax
            //   0100                 | add                 dword ptr [eax], eax
            //   0100                 | add                 dword ptr [eax], eax
            //   0100                 | add                 dword ptr [eax], eax

        $sequence_1 = { 75f2 5f 5e e9???????? c3 55 8bec }
            // n = 7, score = 200
            //   75f2                 | jne                 0xfffffff4
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi
            //   e9????????           |                     
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp

        $sequence_2 = { 33c2 2bc2 8d4da0 8945a0 898d5cffffff 8d4f18 8d8554ffffff }
            // n = 7, score = 200
            //   33c2                 | xor                 eax, edx
            //   2bc2                 | sub                 eax, edx
            //   8d4da0               | lea                 ecx, dword ptr [ebp - 0x60]
            //   8945a0               | mov                 dword ptr [ebp - 0x60], eax
            //   898d5cffffff         | mov                 dword ptr [ebp - 0xa4], ecx
            //   8d4f18               | lea                 ecx, dword ptr [edi + 0x18]
            //   8d8554ffffff         | lea                 eax, dword ptr [ebp - 0xac]

        $sequence_3 = { 83c8ff 5d c3 8bff 55 8bec 81ec28030000 }
            // n = 7, score = 200
            //   83c8ff               | or                  eax, 0xffffffff
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   8bff                 | mov                 edi, edi
            //   55                   | push                ebp
            //   8bec                 | mov                 ebp, esp
            //   81ec28030000         | sub                 esp, 0x328

        $sequence_4 = { 0105???????? 8d8d5cffffff 89855cffffff 898560ffffff }
            // n = 4, score = 200
            //   0105????????         |                     
            //   8d8d5cffffff         | lea                 ecx, dword ptr [ebp - 0xa4]
            //   89855cffffff         | mov                 dword ptr [ebp - 0xa4], eax
            //   898560ffffff         | mov                 dword ptr [ebp - 0xa0], eax

        $sequence_5 = { 0101 014514 2bf3 8b5d0c }
            // n = 4, score = 200
            //   0101                 | add                 dword ptr [ecx], eax
            //   014514               | add                 dword ptr [ebp + 0x14], eax
            //   2bf3                 | sub                 esi, ebx
            //   8b5d0c               | mov                 ebx, dword ptr [ebp + 0xc]

        $sequence_6 = { 0100 0200 0200 0002 0002 }
            // n = 5, score = 200
            //   0100                 | add                 dword ptr [eax], eax
            //   0200                 | add                 al, byte ptr [eax]
            //   0200                 | add                 al, byte ptr [eax]
            //   0002                 | add                 byte ptr [edx], al
            //   0002                 | add                 byte ptr [edx], al

        $sequence_7 = { 8bc8 85c9 7436 8b413c 03c1 }
            // n = 5, score = 200
            //   8bc8                 | mov                 ecx, eax
            //   85c9                 | test                ecx, ecx
            //   7436                 | je                  0x38
            //   8b413c               | mov                 eax, dword ptr [ecx + 0x3c]
            //   03c1                 | add                 eax, ecx

        $sequence_8 = { 301406 40 4f 75f2 5f }
            // n = 5, score = 200
            //   301406               | xor                 byte ptr [esi + eax], dl
            //   40                   | inc                 eax
            //   4f                   | dec                 edi
            //   75f2                 | jne                 0xfffffff4
            //   5f                   | pop                 edi

        $sequence_9 = { 33c0 40 5d c20c00 6a08 68???????? e8???????? }
            // n = 7, score = 200
            //   33c0                 | xor                 eax, eax
            //   40                   | inc                 eax
            //   5d                   | pop                 ebp
            //   c20c00               | ret                 0xc
            //   6a08                 | push                8
            //   68????????           |                     
            //   e8????????           |                     

        $sequence_10 = { 2bf0 5f 8a10 301401 8a10 }
            // n = 5, score = 200
            //   2bf0                 | sub                 esi, eax
            //   5f                   | pop                 edi
            //   8a10                 | mov                 dl, byte ptr [eax]
            //   301401               | xor                 byte ptr [ecx + eax], dl
            //   8a10                 | mov                 dl, byte ptr [eax]

        $sequence_11 = { 0105???????? 8d558c 89458c 894590 }
            // n = 4, score = 200
            //   0105????????         |                     
            //   8d558c               | lea                 edx, dword ptr [ebp - 0x74]
            //   89458c               | mov                 dword ptr [ebp - 0x74], eax
            //   894590               | mov                 dword ptr [ebp - 0x70], eax

        $sequence_12 = { 742a 8b4028 03c1 7423 56 }
            // n = 5, score = 200
            //   742a                 | je                  0x2c
            //   8b4028               | mov                 eax, dword ptr [eax + 0x28]
            //   03c1                 | add                 eax, ecx
            //   7423                 | je                  0x25
            //   56                   | push                esi

        $sequence_13 = { 0108 3310 c1c607 c1c210 }
            // n = 4, score = 200
            //   0108                 | add                 dword ptr [eax], ecx
            //   3310                 | xor                 edx, dword ptr [eax]
            //   c1c607               | rol                 esi, 7
            //   c1c210               | rol                 edx, 0x10

        $sequence_14 = { 0108 3908 1bc9 f7d9 }
            // n = 4, score = 200
            //   0108                 | add                 dword ptr [eax], ecx
            //   3908                 | cmp                 dword ptr [eax], ecx
            //   1bc9                 | sbb                 ecx, ecx
            //   f7d9                 | neg                 ecx

        $sequence_15 = { 7423 56 57 b9???????? }
            // n = 4, score = 200
            //   7423                 | je                  0x25
            //   56                   | push                esi
            //   57                   | push                edi
            //   b9????????           |                     

    condition:
        7 of them and filesize < 835584
}