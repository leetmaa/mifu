
#define MIFU_ASSERT_REAL_EQUAL(actual, expected, eps) \
    call assert_equal_real8( actual, expected, eps, __FILE__, __LINE__)

#define MIFU_REGISTER_TEST(name) \
    write(*,*) "[ name ]"; mifu_running_name = "name"; call name(); mifu_running_name = ""

#define MIFU_END() \
    call print_error_log()
