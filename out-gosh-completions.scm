;; this file get from 
;; http://d.hatena.ne.jp/rui314/20070604/p1
;;
;; how to use
;; mkdir -p ~/.rlwrap
;; gosh <this file > ~/.rlwrap/gosh_completions
;;
;; 2014/07/30 07:36
;; なんか補完きかない...

(require "binary/io") (require "binary/pack") (require "dbi")
(require "gauche/charconv") (require "gauche/collection") (require "gauche/config")
(require "gauche/fcntl") (require "gauche/hook") (require "gauche/libutil")
(require "gauche/listener") (require "gauche/logger") (require "gauche/mop/propagate")
(require "gauche/mop/singleton") (require "gauche/mop/validator") (require "gauche/net")
(require "gauche/package") (require "gauche/package/fetch") (require "gauche/package/util")
(require "gauche/parameter") (require "gauche/parseopt") (require "gauche/process")
(require "gauche/regexp") (require "gauche/selector") (require "gauche/sequence")
(require "gauche/serializer") (require "gauche/syslog") (require "gauche/termios")
(require "gauche/test") (require "gauche/threads") (require "gauche/time")
(require "gauche/uvector") (require "gauche/version") (require "gauche/vport")
(require "math/const") (require "math/mt-random") (require "rfc/822")
(require "rfc/base64") (require "rfc/cookie") (require "rfc/hmac")
(require "rfc/md5") (require "rfc/mime") (require "rfc/quoted-printable")
(require "rfc/sha1") (require "rfc/uri") (require "srfi-0")
(require "srfi-1") (require "srfi-10") (require "srfi-11")
(require "srfi-13") (require "srfi-14") (require "srfi-19")
(require "srfi-2") (require "srfi-26") (require "srfi-27")
(require "srfi-29") (require "srfi-37") (require "srfi-4")
(require "srfi-42") (require "srfi-43") (require "srfi-5")
(require "srfi-9") (require "sxml/adaptor") (require "sxml/serializer")
(require "sxml/ssax") (require "sxml/sxpath") (require "sxml/tools")
(require "sxml/tree-trans") (require "text/csv") (require "text/diff")
(require "text/parse") (require "text/sql") (require "text/tr")
(require "text/tree") (require "util/combinations") (require "util/digest")
(require "util/isomorph") (require "util/lcs") (require "util/list")
(require "util/match") (require "util/queue") (require "util/rbtree")
(require "util/record") (require "util/relation") (require "util/stream")
(require "util/toposort") (require "util/trie") (require "www/cgi")
(require "www/cgi-test")

;; errors
;;(require "dbm") (require "dbm/fsdbm") (require "file/filter")
;;(require "text/gettext") (require "text/html-lite") (require "text/info")
;;(require "file/util") (require "gauche/auxsys") (require "gauche/cgen")

(use srfi-1)

;; カレントモジュールが継承しているモジュールで定義されている変数と、
;; その他のモジュールがエクスポートしている変数を出力する。
(define (main args)
  (define (register lister modules)
    (for-each (lambda (mod)
                (for-each (cut hash-table-put! ht <> #t)
                          (lister mod)))
              modules))
  (define ht (make-hash-table))
  (register (lambda (mod)
              (hash-table-keys (module-table mod)))
            (module-precedence-list (current-module)))
  (register module-exports
            (all-modules))
  (for-each print
            (sort (map symbol->string (hash-table-keys ht))))
  0)
