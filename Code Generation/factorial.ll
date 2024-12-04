declare i32 @printf(i8*, ...)
@.str_int = private constant [4 x i8] c"%d\0A\00"
@.str_float = private constant [7 x i8] c"%.08f\0A\00"
@.str_true = private constant [6 x i8] c"true\0A\00"
@.str_false = private constant [7 x i8] c"false\0A\00"
@.str_string = private constant [4 x i8] c"%s\0A\00"


define i32 @_fact(i32 %a, i32 %b) {
  %1 = add i32 15, 0
  ret i32 %1
  ret i32 0
}

define void @_main() {
  %a = alloca i32
  %b = alloca i32
  %1 = load i32, i32* %a
  %2 = load i32, i32* %a
  call i32 @_fact(i32 %1, i32 %2)
  store i32 %3, i32* %b
  %4 = load i32, i32* %b
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_int, i32 0, i32 0), i32 %4)
  ret void
}

define i32 @main() {
  call void @_main()
  ret i32 0
}
