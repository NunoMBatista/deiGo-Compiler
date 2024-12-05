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
  %2 = add i32 0, 0
  store i32 %2, i32* %counter
  br label %L3cond
L3cond:
  %3 = load i32, i32* %i
  %4 = add i32 14, 0
  %5 = icmp slt i32 %3, %4
  br i1 %5, label %L3body, label %L3end
L3body:
  %6 = load i32, i32* %i
  %7 = add i32 0, 0
  %8 = icmp eq i32 %6, %7
  br i1 %8, label %L9true, label %L9false
L9true:
  %9 = add i32 1, 0
  store i32 %9, i32* %counter
  br label %L9end
L9false:
  %10 = load i32, i32* %counter
  %11 = add i32 2, 0
  %12 = mul i32 %10, %11
  store i32 %12, i32* %counter
  br label %L9end
L9end:
  %13 = alloca [18 x i8]
  store [18 x i8] c"2 to the power of\00", [18 x i8]* %13
  %ptr14 = getelementptr inbounds [18 x i8], [18 x i8]* %13, i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_string, i32 0, i32 0), i8* %ptr14)
  %15 = load i32, i32* %i
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_int, i32 0, i32 0), i32 %15)
  %17 = alloca [3 x i8]
  store [3 x i8] c"is\00", [3 x i8]* %17
  %ptr18 = getelementptr inbounds [3 x i8], [3 x i8]* %17, i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_string, i32 0, i32 0), i8* %ptr18)
  %19 = load i32, i32* %counter
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_int, i32 0, i32 0), i32 %19)
  %21 = alloca [1 x i8]
  store [1 x i8] c"\00", [1 x i8]* %21
  %ptr22 = getelementptr inbounds [1 x i8], [1 x i8]* %21, i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_string, i32 0, i32 0), i8* %ptr22)
  %23 = load i32, i32* %i
  %24 = add i32 1, 0
  %25 = add i32 %23, %24
  store i32 %25, i32* %i
  br label %L3cond
L3end:
  ret void
}

define i32 @main() {
  call void @_main()
  ret i32 0
}
