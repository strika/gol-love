(local t (require :fspec))

(t.eq "actual" "expected")

(t.is-number "1.2")

(t.eq "hello" "hello")

(t.run!)
