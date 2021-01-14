
@extends('frontend.layouts.home')
@section('css')
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
@endsection

@extends('frontend.layouts.reviewstyle')

@section('content')
<div class="container" style="">
  <div class="payment-form pt-5 pb-5 payment-form">
    <h4 class="text-success pb-5"><b>Thanks for staying with us.Your order is successfully palced. A notification sms will send.</b></h4>
      
    <a href="{{route('index')}}" class="btn btn-primary" style="border-radius: 0;">Go to home</a>      
            
  </div> 
</div>


          


@endsection

@section('script')
<script type="text/javascript">
  $( "#print" ).click(function() {
  $('.payment-form').printThis();
  });
  
</script>
@endsection