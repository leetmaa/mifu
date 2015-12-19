
!> Minimal module for unit-testing in fortran.
!!
module mifu_asserts

  ! No implicit types allowed.
  implicit none

  ! Keep private what we can.
  private

  public :: assert_equal_real8
  public :: mifu_running_name
  public :: print_error_log

  integer, parameter :: line_len = 79
  integer :: reg_p = 1
  integer :: failed = 0
  integer :: passed = 0
  character(len=line_len), dimension(1024) :: error_log
  character(len=line_len) :: mifu_running_name

  ! Module content below.
  contains

  !> Prints error summary and details to screen.
  subroutine print_error_log()
    implicit none
    integer :: i

    if (reg_p == 1) then
       write (*,*)
       write (*,*)
       write (*,*) "ALL ", passed, " ASSERTS PASSED"
       write (*,*)
    else
       write (*,*)
       write (*,*)
       write (*,*) "!!!FAILURES!!!"
       write (*,*)
       write (*,*)
       write (*,*) "Test results:"
       write (*,*) "Run:      ", failed + passed
       write (*,*) "Failures: ", failed
       write (*,*)

       do i=1,reg_p
          write(*,*) error_log(i)
       end do
    end if

  end subroutine print_error_log


  !> Asserts the equality of two real*8 numbers within a specified limit.
  !! This subroutine is supposed to be called through the
  !! MIFU_ASSERT_REAL_EQUAL( actual, expected, eps ) macro.
  !! @param[in] a    : actual value
  !! @param[in] b    : expected value
  !! @param[in] eps  : allowed difference
  !! @param[in] file : the name of the file where assertion was made
  !! @param[in] line : the line in the file where assertion was made
  !!
  subroutine assert_equal_real8(a, b, eps, file, line)
    implicit none
    real*8, intent(in) :: a
    real*8, intent(in) :: b
    real*4, intent(in) :: eps
    character*(*), intent(in) :: file
    integer, intent(in) :: line
    ! ------------------------

    ! Local variables.
    real*8 :: diff

    ! Function body.
    diff = abs(a-b)
    if (eps < diff) then
       failed = failed + 1
       write(error_log(reg_p),*) "----------------------------------------------------------------------------"
       reg_p = reg_p + 1
       write(error_log(reg_p),*) "FAILURE ", failed, ") ", "test: ", trim(mifu_running_name)
       reg_p = reg_p + 1
       write(error_log(reg_p),*) "file:", file
       reg_p = reg_p + 1
       write(error_log(reg_p),*) "line:", line
       reg_p = reg_p + 1
       write(error_log(reg_p),*) "real*8 equality assertion faild within limit: ", eps
       reg_p = reg_p + 1
       write(error_log(reg_p),*) "Expected ", a
       reg_p = reg_p + 1
       write(error_log(reg_p),*) "Actual   ", b
       reg_p = reg_p + 1
       write(error_log(reg_p),*) "Diff     ", diff
       reg_p = reg_p + 1
       write(error_log(reg_p),*)
       reg_p = reg_p + 1
    else
       passed = passed + 1
    end if

  end subroutine assert_equal_real8

end module mifu_asserts
