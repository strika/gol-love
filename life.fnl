;;; Life

(local life {})

(fn life.build-world [columns rows]
  (fcollect [i 1 rows]
    (fcollect [j 1 columns]
      0)))

(fn life.width [world]
  (length (. world 1)))

(fn life.height [world]
  (length world))

(fn life.cell [world x y]
  (if (or (> x (life.width world)) (< x 1) (> y (life.height world)) (< y 1))
    0
    (. world y x)))

(fn life.set-cell [world x y value]
  (tset world y x value))

life
