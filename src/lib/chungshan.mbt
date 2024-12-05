///| Error type for Chungshan contains a Int indicating an incorrect bytes array length
type! BytesLenErr Int derive(Show)

///| Convert an UInt64 into a 8 bytes long FixedArray[Byte].
/// 
/// # Example
/// 
/// ```
/// uint64_number |> uint64_to_byte_array
/// ```
pub fn uint64_to_byte_array(i : UInt64) -> FixedArray[Byte] {
  let byte1 = i.to_byte()
  let byte2 = (i >> 8).to_byte()
  let byte3 = (i >> 16).to_byte()
  let byte4 = (i >> 24).to_byte()
  let byte5 = (i >> 32).to_byte()
  let byte6 = (i >> 40).to_byte()
  let byte7 = (i >> 48).to_byte()
  let byte8 = (i >> 56).to_byte()
  [byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8]
}

///| Convert a 8 bytes long FixedArray[Byte] into an UInt64 **with* a length check.
/// The result is either an UInt64 or an BytesLenErr which requires error handling.
/// 
/// # Example
/// 
/// ```
/// [b'\x11', b'\x45', b'\x14', b'\x19', b'\x19', b'\x81', b'\x00', b'\x00'] |> byte_array_to_uint64
/// ```
pub fn byte_array_to_uint64(bs : FixedArray[Byte]) -> UInt64!BytesLenErr {
  if bs.length() == 8 {
    let uint64_1 = bs[0].to_uint64()
    let uint64_2 = bs[1].to_uint64() << 8
    let uint64_3 = bs[2].to_uint64() << 16
    let uint64_4 = bs[3].to_uint64() << 24
    let uint64_5 = bs[4].to_uint64() << 32
    let uint64_6 = bs[5].to_uint64() << 40
    let uint64_7 = bs[6].to_uint64() << 48
    let uint64_8 = bs[7].to_uint64() << 56
    uint64_1 +
    uint64_2 +
    uint64_3 +
    uint64_4 +
    uint64_5 +
    uint64_6 +
    uint64_7 +
    uint64_8
  } else {
    raise BytesLenErr(bs.length())
  }
}

///| Convert a 8 bytes long FixedArray[Byte] into an UInt64 **without** a length check.
/// This function does not check the input so take the risk at your own.
/// 
/// # Example
/// 
/// ```
/// [b'\x11', b'\x45', b'\x14', b'\x19', b'\x19', b'\x81', b'\x00', b'\x00'] |> byte_array_to_uint64_raw
/// ```
pub fn byte_array_to_uint64_raw(bs : FixedArray[Byte]) -> UInt64 {
  let uint64_1 = bs[0].to_uint64()
  let uint64_2 = bs[1].to_uint64() << 8
  let uint64_3 = bs[2].to_uint64() << 16
  let uint64_4 = bs[3].to_uint64() << 24
  let uint64_5 = bs[4].to_uint64() << 32
  let uint64_6 = bs[5].to_uint64() << 40
  let uint64_7 = bs[6].to_uint64() << 48
  let uint64_8 = bs[7].to_uint64() << 56
  uint64_1 +
  uint64_2 +
  uint64_3 +
  uint64_4 +
  uint64_5 +
  uint64_6 +
  uint64_7 +
  uint64_8
}

///| Convert an UInt into a 4 bytes long FixedArray[Byte].
/// 
/// # Example
/// 
/// ```
/// uint_number |> uint_to_byte_array
/// ```
pub fn uint_to_byte_array(i : UInt) -> FixedArray[Byte] {
  let byte1 = i.to_byte()
  let byte2 = (i >> 8).to_byte()
  let byte3 = (i >> 16).to_byte()
  let byte4 = (i >> 24).to_byte()
  [byte1, byte2, byte3, byte4]
}

///| Convert a 4 bytes long FixedArray[Byte] into an UInt **with** a length check.
/// The result is either an UInt or an BytesLenErr which requires error handling.
/// 
/// # Example
/// 
/// ```
/// [b'\x11', b'\x45', b'\x14', b'\x00'] |> byte_array_to_uint
/// ```
pub fn byte_array_to_uint(bs : FixedArray[Byte]) -> UInt!BytesLenErr {
  if bs.length() == 4 {
    let uint64_1 = bs[0].to_uint()
    let uint64_2 = bs[1].to_uint() << 8
    let uint64_3 = bs[2].to_uint() << 16
    let uint64_4 = bs[3].to_uint() << 24
    uint64_1 + uint64_2 + uint64_3 + uint64_4
  } else {
    raise BytesLenErr(bs.length())
  }
}

///| Convert a 4 bytes long FixedArray[Byte] into an UInt **without** a length check.
/// This function does not check the input so take the risk at your own.
/// 
/// # Example
/// 
/// ```
/// [b'\x11', b'\x45', b'\x14', b'\x00'] |> byte_array_to_uint_raw
/// ```
pub fn byte_array_to_uint_raw(bs : FixedArray[Byte]) -> UInt {
  let uint64_1 = bs[0].to_uint()
  let uint64_2 = bs[1].to_uint() << 8
  let uint64_3 = bs[2].to_uint() << 16
  let uint64_4 = bs[3].to_uint() << 24
  uint64_1 + uint64_2 + uint64_3 + uint64_4
}

///| Convert a Double into a 8 bytes long FixedArray[Byte]
/// 
/// # Example
/// 
/// ```
/// double_number |> double_to_byte_array
/// ```
pub fn double_to_byte_array(f : Double) -> FixedArray[Byte] {
  f |> Double::reinterpret_as_uint64 |> uint64_to_byte_array
}

///| Convert a 8 bytes long FixedArray[Byte] into an Double **with* a length check.
/// The result is either an Double or an BytesLenErr which requires error handling.
/// 
/// # Example
/// 
/// ```
/// [b'\x11', b'\x45', b'\x14', b'\x19', b'\x19', b'\x81', b'\x00', b'\x00'] |> byte_array_to_double
/// ```
pub fn byte_array_to_double(bs : FixedArray[Byte]) -> Double!BytesLenErr {
  if bs.length() == 8 {
    bs |> byte_array_to_uint64_raw |> UInt64::reinterpret_as_double
  } else {
    raise BytesLenErr(bs.length())
  }
}

///| Convert a 8 bytes long FixedArray[Byte] into an Double **without** a length check.
/// This function does not check the input so take the risk at your own.
/// 
/// # Example
/// 
/// ```
/// [b'\x11', b'\x45', b'\x14', b'\x19', b'\x19', b'\x81', b'\x00', b'\x00'] |> byte_array_to_double_raw
/// ```
pub fn byte_array_to_double_raw(bs : FixedArray[Byte]) -> Double {
  bs |> byte_array_to_uint64_raw |> UInt64::reinterpret_as_double
}

///| Convert a Float into a 4 bytes long FixedArray[Byte]
/// 
/// # Example
/// 
/// ```
/// float_number |> float_to_byte_array
/// ```
pub fn float_to_byte_array(f : Float) -> FixedArray[Byte] {
  f |> Float::reinterpret_as_uint |> uint_to_byte_array
}

///| Convert a 4 bytes long FixedArray[Byte] into an Float **with** a length check.
/// The result is either an Float or an BytesLenErr which requires error handling.
/// 
/// # Example
/// 
/// ```
/// [b'\x11', b'\x45', b'\x14', b'\x00'] |> byte_array_to_float
/// ```
pub fn byte_array_to_float(bs : FixedArray[Byte]) -> Float!BytesLenErr {
  if bs.length() == 4 {
    bs |> byte_array_to_uint_raw |> UInt::reinterpret_as_float
  } else {
    raise BytesLenErr(bs.length())
  }
}

///| Convert a 4 bytes long FixedArray[Byte] into an Float **without** a length check.
/// This function does not check the input so take the risk at your own.
/// 
/// # Example
/// 
/// ```
/// [b'\x11', b'\x45', b'\x14', b'\x00'] |> byte_array_to_float_raw
/// ```
pub fn byte_array_to_float_raw(bs : FixedArray[Byte]) -> Float {
  bs |> byte_array_to_uint_raw |> UInt::reinterpret_as_float
}

///| Convert an Int into a 4 bytes long FixedArray[Byte].
/// 
/// # Example
/// 
/// ```
/// int_number |> int_to_byte_array
/// ```
pub fn int_to_byte_array(i : Int) -> FixedArray[Byte] {
  i |> Int::reinterpret_as_uint |> uint_to_byte_array
}

///| Convert a 4 bytes long FixedArray[Byte] into an Int **with** a length check.
/// The result is either an Int or an BytesLenErr which requires error handling.
/// 
/// # Example
/// 
/// ```
/// [b'\x11', b'\x45', b'\x14', b'\x00'] |> byte_array_to_int
/// ```
pub fn byte_array_to_int(bs : FixedArray[Byte]) -> Int!BytesLenErr {
  if bs.length() == 4 {
    bs |> byte_array_to_uint_raw |> UInt::reinterpret_as_int
  } else {
    raise BytesLenErr(bs.length())
  }
}

///| Convert a 4 bytes long FixedArray[Byte] into an Int **without** a length check.
/// This function does not check the input so take the risk at your own.
/// 
/// # Example
/// 
/// ```
/// [b'\x11', b'\x45', b'\x14', b'\x00'] |> byte_array_to_int_raw
/// ```
pub fn byte_array_to_int_raw(bs : FixedArray[Byte]) -> Int {
  bs |> byte_array_to_uint_raw |> UInt::reinterpret_as_int
}

///| Convert an Int64 into a 8 bytes long FixedArray[Byte].
/// 
/// # Example
/// 
/// ```
/// int64_number |> int64_to_byte_array
/// ```
pub fn int64_to_byte_array(i : Int64) -> FixedArray[Byte] {
  i |> Int64::reinterpret_as_uint64 |> uint64_to_byte_array
}

///| Convert a 8 bytes long FixedArray[Byte] into an Int64 **with* a length check.
/// The result is either an Int64 or an BytesLenErr which requires error handling.
/// 
/// # Example
/// 
/// ```
/// [b'\x11', b'\x45', b'\x14', b'\x19', b'\x19', b'\x81', b'\x00', b'\x00'] |> byte_array_to_int64
/// ```
pub fn byte_array_to_int64(bs : FixedArray[Byte]) -> Int64!BytesLenErr {
  if bs.length() == 8 {
    bs |> byte_array_to_uint64_raw |> UInt64::reinterpret_as_int64
  } else {
    raise BytesLenErr(bs.length())
  }
}

///| Convert a 8 bytes long FixedArray[Byte] into an Int64 **without** a length check.
/// This function does not check the input so take the risk at your own.
/// 
/// # Example
/// 
/// ```
/// [b'\x11', b'\x45', b'\x14', b'\x19', b'\x19', b'\x81', b'\x00', b'\x00'] |> byte_array_to_int64_raw
/// ```
pub fn byte_array_to_int64_raw(bs : FixedArray[Byte]) -> Int64 {
  bs |> byte_array_to_uint64_raw |> UInt64::reinterpret_as_int64
}
