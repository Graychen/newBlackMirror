
 <!-- js-->
<script src="{{ asset('admin/js/jquery-1.11.1.min.js') }}"></script>
<script src="{{ asset('admin/js/modernizr.custom.js') }}"></script>
<!--webfonts-->
<!--//webfonts-->
<!--animate-->
<script src="{{ asset('admin/js/wow.min.js') }}"></script>
    <script>
         new WOW().init();
    </script>
<!--//end-animate-->
<!-- chart -->
<script src="{{ asset('js/Chart.js') }}"></script>
<!-- //chart -->
<!--Calender-->
<script src="{{ asset('js/underscore-min.js') }}" type="text/javascript"></script>
<script src= "{{ asset('js/moment-2.2.1.js') }}" type="text/javascript"></script>
<script src="{{ asset('js/clndr.js') }}" type="text/javascript"></script>
<script src="{{ asset('js/site.js') }}" type="text/javascript"></script>
<!--End Calender-->
<!-- Metis Menu -->
<script src="{{ asset('js/metisMenu.min.js') }}"></script>
<script src="{{ asset('js/custom.js') }}"></script>
 <!-- Classie -->
        <script src="js/classie.js"></script>
        <script>
            var menuLeft = document.getElementById( 'cbp-spmenu-s1' ),
                showLeftPush = document.getElementById( 'showLeftPush' ),
                body = document.body;

            showLeftPush.onclick = function() {
                classie.toggle( this, 'active' );
                classie.toggle( body, 'cbp-spmenu-push-toright' );
                classie.toggle( menuLeft, 'cbp-spmenu-open' );
                disableOther( 'showLeftPush' );
            };


            function disableOther( button ) {
                if( button !== 'showLeftPush' ) {
                    classie.toggle( showLeftPush, 'disabled' );
                }
            }
        </script>
    <!--scrolling js-->
    <script src="{{ asset('js/jquery.nicescroll.js') }}"></script>
    <script src="{{ asset('js/scripts.js') }}"></script>
    <!--//scrolling js-->
    <!-- Bootstrap Core JavaScript -->
   <script src="{{ asset('js/bootstrap.js') }}"> </script>