(local life (require :life))

(local width 400)
(local height 200)

(var last-iteration 0)
(var world nil)

(fn love.load []
  (set world (life.build-random-world width height)))

(fn love.update [dt]
  (set last-iteration (+ last-iteration dt))
  (if (> last-iteration 0.2)
    (do
      (set last-iteration 0)
      (set world (life.evolve world)))))

(fn love.draw []
  (for [x 1 width]
    (for [y 1 height]
      (if (life.alive? world x y)
        (love.graphics.rectangle "fill" (* (- x 1) 10) (* (- y 1) 10) 10 10)))))
