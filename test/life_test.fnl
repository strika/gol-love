(local t (require :fspec))

(local life (require :life))

;; Test build-world

(let [world (life.build-world 3 2)]
  (t.is-table world)
  (t.eq world [[0 0 0]
               [0 0 0]]))

;; Test build-random-world

(let [world (life.build-random-world 12 8)]
  (t.is-table world)
  (t.eq (life.width world) 12)
  (t.eq (life.height world) 8)
  (t.neq (life.evolve world) world))

;; Test width

(let [world (life.build-world 3 2)]
  (t.eq (life.width world) 3))

;; Test height

(let [world (life.build-world 3 2)]
  (t.eq (life.height world) 2))

;; Test cell

(let [world [[0 1 1]
             [0 0 1]]]
  (t.eq (life.cell world 1 1) 0)
  (t.eq (life.cell world 2 1) 1)
  (t.eq (life.cell world 3 1) 1)
  (t.eq (life.cell world 1 2) 0)
  (t.eq (life.cell world 3 2) 1))

; Test cell when out of bounds

(let [world [[1 1 1]
             [1 1 1]]]
  (t.eq (life.cell world 1 0) 0)
  (t.eq (life.cell world 0 1) 0)
  (t.eq (life.cell world 4 1) 0)
  (t.eq (life.cell world 1 4) 0))

;; Test set-cell

(let [world (life.build-world 3 2)]
  (life.set-cell world 1 1 1)
  (life.set-cell world 1 2 1)
  (life.set-cell world 3 1 1)
  (t.eq world [[1 0 1]
               [1 0 0]]))

;; Test alive-neighbours

(let [world [[0 1 1]
             [0 0 1]
             [1 1 0]]]
  (t.eq (life.alive-neighbours world 1 1) 1)
  (t.eq (life.alive-neighbours world 2 1) 3)
  (t.eq (life.alive-neighbours world 3 1) 3)
  (t.eq (life.alive-neighbours world 1 2) 3)
  (t.eq (life.alive-neighbours world 2 2) 5)
  (t.eq (life.alive-neighbours world 3 3) 2))

;; Test alive?

(let [world [[0 0 0 0 0 0]
             [0 0 0 0 0 0]
             [0 0 1 1 1 0]
             [0 1 1 1 0 0]
             [0 0 0 0 0 0]
             [0 0 0 0 0 0]]]
  (t.eq (life.alive? world 1 1) 0)
  (t.eq (life.alive? world 3 3) 0)
  (t.eq (life.alive? world 4 2) 1)
  (t.eq (life.alive? world 2 4) 1)
  (t.eq (life.alive? world 6 6) 0))

;; Test evolve

(let [world [[0 0 0 0 0 0]
             [0 0 0 0 0 0]
             [0 0 1 1 1 0]
             [0 1 1 1 0 0]
             [0 0 0 0 0 0]
             [0 0 0 0 0 0]]]
  (t.eq (life.evolve world)
        [[0 0 0 0 0 0]
         [0 0 0 1 0 0]
         [0 1 0 0 1 0]
         [0 1 0 0 1 0]
         [0 0 1 0 0 0]
         [0 0 0 0 0 0]]))

(t.run!)
