test "test_uint64" {
  let test_number : UInt64 = 1145141919810
  let tested : UInt64 = test_number
    |> uint64_to_bytes_array
    |> bytes_array_to_uint64_raw
  if test_number != tested {
    fail!("Not equal after bytes conversion!")
  }
}

test "test_uint" {
  let test_number : UInt = 114514
  let tested : UInt = test_number
    |> uint_to_bytes_array
    |> bytes_array_to_uint_raw
  if test_number != tested {
    fail!("Not equal after bytes conversion!")
  }
}

test "test_double_1" {
  let test_number : Double = 1145141919810
  let tested : Double = test_number
    |> double_to_bytes_array
    |> bytes_array_to_double_raw
  if test_number != tested {
    fail!("Not equal after bytes conversion!")
  }
}

test "test_double_2" {
  let test_number : Double = -1145141919810
  let tested : Double = test_number
    |> double_to_bytes_array
    |> bytes_array_to_double_raw
  if test_number != tested {
    fail!("Not equal after bytes conversion!")
  }
}

test "test_double_3" {
  let test_number : Double = 114514.1919810
  let tested : Double = test_number
    |> double_to_bytes_array
    |> bytes_array_to_double_raw
  if test_number != tested {
    fail!("Not equal after bytes conversion!")
  }
}

test "test_double_4" {
  let test_number : Double = -114514.1919810
  let tested : Double = test_number
    |> double_to_bytes_array
    |> bytes_array_to_double_raw
  if test_number != tested {
    fail!("Not equal after bytes conversion!")
  }
}

test "test_float_1" {
  let test_number : Float = 1145141919810
  let tested : Float = test_number
    |> float_to_bytes_array
    |> bytes_array_to_float_raw
  if test_number != tested {
    fail!("Not equal after bytes conversion!")
  }
}

test "test_float_2" {
  let test_number : Float = -1145141919810
  let tested : Float = test_number
    |> float_to_bytes_array
    |> bytes_array_to_float_raw
  if test_number != tested {
    fail!("Not equal after bytes conversion!")
  }
}

test "test_float_3" {
  let test_number : Float = 114514.1919810
  let tested : Float = test_number
    |> float_to_bytes_array
    |> bytes_array_to_float_raw
  if test_number != tested {
    fail!("Not equal after bytes conversion!")
  }
}

test "test_float_4" {
  let test_number : Float = -114514.1919810
  let tested : Float = test_number
    |> float_to_bytes_array
    |> bytes_array_to_float_raw
  if test_number != tested {
    fail!("Not equal after bytes conversion!")
  }
}

test "test_int64_1" {
  let test_number : Int64 = 1145141919810
  let tested : Int64 = test_number
    |> int64_to_bytes_array
    |> bytes_array_to_int64_raw
  if test_number != tested {
    fail!("Not equal after bytes conversion!")
  }
}

test "test_int64_2" {
  let test_number : Int64 = -1145141919810
  let tested : Int64 = test_number
    |> int64_to_bytes_array
    |> bytes_array_to_int64_raw
  if test_number != tested {
    fail!("Not equal after bytes conversion!")
  }
}

test "test_int_1" {
  let test_number : Int = 114514
  let tested : Int = test_number |> int_to_bytes_array |> bytes_array_to_int_raw
  if test_number != tested {
    fail!("Not equal after bytes conversion!")
  }
}

test "test_int_2" {
  let test_number : Int = -114514
  let tested : Int = test_number |> int_to_bytes_array |> bytes_array_to_int_raw
  if test_number != tested {
    fail!("Not equal after bytes conversion!")
  }
}

test "err_handle_1" {
  try {
    114514 |> uint64_to_bytes_array |> bytes_array_to_uint!() |> println
  } catch {
    e => inspect!(e, content="BytesLenErr(8)")
  }
}

test "err_handle_2" {
  try {
    -114514 |> int_to_bytes_array |> bytes_array_to_double!() |> println
  } catch {
    e => inspect!(e, content="BytesLenErr(4)")
  }
}
