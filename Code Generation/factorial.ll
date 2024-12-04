declare i32 @atoi(i8*)
declare i32 @printf(i8*, ...)
@.str_int = private constant [4 x i8] c"%d\0A\00"
@.str_float = private constant [7 x i8] c"%.08f\0A\00"
@.str_true = private constant [6 x i8] c"true\0A\00"
@.str_false = private constant [7 x i8] c"false\0A\00"
@.str_string = private constant [4 x i8] c"%s\0A\00"


@ia = global i32 0
@ib = global i32 0
@ic = global i32 0
@id = global i32 0
@ie = global i32 0
@fa = global double 0.0
@fb = global double 0.0
@fc = global double 0.0
@fd = global double 0.0
@fe = global double 0.0
@ba = global i1 false
@bb = global i1 false
@bc = global i1 false
@bd = global i1 false
@sa = global i8* null
@sb = global i8* null
@sc = global i8* null
define void @_fca() {
  ret void
}

define i32 @_fcb() {
  %fafcb = alloca i32
  %1 = add i32 132, 0
  store i32 %1, i32* %fafcb
  %2 = load i32, i32* %fafcb
  ret i32 %2
  ret i32 0
}

define double @_fcd() {
  %1 = fadd double 1.000000, 0.0
  %2 = fadd double 0.007, 0.0
  %3 = fadd double %1, %2
  ret double %3
  ret double 0.0
}

define i8* @_fce() {
  %strfce = alloca i8*
  %1 = load i8*, i8** %strfce
  ret i8* %1
  ret i8* null
}

define i1 @_fcf() {
  %bafcf = alloca i1
  %1 = load i1, i1* %bafcf
  ret i1 %1
  ret i1 false
}

define i32 @_fcg(i32 %iafcg, double %fafcg) {
  %1 = call double @_fcd()
  %2 = fadd double %fafcg, 0.0
  %3 = fcmp ogt double %1, %2
  br i1 %3, label %L4true, label %L4false
L4true:
  call void @_fca()
  %4 = add i32 %iafcg, 0
  ret i32 %4
  br label %L4end
L4false:
  br label %L4end
L4end:
  %6 = call i32 @_fcb()
  ret i32 %6
  ret i32 0
}

define double @_fch(i32 %iafch, double %fafch, i8* %safch) {
  %1 = call i32 @_fcb()
  %2 = call double @_fcd()
  call i32 @_fcg(i32 %1, double %2)
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_string, i32 0, i32 0), i8* %safch)
  %5 = add i1 %bb, 0
  br i1 %5, label %L6true, label %L6false
L6true:
  %6 = add i32 %ia, 0
  %7 = add i32 %ib, 0
  %8 = add i32 %6, %7
  store i32 %8, i32* %iafch
  %9 = fadd double %fa, 0.0
  store double %9, double* %fafch
  %10 = fadd double %fafch, 0.0
  store double %10, double* %fb
  %11 = add i32 %iafch, 0
  store i32 %11, i32* %id
  br label %L6end
L6false:
  br label %L6end
L6end:
  %13 = fadd double .01, 0.0
  ret double %13
  ret double 0.0
}

define double @_fci(i32 %iafci, i32 %ibfci, double %fafci, double %fbfci, i8* %safci) {
  %1 = call i32 @_fcb()
  %2 = call double @_fcd()
  %3 = call i32 @_fcg(i32 %1, double %2)
  %4 = call double @_fcd()
  %5 = call i8* @_fce()
  call double @_fch(i32 %3, double %4, i8* %5)
  %6 = add i32 %ibfci, 0
  %7 = add i32 12, 0
  %8 = add i32 %6, %7
  %9 = add i32 %ic, 0
  %10 = add i32 %8, %9
  %11 = call i32 @_fcb()
  %12 = add i32 %10, %11
  store i32 %12, i32* %iafci
  %13 = call i1 @_fcf()
  br i1 %13, label %L14true, label %L14false
L14true:
  %14 = add i8* %safci, null
  %ptr15 = getelementptr inbounds [4 x i8], [4 x i8]* %14, i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_string, i32 0, i32 0), i8* %ptr15)
  %16 = add i32 %ia, 0
  %17 = fadd double %fa, 0.0
  %18 = add i8* %sa, null
  %19 = call double @_fch(i32 %16, double %17, i8* %18)
  ret double %19
  br label %L14end
L14false:
  %20 = fadd double %fa, 0.0
  %21 = fadd double %fbfci, 0.0
  %22 = fmul double %20, %21
  %23 = call double @_fcd()
  %24 = fadd double %22, %23
  store double %24, double* %fafci
  %25 = call double @_fcd()
  ret double %25
  br label %L14end
L14end:
  ret double 0.0
}

define i32 @_fcj(i32 %iafcj, i32 %ibfcj, double %fafcj, double %fbfcj, i1 %bafcj) {
  %fcjia = alloca i32
  %fcjib = alloca i32
  %1 = add i32 %ia, 0
  %2 = add i32 %ib, 0
  %3 = add i32 %1, %2
  %4 = add i32 %ic, 0
  %5 = add i32 %id, 0
  %6 = mul i32 %4, %5
  %7 = add i32 %ie, 0
  %8 = srem i32 %6, %7
  %9 = sub i32 %3, %8
  store i32 %9, i32* %fcjia
  %10 = load i32, i32* %fcjia
  %11 = load i32, i32* %fcjia
  %12 = call i32 @_fcb()
  %13 = load i32, i32* %fcjib
  %14 = call i32 @_fcb()
  %15 = fadd double %fb, 0.0
  %16 = add i8* %sa, null
  %17 = call double @_fch(i32 %14, double %15, i8* %16)
  %18 = fadd double %fd, 0.0
  %19 = add i8* %sb, null
  %20 = call double @_fci(i32 %12, i32 %13, double %17, double %18, i8* %19)
  %21 = call i32 @_fcg(i32 %11, double %20)
  %22 = icmp sgt i32 %10, %21
  br i1 %22, label %L23true, label %L23false
L23true:
  %23 = add i1 %ba, 0
  br i1 %23, label %L24true, label %L24false
L24true:
  %24 = fadd double .01, 0.0
  store double %24, double* %fc
  br label %L24end
L24false:
  %25 = fadd double %fc, 0.0
  %26 = fadd double %fe, 0.0
  %27 = fadd double %25, %26
  store double %27, double* %fc
  %28 = add i1 %bafcj, 0
  br i1 %28, label %L29true, label %L29false
L29true:
  br label %L29cond
L29cond:
  %29 = call i1 @_fcf()
  br i1 %29, label %L30body, label %L31end
L30body:
  %30 = load i32, i32* %fcjia
  %31 = call i32 @_fcb()
  %32 = add i32 12, 0
  %33 = sdiv i32 %31, %32
  %34 = add i32 %30, %33
  %35 = add i32 %ia, 0
  %36 = add i32 %iafcj, 0
  %37 = add i32 %35, %36
  %38 = fadd double %fa, 0.0
  %39 = call i32 @_fcg(i32 %37, double %38)
  %40 = add i32 %34, %39
  %41 = add i32 %ibfcj, 0
  %42 = sub i32 %40, %41
  store i32 %42, i32* %fcjib
  %43 = fadd double %fafcj, 0.0
  store double %43, double* %fbfcj
  br label %L29cond
L31end:
  br label %L29end
L29false:
  br label %L29end
L29end:
  br label %L24end
L24end:
  br label %L23end
L23false:
  br label %L23end
L23end:
  br label %L47cond
L47cond:
  %47 = add i1 %bb, 0
  br i1 %47, label %L48body, label %L49end
L48body:
  %48 = add i1 %bc, 0
  br i1 %48, label %L49true, label %L49false
L49true:
  %49 = add i1 %bd, 0
  %50 = add i1 %ba, 0
  %51 = and i1 %49, %50
  store i1 %51, i1* %bd
  %52 = add i1 %ba, 0
  %53 = call i1 @_fcf()
  %54 = and i1 %52, %53
  %55 = add i1 %bd, 0
  %56 = add i1 %bc, 0
  %57 = xor i1 %56, true
  %58 = and i1 %55, %57
  %59 = or i1 %54, %58
  store i1 %59, i1* %bd
  br label %L49end
L49false:
  br label %L49end
L49end:
  br label %L47cond
L49end:
  %61 = add i32 101, 0
  %62 = sub i32 0, %61
  ret i32 %62
  ret i32 0
}

define void @_main() {
  %1 = add i32 1, 0
  store i32 %1, i32* %ia
  %2 = add i32 1, 0
  store i32 %2, i32* %ib
  %3 = add i32 1, 0
  store i32 %3, i32* %ic
  %4 = add i32 1, 0
  store i32 %4, i32* %id
  %5 = add i32 1, 0
  store i32 %5, i32* %ie
  %6 = fadd double .1, 0.0
  store double %6, double* %fa
  %7 = fadd double .1, 0.0
  store double %7, double* %fb
  %8 = fadd double .1, 0.0
  store double %8, double* %fc
  %9 = fadd double .1, 0.0
  store double %9, double* %fd
  %10 = fadd double .1, 0.0
  store double %10, double* %fe
  %mia = alloca i32
  %mib = alloca i32
  br label %L11cond
L11cond:
  %11 = add i32 %ia, 0
  %12 = add i32 %ib, 0
  %13 = icmp sgt i32 %11, %12
  %14 = call i1 @_fcf()
  %15 = and i1 %13, %14
  br i1 %15, label %L12body, label %L13end
L12body:
  %16 = call i32 @_fcb()
  %17 = call i32 @_fcb()
  %18 = fadd double %fe, 0.0
  %19 = call i32 @_fcg(i32 %17, double %18)
  %20 = load i32, i32* %mia
  %21 = call i32 @_fcb()
  %22 = call double @_fcd()
  %23 = call i32 @_fcg(i32 %21, double %22)
  %24 = add i32 123, 0
  %25 = add i32 %ia, 0
  %26 = call double @_fcd()
  %27 = call i8* @_fce()
  %28 = call double @_fch(i32 %25, double %26, i8* %27)
  %29 = call double @_fcd()
  %30 = add i8* %sc, null
  %31 = call double @_fci(i32 %23, i32 %24, double %28, double %29, i8* %30)
  %32 = call double @_fcd()
  %33 = call i1 @_fcf()
  %34 = call i32 @_fcj(i32 %19, i32 %20, double %31, double %32, i1 %33)
  %35 = icmp sgt i32 %16, %34
  br i1 %35, label %L36true, label %L36false
L36true:
  %36 = add i32 12, 0
  %37 = add i32 %ia, 0
  %38 = fadd double %fa, 0.0
  %39 = fadd double 100000000000.000000, 0.0
  %40 = add i1 %ba, 0
  %41 = call i32 @_fcj(i32 %36, i32 %37, double %38, double %39, i1 %40)
  store i32 %41, i32* %mib
  br label %L36end
L36false:
  %42 = add i32 %ia, 0
  %43 = call i32 @_fcb()
  %44 = add i32 %42, %43
  store i32 %44, i32* %mib
  br label %L36end
L36end:
  br label %L11cond
L13end:
  %46 = load i32, i32* %mib
  %47 = add i32 123, 0
  %48 = add i32 456, 0
  %49 = call i32 @_fcb()
  %50 = add i32 %48, %49
  %51 = call double @_fcd()
  %52 = fadd double 123.321, 0.0
  %53 = fadd double %51, %52
  %54 = call i32 @_fcg(i32 %50, double %53)
  %55 = add i32 %47, %54
  %56 = add i32 %ia, 0
  %57 = add i32 %ib, 0
  %58 = add i32 %56, %57
  %59 = add i32 %ic, 0
  %60 = add i32 12, 0
  %61 = sdiv i32 %59, %60
  %62 = sub i32 %58, %61
  %63 = add i32 %id, 0
  %64 = add i32 %ie, 0
  %65 = mul i32 %63, %64
  %66 = call i32 @_fcb()
  %67 = fadd double %fa, 0.0
  %68 = call i32 @_fcg(i32 %66, double %67)
  %69 = srem i32 %65, %68
  %70 = add i32 %62, %69
  %71 = add i32 %ia, 0
  %72 = add i32 %ib, 0
  %73 = add i32 %71, %72
  %74 = add i32 123, 0
  %75 = fadd double %fa, 0.0
  %76 = call double @_fcd()
  %77 = fadd double 100000000000.000000, 0.0
  %78 = fdiv double %76, %77
  %79 = fsub double %75, %78
  %80 = call double @_fcd()
  %81 = call i8* @_fce()
  %82 = call double @_fci(i32 %73, i32 %74, double %79, double %80, i8* %81)
  %83 = add i32 312, 0
  %84 = add i32 12, 0
  %85 = add i32 %83, %84
  %86 = call double @_fcd()
  %87 = fadd double 10000000000000000000000.000000, 0.0
  %88 = fadd double %86, %87
  %89 = call i8* @_fce()
  %90 = call double @_fch(i32 %85, double %88, i8* %89)
  %91 = call i1 @_fcf()
  %92 = add i1 %ba, 0
  %93 = and i1 %91, %92
  %94 = add i1 %bb, 0
  %95 = or i1 %93, %94
  %96 = call i32 @_fcj(i32 %55, i32 %70, double %82, double %90, i1 %95)
  %97 = add i32 %46, %96
  store i32 %97, i32* %mia
  ret void
}

define i32 @main() {
  call void @_main()
  ret i32 0
}
