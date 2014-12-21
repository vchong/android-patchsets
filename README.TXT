Linaro Android Patches Set Repository

1. Patches should be here

About what patches we should have here, please follow these rules.
* Backport - backport of upstream accepted feature
* Non-upstreamable feature - valid feature, wanted for products, but not going upstream (GTS patchset, of TuxOnIce, etc), maintained by Linaro forever.
* Temporary fix - something that will get to upstream soon or will be fixed properly in upstream soon, but we just can't wait.
* Linaro hack - something to get things working in our CI, on our HW, not going upstream. Ever. Members stay away.

2. How to add patch into this repository

* Submit your patch to Linaro Gerrit or Google Gerrit for review, but not merged
  Linaro Gerrit: https://wiki.linaro.org/Platform/Android/GoodChanges
  Google Gerrit: https://source.android.com/source/submit-patches.html

* Add your patch information into following file:
  AOSP-CLANG-PATCHSET: patches for building AOSP mater with Clang
  AOSP-MASTER-EXPERIMENTAL-PATCHSET: patches for building AOSP mater branch
  LOLLIPOP-CLANG-PATCHSET: patches for building AOSP Lollipop with Clang
  LOLLIPOP-STABLE-PATCHSET: patches for building AOSP Lollipop version
  LOLLIPOP-GCC49: TBU

  PLEASE NOTE: please add description here when you add new patchset file.

* About apply function:
  please see LOLLIPOP-EXPERIMENTAL-PATCHSET as example,
  and see the functions for details.

  ## use patch from Linaro Gerrit:
  apply --linaro system/extras 15288/1

  ## use patch from Google Gerrit:
  apply packages/apps/Browser 118963/1

  "--linaro" here means using linaro gerrit server, you can use "--server" to
  specify your own gerrit server as well, when no option specified, we will use
  google gerrit server as default.

  "system/extras" and "packages/apps/Browser" are the project repository pathes
  which is after the gerrit server prefix.
  linaro gerrit server prefix: git://review.android.git.linaro.org/
  google gerrit server prefix: https://android.googlesource.com/

  "15288" and "118963" are the review ids of the gerrit review url

  "1" here is the patchset number of your patch on the gerrit server.

3. Others
   TBU
