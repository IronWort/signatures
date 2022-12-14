rule win_tmanger_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2021-10-07"
        version = "1"
        description = "Detects win.tmanger."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.tmanger"
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
        $sequence_0 = { c7411cf8f0564e c7412066b8276e c7412425d933d1 c7412861fdc72a c7412cdf9134d2 }
            // n = 5, score = 200
            //   c7411cf8f0564e       | dec                 eax
            //   c7412066b8276e       | mov                 eax, dword ptr [eax + 0x18]
            //   c7412425d933d1       | dec                 eax
            //   c7412861fdc72a       | mov                 dword ptr [esp + 0x130], ebx
            //   c7412cdf9134d2       | dec                 eax

        $sequence_1 = { c7412861fdc72a c7412cdf9134d2 c74130324d251d c74134375ec19d c7413893c82e55 c7413c1b4a468b }
            // n = 6, score = 200
            //   c7412861fdc72a       | mov                 ebx, dword ptr [ebp - 0x3f8]
            //   c7412cdf9134d2       | lea                 ecx, dword ptr [ebp - 0x3b0]
            //   c74130324d251d       | mov                 byte ptr [ebp - 4], 0xa4
            //   c74134375ec19d       | lea                 eax, dword ptr [ebx + 0x1ac]
            //   c7413893c82e55       | mov                 byte ptr [ebp - 4], 0xa4
            //   c7413c1b4a468b       | lea                 eax, dword ptr [ebx + 0x1ac]

        $sequence_2 = { c74141fdea7736 c74145aed72316 c74149ff663a9d c7414dd22a7e91 c741510f9f2997 c7415565449eac }
            // n = 6, score = 200
            //   c74141fdea7736       | mov                 byte ptr [ebp - 4], 0xa7
            //   c74145aed72316       | mov                 byte ptr [ebp - 4], 0xab
            //   c74149ff663a9d       | push                eax
            //   c7414dd22a7e91       | lea                 eax, dword ptr [ebp - 0x3c0]
            //   c741510f9f2997       | push                eax
            //   c7415565449eac       | lea                 ecx, dword ptr [ebp - 0x3b0]

        $sequence_3 = { c74149ff663a9d c7414dd22a7e91 c741510f9f2997 c7415565449eac }
            // n = 4, score = 200
            //   c74149ff663a9d       | mov                 byte ptr [ebp - 4], 0x9e
            //   c7414dd22a7e91       | push                eax
            //   c741510f9f2997       | lea                 eax, dword ptr [ebp - 0x39c]
            //   c7415565449eac       | push                eax

        $sequence_4 = { c7411cf8f0564e c7412066b8276e c7412425d933d1 c7412861fdc72a }
            // n = 4, score = 200
            //   c7411cf8f0564e       | push                eax
            //   c7412066b8276e       | mov                 byte ptr [ebp - 4], 0x8d
            //   c7412425d933d1       | push                eax
            //   c7412861fdc72a       | lea                 ecx, dword ptr [ebp - 0x3e0]

        $sequence_5 = { c741103a71c135 c74114c2a02ab0 c74118d95dc845 c7411cf8f0564e }
            // n = 4, score = 200
            //   c741103a71c135       | lea                 ecx, dword ptr [ebp - 0x39c]
            //   c74114c2a02ab0       | mov                 byte ptr [ebp - 4], 0x85
            //   c74118d95dc845       | push                eax
            //   c7411cf8f0564e       | lea                 ecx, dword ptr [ebp - 0x3e0]

        $sequence_6 = { c741594d68b93a c7415d382cd7bd c74161d47bdb0f c741651f013f62 c74169388b8e92 c7416d9b14f6a0 }
            // n = 6, score = 200
            //   c741594d68b93a       | lea                 eax, dword ptr [ebp - 0x3a0]
            //   c7415d382cd7bd       | push                eax
            //   c74161d47bdb0f       | lea                 ecx, dword ptr [ebp - 0x3b0]
            //   c741651f013f62       | mov                 byte ptr [ebp - 4], 0xad
            //   c74169388b8e92       | lea                 eax, dword ptr [ebp - 0x3e4]
            //   c7416d9b14f6a0       | mov                 byte ptr [ebp - 4], 0xae

        $sequence_7 = { c741103a71c135 c74114c2a02ab0 c74118d95dc845 c7411cf8f0564e c7412066b8276e c7412425d933d1 c7412861fdc72a }
            // n = 7, score = 200
            //   c741103a71c135       | push                eax
            //   c74114c2a02ab0       | lea                 ecx, dword ptr [ebp - 0x3e0]
            //   c74118d95dc845       | mov                 ecx, dword ptr [ebp - 0x3f0]
            //   c7411cf8f0564e       | mov                 byte ptr [ebp - 4], 0xff
            //   c7412066b8276e       | push                eax
            //   c7412425d933d1       | lea                 eax, dword ptr [ebp - 0x54]
            //   c7412861fdc72a       | push                eax

        $sequence_8 = { c7414dd22a7e91 c741510f9f2997 c7415565449eac c741594d68b93a c7415d382cd7bd c74161d47bdb0f }
            // n = 6, score = 200
            //   c7414dd22a7e91       | lea                 ecx, dword ptr [ebp - 0x3cc]
            //   c741510f9f2997       | mov                 byte ptr [ebp - 4], 0xac
            //   c7415565449eac       | lea                 ecx, dword ptr [ecx - 0x10]
            //   c741594d68b93a       | lea                 ecx, dword ptr [ebp - 0x3bc]
            //   c7415d382cd7bd       | mov                 byte ptr [ebp - 4], 0xac
            //   c74161d47bdb0f       | lea                 ecx, dword ptr [ecx - 0x10]

        $sequence_9 = { c741651f013f62 c74169388b8e92 c7416d9b14f6a0 c7417180fcd6bb c74175d7401d36 }
            // n = 5, score = 200
            //   c741651f013f62       | mov                 esi, ecx
            //   c74169388b8e92       | ret                 
            //   c7416d9b14f6a0       | push                0x700
            //   c7417180fcd6bb       | mov                 edi, ecx
            //   c74175d7401d36       | ret                 

    condition:
        7 of them and filesize < 8252416
}