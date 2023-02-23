from starkware.cairo.common.uint256 import (uint256_add,uint256_mul,Uint256,uint256_unsigned_div_rem)

// Perform and log output of simple arithmetic operations
func simple_math{range_check_ptr}() {
   // adding 13 + 14
   // let x = 13 + 14;
   let (res, _) = uint256_add(Uint256(13,0), Uint256(14,0));
   assert res.low = 27;

   // multiplying 3 * 6
   let (res, _) = uint256_mul(Uint256(low=3,high=0), Uint256(low=6,high=0));
   assert res.low = 18;

   // dividing 6 by 2
   let (res, _) = uint256_unsigned_div_rem(Uint256(6,0), Uint256(2,0));
   // %{ print(f"res: {ids.res.low}") %}
   assert res.low = 3;
   

   //let (div_1);
   //%{
   //     ids.div_1 = int(6/2)
   // %}
   // assert div_1 = 3;

   // dividing 70 by 2
   tempvar sevenbytwo = 70 / 2;
   //%{ print(f"{ids.sevenbytwo}") %}
   assert sevenbytwo = 35;

   // dividing 7 by 2
   let (res, rem) = uint256_unsigned_div_rem(Uint256(7,0), Uint256(2,0));
   assert res.low = 3;
   assert rem.low = 1;
   //%{ print(f"res: {ids.res.low}") %}
   //%{ print(f"res: {ids.rem.low}") %}

    return ();
}