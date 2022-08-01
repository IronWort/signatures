rule win_poslurp_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.poslurp."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.poslurp"
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
        $sequence_0 = { c640f417 c640f51a 458bc8 0f1f00 410fb64201 b91f000000 }
            // n = 6, score = 100
            //   c640f417             | mov                 word ptr [esp + 0x7c], cx
            //   c640f51a             | xor                 edi, edi
            //   458bc8               | dec                 eax
            //   0f1f00               | lea                 ecx, dword ptr [0x2fd3]
            //   410fb64201           | inc                 ebp
            //   b91f000000           | xor                 ecx, ecx

        $sequence_1 = { 660f1f440000 803b4d 7506 807b015a 7409 4881eb00100000 }
            // n = 6, score = 100
            //   660f1f440000         | mov                 byte ptr [eax - 0x13], 7
            //   803b4d               | mov                 byte ptr [eax - 0x12], 8
            //   7506                 | mov                 byte ptr [eax - 0x11], 0xa
            //   807b015a             | mov                 byte ptr [eax - 0x10], 0xb
            //   7409                 | mov                 byte ptr [eax - 0xf], 0xc
            //   4881eb00100000       | mov                 byte ptr [eax - 0x12], 8

        $sequence_2 = { 4c8d1424 c640e901 c640ea02 c640eb04 458d5807 }
            // n = 5, score = 100
            //   4c8d1424             | ret                 
            //   c640e901             | dec                 esp
            //   c640ea02             | mov                 esp, ebp
            //   c640eb04             | dec                 eax
            //   458d5807             | test                ebp, ebp

        $sequence_3 = { 488bcb ff15???????? 498bcd ff15???????? 498bcc }
            // n = 5, score = 100
            //   488bcb               | add                 esp, 0x44
            //   ff15????????         |                     
            //   498bcd               | inc                 ecx
            //   ff15????????         |                     
            //   498bcc               | cmp                 ebp, eax

        $sequence_4 = { 4c8bc6 4889743030 488d842498000000 488bd5 488bcf 4889442420 }
            // n = 6, score = 100
            //   4c8bc6               | dec                 eax
            //   4889743030           | test                ecx, ecx
            //   488d842498000000     | je                  0xd42
            //   488bd5               | lea                 eax, dword ptr [edi - 0xf]
            //   488bcf               | cmp                 eax, 5
            //   4889442420           | ja                  0xd5c

        $sequence_5 = { 48ffc2 32c1 8842ff 69c90d661900 81e96b1ef949 }
            // n = 5, score = 100
            //   48ffc2               | sub                 ecx, ebp
            //   32c1                 | add                 ecx, -0x24
            //   8842ff               | cmp                 ecx, 0x3c
            //   69c90d661900         | ja                  0x1c9
            //   81e96b1ef949         | cmp                 byte ptr [eax + 0x10], 0x3d

        $sequence_6 = { 7434 418bc8 ffce 488bd5 2bcd 8bfb }
            // n = 6, score = 100
            //   7434                 | dec                 eax
            //   418bc8               | mov                 edx, esi
            //   ffce                 | je                  0x16f5
            //   488bd5               | jne                 0x16e5
            //   2bcd                 | inc                 ecx
            //   8bfb                 | mov                 ebx, ebp

        $sequence_7 = { 7458 448b0d???????? 4c8bd6 6690 410fb70a 6683f920 }
            // n = 6, score = 100
            //   7458                 | add                 esp, 0x40
            //   448b0d????????       |                     
            //   4c8bd6               | dec                 eax
            //   6690                 | mov                 edi, dword ptr [esp + 0x68]
            //   410fb70a             | test                eax, eax
            //   6683f920             | jne                 0x177f

        $sequence_8 = { 33c9 41f7d0 85d2 7418 498bc1 }
            // n = 5, score = 100
            //   33c9                 | dec                 eax
            //   41f7d0               | add                 eax, -8
            //   85d2                 | inc                 ebp
            //   7418                 | xor                 ecx, ecx
            //   498bc1               | je                  0x9be

        $sequence_9 = { 7409 488bc8 ff15???????? 44892d???????? 488bcf }
            // n = 5, score = 100
            //   7409                 | inc                 ecx
            //   488bc8               | inc                 edx
            //   ff15????????         |                     
            //   44892d????????       |                     
            //   488bcf               | inc                 ecx

    condition:
        7 of them and filesize < 50176
}