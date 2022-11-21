;;; Life

(local life {})

(fn life.build-world [columns rows]
  (fcollect [i 1 rows]
    (fcollect [j 1 columns]
      0)))

(fn life.cell [world x y]
  (. world y x))

(fn life.set-cell [world x y value]
  (tset world y x value))

life
