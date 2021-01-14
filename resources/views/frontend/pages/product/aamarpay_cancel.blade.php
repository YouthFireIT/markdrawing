
@extends('frontend.layouts.home')
@section('css')
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
@endsection

@section('content')

    <br/><br/><center text-danger><font size="13pt"><b>Thank You Payment Not Successfully Received</b></font></center>

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