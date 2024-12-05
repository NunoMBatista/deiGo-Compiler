declare i32 @atoi(i8*)
declare i32 @printf(i8*, ...)
@.str_int = private constant [4 x i8] c"%d\0A\00"
@.str_float = private constant [7 x i8] c"%.08f\0A\00"
@.str_true = private constant [6 x i8] c"true\0A\00"
@.str_false = private constant [7 x i8] c"false\0A\00"
@.str_string = private constant [4 x i8] c"%s\0A\00"


define i32 @_fcj() {
  %xint = alloca i32
  %x1int = alloca i32
  %x2int = alloca i32
  %xbool = alloca i1
  %xfloat = alloca double
  %1 = add i32 1, 0
  store i32 %1, i32* %xint
  %2 = load i32, i32* %xint
  %3 = add i32 2, 0
  store i32 %3, i32* %x1int
  %4 = load i32, i32* %x1int
  %5 = load i32, i32* %x1int
  %6 = add i32 1, 0
  %7 = icmp sgt i32 %5, %6
  br i1 %7, label %L8true, label %L8false
L8true:
  %8 = load i32, i32* %x2int
  %9 = add i32 1, 0
  %10 = sub i32 0, %9
  %11 = icmp sgt i32 %8, %10
  br i1 %11, label %L12true, label %L12false
L12true:
  %12 = fadd double 0.01, 0.0
  store double %12, double* %xfloat
  %13 = load double, double* %xfloat
  br label %L12end
L12false:
  %14 = load i1, i1* %xbool
  br i1 %14, label %L15true, label %L15false
L15true:
  br label %L0cond
L0cond:
  %15 = load i32, i32* %xint
  %16 = add i32 10, 0
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %L0body, label %L0end
L0body:
  %18 = load i32, i32* %xint
  %19 = add i32 1, 0
  %20 = add i32 %18, %19
  store i32 %20, i32* %xint
  %21 = load i32, i32* %xint
  br label %L0cond
L0end:
  br label %L15end
L15false:
  br label %L15end
L15end:
  br label %L12end
L12end:
  br label %L8end
L8false:
  br label %L8end
L8end:
  %22 = add i32 101, 0
  %23 = sub i32 0, %22
  ret i32 %23
  ret i32 0
}

define void @_main() {
  call i32 @_fcj()
  ret void
}

define i32 @main() {
  call void @_main()
  ret i32 0
}
