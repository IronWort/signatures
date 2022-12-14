rule win_amadey_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.amadey."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.amadey"
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
        $sequence_0 = { 8d85f8fdffff 89442404 891424 e8???????? 83ec20 c70424???????? }
            // n = 6, score = 700
            //   8d85f8fdffff         | lea                 eax, dword ptr [ebp - 0x208]
            //   89442404             | mov                 dword ptr [esp + 4], eax
            //   891424               | mov                 dword ptr [esp], edx
            //   e8????????           |                     
            //   83ec20               | sub                 esp, 0x20
            //   c70424????????       |                     

        $sequence_1 = { e8???????? 89442404 8d85f8efffff 890424 e8???????? e8???????? 890424 }
            // n = 7, score = 700
            //   e8????????           |                     
            //   89442404             | mov                 dword ptr [esp + 4], eax
            //   8d85f8efffff         | lea                 eax, dword ptr [ebp - 0x1008]
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     
            //   e8????????           |                     
            //   890424               | mov                 dword ptr [esp], eax

        $sequence_2 = { c1e004 8945f4 8b45f4 e8???????? 8d44240c 83c00f c1e804 }
            // n = 7, score = 700
            //   c1e004               | shl                 eax, 4
            //   8945f4               | mov                 dword ptr [ebp - 0xc], eax
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]
            //   e8????????           |                     
            //   8d44240c             | lea                 eax, dword ptr [esp + 0xc]
            //   83c00f               | add                 eax, 0xf
            //   c1e804               | shr                 eax, 4

        $sequence_3 = { c1e804 89c3 c1e304 891c24 e8???????? 8b4508 }
            // n = 6, score = 700
            //   c1e804               | shr                 eax, 4
            //   89c3                 | mov                 ebx, eax
            //   c1e304               | shl                 ebx, 4
            //   891c24               | mov                 dword ptr [esp], ebx
            //   e8????????           |                     
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]

        $sequence_4 = { 89e5 83ec28 c70424???????? e8???????? 890424 e8???????? }
            // n = 6, score = 700
            //   89e5                 | mov                 ebp, esp
            //   83ec28               | sub                 esp, 0x28
            //   c70424????????       |                     
            //   e8????????           |                     
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     

        $sequence_5 = { c3 55 89e5 83ec18 c745fcffffffff }
            // n = 5, score = 700
            //   c3                   | ret                 
            //   55                   | push                ebp
            //   89e5                 | mov                 ebp, esp
            //   83ec18               | sub                 esp, 0x18
            //   c745fcffffffff       | mov                 dword ptr [ebp - 4], 0xffffffff

        $sequence_6 = { 8b85f4fbffff 890424 e8???????? c744240805000000 c744240402000000 890424 }
            // n = 6, score = 700
            //   8b85f4fbffff         | mov                 eax, dword ptr [ebp - 0x40c]
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     
            //   c744240805000000     | mov                 dword ptr [esp + 8], 5
            //   c744240402000000     | mov                 dword ptr [esp + 4], 2
            //   890424               | mov                 dword ptr [esp], eax

        $sequence_7 = { 890424 e8???????? c7442404???????? 8d85e8feffff 890424 e8???????? }
            // n = 6, score = 700
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     
            //   c7442404????????     |                     
            //   8d85e8feffff         | lea                 eax, dword ptr [ebp - 0x118]
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     

        $sequence_8 = { 84c0 7407 c745fc03000000 c70424???????? e8???????? 890424 }
            // n = 6, score = 700
            //   84c0                 | test                al, al
            //   7407                 | je                  9
            //   c745fc03000000       | mov                 dword ptr [ebp - 4], 3
            //   c70424????????       |                     
            //   e8????????           |                     
            //   890424               | mov                 dword ptr [esp], eax

        $sequence_9 = { c7442404???????? 8b4508 890424 e8???????? 40 895c2408 89442404 }
            // n = 7, score = 700
            //   c7442404????????     |                     
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   890424               | mov                 dword ptr [esp], eax
            //   e8????????           |                     
            //   40                   | inc                 eax
            //   895c2408             | mov                 dword ptr [esp + 8], ebx
            //   89442404             | mov                 dword ptr [esp + 4], eax

    condition:
        7 of them and filesize < 264192
}