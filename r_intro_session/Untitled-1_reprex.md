This template demonstrates many of the bells and whistles of the `reprex::reprex_document()` output format. The YAML sets many options to non-default values, such as using `#;-)` as the comment in front of output.

## Code style

Since `style` is `TRUE`, this difficult-to-read code (look at the `.Rmd` source file) will be restyled according to the Tidyverse style guide when it’s rendered. Whitespace rationing is not in effect!

``` r
x <- 1
y <- 2
z <- x + y
z
#;-) [1] 3
```

## Quiet tidyverse

The tidyverse meta-package is quite chatty at startup, which can be very useful in exploratory, interactive work. It is often less useful in a reprex, so by default, we suppress this.

However, when `tidyverse_quiet` is `FALSE`, the rendered result will include a tidyverse startup message about package versions and function masking.

``` r
library(tidyverse)
#;-) ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
#;-) ✔ dplyr     1.2.1     ✔ readr     2.2.0
#;-) ✔ forcats   1.0.1     ✔ stringr   1.6.0
#;-) ✔ ggplot2   4.0.2     ✔ tibble    3.3.1
#;-) ✔ lubridate 1.9.5     ✔ tidyr     1.3.2
#;-) ✔ purrr     1.2.2     
#;-) ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
#;-) ✖ dplyr::filter() masks stats::filter()
#;-) ✖ dplyr::lag()    masks stats::lag()
#;-) ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
```

## Chunks in languages other than R

Remember: knitr supports many other languages than R, so you can reprex bits of code in Python, Ruby, Julia, C++, SQL, and more. Note that, in many cases, this still requires that you have the relevant external interpreter installed.

Let’s try Python!

``` python
x = 'hello, python world!'
print(x.split(' '))
```

And bash!

``` bash
echo "Hello Bash!";
pwd;
ls | head;
#;-) Hello Bash!
#;-) /Users/jordanwingenroth/code/math_camp/r_intro_session
#;-) Untitled-1.rmd
#;-) Untitled-1_reprex.Rmd
#;-) Untitled-1_reprex_std_out_err.txt
#;-) x.r
```

Write a function in C++, use Rcpp to wrap it and …

``` cpp
#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
NumericVector timesTwo(NumericVector x) {
  return x * 2;
}
```

then immediately call your C++ function from R!

``` r
timesTwo(1:4)
#;-) [1] 2 4 6 8
```

## Standard output and error

Some output that you see in an interactive session is not actually captured by rmarkdown, when that same code is executed in the context of an `.Rmd` document. When `std_out_err` is `TRUE`, `reprex::reprex_render()` uses a feature of `callr:r()` to capture such output and then injects it into the rendered result.

Look for this output in a special section of the rendered document (and notice that it does not appear right here).

``` r
system2("echo", args = "Output that would normally be lost")
```

## Session info

Because `session_info` is `TRUE`, the rendered result includes session info, even though no such code is included here in the source document.

<details style="margin-bottom:10px;">

<summary>

Standard output and standard error
</summary>


``` sh
running: bash  -c 'echo "Hello Bash!";
pwd;
ls | head;'
Building shared library for Rcpp code chunk...
Output that would normally be lost
```

</details>

<details style="margin-bottom:10px;">

<summary>

Session info
</summary>

``` r
sessionInfo()
#;-) R version 4.5.2 (2025-10-31)
#;-) Platform: aarch64-apple-darwin20
#;-) Running under: macOS Tahoe 26.5.2
#;-) 
#;-) Matrix products: default
#;-) BLAS:   /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libBLAS.dylib 
#;-) LAPACK: /Library/Frameworks/R.framework/Versions/4.5-arm64/Resources/lib/libRlapack.dylib;  LAPACK version 3.12.1
#;-) 
#;-) locale:
#;-) [1] C.UTF-8/C.UTF-8/C.UTF-8/C/C.UTF-8/C.UTF-8
#;-) 
#;-) time zone: America/Los_Angeles
#;-) tzcode source: internal
#;-) 
#;-) attached base packages:
#;-) [1] stats     graphics  grDevices utils     datasets  methods   base     
#;-) 
#;-) other attached packages:
#;-)  [1] lubridate_1.9.5 forcats_1.0.1   stringr_1.6.0   dplyr_1.2.1    
#;-)  [5] purrr_1.2.2     readr_2.2.0     tidyr_1.3.2     tibble_3.3.1   
#;-)  [9] ggplot2_4.0.2   tidyverse_2.0.0
#;-) 
#;-) loaded via a namespace (and not attached):
#;-)  [1] gtable_0.3.6       compiler_4.5.2     Rcpp_1.1.1         reprex_2.1.1      
#;-)  [5] tidyselect_1.2.1   scales_1.4.0       yaml_2.3.12        fastmap_1.2.0     
#;-)  [9] R6_2.6.1           generics_0.1.4     knitr_1.51         R.cache_0.17.0    
#;-) [13] tzdb_0.5.0         pillar_1.11.1      RColorBrewer_1.1-3 R.utils_2.13.0    
#;-) [17] rlang_1.2.0        stringi_1.8.7      xfun_0.57          fs_2.0.1          
#;-) [21] S7_0.2.1           timechange_0.4.0   cli_3.6.6          withr_3.0.2       
#;-) [25] magrittr_2.0.5     digest_0.6.39      grid_4.5.2         hms_1.1.4         
#;-) [29] lifecycle_1.0.5    R.methodsS3_1.8.2  R.oo_1.27.1        vctrs_0.7.3       
#;-) [33] evaluate_1.0.5     glue_1.8.0         farver_2.1.2       styler_1.11.0     
#;-) [37] rmarkdown_2.31     tools_4.5.2        pkgconfig_2.0.3    htmltools_0.5.9
```

</details>
