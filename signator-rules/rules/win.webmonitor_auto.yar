rule win_webmonitor_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.webmonitor."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.webmonitor"
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
        $sequence_0 = { fd 04f8 fd ff01 04f8 fd 0512002413 }
            // n = 7, score = 200
            //   fd                   | std                 
            //   04f8                 | add                 al, 0xf8
            //   fd                   | std                 
            //   ff01                 | inc                 dword ptr [ecx]
            //   04f8                 | add                 al, 0xf8
            //   fd                   | std                 
            //   0512002413           | add                 eax, 0x13240012

        $sequence_1 = { 43 ec fe04ec fe05???????? 000d???????? 04c8 fe04ec }
            // n = 7, score = 200
            //   43                   | inc                 ebx
            //   ec                   | in                  al, dx
            //   fe04ec               | inc                 byte ptr [esp + ebp*8]
            //   fe05????????         |                     
            //   000d????????         |                     
            //   04c8                 | add                 al, 0xc8
            //   fe04ec               | inc                 byte ptr [esp + ebp*8]

        $sequence_2 = { 9e 6c 68ff080800 8a3401 a3???????? 0800 }
            // n = 6, score = 200
            //   9e                   | sahf                
            //   6c                   | insb                byte ptr es:[edi], dx
            //   68ff080800           | push                0x808ff
            //   8a3401               | mov                 dh, byte ptr [ecx + eax]
            //   a3????????           |                     
            //   0800                 | or                  byte ptr [eax], al

        $sequence_3 = { 0000 00c0 c46c68ff 0808 008a34019ec5 6c 70ff }
            // n = 7, score = 200
            //   0000                 | add                 byte ptr [eax], al
            //   00c0                 | add                 al, al
            //   c46c68ff             | les                 ebp, ptr [eax + ebp*2 - 1]
            //   0808                 | or                  byte ptr [eax], cl
            //   008a34019ec5         | add                 byte ptr [edx - 0x3a61fecc], cl
            //   6c                   | insb                byte ptr es:[edi], dx
            //   70ff                 | jo                  1

        $sequence_4 = { fd 04f0 fd ff01 04f0 }
            // n = 5, score = 200
            //   fd                   | std                 
            //   04f0                 | add                 al, 0xf0
            //   fd                   | std                 
            //   ff01                 | inc                 dword ptr [ecx]
            //   04f0                 | add                 al, 0xf0

        $sequence_5 = { 3001 a3???????? 30ff 9e 0808 008a30019ef5 }
            // n = 6, score = 200
            //   3001                 | xor                 byte ptr [ecx], al
            //   a3????????           |                     
            //   30ff                 | xor                 bh, bh
            //   9e                   | sahf                
            //   0808                 | or                  byte ptr [eax], cl
            //   008a30019ef5         | add                 byte ptr [edx - 0xa61fed0], cl

        $sequence_6 = { 38644400 44 8a4100 047e }
            // n = 4, score = 200
            //   38644400             | cmp                 byte ptr [esp + eax*2], ah
            //   44                   | inc                 esp
            //   8a4100               | mov                 al, byte ptr [ecx]
            //   047e                 | add                 al, 0x7e

        $sequence_7 = { fa 41 0014b4 42 }
            // n = 4, score = 200
            //   fa                   | cli                 
            //   41                   | inc                 ecx
            //   0014b4               | add                 byte ptr [esp + esi*4], dl
            //   42                   | inc                 edx

        $sequence_8 = { 00d1 6848007269 48 00856948008b }
            // n = 4, score = 100
            //   00d1                 | add                 cl, dl
            //   6848007269           | push                0x69720048
            //   48                   | dec                 eax
            //   00856948008b         | add                 byte ptr [ebp - 0x74ffb797], al

        $sequence_9 = { 00e8 dd7000 008bf98b5d1c 8d4de4 }
            // n = 4, score = 100
            //   00e8                 | add                 al, ch
            //   dd7000               | fnsave              dword ptr [eax]
            //   008bf98b5d1c         | add                 byte ptr [ebx + 0x1c5d8bf9], cl
            //   8d4de4               | lea                 ecx, dword ptr [ebp - 0x1c]

        $sequence_10 = { 000f b681 fc b84500ff24 }
            // n = 4, score = 100
            //   000f                 | add                 byte ptr [edi], cl
            //   b681                 | mov                 dh, 0x81
            //   fc                   | cld                 
            //   b84500ff24           | mov                 eax, 0x24ff0045

        $sequence_11 = { 0108 8b442410 891e 894604 }
            // n = 4, score = 100
            //   0108                 | add                 dword ptr [eax], ecx
            //   8b442410             | mov                 eax, dword ptr [esp + 0x10]
            //   891e                 | mov                 dword ptr [esi], ebx
            //   894604               | mov                 dword ptr [esi + 4], eax

        $sequence_12 = { 00d1 6848004069 48 00d1 }
            // n = 4, score = 100
            //   00d1                 | add                 cl, dl
            //   6848004069           | push                0x69400048
            //   48                   | dec                 eax
            //   00d1                 | add                 cl, dl

        $sequence_13 = { 00856948008b ff558b ec 83ec0c }
            // n = 4, score = 100
            //   00856948008b         | add                 byte ptr [ebp - 0x74ffb797], al
            //   ff558b               | call                dword ptr [ebp - 0x75]
            //   ec                   | in                  al, dx
            //   83ec0c               | sub                 esp, 0xc

        $sequence_14 = { 00e8 f61c00 008bd9895df0 8b451c }
            // n = 4, score = 100
            //   00e8                 | add                 al, ch
            //   f61c00               | neg                 byte ptr [eax + eax]
            //   008bd9895df0         | add                 byte ptr [ebx - 0xfa27627], cl
            //   8b451c               | mov                 eax, dword ptr [ebp + 0x1c]

        $sequence_15 = { 0108 eb5a 8b4508 83ceff }
            // n = 4, score = 100
            //   0108                 | add                 dword ptr [eax], ecx
            //   eb5a                 | jmp                 0x5c
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   83ceff               | or                  esi, 0xffffffff

    condition:
        7 of them and filesize < 1867776
}