
#include "mifu.h"

module test_module1
  use mifu_asserts

  contains

  subroutine test_dummyABFail()
    implicit none
    real*8 :: a
    real*8 :: b
    ! ----------------------------------
    a = 1.0
    b = 1.4
    MIFU_ASSERT_REAL_EQUAL(a, b, 1.0e-10)
  end subroutine test_dummyABFail

  subroutine test_dummyABPass()
    implicit none
    real*8 :: a
    real*8 :: b
    ! ----------------------------------
    a = 1.41
    b = 1.4
    MIFU_ASSERT_REAL_EQUAL(a, b, 1.0e-1)
  end subroutine test_dummyABPass

end module test_module1
