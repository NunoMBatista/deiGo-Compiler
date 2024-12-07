@.str_int = private constant [4 x i8] c"%d\0A\00"
@.str_float = private constant [7 x i8] c"%.08F\0A\00"
@.str_true = private constant [6 x i8] c"true\0A\00"
@.str_false = private constant [7 x i8] c"false\0A\00"
@.str_string = private constant [4 x i8] c"%s\0A\00"
@.empty_str = private constant [1 x i8] c"\00"

declare i32 @atoi(i8*)
declare i32 @printf(i8*, ...)


@a = global i32 0
@b = global double 0.0
@c = global i1 false
@d = global i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.empty_str, i32 0, i32 0)
define i32 @main(i32 %argc, i8** %argv) {
.label0:
  %0 = alloca [8 x i8]
  store [8 x i8] c"Lebroin\00", [8 x i8]* %0
  %ptr1 = getelementptr inbounds [8 x i8], [8 x i8]* %0, i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_string, i32 0, i32 0), i8* %ptr1)
  %2 = load i32, i32* @a
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_int, i32 0, i32 0), i32 %2)
  %4 = load double, double* @b
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i32 0, i32 0), double %4)
  %6 = load i1, i1* @c
  br i1 %6, label %L7true, label %L7false
L7true:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str_true, i32 0, i32 0))
  br label %L7end
L7false:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_false, i32 0, i32 0))
  br label %L7end
L7end:
  %9 = load i8*, i8** @d
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_string, i32 0, i32 0), i8* %9)
  %11 = add i32 18, 0
  store i32 %11, i32* @a
  %12 = fadd double 1.23e-4, 0.0
  store double %12, double* @b
  %13 = fadd double 253.E-3, 0.0
  %14 = fsub double 0.0, %13
  store double %14, double* @b
  %15 = fadd double 0.1, 0.0
  %16 = fsub double 0.0, %15
  store double %16, double* @b
  %17 = fadd double 0.113E11111111, 0.0
  store double %17, double* @b
  %18 = add i32 1, 0
  %19 = add i32 2, 0
  %20 = icmp ne i32 %18, %19
  store i1 %20, i1* @c
  %21 = add i32 3, 0
  %22 = add i32 4, 0
  %23 = add i32 %21, %22
  store i32 %23, i32* @a
  %24 = load i1, i1* @c
  %25 = alloca i1
  br i1 %24, label %L1_true, label %L1_false
L1_true:
  %26 = load i1, i1* @c
  %27 = xor i1 %26, true
  store i1 %27, i1* %25
  br label %L1_end
L1_false:
  store i1 false, i1* %25
  br label %L1_end
L1_end:
  %28 = load i1, i1* %25
  %29 = xor i1 %28, true
  %30 = alloca i1
  br i1 %29, label %L2_true, label %L2_false
L2_true:
  store i1 true, i1* %30
  br label %L2_end
L2_false:
  %31 = load i1, i1* @c
  %32 = load i1, i1* @c
  %33 = xor i1 %32, true
  %34 = icmp ne i1 %31, %33
  store i1 %34, i1* %30
  br label %L2_end
L2_end:
  %35 = load i1, i1* %30
  store i1 %35, i1* @c
  %36 = load i32, i32* @a
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_int, i32 0, i32 0), i32 %36)
  %38 = load double, double* @b
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i32 0, i32 0), double %38)
  %40 = load i1, i1* @c
  br i1 %40, label %L41true, label %L41false
L41true:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str_true, i32 0, i32 0))
  br label %L41end
L41false:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_false, i32 0, i32 0))
  br label %L41end
L41end:
  %43 = load i8*, i8** @d
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_string, i32 0, i32 0), i8* %43)
  %45 = alloca [5 x i8]
  store [5 x i8] c"\09\0Da\0C\00", [5 x i8]* %45
  %ptr46 = getelementptr inbounds [5 x i8], [5 x i8]* %45, i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_string, i32 0, i32 0), i8* %ptr46)
  %47 = alloca [5 x i8]
  store [5 x i8] c"\09\0Db\0C\00", [5 x i8]* %47
  %ptr48 = getelementptr inbounds [5 x i8], [5 x i8]* %47, i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_string, i32 0, i32 0), i8* %ptr48)
  %49 = alloca [5 x i8]
  store [5 x i8] c"\09\0Dc\0C\00", [5 x i8]* %49
  %ptr50 = getelementptr inbounds [5 x i8], [5 x i8]* %49, i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_string, i32 0, i32 0), i8* %ptr50)
  %51 = alloca [5 x i8]
  store [5 x i8] c"\09\0Dd\0C\00", [5 x i8]* %51
  %ptr52 = getelementptr inbounds [5 x i8], [5 x i8]* %51, i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_string, i32 0, i32 0), i8* %ptr52)
  %53 = alloca [38 x i8]
  store [38 x i8] c"\22\5Cvideojogar\0C jogo de video\0D videojog\00", [38 x i8]* %53
  %ptr54 = getelementptr inbounds [38 x i8], [38 x i8]* %53, i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_string, i32 0, i32 0), i8* %ptr54)
  %55 = alloca [38 x i8]
  store [38 x i8] c"\22\5Cvideojogar\0C jogo de video\0D videojog\00", [38 x i8]* %55
  %ptr56 = getelementptr inbounds [38 x i8], [38 x i8]* %55, i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_string, i32 0, i32 0), i8* %ptr56)
  %57 = alloca [38 x i8]
  store [38 x i8] c"\22\5Cvideojogar\0C jogo de video\0D videojog\00", [38 x i8]* %57
  %ptr58 = getelementptr inbounds [38 x i8], [38 x i8]* %57, i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_string, i32 0, i32 0), i8* %ptr58)
  %59 = alloca [38 x i8]
  store [38 x i8] c"\22\5Cvideojogar\0C jogo de video\0D videojog\00", [38 x i8]* %59
  %ptr60 = getelementptr inbounds [38 x i8], [38 x i8]* %59, i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_string, i32 0, i32 0), i8* %ptr60)
  br label %.label3
.label3:
  br label %return
return:
  ret i32 0
}

