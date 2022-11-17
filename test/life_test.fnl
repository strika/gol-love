(local t (require :fspec))

(local life (require :life))

;; Test build-world

(let [world (life.build-world 3 2)]
  (t.is-table world)
  (t.eq world [[0 0 0]
               [0 0 0]]))

;; Test get-cell

(let [world [[0 1 1]
             [0 0 1]]]
  (t.eq (life.get-cell world 1 1) 0)
  (t.eq (life.get-cell world 2 1) 1)
  (t.eq (life.get-cell world 3 1) 1)
  (t.eq (life.get-cell world 1 2) 0)
  (t.eq (life.get-cell world 3 2) 1))

;; Test set-cell

(let [world (life.build-world 3 2)]
  (life.set-cell world 1 1 1)
  (life.set-cell world 1 2 1)
  (life.set-cell world 3 1 1)
  (t.eq world [[1 0 1]
               [1 0 0]]))

(t.run!)
