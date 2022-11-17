;;; Life
(local life {})

(fn life.build-world [columns rows]
  (fcollect [i 1 rows]
    (fcollect [j 1 columns]
      0)))

life
