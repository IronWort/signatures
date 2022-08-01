rule AthenaHTTP
{
    meta:
        author = "Brian Wallace @botnet_hunter"
        author_email = "bwall@ballastsecurity.net"
        date = "2014-08-09"
        description = "Identify Athena HTTP"
    strings:
        $s1 = "%s(%s)"
        $s2 = "type:on_exec"
        $s3 = "uid:%s"
        $s4 = "priv:%s"
        $s5 = "arch:x%s"
        $s6 = "gend:%s"
        $s7 = "cores:%i"
        $s8 = "ver:%s"
        $s9 = "net:%s"
    condition:
        all of them
}