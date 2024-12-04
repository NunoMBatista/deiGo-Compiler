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
  %2 = add i32 %fafcb, 0
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
  %1 = add i8* %strfce, null
  ret i8* %1
  ret i8* null
}

define i1 @_fcf() {
  %bafcf = alloca i1
  %1 = add i1 %bafcf, 0
  ret i1 %1
  ret i1 false
}

define i32 @_fcg(i32 %iafcg, double %fafcg) {
  call double @_fcd()
  %2 = fadd double %fafcg, 0.0
  %3 = fcmp ogt double %1, %2
  br i1 %3, label %L4true, label %L5false
L4true:
  call void @_fca()
  %5 = add i32 %iafcg, 0
  ret i32 %5
  br label %L6end
L5false:
  br label %L6end
L6end:
  call i32 @_fcb()
  ret i32 %6
  ret i32 0
}

define double @_fch(i32 %iafch, double %fafch, i8* %safch) {
  call i32 @_fcb()
  call double @_fcd()
  call i32 @_fcg(i32 %1, double %2)
  %4 = add i8* %safch, null
  %ptr5 = getelementptr inbounds [4 x i8], [4 x i8]* %4, i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_string, i32 0, i32 0), i8* %ptr5)
  %6 = add i1 %bb, 0
  br i1 %6, label %L7true, label %L8false
L7true:
  %7 = add i32 %ia, 0
  %8 = add i32 %ib, 0
  %9 = add i32 %7, %8
  store i32 %9, i32* %iafch
  %10 = fadd double %fa, 0.0
  store double %10, double* %fafch
  %11 = fadd double %fafch, 0.0
  store double %11, double* %fb
  %12 = add i32 %iafch, 0
  store i32 %12, i32* %id
  br label %L9end
L8false:
  br label %L9end
L9end:
  %13 = fadd double .01, 0.0
  ret double %13
  ret double 0.0
}

define double @_fci(i32 %iafci, i32 %ibfci, double %fafci, double %fbfci, i8* %safci) {
  call i32 @_fcb()
  call double @_fcd()
  call i32 @_fcg(i32 %1, double %2)
  call double @_fcd()
  call i8* @_fce()
  call double @_fch(i32 %3, double %4, i8* %5)
  %7 = add i32 %ibfci, 0
  %8 = add i32 12, 0
  %9 = add i32 %7, %8
  %10 = add i32 %ic, 0
  %11 = add i32 %9, %10
  call i32 @_fcb()
  %13 = add i32 %11, %12
  store i32 %13, i32* %iafci
  call i1 @_fcf()
  br i1 %14, label %L15true, label %L16false
L15true:
  %15 = add i8* %safci, null
  %ptr16 = getelementptr inbounds [4 x i8], [4 x i8]* %15, i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_string, i32 0, i32 0), i8* %ptr16)
  %17 = add i32 %ia, 0
  %18 = fadd double %fa, 0.0
  %19 = add i8* %sa, null
  call double @_fch(i32 %17, double %18, i8* %19)
  ret double %20
  br label %L17end
L16false:
  %21 = fadd double %fa, 0.0
  %22 = fadd double %fbfci, 0.0
  %23 = fmul double %21, %22
  call double @_fcd()
  %25 = fadd double %23, %24
  store double %25, double* %fafci
  call double @_fcd()
  ret double %26
  br label %L17end
L17end:
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
  %10 = add i32 %fcjia, 0
  %11 = add i32 %fcjia, 0
  call i32 @_fcb()
  %13 = add i32 %fcjib, 0
  call i32 @_fcb()
  %15 = fadd double %fb, 0.0
  %16 = add i8* %sa, null
  call double @_fch(i32 %14, double %15, i8* %16)
  %18 = fadd double %fd, 0.0
  %19 = add i8* %sb, null
  call double @_fci(i32 %12, i32 %13, double %17, double %18, i8* %19)
  call i32 @_fcg(i32 %11, double %20)
  %22 = icmp sgt i32 %10, %21
  br i1 %22, label %L23true, label %L24false
L23true:
  %23 = add i1 %ba, 0
  br i1 %23, label %L24true, label %L25false
L24true:
  %24 = fadd double .01, 0.0
  store double %24, double* %fc
  br label %L26end
L25false:
  %25 = fadd double %fc, 0.0
  %26 = fadd double %fe, 0.0
  %27 = fadd double %25, %26
  store double %27, double* %fc
  %28 = add i1 %bafcj, 0
  br i1 %28, label %L29true, label %L30false
L29true:
  br label %L29cond
L29cond:
  call i1 @_fcf()
  br i1 %29, label %L30body, label %L31end
L30body:
  %30 = add i32 %fcjia, 0
  call i32 @_fcb()
  %32 = add i32 12, 0
  %33 = sdiv i32 %31, %32
  %34 = add i32 %30, %33
  %35 = add i32 %ia, 0
  %36 = add i32 %iafcj, 0
  %37 = add i32 %35, %36
  %38 = fadd double %fa, 0.0
  call i32 @_fcg(i32 %37, double %38)
  %40 = add i32 %34, %39
  %41 = add i32 %ibfcj, 0
  %42 = sub i32 %40, %41
  store i32 %42, i32* %fcjib
  %43 = fadd double %fafcj, 0.0
  store double %43, double* %fbfcj
  br label %L29cond
L31end:
  br label %L31end
L30false:
  br label %L31end
L31end:
  br label %L26end
L26end:
  br label %L25end
L24false:
  br label %L25end
L25end:
  br label %L44cond
L44cond:
  %44 = add i1 %bb, 0
  br i1 %44, label %L45body, label %L46end
L45body:
  %45 = add i1 %bc, 0
  br i1 %45, label %L46true, label %L47false
L46true:
  %46 = add i1 %bd, 0
  %47 = add i1 %ba, 0
  %48 = and i1 %46, %47
  store i1 %48, i1* %bd
  %49 = add i1 %ba, 0
  call i1 @_fcf()
  %51 = and i1 %49, %50
  %52 = add i1 %bd, 0
  %53 = add i1 %bc, 0
  %54 = xor i1 %53, true
  %55 = and i1 %52, %54
  %56 = or i1 %51, %55
  store i1 %56, i1* %bd
  br label %L48end
L47false:
  br label %L48end
L48end:
  br label %L44cond
L46end:
  %57 = add i32 101, 0
  %58 = sub i32 0, %57
  ret i32 %58
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
  call i1 @_fcf()
  %15 = and i1 %13, %14
  br i1 %15, label %L12body, label %L13end
L12body:
  call i32 @_fcb()
  call i32 @_fcb()
  %18 = fadd double %fe, 0.0
  call i32 @_fcg(i32 %17, double %18)
  %20 = add i32 %mia, 0
  call i32 @_fcb()
  call double @_fcd()
  call i32 @_fcg(i32 %21, double %22)
  %24 = add i32 123, 0
  %25 = add i32 %ia, 0
  call double @_fcd()
  call i8* @_fce()
  call double @_fch(i32 %25, double %26, i8* %27)
  call double @_fcd()
  %30 = add i8* %sc, null
  call double @_fci(i32 %23, i32 %24, double %28, double %29, i8* %30)
  call double @_fcd()
  call i1 @_fcf()
  call i32 @_fcj(i32 %19, i32 %20, double %31, double %32, i1 %33)
  %35 = icmp sgt i32 %16, %34
  br i1 %35, label %L36true, label %L37false
L36true:
  %36 = add i32 12, 0
  %37 = add i32 %ia, 0
  %38 = fadd double %fa, 0.0
  %39 = fadd double 100000000000.000000, 0.0
  %40 = add i1 %ba, 0
  call i32 @_fcj(i32 %36, i32 %37, double %38, double %39, i1 %40)
  store i32 %41, i32* %mib
  br label %L38end
L37false:
  %42 = add i32 %ia, 0
  call i32 @_fcb()
  %44 = add i32 %42, %43
  store i32 %44, i32* %mib
  br label %L38end
L38end:
  br label %L11cond
L13end:
  %45 = add i32 %mib, 0
  %46 = add i32 123, 0
  %47 = add i32 456, 0
  call i32 @_fcb()
  %49 = add i32 %47, %48
  call double @_fcd()
  %51 = fadd double 123.321, 0.0
  %52 = fadd double %50, %51
  call i32 @_fcg(i32 %49, double %52)
  %54 = add i32 %46, %53
  %55 = add i32 %ia, 0
  %56 = add i32 %ib, 0
  %57 = add i32 %55, %56
  %58 = add i32 %ic, 0
  %59 = add i32 12, 0
  %60 = sdiv i32 %58, %59
  %61 = sub i32 %57, %60
  %62 = add i32 %id, 0
  %63 = add i32 %ie, 0
  %64 = mul i32 %62, %63
  call i32 @_fcb()
  %66 = fadd double %fa, 0.0
  call i32 @_fcg(i32 %65, double %66)
  %68 = srem i32 %64, %67
  %69 = add i32 %61, %68
  %70 = add i32 %ia, 0
  %71 = add i32 %ib, 0
  %72 = add i32 %70, %71
  %73 = add i32 123, 0
  %74 = fadd double %fa, 0.0
  call double @_fcd()
  %76 = fadd double 100000000000.000000, 0.0
  %77 = fdiv double %75, %76
  %78 = fsub double %74, %77
  call double @_fcd()
  call i8* @_fce()
  call double @_fci(i32 %72, i32 %73, double %78, double %79, i8* %80)
  %82 = add i32 312, 0
  %83 = add i32 12, 0
  %84 = add i32 %82, %83
  call double @_fcd()
  %86 = fadd double 10000000000000000000000.000000, 0.0
  %87 = fadd double %85, %86
  call i8* @_fce()
  call double @_fch(i32 %84, double %87, i8* %88)
  call i1 @_fcf()
  %91 = add i1 %ba, 0
  %92 = and i1 %90, %91
  %93 = add i1 %bb, 0
  %94 = or i1 %92, %93
  call i32 @_fcj(i32 %54, i32 %69, double %81, double %89, i1 %94)
  %96 = add i32 %45, %95
  store i32 %96, i32* %mia
  ret void
}

define i32 @main() {
  call void @_main()
  ret i32 0
}
