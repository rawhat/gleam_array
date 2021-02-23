import arrays
import gleam/should

pub fn new_arrays_should_have_size_test() {
  arrays.new(10)
  |> arrays.size()
  |> should.equal(10)
}

pub fn arrays_get_set_test() {
  [True, False]
  |> arrays.from_list
  |> arrays.get(0)
  |> should.equal(True)

  [True, False]
  |> arrays.from_list
  |> arrays.set(0, False)
  |> arrays.get(0)
  |> should.equal(False)
}

pub fn arrays_fold_generates_accum_test() {
  [1, 2, 3, 4, 5, 6]
  |> arrays.from_list
  |> arrays.fold(0, fn(next, sum) { sum + next })
  |> should.equal(21)
}

pub fn arrays_to_list_generates_test() {
  [1, 2, 3]
  |> arrays.from_list
  |> arrays.to_list
  |> should.equal([1, 2, 3])
}

pub fn arrays_map_updates_values_test() {
  [1, 2, 3]
  |> arrays.from_list
  |> arrays.map(fn(item, _) { item * 2 })
  |> arrays.to_list
  |> should.equal([2, 4, 6])
}

pub fn arrays_to_pairs_makes_list_test() {
  [1, 2, 3]
  |> arrays.from_list
  |> arrays.to_pairs
  |> should.equal([tuple(0, 1), tuple(1, 2), tuple(2, 3)])
}

pub fn arrays_from_pairs_makes_array_test() {
  [tuple(0, 1), tuple(1, 2), tuple(2, 3)]
  |> arrays.from_pairs
  |> arrays.to_list
  |> should.equal([1, 2, 3])
}
