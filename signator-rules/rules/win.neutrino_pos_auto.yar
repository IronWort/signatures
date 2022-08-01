rule win_neutrino_pos_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.neutrino_pos."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.neutrino_pos"
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
        $sequence_0 = { 66898d66ffffff 59 6a07 6689856affffff 58 66898d68ffffff }
            // n = 6, score = 200
            //   66898d66ffffff       | mov                 word ptr [ebp - 0x9a], cx
            //   59                   | pop                 ecx
            //   6a07                 | push                7
            //   6689856affffff       | mov                 word ptr [ebp - 0x96], ax
            //   58                   | pop                 eax
            //   66898d68ffffff       | mov                 word ptr [ebp - 0x98], cx

        $sequence_1 = { 8d4e01 51 6a00 ffd0 8bf8 85ff 740d }
            // n = 7, score = 200
            //   8d4e01               | lea                 ecx, dword ptr [esi + 1]
            //   51                   | push                ecx
            //   6a00                 | push                0
            //   ffd0                 | call                eax
            //   8bf8                 | mov                 edi, eax
            //   85ff                 | test                edi, edi
            //   740d                 | je                  0xf

        $sequence_2 = { 8d854cffffff 68b4000000 50 66894dbc 66894dbe 66894dc0 }
            // n = 6, score = 200
            //   8d854cffffff         | lea                 eax, dword ptr [ebp - 0xb4]
            //   68b4000000           | push                0xb4
            //   50                   | push                eax
            //   66894dbc             | mov                 word ptr [ebp - 0x44], cx
            //   66894dbe             | mov                 word ptr [ebp - 0x42], cx
            //   66894dc0             | mov                 word ptr [ebp - 0x40], cx

        $sequence_3 = { 6a27 66898576ffffff 58 6a37 66898578ffffff 58 6a07 }
            // n = 7, score = 200
            //   6a27                 | push                0x27
            //   66898576ffffff       | mov                 word ptr [ebp - 0x8a], ax
            //   58                   | pop                 eax
            //   6a37                 | push                0x37
            //   66898578ffffff       | mov                 word ptr [ebp - 0x88], ax
            //   58                   | pop                 eax
            //   6a07                 | push                7

        $sequence_4 = { 8bec 56 57 64a130000000 8b400c 8b780c 8bf7 }
            // n = 7, score = 200
            //   8bec                 | mov                 ebp, esp
            //   56                   | push                esi
            //   57                   | push                edi
            //   64a130000000         | mov                 eax, dword ptr fs:[0x30]
            //   8b400c               | mov                 eax, dword ptr [eax + 0xc]
            //   8b780c               | mov                 edi, dword ptr [eax + 0xc]
            //   8bf7                 | mov                 esi, edi

        $sequence_5 = { 6a00 ff75d8 ffd0 57 e8???????? 59 83c8ff }
            // n = 7, score = 200
            //   6a00                 | push                0
            //   ff75d8               | push                dword ptr [ebp - 0x28]
            //   ffd0                 | call                eax
            //   57                   | push                edi
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   83c8ff               | or                  eax, 0xffffffff

        $sequence_6 = { 58 6a68 6689854effffff 58 6a70 66898550ffffff 58 }
            // n = 7, score = 200
            //   58                   | pop                 eax
            //   6a68                 | push                0x68
            //   6689854effffff       | mov                 word ptr [ebp - 0xb2], ax
            //   58                   | pop                 eax
            //   6a70                 | push                0x70
            //   66898550ffffff       | mov                 word ptr [ebp - 0xb0], ax
            //   58                   | pop                 eax

        $sequence_7 = { 8d8534feffff eb16 8d857cfdffff eb0e 8d85c4fcffff }
            // n = 5, score = 200
            //   8d8534feffff         | lea                 eax, dword ptr [ebp - 0x1cc]
            //   eb16                 | jmp                 0x18
            //   8d857cfdffff         | lea                 eax, dword ptr [ebp - 0x284]
            //   eb0e                 | jmp                 0x10
            //   8d85c4fcffff         | lea                 eax, dword ptr [ebp - 0x33c]

        $sequence_8 = { 6a77 58 6a6e 6689854cffffff 58 }
            // n = 5, score = 200
            //   6a77                 | push                0x77
            //   58                   | pop                 eax
            //   6a6e                 | push                0x6e
            //   6689854cffffff       | mov                 word ptr [ebp - 0xb4], ax
            //   58                   | pop                 eax

        $sequence_9 = { 66894da0 66894da2 66894da4 66894da6 66894da8 66894daa 66894dac }
            // n = 7, score = 200
            //   66894da0             | mov                 word ptr [ebp - 0x60], cx
            //   66894da2             | mov                 word ptr [ebp - 0x5e], cx
            //   66894da4             | mov                 word ptr [ebp - 0x5c], cx
            //   66894da6             | mov                 word ptr [ebp - 0x5a], cx
            //   66894da8             | mov                 word ptr [ebp - 0x58], cx
            //   66894daa             | mov                 word ptr [ebp - 0x56], cx
            //   66894dac             | mov                 word ptr [ebp - 0x54], cx

    condition:
        7 of them and filesize < 188416
}