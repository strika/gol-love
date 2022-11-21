;;; Life

(local life {})
(local delta-coordinates [[-1 -1] [0 -1] [1 -1] [-1 0] [0 0] [1 0] [-1 1] [0 1] [1 1]])

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

(fn life.alive-neighbours [world x y]
  "Returns the number of alive neighbour cells of the cell."
  (accumulate [sum 0
               _ [dx dy] (ipairs delta-coordinates)]
    (+ sum (life.cell world (+ x dx) (+ y dy)))))

life
