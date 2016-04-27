  @include('public.header')
<body class="cbp-spmenu-push">
    <div class="main-content">
        <!--left-fixed -navigation-->
      @include('public.sidebar')
        <!--left-fixed -navigation-->
        <!-- header-starts -->
      @include('public.sticky')
        <!-- //header-ends -->
        <!-- main content start-->
       @section('content')
        @include('public.wrapper')
       @endsection

        <!--footer-->
      @include('public.footer')
        <!--//footer-->
    </div>

</body>
</html>