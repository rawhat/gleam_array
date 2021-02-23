pub external type Array(a)

external fn array_size(array: Array(a)) -> Int =
  "array" "size"

external fn new_array(size: Int) -> Array(a) =
  "array" "new"

external fn array_from_list(l: List(a)) -> Array(a) =
  "array" "from_list"

external fn array_set(index: Int, value: a, arr: Array(a)) -> Array(a) =
  "array" "set"

external fn array_get(index: Int, arr: Array(a)) -> a =
  "array" "get"

external fn array_fold(
  reducer: fn(Int, a, b) -> b,
  initial: b,
  arr: Array(a),
) -> b =
  "array" "foldr"

external fn array_to_list(arr: Array(a)) -> List(a) =
  "array" "to_list"

external fn array_map(fn(Int, a) -> b, arr: Array(a)) -> Array(b) =
  "array" "map"

external fn array_to_tuple_list(arr: Array(a)) -> List(tuple(Int, a)) =
  "array" "to_orddict"

external fn array_from_tuple_list(l: List(tuple(Int, a))) -> Array(a) =
  "array" "from_orddict"

pub fn new(size: Int) -> Array(a) {
  new_array(size)
}

pub fn from_list(l: List(a)) -> Array(a) {
  array_from_list(l)
}

pub fn to_list(arr: Array(a)) -> List(a) {
  array_to_list(arr)
}

pub fn size(arr: Array(a)) -> Int {
  array_size(arr)
}

pub fn set(arr: Array(a), index: Int, value: a) -> Array(a) {
  array_set(index, value, arr)
}

pub fn get(arr: Array(a), index: Int) -> a {
  array_get(index, arr)
}

pub fn fold(arr: Array(a), initial: b, reducer: fn(a, b) -> b) -> b {
  array_fold(fn(_, item, accum) { reducer(item, accum) }, initial, arr)
}

pub fn map(arr: Array(a), mapper: fn(a, Int) -> b) -> Array(b) {
  array_map(fn(index, item) { mapper(item, index) }, arr)
}

pub fn to_pairs(arr: Array(a)) -> List(tuple(Int, a)) {
  array_to_tuple_list(arr)
}

pub fn from_pairs(l: List(tuple(Int, a))) -> Array(a) {
  array_from_tuple_list(l)
}
