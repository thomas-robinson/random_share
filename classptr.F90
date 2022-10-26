module test_mod
implicit none

type, public :: F_t
  real, dimension(:,:,:), allocatable :: data3d
  character(len=32) :: chksum !< Only fails when this is a string
endtype F_t

 contains

!> This routine does nothing
 subroutine register_variable_attribute(fileobj, attribute_value)
   class(F_t), intent(in) :: fileobj !< File object.
   class(*), intent(in) :: attribute_value !< Attribute value
 end subroutine register_variable_attribute

!> This routine calls the other routine
 subroutine write_restart_bc(fileobj)
   type(F_t), intent(inout) :: fileobj !This fails both as both type and class

       call register_variable_attribute(fileobj, fileobj%chksum)

 end subroutine write_restart_bc
end module test_mod

