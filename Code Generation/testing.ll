declare i32 @atoi(i8*)
declare i32 @printf(i8*, ...)
@.str_int = private constant [4 x i8] c"%d\0A\00"
@.str_float = private constant [7 x i8] c"%.08f\0A\00"
@.str_true = private constant [6 x i8] c"true\0A\00"
@.str_false = private constant [7 x i8] c"false\0A\00"
@.str_string = private constant [4 x i8] c"%s\0A\00"


define void @_main() {
  %i = alloca i32
  %counter = alloca i32
  %1 = add i32 0, 0
  store i32 %1, i32* %i
  %2 = add i32 1, 0
  store i32 %2, i32* %counter
  br label %L3cond
L3cond:
  %3 = load i32, i32* %i
  %4 = add i32 14, 0
  %5 = icmp slt i32 %3, %4
  br i1 %5, label %L3body, label %L3end
L3body:
  %6 = load i32, i32* %i
  %7 = add i32 1, 0
  %8 = add i32 %6, %7
  store i32 %8, i32* %i
  br label %L3cond
L3end:
  %9 = add i32 3, 0
  store i32 %9, i32* %i
  ret void
}

define i32 @main() {
  call void @_main()
  ret i32 0
}
